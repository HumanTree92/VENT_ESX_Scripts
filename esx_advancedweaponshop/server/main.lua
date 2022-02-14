local shopMisc, shopThrow, shopMelee, shopHandgun, shopSMG, shopShotgun, shopAssault, shopLMG, shopSniper = {}, {}, {}, {}, {}, {}, {}, {}, {}

AddEventHandler('onResourceStart', function(resource)
	Wait(10000)
	if resource == GetCurrentResourceName() then
		mysqlGetWeapons()
	end
end)

function mysqlGetWeapons()
	-- Get/Send Misc Weapons
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'misc'
	}, function(shopMiscResult)
		for i=1, #shopMiscResult, 1 do
			if shopMisc[shopMiscResult[i].zone] == nil then
				shopMisc[shopMiscResult[i].zone] = {}
			end
			
			table.insert(shopMisc[shopMiscResult[i].zone], {
				item = shopMiscResult[i].item,
				price = shopMiscResult[i].price,
				label = ESX.GetWeaponLabel(shopMiscResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendMisc', -1, shopMisc)
	end)

	-- Get/Send Throwables
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'throw'
	}, function(shopThrowResult)
		for i=1, #shopThrowResult, 1 do
			if shopThrow[shopThrowResult[i].zone] == nil then
				shopThrow[shopThrowResult[i].zone] = {}
			end
			
			table.insert(shopThrow[shopThrowResult[i].zone], {
				item = shopThrowResult[i].item,
				price = shopThrowResult[i].price,
				label = ESX.GetWeaponLabel(shopThrowResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendThrow', -1, shopThrow)
	end)

	-- Get/Send Melee Weapons
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'melee'
	}, function(shopMeleeResult)
		for i=1, #shopMeleeResult, 1 do
			if shopMelee[shopMeleeResult[i].zone] == nil then
				shopMelee[shopMeleeResult[i].zone] = {}
			end
			
			table.insert(shopMelee[shopMeleeResult[i].zone], {
				item = shopMeleeResult[i].item,
				price = shopMeleeResult[i].price,
				label = ESX.GetWeaponLabel(shopMeleeResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendMelee', -1, shopMelee)
	end)

	-- Get/Send Handguns
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'handgun'
	}, function(shopHandgunResult)
		for i=1, #shopHandgunResult, 1 do
			if shopHandgun[shopHandgunResult[i].zone] == nil then
				shopHandgun[shopHandgunResult[i].zone] = {}
			end
			
			table.insert(shopHandgun[shopHandgunResult[i].zone], {
				item = shopHandgunResult[i].item,
				price = shopHandgunResult[i].price,
				label = ESX.GetWeaponLabel(shopHandgunResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendHandgun', -1, shopHandgun)
	end)

	-- Get/Send SMGs
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'smg'
	}, function(shopSMGResult)
		for i=1, #shopSMGResult, 1 do
			if shopSMG[shopSMGResult[i].zone] == nil then
				shopSMG[shopSMGResult[i].zone] = {}
			end
			
			table.insert(shopSMG[shopSMGResult[i].zone], {
				item = shopSMGResult[i].item,
				price = shopSMGResult[i].price,
				label = ESX.GetWeaponLabel(shopSMGResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendSMG', -1, shopSMG)
	end)

	-- Get/Send Shotguns
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'shotgun'
	}, function(shopShotgunResult)
		for i=1, #shopShotgunResult, 1 do
			if shopShotgun[shopShotgunResult[i].zone] == nil then
				shopShotgun[shopShotgunResult[i].zone] = {}
			end
			
			table.insert(shopShotgun[shopShotgunResult[i].zone], {
				item = shopShotgunResult[i].item,
				price = shopShotgunResult[i].price,
				label = ESX.GetWeaponLabel(shopShotgunResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendShotgun', -1, shopShotgun)
	end)

	-- Get/Send Assault Rifles
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'assault'
	}, function(shopAssaultResult)
		for i=1, #shopAssaultResult, 1 do
			if shopAssault[shopAssaultResult[i].zone] == nil then
				shopAssault[shopAssaultResult[i].zone] = {}
			end
			
			table.insert(shopAssault[shopAssaultResult[i].zone], {
				item = shopAssaultResult[i].item,
				price = shopAssaultResult[i].price,
				label = ESX.GetWeaponLabel(shopAssaultResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendAssault', -1, shopAssault)
	end)

	-- Get/Send LMGs
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'lmg'
	}, function(shopLMGResult)
		for i=1, #shopLMGResult, 1 do
			if shopLMG[shopLMGResult[i].zone] == nil then
				shopLMG[shopLMGResult[i].zone] = {}
			end
			
			table.insert(shopLMG[shopLMGResult[i].zone], {
				item = shopLMGResult[i].item,
				price = shopLMGResult[i].price,
				label = ESX.GetWeaponLabel(shopLMGResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendLMG', -1, shopLMG)
	end)

	-- Get/Send Sniper Rifles
	MySQL.Async.fetchAll('SELECT * FROM weaponshops WHERE category = @category', {
		['@category'] = 'sniper'
	}, function(shopSniperResult)
		for i=1, #shopSniperResult, 1 do
			if shopSniper[shopSniperResult[i].zone] == nil then
				shopSniper[shopSniperResult[i].zone] = {}
			end
			
			table.insert(shopSniper[shopSniperResult[i].zone], {
				item = shopSniperResult[i].item,
				price = shopSniperResult[i].price,
				label = ESX.GetWeaponLabel(shopSniperResult[i].item)
			})
		end

		TriggerClientEvent('esx_advancedweaponshop:sendSniper', -1, shopSniper)
	end)
end

ESX.RegisterServerCallback('esx_advancedweaponshop:getMisc', function(source, cb)
	cb(shopMisc)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getThrow', function(source, cb)
	cb(shopThrow)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getMelee', function(source, cb)
	cb(shopMelee)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getHandgun', function(source, cb)
	cb(shopHandgun)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getSMG', function(source, cb)
	cb(shopSMG)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getShotgun', function(source, cb)
	cb(shopShotgun)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getAssault', function(source, cb)
	cb(shopAssault)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getLMG', function(source, cb)
	cb(shopLMG)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getSniper', function(source, cb)
	cb(shopSniper)
end)

-- Buy Weapon
ESX.RegisterServerCallback('esx_advancedweaponshop:buyWeapon', function(source, cb, weaponName, zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPrice(weaponName, zone)

	if price == 0 then
		print(('esx_advancedweaponshop: %s attempted to buy a unknown weapon!'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.hasWeapon(weaponName) then
			xPlayer.showNotification(_U('already_owned'))
			cb(false)
		else
			if zone == 'BlackShop' then
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
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeapon(weaponName, 50)

					cb(true)
				else
					xPlayer.showNotification(_U('not_enough'))
					cb(false)
				end
			end
		end
	end
end)

function getPrice(weaponName, zone)
	local price = MySQL.Sync.fetchScalar('SELECT price FROM weaponshops WHERE zone = @zone AND item = @item', {
		['@zone'] = zone,
		['@item'] = weaponName
	})

	if price then
		return price
	else
		return 0
	end
end
