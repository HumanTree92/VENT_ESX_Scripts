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
		xPlayer.showNotification(_U('healing_paid', ESX.Math.GroupDigits(price)))
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
		xPlayer.showNotification(_U('surgery_paid', ESX.Math.GroupDigits(price)))
		cb(true)
	else
		cb(false)
	end
end)
