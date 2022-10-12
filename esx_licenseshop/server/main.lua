AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_licenseshop:loadLicenses', source, licenses)
	end)
end)

function LoadLicenses(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_licenseshop:loadLicenses', source, licenses)
	end)
end

RegisterServerEvent('esx_licenseshop:ServerLoadLicenses')
AddEventHandler('esx_licenseshop:ServerLoadLicenses', function()
	local _source = source
	LoadLicenses(_source)
end)

-- Buying License
RegisterServerEvent('esx_licenseshop:buyLicense')
AddEventHandler('esx_licenseshop:buyLicense', function(type)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if type == 'buy_license_aircraft' then
		local price = Config.Prices.Aircraft

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'aircraft', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_boating' then
		local price = Config.Prices.Boating

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'boating', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_melee' then
		local price = Config.Prices.Melee

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon_melee', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_handgun' then
		local price = Config.Prices.Handgun

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon_handgun', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_smg' then
		local price = Config.Prices.SMG

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon_smg', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_shotgun' then
		local price = Config.Prices.Shotgun

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon_shotgun', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_assault' then
		local price = Config.Prices.Assault

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon_assault', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_lmg' then
		local price = Config.Prices.LMG

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon_lmg', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_sniper' then
		local price = Config.Prices.Sniper

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon_sniper', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_commercial' then
		local price = Config.Prices.Commercial

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'drive_truck', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_drivers' then
		local price = Config.Prices.Drivers

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'drive', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_driversp' then
		local price = Config.Prices.DriversP

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'dmv', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_motorcycle' then
		local price = Config.Prices.Motorcycle

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'drive_bike', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_weed' then
		local price = Config.Prices.Weed

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weed_processing', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_weapon' then
		local price = Config.Prices.Weapon

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, 'weapon', function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_custom1' then
		local price = Config.Prices.Custom1

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, Config.Custom.C1Name, function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_custom2' then
		local price = Config.Prices.Custom2

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, Config.Custom.C2Name, function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_custom3' then
		local price = Config.Prices.Custom3

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, Config.Custom.C3Name, function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_custom4' then
		local price = Config.Prices.Custom4

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, Config.Custom.C4Name, function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	elseif type == 'buy_license_custom5' then
		local price = Config.Prices.Custom5

		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			TriggerEvent('esx_license:addLicense', _source, Config.Custom.C5Name, function()
				LoadLicenses(_source)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	end
end)
