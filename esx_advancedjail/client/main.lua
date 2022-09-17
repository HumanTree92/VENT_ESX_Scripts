local HasAlreadyEnteredMarker, isInJail, unJail = false, false, false
local LastZone, CurrentAction, CurrentActionMsg
local jailTime = 0

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
CreateThread(function()
	while true do
		Wait(1)

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
			Wait(500)
		end
	end
end)

RegisterNetEvent('esx_advancedjail:jailPlayer')
AddEventHandler('esx_advancedjail:jailPlayer', function(_jailTime, _jailLoc, _name)
	if isInJail then -- Don't allow muliple jails
		return
	end

	jailTime = _jailTime
	local location = _jailLoc
	local name = _name
	local playerPed = PlayerPedId()
	StartJailTimer()

	if location == 'LSMR1' then
		JailLoc = Config.JL.LSMR1
		UnJailLoc = Config.JL.LSMR0
	elseif location == 'LSMR2' then
		JailLoc = Config.JL.LSMR2
		UnJailLoc = Config.JL.LSMR0
	elseif location == 'LSMR3' then
		JailLoc = Config.JL.LSMR3
		UnJailLoc = Config.JL.LSMR0
	elseif location == 'LSMR4' then
		JailLoc = Config.JL.LSMR4
		UnJailLoc = Config.JL.LSMR0
	elseif location == 'SSSD1' then
		JailLoc = Config.JL.SSSD1
		UnJailLoc = Config.JL.SSSD0
	elseif location == 'SSSD2' then
		JailLoc = Config.JL.SSSD2
		UnJailLoc = Config.JL.SSSD0
	elseif location == 'PBSD1' then
		JailLoc = Config.JL.PBSD1
		UnJailLoc = Config.JL.PBSD0
	elseif location == 'PBSD2' then
		JailLoc = Config.JL.PBSD2
		UnJailLoc = Config.JL.PBSD0
	elseif location == 'SSBP1' then
		JailLoc = Config.JL.SSBP1
		UnJailLoc = Config.JL.SSBP0
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

			Wait(20000)

			if location == 'LSMR1' then
				JailLoc = Config.JL.LSMR1
				UnJailLoc = Config.JL.LSMR0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'LSMR')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'LSMR')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'LSMR2' then
				JailLoc = Config.JL.LSMR2
				UnJailLoc = Config.JL.LSMR0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'LSMR')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'LSMR')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'LSMR3' then
				JailLoc = Config.JL.LSMR3
				UnJailLoc = Config.JL.LSMR0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'LSMR')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'LSMR')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'LSMR4' then
				JailLoc = Config.JL.LSMR4
				UnJailLoc = Config.JL.LSMR0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'LSMR')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'LSMR')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'SSSD1' then
				JailLoc = Config.JL.SSSD1
				UnJailLoc = Config.JL.SSSD0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'SSSD')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'SSSD')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'SSSD2' then
				JailLoc = Config.JL.SSSD2
				UnJailLoc = Config.JL.SSSD0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'SSSD')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'SSSD')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'PBSD1' then
				JailLoc = Config.JL.PBSD1
				UnJailLoc = Config.JL.PBSD0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'PBSD')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'PBSD')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'PBSD2' then
				JailLoc = Config.JL.PBSD2
				UnJailLoc = Config.JL.PBSD0

				if #(GetEntityCoords(playerPed) - JailLoc) > 2.5 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'PBSD')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'PBSD')
						TriggerEvent('chat:addMessage', {args = {_U('judge'), _U('escape_attempt')}, color = {147, 196, 109}})
					end
				end
			elseif location == 'SSBP1' then
				JailLoc = Config.JL.SSBP1
				UnJailLoc = Config.JL.SSBP0

				if #(GetEntityCoords(playerPed) - JailLoc) > 25 then
					if Config.AllowEscape then
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'run', 'SSBP')
						TriggerServerEvent('esx_advancedjail:rununjail')
						isInJail, unJail = false, true
						return
					else
						ESX.Game.Teleport(playerPed, JailLoc)
						TriggerServerEvent('esx_advancedjail:playerEscape', name, 'attempt', 'SSBP')
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
	CreateThread(function()
		while jailTime > 0 and isInJail do
			Wait(1000)

			if jailTime > 0 then
				jailTime = jailTime - 1
			end
		end
	end)

	CreateThread(function()
		local text

		while jailTime > 0 and isInJail do
			Wait(0)
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
	unJail, jailTime = true, 0
end)

-- When Player Respawns/Joins
AddEventHandler('playerSpawned', function(spawn)
	if isInJail then
		ESX.Game.Teleport(PlayerPedId(), JailLoc)
	end
end)

-- Draw Marker around Jail Position
CreateThread(function()
	while true do
		Wait(0)

		if Config.DM.Show then
			-- Los Santos Mission Row
			if Config.DM.LSMR0 then
				DrawMarker(1, Config.JL.LSMR0, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.LSMR1 then
				DrawMarker(1, Config.JL.LSMR1, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.LSMR2 then
				DrawMarker(1, Config.JL.LSMR2, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.LSMR3 then
				DrawMarker(1, Config.JL.LSMR3, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.LSMR4 then
				DrawMarker(1, Config.JL.LSMR4, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			-- Sandy Shores Sheriffs Dept
			if Config.DM.SSSD0 then
				DrawMarker(1, Config.JL.SSSD0, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.SSSD1 then
				DrawMarker(1, Config.JL.SSSD1, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.SSSD2 then
				DrawMarker(1, Config.JL.SSSD2, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			-- Paleto Bay Sheriffs Dept
			if Config.DM.PBSD0 then
				DrawMarker(1, Config.JL.PBSD0, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.PBSD1 then
				DrawMarker(1, Config.JL.PBSD1, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.PBSD2 then
				DrawMarker(1, Config.JL.PBSD2, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			-- Sandy Shores Bolingbroke Penitentiary
			if Config.DM.SSBP0 then
				DrawMarker(1, Config.JL.SSBP0, 0, 0, 0, 0, 0, 0, 2.5 * 2, 2.5 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end

			if Config.DM.SSBP1 then
				DrawMarker(1, Config.JL.SSBP1, 0, 0, 0, 0, 0, 0, 25.0 * 2, 25.0 * 2, 0.8001, 0, 155, 255, 200, 0,0, 0,0)
			end
		end
	end
end)

function FloatingJailText()
	while true do
		Wait(0)

		if Config.TL.Show then
			-- Los Santos Mission Row
			if Config.TL.ShowLSMR then
				if GetDistanceBetweenCoords(Config.TL.LSMR0.x, Config.TL.LSMR0.y, Config.TL.LSMR0.z, GetEntityCoords(GetPlayerPed(-1))) < Config.TL.LSMR0.d then
					Draw3DText(Config.TL.LSMR1.x, Config.TL.LSMR1.y, Config.TL.LSMR1.z, Config.TL.LSMR1.text, 4, 0.1, 0.1)
					Draw3DText(Config.TL.LSMR2.x, Config.TL.LSMR2.y, Config.TL.LSMR2.z, Config.TL.LSMR2.text, 4, 0.1, 0.1)
					Draw3DText(Config.TL.LSMR3.x, Config.TL.LSMR3.y, Config.TL.LSMR3.z, Config.TL.LSMR3.text, 4, 0.1, 0.1)
					Draw3DText(Config.TL.LSMR4.x, Config.TL.LSMR4.y, Config.TL.LSMR4.z, Config.TL.LSMR4.text, 4, 0.1, 0.1)
				end
			end

			-- Sandy Shores Sheriffs Dept
			if Config.TL.ShowSSSD then
				if GetDistanceBetweenCoords(Config.TL.SSSD0.x, Config.TL.SSSD0.y, Config.TL.SSSD0.z, GetEntityCoords(GetPlayerPed(-1))) < Config.TL.SSSD0.d then
					Draw3DText(Config.TL.SSSD1.x, Config.TL.SSSD1.y, Config.TL.SSSD1.z, Config.TL.SSSD1.text, 4, 0.1, 0.1)
					Draw3DText(Config.TL.SSSD2.x, Config.TL.SSSD2.y, Config.TL.SSSD2.z, Config.TL.SSSD2.text, 4, 0.1, 0.1)
				end
			end

			-- Paleto Bay Sheriffs Dept
			if Config.TL.ShowPBSD then
				if GetDistanceBetweenCoords(Config.TL.PBSD0.x, Config.TL.PBSD0.y, Config.TL.PBSD0.z, GetEntityCoords(GetPlayerPed(-1))) < Config.TL.PBSD0.d then
					Draw3DText(Config.TL.PBSD1.x, Config.TL.PBSD1.y, Config.TL.PBSD1.z, Config.TL.PBSD1.text, 4, 0.1, 0.1)
					Draw3DText(Config.TL.PBSD2.x, Config.TL.PBSD2.y, Config.TL.PBSD2.z, Config.TL.PBSD2.text, 4, 0.1, 0.1)
				end
			end
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
CreateThread(function()
	while true do
		Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true, nil

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
				if CurrentAction == 'prison_clothing_menu' then
					PrisonClothingMenu()
				end

				CurrentAction = nil
			end
		else
			Wait(500)
		end
	end
end)
