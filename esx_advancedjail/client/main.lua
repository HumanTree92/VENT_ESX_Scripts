local HasAlreadyEnteredMarker, isInJail, unJail = false, false, false
local LastZone, CurrentAction, CurrentActionMsg
local CurrentActionData = {}
local jailTime, fastTimer = 0, 0

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	FloatingJailText()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

-- Disable Certain Controls if Jailed
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPed = PlayerPedId()

		if isInJail then
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth
			DisableControlAction(2, 21, true) -- Disable sprint | Custom

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			-- Custom Start
			DisableControlAction(0, 289, true) -- Disable F2 | vMenu
			DisableControlAction(0, 170, true) -- Disable F3 | Mechanic Menu/Distress Signal
			DisableControlAction(0, 166, true) -- Disable F5 | Point
			DisableControlAction(0, 167, true) -- Disable F6 | Handsup
			DisableControlAction(0, 168, true) -- Disable F7 | Kneel
			DisableControlAction(0, 169, true) -- Disable F8 | Console
			DisableControlAction(0, 56, true) -- Disable F9 | EasyAdmin
			DisableControlAction(0, 57, true) -- Disable F10 | N/A
			DisableControlAction(0, 344, true) -- Disable F11 | N/A
			DisableControlAction(0, 212, true) -- Disable HOME | es_admin2
			DisableControlAction(0, 213, true) -- Disable HOME | es_admin2
			DisableControlAction(0, 10, true) -- Disable Page Up | Engine
			--DisableControlAction(0, 208, true) -- Disable Page Up | Engine
			--DisableControlAction(0, 316, true) -- Disable Page Up | Engine
			DisableControlAction(0, 11, true) -- Disable Page Down | Job Menu
			--DisableControlAction(0, 207, true) -- Disable Page Down | Job Menu
			--DisableControlAction(0, 317, true) -- Disable Page Down | Job Menu
			-- Custom End
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_advancedjail:jailPlayer')
AddEventHandler('esx_advancedjail:jailPlayer', function(_jailTime, _jailLoc, _name)
	if isInJail then -- Don't allow muliple jails
		return
	end

	jailTime = _jailTime
	location = _jailLoc
	name = _name
	local playerPed = PlayerPedId()
	StartJailTimer()

	if location == 'mr1' then -- MissionRow1
		JailLoc = Config.JailLocations.MissionRow1
		UnJailLoc = Config.JailLocations.MissionRow0
	elseif location == 'mr2' then -- MissionRow2
		JailLoc = Config.JailLocations.MissionRow2
		UnJailLoc = Config.JailLocations.MissionRow0
	elseif location == 'mr3' then -- MissionRow3
		JailLoc = Config.JailLocations.MissionRow3
		UnJailLoc = Config.JailLocations.MissionRow0
	elseif location == 'bp1' then -- BolingBroke1
		JailLoc = Config.JailLocations.BolingBroke1
		UnJailLoc = Config.JailLocations.BolingBroke0
	end

	if DoesEntityExist(playerPed) then
		-- Assigns Jail Skin to Player
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.male)
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_wear.female)
			end
		end)

		-- Clears Player
		SetPedArmour(playerPed, 0)
		ClearPedBloodDamage(playerPed)
		ResetPedVisibleDamage(playerPed)
		ClearPedLastWeaponDamage(playerPed)
		ResetPedMovementClipset(playerPed, 0)

		TriggerEvent('esx_basicneeds:healPlayer')
		TriggerServerEvent('esx_advancedjail:removeInventory')

		ESX.Game.Teleport(playerPed, JailLoc)
		isInJail, unJail = true, false

		while not unJail do
			playerPed = PlayerPedId()

			RemoveAllPedWeapons(playerPed, true)
			if IsPedInAnyVehicle(playerPed, false) then
				ClearPedTasksImmediately(playerPed)
			end

			Citizen.Wait(20000)

			if location == 'mr1' then
				JailLoc = Config.JailLocations.MissionRow1
				UnJailLoc = Config.JailLocations.MissionRow0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'mr')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'mr')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'mr2' then
				JailLoc = Config.JailLocations.MissionRow2
				UnJailLoc = Config.JailLocations.MissionRow0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'mr')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'mr')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'mr3' then
				JailLoc = Config.JailLocations.MissionRow3
				UnJailLoc = Config.JailLocations.MissionRow0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'mr')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'mr')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'bp1' then
				JailLoc = Config.JailLocations.BolingBroke1
				UnJailLoc = Config.JailLocations.BolingBroke0

				if #(GetEntityCoords(playerPed) - JailLoc) > 25 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'bp')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'bp')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			end
		end

		-- Jail Time Served
		ESX.Game.Teleport(playerPed, UnJailLoc)
		isInJail = false

		-- Change Back to the User Skin
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
end)

-- Jail Timer
function DrawGenericTextThisFrame()
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format('%02.f', math.floor(seconds / 3600))
		local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end

function StartJailTimer()
	Citizen.CreateThread(function()
		while jailTime > 0 and isInJail do
			Citizen.Wait(1000)

			if jailTime > 0 then
				jailTime = jailTime - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		local text

		while jailTime > 0 and isInJail do
			Citizen.Wait(0)
			text = _U('remaining_msg', secondsToClock(jailTime))
			DrawGenericTextThisFrame()
			SetTextEntry('STRING')
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end
	end)
end

RegisterNetEvent('esx_advancedjail:unjailPlayer')
AddEventHandler('esx_advancedjail:unjailPlayer', function()
	unJail, jailTime, fastTimer = true, 0, 0
end)

-- When Player Respawns/Joins
AddEventHandler('playerSpawned', function(spawn)
	if isInJail then
		ESX.Game.Teleport(PlayerPedId(), JailLoc)
	end
end)

-- Draw Marker around Jail Position
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if Config.DrawMarkers.Show then
			if Config.DrawMarkers.MR0 then
				DrawMarker(1, Config.JailLocations.MissionRow0, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DrawMarkers.MR1 then
				DrawMarker(1, Config.JailLocations.MissionRow1, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DrawMarkers.MR2 then
				DrawMarker(1, Config.JailLocations.MissionRow2, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DrawMarkers.MR3 then
				DrawMarker(1, Config.JailLocations.MissionRow3, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DrawMarkers.BP0 then
				DrawMarker(1, Config.JailLocations.BolingBroke0, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DrawMarkers.BP1 then
				DrawMarker(1, Config.JailLocations.BolingBroke1, 0, 0, 0, 0, 0, 0, 25.0 * 2, 25.0 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end
		end
	end
end)

function FloatingJailText()
	while true do
		Citizen.Wait(0)

		-- Mission Row
		if GetDistanceBetweenCoords(463.8985, -998.0825, 23.95, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
			-- Default Jail Cells
			Draw3DText(461.8, -993.3, 25.0  -1.400, "Cell 1", 4, 0.1, 0.1)
			Draw3DText(461.8, -998.8, 25.0  -1.400, "Cell 2", 4, 0.1, 0.1)
			Draw3DText(461.8, -1002.4, 25.0  -1.400, "Cell 3", 4, 0.1, 0.1)
		end
	end
end

function Draw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
	local px, py, pz = table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(250, 250, 250, 255) -- You can change the text color here
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry('STRING')
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end

-- Prison Clothing Menu
function PrisonClothingMenu()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'prisonclothing', {
		title = _U('clothing_menu'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = {
			{label = _U('citizen_wear'), value = 'citizen_wear'},
			{label = _U('jail_wear'), value = 'jail_wear'},
	}}, function(data, menu)
		local ped = GetPlayerPed(-1)
		menu.close()

		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'jail_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
				if skin.sex == 0 then
					SetPedComponentVariation(GetPlayerPed(-1), 3, 5, 0, 0) -- Gloves
					SetPedComponentVariation(GetPlayerPed(-1), 4, 9, 4, 0) -- Jeans
					SetPedComponentVariation(GetPlayerPed(-1), 6, 61, 0, 0) -- Shoes
					SetPedComponentVariation(GetPlayerPed(-1), 11, 5, 0, 0) -- Jacket
					SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0) -- Yellow Vest
				elseif skin.sex == 1 then
					SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0) -- Gloves
					SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 15, 0) -- Jeans
					SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0) -- Shoes
					SetPedComponentVariation(GetPlayerPed(-1), 11, 73, 0, 0) -- Jacket
					SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0) -- Yellow Vest
				else
					TriggerEvent('skinchanger:loadClothes', skin, jailSkin.skin_female)
				end
			end)
		end
	end, function (data, menu)
		menu.close()
	end)
end

-- Entered Marker
AddEventHandler('esx_advancedjail:hasEnteredMarker', function(zone)
	CurrentAction = 'prison_clothing_menu'
	CurrentActionMsg = _U('press_access')
	CurrentActionData = {}
end)

-- Exited Marker
AddEventHandler('esx_advancedjail:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		ESX.UI.Menu.CloseAll()
	end
end)

-- Enter / Exit marker events & Draw Markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true

		for k,v in pairs(Config.Zones) do
			local distance = #(playerCoords - v)

			if distance < Config.DrawDistance then
				letSleep = false

				if Config.MarkerInfo.Type ~= -1 then
					DrawMarker(Config.MarkerInfo.Type, v, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerInfo.x, Config.MarkerInfo.y, Config.MarkerInfo.z, Config.MarkerInfo.r, Config.MarkerInfo.g, Config.MarkerInfo.b, 100, false, true, 2, false, false, false, false)
				end

				if distance < Config.MarkerInfo.x then
					isInMarker, currentZone = true, k
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			TriggerEvent('esx_advancedjail:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_advancedjail:hasExitedMarker', LastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end	
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'prison_clothing_menu' then
					PrisonClothingMenu()
				end

				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)