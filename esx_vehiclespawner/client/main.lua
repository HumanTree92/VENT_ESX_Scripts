local CurrentActionData, this_Spawner = {}, {}
local HasAlreadyEnteredMarker, IsInMainMenu = false, false
local LastZone, CurrentAction, CurrentActionMsg

-- Vehicle Spawn Menu
function OpenSpawnerMenu()
	IsInMainMenu = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
		title = _U('vehicle_spawner'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = {
			{label = _U('dont_abuse')},
			{label = _U('default_veh'), value = 'default_veh'}
	}}, function(data, menu)
		local action = data.current.value

		if action == 'default_veh' then
			local elements2 = {}

			for i=1, #Config.Vehicles, 1 do
				 table.insert(elements2, {
					label = Config.Vehicles[i].label,
					model = Config.Vehicles[i].model
				 })
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'default_veh', {
				title = _U('default_veh'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data, menu)
				if ESX.Game.IsSpawnPointClear(this_Spawner.Loc, 5.0) then
					IsInMainMenu = false
					menu.close()
					SpawnVehicle(data.current.model)
				else
					ESX.ShowNotification(_U('spawnpoint_blocked'))
				end
			end)
		end
	end, function(data, menu)
		IsInMainMenu = false
		menu.close()
		CurrentAction = 'spawner_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	end)
end

-- Vehicle Return Menu
function OpenReturnMenu()
	local playerCoords = GetEntityCoords(PlayerPedId())
	vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 5.0)

	if #vehicles > 0 then
		for i=1, #vehicles, 1 do
			Model = GetEntityModel(vehicles[i])

			if isVehicleListed(Model) then
				ESX.Game.DeleteVehicle(vehicles[i])
			end
		end
	end
end

function isVehicleListed(Model)
	for _,listedVehicle in pairs(Config.ListedVehicles) do
		if Model == GetHashKey(listedVehicle) then
			return true
		end
	end
	return false
end

function SpawnVehicle(model)
	ESX.Game.SpawnVehicle(model, this_Spawner.Loc, this_Spawner.Heading)
end

-- Entered Marker
AddEventHandler('esx_vehiclespawner:hasEnteredMarker', function(zone)
	if zone == 'spawner_point' then
		CurrentAction = 'spawner_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'deleter_point' then
		CurrentAction = 'deleter_point'
		CurrentActionMsg = _U('press_to_enter2')
		CurrentActionData = {}
	end
end)

-- Exited Marker
AddEventHandler('esx_vehiclespawner:hasExitedMarker', function()
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

-- Create Blips
Citizen.CreateThread(function()
	if Config.UseBlips then
		for k,v in pairs(Config.Zones) do
			local blip = AddBlipForCoord(v.Pos)

			SetBlipSprite (blip, Config.BlipVehicleSpawner.Sprite)
			SetBlipColour (blip, Config.BlipVehicleSpawner.Color)
			SetBlipDisplay(blip, Config.BlipVehicleSpawner.Display)
			SetBlipScale  (blip, Config.BlipVehicleSpawner.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('blip_spawner'))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

-- Enter / Exit marker events & Draw Markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true

		for k,v in pairs(Config.Zones) do
			local distance = #(playerCoords - v.Pos)
			local distance2 = #(playerCoords - v.Del)

			if distance < Config.DrawDistance then
				letSleep = false

				if Config.MenuMarker.Type ~= -1 then
					DrawMarker(Config.MenuMarker.Type, v.Pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MenuMarker.x, Config.MenuMarker.y, Config.MenuMarker.z, Config.MenuMarker.r, Config.MenuMarker.g, Config.MenuMarker.b, 100, false, true, 2, false, false, false, false)
				end

				if distance < Config.MenuMarker.x then
					isInMarker, this_Spawner, currentZone = true, v, 'spawner_point'
				end
			end

			if distance2 < Config.DrawDistance then
				letSleep = false

				if Config.DelMarker.Type ~= -1 then
					DrawMarker(Config.DelMarker.Type, v.Del, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.DelMarker.x, Config.DelMarker.y, Config.DelMarker.z, Config.DelMarker.r, Config.DelMarker.g, Config.DelMarker.b, 100, false, true, 2, false, false, false, false)
				end

				if distance2 < Config.DelMarker.x then
					isInMarker, this_Spawner, currentZone = true, v, 'deleter_point'
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			TriggerEvent('esx_vehiclespawner:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_vehiclespawner:hasExitedMarker', LastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'spawner_point' then
					OpenSpawnerMenu()
				elseif CurrentAction == 'deleter_point' then
					OpenReturnMenu()
				end

				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)
