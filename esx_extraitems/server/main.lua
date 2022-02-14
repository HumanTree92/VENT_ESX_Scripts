-- Start of Dark Net
TriggerEvent('esx_phone:registerNumber', 'darknet', _U('phone_darknet'), true, false, true, true)

function OnDarkNetItemChange(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local found = false
	local darknet = xPlayer.getInventoryItem('darknet')

	if darknet.count > 0 then
		found = true
	end

	if found then
		TriggerEvent('esx_phone:addSource', 'darknet', source)
	else
		TriggerEvent('esx_phone:removeSource', 'darknet', source)
	end
end

RegisterServerEvent('esx_phone:reload')
AddEventHandler('esx_phone:reload', function(phoneNumber)
	local xPlayer = ESX.GetPlayerFromId(source)
	local darknet = xPlayer.getInventoryItem('darknet')
	if darknet.count > 0 then
		TriggerEvent('esx_phone:addSource', 'darknet', source)
	end
end)

AddEventHandler('esx:playerDropped', function(source)
	TriggerEvent('esx_phone:removeSource', 'darknet', source)
end)

AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
	if item.name == 'darknet' then
		OnDarkNetItemChange(source)
	end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'darknet' then
		OnDarkNetItemChange(source)
	end
end)
-- End of Dark Net

-- Bandage
ESX.RegisterUsableItem('bandage', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx_extraitems:bandage', source)
	if Config.Removeables.Bandage then
		xPlayer.removeInventoryItem('bandage', 1)
		xPlayer.showNotification(_U('used_bandage'))
	end
end)

RegisterServerEvent('esx_extraitems:givebandages')
AddEventHandler('esx_extraitems:givebandages', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem('bandage', 3) then
		xPlayer.removeInventoryItem('firstaidkit', 1)
		xPlayer.showNotification(_U('used_firstaidkit'))
		xPlayer.addInventoryItem('bandage', 3)
	else
		xPlayer.showNotification(_U('player_cannot_hold', 'Bandages'))
	end
end)

-- Binoculars
ESX.RegisterUsableItem('binoculars', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:binoculars', source)
end)

-- Bullet-Proof Vest
ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:bulletproof', source)
	if Config.Removeables.BulletProofVest then
		xPlayer.removeInventoryItem('bulletproof', 1)
		xPlayer.showNotification(_U('used_bulletproof'))
	end
end)

-- Clean Kit
ESX.RegisterUsableItem('cleankit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:cleankit', source)
end)

RegisterNetEvent('esx_extraitems:removecleankit')
AddEventHandler('esx_extraitems:removecleankit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.CleanKit then
		xPlayer.removeInventoryItem('cleankit', 1)
		xPlayer.showNotification(_U('used_cleankit'))
	end
end)

-- Defib
ESX.RegisterUsableItem('defib', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx_extraitems:defib', source)
end)

RegisterNetEvent('esx_extraitems:removedefib')
AddEventHandler('esx_extraitems:removedefib', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.Defib then
		xPlayer.removeInventoryItem('defib', 1)
		xPlayer.showNotification(_U('used_defib'))
	end
end)

-- Drill
ESX.RegisterUsableItem('drill', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx_extraitems:drill', source)
end)

RegisterNetEvent('esx_extraitems:removedrill')
AddEventHandler('esx_extraitems:removedrill', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.Drill then
		xPlayer.removeInventoryItem('drill', 1)
		xPlayer.showNotification(_U('used_drill'))
	end
end)

-- Firework
ESX.RegisterUsableItem('firework', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:firework', source)
	if Config.Removeables.Firework then
		xPlayer.removeInventoryItem('firework', 1)
		xPlayer.showNotification(_U('used_firework'))
	end
end)

-- First Aid Kit
ESX.RegisterUsableItem('firstaidkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:firstaidkit', source)
end)

RegisterNetEvent('esx_extraitems:removefirstaidkit')
AddEventHandler('esx_extraitems:removefirstaidkit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.FirstAidKit then
		xPlayer.removeInventoryItem('firstaidkit', 1)
		xPlayer.showNotification(_U('used_firstaidkit'))
	end
end)

-- Lock Pick
ESX.RegisterUsableItem('lockpick', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:lockpick', source)
end)

RegisterNetEvent('esx_extraitems:removelockpick')
AddEventHandler('esx_extraitems:removelockpick', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.LockPick then
		xPlayer.removeInventoryItem('lockpick', 1)
		xPlayer.showNotification(_U('used_lockpick'))
	end
end)

-- Oxygen Mask
ESX.RegisterUsableItem('oxygenmask', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:oxygenmask', source)
	if Config.Removeables.OxygenMask then
		xPlayer.removeInventoryItem('oxygenmask', 1)
		xPlayer.showNotification(_U('used_oxygenmask'))
	end
end)

-- Repair Kit
ESX.RegisterUsableItem('repairkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:repairkit', source)
end)

RegisterNetEvent('esx_extraitems:removerepairkit')
AddEventHandler('esx_extraitems:removerepairkit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.RepairKit then
		xPlayer.removeInventoryItem('repairkit', 1)
		xPlayer.showNotification(_U('used_repairkit'))
	end
end)

-- Tire Kit
ESX.RegisterUsableItem('tirekit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:tirekit', source)
end)

RegisterNetEvent('esx_extraitems:removetirekit')
AddEventHandler('esx_extraitems:removetirekit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.TireKit then
		xPlayer.removeInventoryItem('tirekit', 1)
		xPlayer.showNotification(_U('used_tirekit'))
	end
end)

-- Vape
ESX.RegisterUsableItem('vape', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:vape', source)
end)

RegisterServerEvent('esx_extraitems:VapeSmoke')
AddEventHandler('esx_extraitems:VapeSmoke', function(entity)
	TriggerClientEvent('esx_extraitems:VapeSmoke', -1, entity)
end)

-- Vehicle GPS
ESX.RegisterUsableItem('vehgps', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:installGPS', source)
end)

-- Weapon Kit
ESX.RegisterUsableItem('weakit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:weakit', source)
end)

RegisterNetEvent('esx_extraitems:removeweakit')
AddEventHandler('esx_extraitems:removeweakit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.WeaKit then
		xPlayer.removeInventoryItem('weakit', 1)
		xPlayer.showNotification(_U('used_weakit'))
	end
end)

-- Start of Ammo Boxes
ESX.RegisterUsableItem('boxpistol', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxpistol')
end)

ESX.RegisterUsableItem('boxsmg', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxsmg')
end)

ESX.RegisterUsableItem('boxshot', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxshot')
end)

ESX.RegisterUsableItem('boxrifle', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxrifle')
end)

ESX.RegisterUsableItem('boxmg', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxmg')
end)

ESX.RegisterUsableItem('boxsniper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxsniper')
end)

ESX.RegisterUsableItem('boxflare', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxflare')
end)

ESX.RegisterUsableItem('boxbig', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxbig')
end)

ESX.RegisterUsableItem('boxsmall', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxsmall')
end)

RegisterNetEvent('esx_extraitems:removebox')
AddEventHandler('esx_extraitems:removebox', function(hash, ammo, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local weaponName = ESX.GetWeaponFromHash(hash)

	if type == 'boxpistol' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxpistol', 1)
			xPlayer.showNotification(_U('used_boxpistol'))
		end
	elseif type == 'boxsmg' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxsmg', 1)
			xPlayer.showNotification(_U('used_boxsmg'))
		end
	elseif type == 'boxshot' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxshot', 1)
			xPlayer.showNotification(_U('used_boxshot'))
		end
	elseif type == 'boxrifle' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxrifle', 1)
			xPlayer.showNotification(_U('used_boxrifle'))
		end
	elseif type == 'boxmg' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxmg', 1)
			xPlayer.showNotification(_U('used_boxmg'))
		end
	elseif type == 'boxsniper' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxsniper', 1)
			xPlayer.showNotification(_U('used_boxsniper'))
		end
	elseif type == 'boxflare' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxflare', 1)
			xPlayer.showNotification(_U('used_boxflare'))
		end
	elseif type == 'boxbig' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxbig', 1)
			xPlayer.showNotification(_U('used_boxbig'))
		end
	elseif type == 'boxsmall' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxsmall', 1)
			xPlayer.showNotification(_U('used_boxsmall'))
		end
	end
end)
-- End of Ammo Boxes

-- Start of Weapon Components
ESX.RegisterServerCallback('esx_extraitems:AddWeaponComponent', function(source, cb, weaponCat, weaponName, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = weaponCat

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end
	
	if not selectedWeapon then
		print(('esx_extraitems: %s attempted to Install an invalid weapon component 1.'):format(xPlayer.identifier))
		cb(false)
	else
		local weaponNum, weapon = ESX.GetWeapon(weaponName)
		local component = weapon.components[componentNum]

		if component then
			xPlayer.addWeaponComponent(weaponName, component.name)
			cb(true)
		else
			print(('esx_extraitems: %s attempted to Install an invalid weapon component 2.'):format(xPlayer.identifier))
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('esx_extraitems:RemoveWeaponComponent', function(source, cb, weaponCat, weaponName, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = weaponCat

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end
	
	if not selectedWeapon then
		print(('esx_extraitems: %s attempted to Uninstall an invalid weapon component 1.'):format(xPlayer.identifier))
		cb(false)
	else
		local weaponNum, weapon = ESX.GetWeapon(weaponName)
		local component = weapon.components[componentNum]

		if component then
			xPlayer.removeWeaponComponent(weaponName, component.name)
			cb(true)
		else
			print(('esx_extraitems: %s attempted to Uninstall an invalid weapon component 2.'):format(xPlayer.identifier))
			cb(false)
		end
	end
end)
-- End of Weapon Components

-- Check if Player has Item
ESX.RegisterServerCallback('esx_extraitems:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	cb(qtty)
end)

function getItemAmount(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	return qtty
end
