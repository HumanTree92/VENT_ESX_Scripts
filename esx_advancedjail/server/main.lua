local playersInJail = {}

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	MySQL.single('SELECT `jail_time`, `jail_loc` FROM users WHERE identifier = ?', {xPlayer.identifier}, function(result)
		if result and result.jail_time > 0 then
			TriggerEvent('esx_advancedjail:sendToJail', xPlayer.source, result.jail_time, result.jail_loc, true)
		end
	end)
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	playersInJail[playerId] = nil
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		checkJail()
	end
end)

function checkJail()
	Citizen.Wait(2000)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers do
		Citizen.Wait(100)
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		MySQL.single('SELECT `jail_time`, `jail_loc` FROM users WHERE identifier = ?', {xPlayer.identifier}, function(result)
			if result and result.jail_time > 0 then
				TriggerEvent('esx_advancedjail:sendToJail', xPlayer.source, result.jail_time, result.jail_loc, true)
			end
		end)
	end
end

ESX.RegisterCommand('jail', 'admin', function(xPlayer, args, showError)
	TriggerEvent('esx_advancedjail:sendToJail', args.playerId, args.time * 60, 'SSBP1', false)
end, true, {help = 'Jail a Player', validate = true, arguments = {
	{name = 'playerId', help = 'Player Id', type = 'playerId'},
	{name = 'time', help = 'Jail Time in Minutes', type = 'number'}
}})

ESX.RegisterCommand('unjail', 'admin', function(xPlayer, args, showError)
	unjailPlayer(args.playerId)
end, true, {help = 'Unjail a Player', validate = true, arguments = {
	{name = 'playerId', help = 'Player Id', type = 'playerId'}
}})

RegisterNetEvent('esx_advancedjail:sendToJail')
AddEventHandler('esx_advancedjail:sendToJail', function(playerId, jailTime, jailLoc, quiet)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local name = GetCharacterName(playerId)

	if xPlayer then
		if not playersInJail[playerId] then
			MySQL.update('UPDATE users SET jail_time = ?, jail_loc = ? WHERE identifier = ?', {jailTime, jailLoc, xPlayer.identifier}, function(rowsChanged)
				xPlayer.triggerEvent('esx_policejob:unrestrain')
				xPlayer.triggerEvent('esx_advancedjail:jailPlayer', jailTime, jailLoc, name)
				playersInJail[playerId] = {timeRemaining = jailTime, identifier = xPlayer.getIdentifier()}

				if not quiet then
					TriggerClientEvent('chat:addMessage', -1, {args = {_U('judge'), _U('jailed_msg', xPlayer.getName(), ESX.Math.Round(jailTime / 60))}, color = {147, 196, 109}})
				end
			end)
		end
	end
end)

RegisterNetEvent('esx_advancedjail:unjailPlayerS')
AddEventHandler('esx_advancedjail:unjailPlayerS', function(playerId)
	unjailPlayer(playerId)
end)

function unjailPlayer(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if playersInJail[playerId] then
			MySQL.update('UPDATE users SET jail_time = 0, jail_loc = NULL WHERE identifier = ?', {xPlayer.identifier}, function(rowsChanged)
				TriggerClientEvent('chat:addMessage', -1, {args = {_U('judge'), _U('unjailed_msg', xPlayer.getName())}, color = {147, 196, 109}})
				playersInJail[playerId] = nil
				xPlayer.triggerEvent('esx_advancedjail:unjailPlayer')
			end)
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		for playerId,data in pairs(playersInJail) do
			playersInJail[playerId].timeRemaining = data.timeRemaining - 1

			if data.timeRemaining < 1 then
				unjailPlayer(playerId)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000 * Config.Sync)
		local tasks = {}

		for playerId,data in pairs(playersInJail) do
			local task = function(cb)
				MySQL.update('UPDATE users SET jail_time = ? WHERE identifier = ?', {data.timeRemaining, data.identifier}, function(rowsChanged)
					cb(rowsChanged)
				end)
			end

			table.insert(tasks, task)
		end

		Async.parallelLimit(tasks, 4, function(results) end)
	end
end)

-- Run UnJail
RegisterNetEvent('esx_advancedjail:rununjail')
AddEventHandler('esx_advancedjail:rununjail', function(_source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerId = _source

	if xPlayer then
		MySQL.update('UPDATE users SET jail_time = ?, jail_loc = ? WHERE identifier = ?', {0, NULL, xPlayer.identifier}, function(rowsChanged)
			playersInJail[playerId] = nil
			xPlayer.triggerEvent('esx_advancedjail:unjailPlayer')
			xPlayer.showNotification(_U('you_ran'))
		end)
	end
end)

-- Get Character Name
function GetCharacterName(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.single('SELECT firstname, lastname FROM users WHERE identifier = ?', {xPlayer.identifier})

	if result ~= nil and result.firstname ~= nil and result.lastname ~= nil then
		if Config.OnlyFirstname then
			return result.firstname
		else
			return result.firstname .. ' ' .. result.lastname
		end
	else
		return GetPlayerName(source)
	end
end

-- Player Attempted Escape/Escaped
RegisterNetEvent('esx_advancedjail:playerEscape')
AddEventHandler('esx_advancedjail:playerEscape', function(name, type, location)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			if type == 'run' then
				if location == 'LSMR' then
					xPlayer.showNotification(_U('player_escaped', name, _U('mission_row')))
				elseif location == 'SSSD' then
					xPlayer.showNotification(_U('player_escaped', name, _U('sandy_shores')))
				elseif location == 'PBSD' then
					xPlayer.showNotification(_U('player_escaped', name, _U('paleto_bay')))
				elseif location == 'SSBP' then
					xPlayer.showNotification(_U('player_escaped', name, _U('bolingbroke_pen')))
				end
			elseif type == 'attempt' then
				if location == 'LSMR' then
					xPlayer.showNotification(_U('player_escape_attempt', name, _U('mission_row')))
				elseif location == 'SSSD' then
					xPlayer.showNotification(_U('player_escape_attempt', name, _U('sandy_shores')))
				elseif location == 'PBSD' then
					xPlayer.showNotification(_U('player_escape_attempt', name, _U('paleto_bay')))
				elseif location == 'SSBP' then
					xPlayer.showNotification(_U('player_escape_attempt', name, _U('bolingbroke_pen')))
				end
			end
		end
	end
end)

-- Remove Inventory when Jailed
RegisterNetEvent('esx_advancedjail:removeInventory')
AddEventHandler('esx_advancedjail:removeInventory', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.RemoveLoadout then
		for i=1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	end

	if Config.RemoveInventory then
		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
	end

	if Config.RemoveDirtyMoney then
		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.setAccountMoney('black_money', 0)
		end
	end

	if Config.GiveFoodDrink then
		xPlayer.addInventoryItem(Config.FoodItem, Config.FoodAmount)
		xPlayer.addInventoryItem(Config.DrinkItem, Config.DrinkAmount)
	end

	--Core.SavePlayer(xPlayer)
end)
