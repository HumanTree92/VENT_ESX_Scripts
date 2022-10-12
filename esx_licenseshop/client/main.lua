local CurrentActionData, Licenses = {}, {}
local HasAlreadyEnteredMarker, IsInMainMenu = false, false
local LastZone, CurrentAction, CurrentActionMsg

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx_licenseshop:loadLicenses')
AddEventHandler('esx_licenseshop:loadLicenses', function(licenses)
	Licenses = licenses
end)

-- Open Main Menu
function OpenMainMenu()
	IsInMainMenu = true
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_shop_actions', {
		title = _U('where_to_go'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = {
			--{label = _U('dmv_school'), value = 'dmv_school'},
			{label = _U('buy_license'), value = 'buy_license'}
	}}, function(data, menu)
		if data.current.value == 'dmv_school' then
			exports['esx_dmvschool']:openESXDMV()
		elseif data.current.value == 'buy_license' then
			TriggerServerEvent('esx_licenseshop:ServerLoadLicenses')
			if Config.RequireDMV then
				local ownedLicenses = {}
				for i=1, #Licenses, 1 do
					ownedLicenses[Licenses[i].type] = true
				end

				if not ownedLicenses['dmv'] then
					ESX.ShowNotification(_U('need_dmv'))
				else
					OpenLicenseShop()
				end
			else
				OpenLicenseShop()
			end
		end
	end, function(data, menu)
		IsInMainMenu = false
		menu.close()
		CurrentAction = 'license_menu'
		CurrentActionMsg = _U('press_access')
		CurrentActionData = {}
	end)
end

-- Open License Shop
function OpenLicenseShop()
	IsInMainMenu = true
	local ownedLicenses = {}

	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end

	local elements = {}

	if Config.AdvancedVehicleShop then
		if not ownedLicenses['aircraft'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_aircraft'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Aircraft))), value = 'buy_license_aircraft'})
		end

		if not ownedLicenses['boating'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_boating'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Boating))), value = 'buy_license_boating'})
		end
	end

	if Config.AdvancedWeaponShop then
		if not ownedLicenses['weapon_melee'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_melee'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Melee))), value = 'buy_license_melee'})
		end

		if not ownedLicenses['weapon_handgun'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_handgun'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Handgun))), value = 'buy_license_handgun'})
		end

		if not ownedLicenses['weapon_smg'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_smg'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.SMG))), value = 'buy_license_smg'})
		end

		if not ownedLicenses['weapon_shotgun'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_shotgun'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Shotgun))), value = 'buy_license_shotgun'})
		end

		if not ownedLicenses['weapon_assault'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_assault'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Assault))), value = 'buy_license_assault'})
		end

		if not ownedLicenses['weapon_lmg'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_lmg'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.LMG))), value = 'buy_license_lmg'})
		end

		if not ownedLicenses['weapon_sniper'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_sniper'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Sniper))), value = 'buy_license_sniper'})
		end
	end

	if Config.DMVSchool then
		if Config.SellDMV then
			if not ownedLicenses['dmv'] then
				table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_driversp'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.DriversP))), value = 'buy_license_driversp'})
			end
		end

		if not ownedLicenses['drive_truck'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_commercial'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Commercial))), value = 'buy_license_commercial'})
		end

		if not ownedLicenses['drive'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_drivers'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Drivers))), value = 'buy_license_drivers'})
		end

		if not ownedLicenses['drive_bike'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_motorcycle'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Motorcycle))), value = 'buy_license_motorcycle'})
		end
	end

	if Config.Drugs then
		if not ownedLicenses['weed_processing'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_weed'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Weed))), value = 'buy_license_weed'})
		end
	end

	if Config.WeaponShop then
		if not ownedLicenses['weapon'] then
			table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_weapon'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Weapon))), value = 'buy_license_weapon'})
		end
	end

	if Config.Custom.Licenses then
		if Config.Custom.C1 then
			if not ownedLicenses[Config.Custom.C1Name] then
				table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_custom1'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Custom1))), value = 'buy_license_custom1'})
			end
		end

		if Config.Custom.C2 then
			if not ownedLicenses[Config.Custom.C2Name] then
				table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_custom2'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Custom2))), value = 'buy_license_custom2'})
			end
		end

		if Config.Custom.C3 then
			if not ownedLicenses[Config.Custom.C3Name] then
				table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_custom3'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Custom3))), value = 'buy_license_custom3'})
			end
		end

		if Config.Custom.C4 then
			if not ownedLicenses[Config.Custom.C4Name] then
				table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_custom4'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Custom4))), value = 'buy_license_custom4'})
			end
		end

		if Config.Custom.C5 then
			if not ownedLicenses[Config.Custom.C5Name] then
				table.insert(elements, {label = ('%s - <span style="color: green;">%s</span>'):format(_U('license_custom5'), _U('shop_menu_item', ESX.Math.GroupDigits(Config.Prices.Custom5))), value = 'buy_license_custom5'})
			end
		end
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_shop_actions', {
		title = _U('buy_license'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('esx_licenseshop:buyLicense', data.current.value)
		IsInMainMenu = false
		menu.close()
	end, function(data, menu)
		IsInMainMenu = false
		menu.close()
		CurrentAction = 'license_menu'
		CurrentActionData = {}
	end)
end

-- Entered Marker
AddEventHandler('esx_licenseshop:hasEnteredMarker', function(zone)
	CurrentAction = 'license_menu'
	CurrentActionMsg = _U('press_access')
	CurrentActionData = {}
end)

-- Exited Marker
AddEventHandler('esx_licenseshop:hasExitedMarker', function(zone)
	if not IsInMainMenu or IsInMainMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if IsInMainMenu then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

-- Blips
CreateThread(function()
	if Config.UseBlips then
		for k,v in ipairs(Config.Locs) do
			local blip = AddBlipForCoord(v)

			SetBlipSprite(blip, Config.Blip.Sprite)
			SetBlipColour(blip, Config.Blip.Color)
			SetBlipDisplay(blip, Config.Blip.Display)
			SetBlipScale(blip, Config.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('blip_license_shop'))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

-- Enter / Exit marker events & Draw Markers
CreateThread(function()
	while true do
		Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true, nil

		for k,v in ipairs(Config.Locs) do
			local distance = #(playerCoords - v)

			if distance < Config.DrawDistance then
				letSleep = false

				if Config.MarkerInfo.Type ~= -1 then
					DrawMarker(Config.MarkerInfo.Type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerInfo.x, Config.MarkerInfo.y, Config.MarkerInfo.z, Config.MarkerInfo.r, Config.MarkerInfo.g, Config.MarkerInfo.b, 100, false, true, 2, false, nil, nil, false)
				end

				if distance < Config.MarkerInfo.x then
					isInMarker, currentZone = true, k
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			TriggerEvent('esx_licenseshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_licenseshop:hasExitedMarker', LastZone)
		end

		if letSleep then
			Wait(500)
		end
	end
end)

-- Key controls
CreateThread(function()
	while true do
		Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'license_menu' then
					TriggerServerEvent('esx_licenseshop:ServerLoadLicenses')
					OpenMainMenu()
				end

				CurrentAction = nil
			end
		else
			Wait(500)
		end
	end
end)

function openESXLicenseShop()
	TriggerServerEvent('esx_licenseshop:ServerLoadLicenses')
	if Config.RequireDMV then
		local ownedLicenses = {}
		for i=1, #Licenses, 1 do
			ownedLicenses[Licenses[i].type] = true
		end

		if not ownedLicenses['dmv'] then
			ESX.ShowNotification(_U('need_dmv'))
		else
			OpenLicenseShop()
		end
	else
		OpenLicenseShop()
	end
end
