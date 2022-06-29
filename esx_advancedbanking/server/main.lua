-- getCharData
function getCharData(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.single('SELECT firstname, lastname FROM users WHERE identifier = ?', {xPlayer.identifier}, function(result)
		if result then
			local data = {
				firstname = result.firstname,
				lastname = result.lastname
			}
			cb(data)
		end
	end)
end

ESX.RegisterServerCallback('esx_advancedbanking:getCharData', function(source, cb)
	getCharData(source, function(data)
		if data ~= nil then
			cb(data)
		end
	end)
end)

-- Balance Event
RegisterServerEvent('esx_advancedbanking:balance')
AddEventHandler('esx_advancedbanking:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('esx_advancedbanking:currentBalance', _source, balance)
end)

-- Deposit Event
RegisterServerEvent('esx_advancedbanking:deposit')
AddEventHandler('esx_advancedbanking:deposit', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if amount == nil or amount <= 0 then
		xPlayer.showNotification(_U('invalid_amount'))
	else
		if amount > xPlayer.getMoney() then
			amount = xPlayer.getMoney()
		end

		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', amount)
	end
end)

-- Withdraw Event
RegisterServerEvent('esx_advancedbanking:withdraw')
AddEventHandler('esx_advancedbanking:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = tonumber(amount)
	local account = xPlayer.getAccount('bank').money

	if amount == nil or amount <= 0 then
		xPlayer.showNotification(_U('invalid_amount'))
	else
		if amount > account then
			amount = account
		end

		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
	end
end)

-- Transfer Event
RegisterServerEvent('esx_advancedbanking:transfer')
AddEventHandler('esx_advancedbanking:transfer', function(target, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local tPlayer = ESX.GetPlayerFromId(target)
	local account = 0

	if tPlayer ~= nil and GetPlayerEndpoint(target) ~= nil then
		account = xPlayer.getAccount('bank').money

		if tonumber(_source) == tonumber(target) then
			xPlayer.showNotification(_U('invalid_self'))
		else
			if account <= 0 or account < tonumber(amountt) or tonumber(amountt) <= 0 then
				xPlayer.showNotification(_U('invalid_amount'))
			else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				tPlayer.addAccountMoney('bank', tonumber(amountt))
				-- Show Notification
				xPlayer.showNotification(_U('transfer_you', amountt, target))
				tPlayer.showNotification(_U('transfer_receive', amountt, _source))
			end
		end
	else
		xPlayer.showNotification(_U('invalid_input'))
	end
end)
