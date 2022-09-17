local CurrentActionData, allDeliveries = {}, {}
local randomDelivery, veh = 1, 0
local HasAlreadyEnteredMarker, isTaken, isDelivered = false, false, false
local LastZone, CurrentAction, CurrentActionMsg, policeBlip, deliveryBlip

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Add all Deliveries a Table
CreateThread(function()
	local deliveryIds = 1
	for k,v in pairs(Config.Delivery.Locations) do
		table.insert(allDeliveries, {id = deliveryIds, loc = v.Marker, reward = v.Reward, veh = v.Vehicles})
		deliveryIds = deliveryIds + 1
	end
end)

-- Spawn Vehicle
RegisterNetEvent('esx_vehicletheft:startTheft')
AddEventHandler('esx_vehicletheft:startTheft', function()
	-- Delete old Vehicle & Remove Old Blip
	SetEntityAsNoLongerNeeded(veh)
	DeleteVehicle(veh)
	RemoveBlip(deliveryBlip)

	-- Get Delivery & Vehicle
	randomDelivery = math.random(1, #allDeliveries)
	randomVeh = math.random(1, #allDeliveries[randomDelivery].veh)

	-- Get Vehicle Model
	local vehHash = GetHashKey(allDeliveries[randomDelivery].veh[randomVeh])
	RequestModel(vehHash)
	while not HasModelLoaded(vehHash) do
		RequestModel(vehHash)
		Wait(1)
	end

	-- Spawn Vehicle
	ESX.Game.SpawnVehicle(vehHash, this_location.Spawner, this_location.Heading, function(callback_vehicle)
		SetVehRadioStation(callback_vehicle, 'OFF')
		SetVehicleFixed(callback_vehicle)
		SetVehicleDeformationFixed(callback_vehicle)
		SetVehicleUndriveable(callback_vehicle, false)
		SetVehicleEngineOn(callback_vehicle, true, true)
		SetEntityAsMissionEntity(callback_vehicle, true, true)

		if Config.Main.Plate then
			SetVehicleNumberPlateText(callback_vehicle, Config.Main.SetPlate)
		end

		if Config.Main.LegacyFuel then
			exports['LegacyFuel']:SetFuel(callback_vehicle, Config.Main.SetFuel)
		end

		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)

	-- Set Delivery Blip
	deliveryBlip = AddBlipForCoord(allDeliveries[randomDelivery].loc)
	SetBlipSprite(deliveryBlip, 1)
	SetBlipDisplay(deliveryBlip, 4)
	SetBlipScale(deliveryBlip, 1.0)
	SetBlipColour(deliveryBlip, 5)
	SetBlipAsShortRange(deliveryBlip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(_U('delivery_loc'))
	EndTextCommandSetBlipName(deliveryBlip)
	SetBlipRoute(deliveryBlip, true)

	-- Other Needed Stuff
	Wait(2500)
	veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	isTaken = true
	isDelivered = false
end)

-- Finish Delivery
function FinishDelivery()
	if (GetVehiclePedIsIn(GetPlayerPed(-1), false) == veh) and GetEntitySpeed(veh) < 3 then
		-- Delete Vehicle & Blip
		SetEntityAsNoLongerNeeded(veh)
		DeleteEntity(veh)
		RemoveBlip(deliveryBlip)

		-- Send Payment
		local sendPayment = allDeliveries[randomDelivery].reward
		TriggerServerEvent('esx_vehicletheft:sendPayment', sendPayment)

		-- Other Needed Stuff
		isTaken = false
		isDelivered = true

		-- Remove Last Police Blips
		TriggerServerEvent('esx_vehicletheft:alertPoliceStop')
	else
		ESX.ShowNotification(_U('theft_wrong'))
	end
end

-- Abort Delivery
function AbortDelivery()
	-- Delete Vehicle & Blip
	SetEntityAsNoLongerNeeded(veh)
	DeleteEntity(veh)
	RemoveBlip(deliveryBlip)

	-- Other Needed Stuff
	isTaken = false
	isDelivered = true
end

-- Check if Player Left Vehicle
CreateThread(function()
	while true do
		Wait(1000)

		if isTaken and not isDelivered and not (GetVehiclePedIsIn(GetPlayerPed(-1), false) == veh) then
			ESX.ShowNotification(_U('left_1m'))
			Wait(50000)

			if isTaken and not isDelivered and not (GetVehiclePedIsIn(GetPlayerPed(-1), false) == veh) then
				ESX.ShowNotification(_U('left_10s'))
				Wait(10000)
				TriggerServerEvent('esx_vehicletheft:theftCanceled')
				AbortDelivery()
			end
		end
	end
end)

-- Send Location
CreateThread(function()
	while true do
		Wait(Config.Main.BlipTime*1000)

		if isTaken and (GetVehiclePedIsIn(GetPlayerPed(-1), false) == veh) then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			TriggerServerEvent('esx_vehicletheft:alertPolice', coords)
		end
	end
end)

RegisterNetEvent('esx_vehicletheft:setPoliceBlip')
AddEventHandler('esx_vehicletheft:setPoliceBlip', function(coords)
	RemoveBlip(policeBlip)
	policeBlip = AddBlipForCoord(coords)
	SetBlipSprite(policeBlip, 161)
	SetBlipScale(policeBlip, 2.0)
	SetBlipColour(policeBlip, 8)
	PulseBlip(policeBlip)
end)

RegisterNetEvent('esx_vehicletheft:theftPoliceNotif')
AddEventHandler('esx_vehicletheft:theftPoliceNotif', function()
	PlaySoundFrontend(-1, 'Event_Start_Text', 'GTAO_FM_Events_Soundset', 0)
	Wait(1)
	ESX.ShowAdvancedNotification(_U('police_alert'), _U('police_alert_theft'), _U('police_alert_started'), 'CHAR_CALL911', 1)
end)

RegisterNetEvent('esx_vehicletheft:theftCompNotif')
AddEventHandler('esx_vehicletheft:theftCompNotif', function(complete)
	PlaySoundFrontend(-1, 'Event_Start_Text', 'GTAO_FM_Events_Soundset', 0)
	Wait(1)
	RemoveBlip(policeBlip)

	if complete then
		ESX.ShowAdvancedNotification(_U('police_alert'), _U('police_alert_theft'), _U('police_alert_complete'), 'CHAR_CALL911', 1)
	else
		ESX.ShowAdvancedNotification(_U('police_alert'), _U('police_alert_theft'), _U('police_alert_cancelled'), 'CHAR_CALL911', 1)
	end
end)

-- Entered Marker
AddEventHandler('esx_vehicletheft:hasEnteredMarker', function(zone)
	if zone == 'veh_theft_menu' then
		CurrentAction = 'veh_theft_menu'
		CurrentActionMsg = _U('press_theft')
		CurrentActionData = {}
	elseif zone == 'veh_delivered_menu' then
		CurrentAction = 'veh_delivered_menu'
		CurrentActionMsg = _U('press_deliver')
		CurrentActionData = {}
	end
end)

-- Exited Marker
AddEventHandler('esx_vehicletheft:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Enter / Exit marker events & Draw Markers
CreateThread(function()
	while true do
		Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true, nil

		for k,v in pairs(Config.Zones.Locations) do
			local distance = #(playerCoords - v.Marker)

			if distance < Config.Main.DrawDistance then
				letSleep = false

				if Config.Zones.Markers.Type ~= -1 then
					DrawMarker(Config.Zones.Markers.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.Markers.x, Config.Zones.Markers.y, Config.Zones.Markers.z, Config.Zones.Markers.r, Config.Zones.Markers.g, Config.Zones.Markers.b, 100, false, true, 2, false, nil, nil, false)
				end

				if distance < Config.Zones.Markers.x then
					isInMarker, this_location, currentZone = true, v, 'veh_theft_menu'
				end
			end
		end

		if isTaken and not isDelivered then
			v = allDeliveries[randomDelivery]
			local distance = #(playerCoords - allDeliveries[randomDelivery].loc)

			if distance < Config.Main.DrawDistance then
				letSleep = false

				if Config.Delivery.Markers.Type ~= -1 then
					DrawMarker(Config.Delivery.Markers.Type, allDeliveries[randomDelivery].loc, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Delivery.Markers.x, Config.Delivery.Markers.y, Config.Delivery.Markers.z, Config.Delivery.Markers.r, Config.Delivery.Markers.g, Config.Delivery.Markers.b, 100, false, true, 2, false, nil, nil, false)
				end

				if distance < Config.Delivery.Markers.x then
					isInMarker, currentZone = true, 'veh_delivered_menu'
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			LastZone = currentZone
			TriggerEvent('esx_vehicletheft:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_vehicletheft:hasExitedMarker', LastZone)
		end

		if letSleep then
			Wait(500)
		end
	end
end)

-- Key Controls
CreateThread(function()
	while true do
		Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and GetLastInputMethod(2) then
				if CurrentAction == 'veh_theft_menu' then
					if isAuthorized() then
						ESX.TriggerServerCallback('esx_vehicletheft:checkThefts', function(success)
							if success then
								TriggerServerEvent('esx_vehicletheft:theftInProgress')
							else
								ESX.ShowNotification(_U('theft_cooldown'))
							end
						end)
					else
						ESX.ShowNotification(_U('cant_job'))
					end
				elseif CurrentAction == 'veh_delivered_menu' then
					FinishDelivery()
				end

				CurrentAction = nil
			end
		else
			Wait(500)
		end
	end
end)

-- Authorized Jobs
function isAuthorized()
	if not ESX or not ESX.PlayerData.job then
		return false
	end

	for k,job in pairs(Config.Main.AuthorizedJobs) do
		if job == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end
