
-- Buy Weapon
ESX.RegisterServerCallback('esx_advancedweaponshop:buyWeapon', function(source, cb, weaponCat, weaponName, zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPrice(weaponCat, weaponName, zone)

	if price == 0 then
		print(('esx_advancedweaponshop: %s Attempted to buy a UNKNOWN Weapon!'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.hasWeapon(weaponName) then
			xPlayer.showNotification(_U('already_owned'))
			cb(false)
		else
			if zone == 'LegalShop' then
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeapon(weaponName, 50)

					cb(true)
				else
					xPlayer.showNotification(_U('not_enough'))
					cb(false)
				end
			elseif zone == 'IllegalShop' then
				if Config.UseDirty then
					if xPlayer.getAccount('black_money').money >= price then
						xPlayer.removeAccountMoney('black_money', price)
						xPlayer.addWeapon(weaponName, 50)

						cb(true)
					else
						xPlayer.showNotification(_U('not_enough_black'))
						cb(false)
					end
				else
					if xPlayer.getMoney() >= price then
						xPlayer.removeMoney(price)
						xPlayer.addWeapon(weaponName, 50)

						cb(true)
					else
						xPlayer.showNotification(_U('not_enough'))
						cb(false)
					end
				end
			else
				print(('esx_advancedweaponshop: %s Attempted to access a UNKNOWN Weapon Shop!'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

function getPrice(weaponCat, weaponName, zone)
	if weaponCat == 'Misc' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Misc) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'Throw' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Throw) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'Melee' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Melee) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'Handgun' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Handgun) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'SMG' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].SMG) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'Shotgun' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Shotgun) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'Assault' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Assault) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'LMG' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].LMG) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	elseif weaponCat == 'Sniper' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Sniper) do
			if v.name == weaponName then
				weapon = v
				break
			end
		end

		if weapon then
			return weapon.price
		else
			return 0
		end
	end
end
