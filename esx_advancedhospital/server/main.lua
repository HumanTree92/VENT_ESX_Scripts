-- Count Medics
ESX.RegisterServerCallback('esx_advancedhospital:checkMedic', function(source, cb)
	local xPlayers = ESX.GetExtendedPlayers('job', 'ambulance')

	if #xPlayers >= Config.MedicRequired then
		cb(true)
	else
		cb(false)
	end
end)

-- Pay for Healing
ESX.RegisterServerCallback('esx_advancedhospital:payHealing', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.HealingPrice

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
			account.addMoney(price)
		end)
		xPlayer.showNotification(_U('healing_paid', ESX.Math.GroupDigits(price)))

		cb(true)
	else
		cb(false)
	end
end)

-- Pay for Revive
ESX.RegisterServerCallback('esx_advancedhospital:payRevive', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.RevivePrice

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
			account.addMoney(price)
		end)
		xPlayer.showNotification(_U('revive_paid', ESX.Math.GroupDigits(price)))
		xPlayer.triggerEvent('esx_ambulancejob:revive')

		cb(true)
	else
		cb(false)
	end
end)

-- Pay for Surgery
ESX.RegisterServerCallback('esx_advancedhospital:paySurgery', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.SurgeryPrice

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
			account.addMoney(price)
		end)
		xPlayer.showNotification(_U('surgery_paid', ESX.Math.GroupDigits(price)))

		cb(true)
	else
		cb(false)
	end
end)
