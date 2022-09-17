local HasAlreadyEnteredMarker, isInRobberyZone, isRobberyStarted, isRobberyDone, isPedArmed, loopAlarm = false, false, false, false, false, false
local LastZone, CurrentAction, CurrentActionMsg
local CurrentActionData	= {}
local blipRobbery = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Start Robbery Timer
RegisterNetEvent('esx_advancedholdup:startRobTimer')
AddEventHandler('esx_advancedholdup:startRobTimer', function(zone)
	isInRobberyZone, isRobberyDone, isRobberyStarted, loopAlarm = true, false, true, true
	RobberyZoneEvents(zone)
	TriggerEvent('esx_advancedholdup:loopAlarm', zone)

	local timer = Config.Zones[zone].TimeToRob

	CreateThread(function()
		while timer > 0 and isInRobberyZone do
			Wait(1000)

			if (timer > 0) then
				timer = timer - 1
			end
		end
	end)

	CreateThread(function()
		while timer > 0 and isInRobberyZone do
			Wait(1)
			drawTxt(0.85, 0.50, 1.0,1.0,0.4, _U('rob_progress', timer), 255, 255, 255, 255)
		end
	end)
end)

-- Robbery Zone Events
function RobberyZoneEvents(zone)
	CreateThread(function()
		while isInRobberyZone do
			Wait(100)
			local playerCoords = GetEntityCoords(PlayerPedId())
			local zoneTable = Config.Zones[zone]
			local distance = #(playerCoords - zoneTable.Coords)

			if distance > zoneTable.AreaSize then
				isInRobberyZone	= false

				if not isRobberyDone then
					PlaySoundFrontend(-1, 'HACKING_FAILURE', 0, 1)
					TriggerServerEvent('esx_advancedholdup:robberyCanceled', zone, true)
					Wait(1000)
					loopAlarm = false
					isRobberyStarted = false
				end
			end
		end
	end)
end

-- Robbery Police Notification
RegisterNetEvent('esx_advancedholdup:robPoliceNotif')
AddEventHandler('esx_advancedholdup:robPoliceNotif', function(zone)
	PlaySoundFrontend(-1, 'Event_Start_Text', 'GTAO_FM_Events_Soundset', 0)
	Wait(1)
	ESX.ShowAdvancedNotification(_U('police_alert'), _U('police_alert_alarm_subject'), _U('police_alert_alarm', zone), 'CHAR_CALL911', 1)
end)

-- Robbery Complete Notification
RegisterNetEvent('esx_advancedholdup:robCompNotif')
AddEventHandler('esx_advancedholdup:robCompNotif', function()
	isRobberyDone = true
	isRobberyStarted = false
	PlaySoundFrontend(-1, 'HACKING_SUCCESS', 0, 1)
	ESX.ShowNotification(_U('rob_complete'))
	Wait(20000)
	loopAlarm = false
end)

-- Robbery Complete At Notification
RegisterNetEvent('esx_advancedholdup:robCompAtNotif')
AddEventHandler('esx_advancedholdup:robCompAtNotif', function(zone, complete)
	PlaySoundFrontend(-1, 'Event_Start_Text', 'GTAO_FM_Events_Soundset', 0)
	Wait(1)

	if complete then
		ESX.ShowAdvancedNotification(_U('police_alert'), _U('police_alert_complete_subject'), _U('police_alert_complete', zone), 'CHAR_CALL911', 1)
	else
		ESX.ShowAdvancedNotification(_U('police_alert'), _U('police_alert_cancel_subject'), _U('police_alert_cancel', zone), 'CHAR_CALL911', 1)
	end
end)

-- Loop Alarm
RegisterNetEvent('esx_advancedholdup:loopAlarm')
AddEventHandler('esx_advancedholdup:loopAlarm', function(zone)
	while loopAlarm do
		PlaySoundFromCoord(-1, 'scanner_alarm_os', Config.Zones[zone].Coords, 'dlc_xm_iaa_player_facility_sounds', 1, 100, 0)
		Wait(1000)
	end
end)

-- Create Blip
RegisterNetEvent('esx_advancedholdup:createBlip')
AddEventHandler('esx_advancedholdup:createBlip', function(coords)
	blipRobbery = AddBlipForCoord(coords)
	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 1)
	PulseBlip(blipRobbery)
end)

-- Remove Blip
RegisterNetEvent('esx_advancedholdup:removeBlip')
AddEventHandler('esx_advancedholdup:removeBlip', function()
	--Wait(20000)
	RemoveBlip(blipRobbery)
end)

-- Entered Marker
AddEventHandler('esx_advancedholdup:hasEnteredMarker', function(zone)
	CurrentAction = 'start_robbery'
	CurrentActionMsg = _U('press_to_rob')
	CurrentActionData = {zone = zone} -- zone = zone
end)

-- Exited Marker
AddEventHandler('esx_advancedholdup:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

-- Enter / Exit marker events & Draw Markers
CreateThread(function()
	while true do
		Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, isEnoughPolice, letSleep, currentZone = false, false, true, nil

		if Config.ReqWeapon and IsPedArmed(PlayerPedId(), 4) or Config.ReqWeapon == false then
			isPedArmed = true

			for k,v in pairs(Config.Zones) do
				local distance = #(playerCoords - v.Coords)

				if distance < Config.DrawDistance then
					letSleep = false

					if v.Marker.Type ~= -1 then
						DrawMarker(v.Marker.Type, v.Coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, 100, false, false, 2, false, false, false, false)
					end

					if distance < v.Marker.x then
						isInMarker, isEnoughPolice, currentZone = true, true, k
					end
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker and isEnoughPolice) or (isInMarker and LastZone ~= currentZone and isEnoughCops) then
				HasAlreadyEnteredMarker, LastZone = true, currentZone
				TriggerEvent('esx_advancedholdup:hasEnteredMarker', currentZone)
			end
		else
			isPedArmed = false
		end

		if (not isInMarker or not isEnoughPolice or not isPedArmed) and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_advancedholdup:hasExitedMarker', LastZone)
		end

		if not isPedArmed or letSleep then
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

			if IsControlJustReleased(1, 38) and GetLastInputMethod(2) then
				if IsPedSittingInAnyVehicle(PlayerPedId()) then
					ESX.ShowNotification(_U('rob_vehicle'))
				else
					if not isRobberyStarted then
						if isAuthorized() then
							ESX.TriggerServerCallback('esx_advancedholdup:checkRob', function(success)
								if success then
									local zone = CurrentActionData.zone
									TriggerServerEvent('esx_advancedholdup:robInProgress', zone)
								else
									ESX.ShowNotification(_U('rob_cooldown'))
								end
							end)
						else
							ESX.ShowNotification(_U('cant_job'))
						end
					else
						ESX.ShowNotification(_U('rob_in_prog'))
					end
				end

				CurrentAction = nil
			end
		else
			Wait(500)
		end
	end
end)

-- Draw Text
function drawTxt(x, y, width, height, scale, text, r, g, b, a)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry('STRING')
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

-- Authorized Jobs
function isAuthorized()
	if not ESX or not ESX.PlayerData.job then
		return false
	end

	for k,job in pairs(Config.AuthorizedJobs) do
		if job == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end
