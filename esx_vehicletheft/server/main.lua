local isCurrentTheft, coolDown = false, false
local theftPlayer = 0

-- Count Police
ESX.RegisterServerCallback('esx_vehicletheft:checkPolice', function(source, cb)
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')

	if #xPlayers >= Config.Main.PoliceReq then
		cb(true)
	else
		cb(false)
	end
end)

-- Add Command to Start Timer
ESX.RegisterCommand('theftstart', 'admin', function(xPlayer, args, showError)
	TriggerEvent('esx_vehicletheft:startTimer')
end, false, {help = 'Start Vehicle Theft Timer'})

-- Add Command to Reset Timer
ESX.RegisterCommand('theftreset', 'admin', function(xPlayer, args, showError)
	TriggerEvent('esx_vehicletheft:resetTimer')
end, false, {help = 'Reset Vehicle Theft Timer'})

-- See if there is an On Going Vehicle Thefts & Cool Down has Ended
ESX.RegisterServerCallback('esx_vehicletheft:checkThefts', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if isCurrentTheft == false and coolDown == false then
		cb(true)
	else
		cb(false)
	end
end)

-- Start Cool Down Timer
RegisterServerEvent('esx_vehicletheft:startTimer')
AddEventHandler('esx_vehicletheft:startTimer', function()
	theftPlayer = 0
	isCurrentTheft = false
	coolDown = true
	SetTimeout((Config.Main.CoolDown*60)*1000, function()
		coolDown = false
	end)
end)

-- Reset Timer
RegisterServerEvent('esx_vehicletheft:resetTimer')
AddEventHandler('esx_vehicletheft:resetTimer', function()
	theftPlayer = 0
	isCurrentTheft = false
	coolDown = false
end)

-- Send Payment for Completion
RegisterServerEvent('esx_vehicletheft:sendPayment')
AddEventHandler('esx_vehicletheft:sendPayment', function(reward)
	local _source = source

	if isCurrentTheft and not coolDown then
		if _source == theftPlayer then
			local xPlayer = ESX.GetPlayerFromId(_source)

			xPlayer.addAccountMoney('black_money', reward)
			xPlayer.showNotification(_U('you_earned', reward))
			TriggerEvent('esx_vehicletheft:startTimer')
		end
	end
end)

-- Theft Canceled
RegisterServerEvent('esx_vehicletheft:theftCanceled')
AddEventHandler('esx_vehicletheft:theftCanceled', function()
	local _source = source
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')
	isCurrentTheft = false

	for _, xPlayer in pairs(xPlayers) do
		TriggerClientEvent('esx_vehicletheft:theftCompNotif', xPlayer.source, false)
	end

	if _source == theftPlayer then
		local xPlayer = ESX.GetPlayerFromId(_source)
		theftPlayer = 0
		xPlayer.showNotification(_U('theft_cancel'))
	end
end)

-- Theft in Progress
RegisterServerEvent('esx_vehicletheft:theftInProgress')
AddEventHandler('esx_vehicletheft:theftInProgress', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')

	if isCurrentTheft == false then
		if #xPlayers < Config.Main.PoliceReq then
			xPlayer.showNotification(_U('theft_required', Config.Main.PoliceReq))
			return
		end

		isCurrentTheft = true
		for _, xPlayer in pairs(xPlayers) do
			TriggerClientEvent('esx_vehicletheft:theftPoliceNotif', xPlayer.source)
		end

		xPlayer.showNotification(_U('theft_started'))
		TriggerClientEvent('esx_vehicletheft:startTheft', _source)
		theftPlayer = _source
	else
		xPlayer.showNotification(_U('theft_in_prog'))
	end
end)

-- Alert Police
RegisterServerEvent('esx_vehicletheft:alertPolice')
AddEventHandler('esx_vehicletheft:alertPolice', function(coords)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')

	for _, xPlayer in pairs(xPlayers) do
		TriggerClientEvent('esx_vehicletheft:setPoliceBlip', xPlayer.source, coords)
	end
end)

-- Stop Alert Police
RegisterServerEvent('esx_vehicletheft:alertPoliceStop')
AddEventHandler('esx_vehicletheft:alertPoliceStop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')

	for _, xPlayer in pairs(xPlayers) do
		TriggerClientEvent('esx_vehicletheft:theftCompNotif', xPlayer.source, true)
	end
end)

-- Stop if Player Leaves
AddEventHandler('esx:playerDropped', function(playerId, reason)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')

	if playerId == theftPlayer then
		isCurrentTheft = false

		for _, xPlayer in pairs(xPlayers) do
			TriggerClientEvent('esx_vehicletheft:theftCompNotif', xPlayer.source, false)
		end
	end
end)

-- Start Timer
AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_vehicletheft:startTimer')
		return
	end
end)
