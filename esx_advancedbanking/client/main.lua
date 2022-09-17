local HasAlreadyEnteredMarker, IsInMainMenu = false, false
local LastZone, CurrentAction, CurrentActionMsg

-- Current Balance Event
RegisterNetEvent('esx_advancedbanking:currentBalance')
AddEventHandler('esx_advancedbanking:currentBalance', function(balance)
	if Config.ShowCharName then
		ESX.TriggerServerCallback('esx_advancedbanking:getCharData', function(data)
			if Config.ShowFirstLast then
				playerName = data.firstname .. ' ' .. data.lastname
			else
				playerName = data.firstname
			end

			SendNUIMessage({type = 'balanceHUD', balance = balance, player = playerName})
		end)
	else
		local id = PlayerId()
		local playerName = GetPlayerName(id)
		SendNUIMessage({type = 'balanceHUD', balance = balance, player = playerName})
	end
end)

-- Balance Callback
RegisterNUICallback('balance', function()
	TriggerServerEvent('esx_advancedbanking:balance')
end)

-- Deposit Callback
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('esx_advancedbanking:deposit', tonumber(data.amount))
	TriggerServerEvent('esx_advancedbanking:balance')
end)

-- Withdraw Callback
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('esx_advancedbanking:withdraw', tonumber(data.amountw))
	TriggerServerEvent('esx_advancedbanking:balance')
end)

-- Transfer Callback
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('esx_advancedbanking:transfer', data.target, data.amountt)
	TriggerServerEvent('esx_advancedbanking:balance')
end)

-- Result Event
RegisterNetEvent('esx_advancedbanking:result')
AddEventHandler('esx_advancedbanking:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

-- Invest Callback
RegisterNUICallback('esx_invest', function()
	if IsInMainMenu then
		IsInMainMenu = false
		SetNuiFocus(false, false)
		SendNUIMessage({type = 'closeAll'})
		exports.esx_invest:openUI()
	end
end)

-- Play Animation Function
function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(0)
	end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

-- Close UI Callback
RegisterNUICallback('NUIFocusOff', function()
	closeUI()
end)

-- Open UI Function
function openUI()
	if Config.Animation.Active then
		playAnim('mp_common', 'givetake1_a', Config.Animation.Time)
		Wait(Config.Animation.Time)
	end

	IsInMainMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openGeneral'})
	TriggerServerEvent('esx_advancedbanking:balance')
end

-- Close UI Function
function closeUI()
	IsInMainMenu = false
	SetNuiFocus(false, false)

	if Config.Animation.Active then
		playAnim('mp_common', 'givetake1_a', Config.Animation.Time)
		Wait(Config.Animation.Time)
	end

	SendNUIMessage({type = 'closeAll'})
end

-- Entered Marker
AddEventHandler('esx_advancedbanking:hasEnteredMarker', function(zone)
	if zone == 'ATMLocations' then
		CurrentAction = 'atm_menu'
		CurrentActionMsg = _U('press_access_atm')
	elseif zone == 'BankLocations' then
		CurrentAction = 'bank_menu'
		CurrentActionMsg = _U('press_access_bank')
	end
end)

-- Exited Marker
AddEventHandler('esx_advancedbanking:hasExitedMarker', function(zone)
	if not IsInMainMenu then
		closeUI()
	end

	CurrentAction = nil
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if IsInMainMenu then
			closeUI()
		end
	end
end)

-- Create Blips
CreateThread(function()
	if Config.UseATMBlips then
		for k,v in pairs(Config.Locations) do
			for i=1, #v.ATMs, 1 do
				local blip = AddBlipForCoord(v.ATMs[i])

				SetBlipSprite (blip, Config.ATMBlip.Sprite)
				SetBlipColour (blip, Config.ATMBlip.Color)
				SetBlipDisplay(blip, Config.ATMBlip.Display)
				SetBlipScale  (blip, Config.ATMBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_atm'))
				EndTextCommandSetBlipName(blip)
			end
		end
	end

	if Config.UseBankBlips then
		for k,v in pairs(Config.Locations) do
			for i=1, #v.Banks, 1 do
				local blip = AddBlipForCoord(v.Banks[i])

				SetBlipSprite (blip, Config.BankBlip.Sprite)
				SetBlipColour (blip, Config.BankBlip.Color)
				SetBlipDisplay(blip, Config.BankBlip.Display)
				SetBlipScale  (blip, Config.BankBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_bank'))
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Enter / Exit marker events & Draw Markers
CreateThread(function()
	while true do
		Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true, nil

		for k,v in pairs(Config.Locations) do
			for i=1, #v.ATMs, 1 do
				local distance = #(playerCoords - v.ATMs[i])

				if distance < Config.DrawDistance then
					letSleep = false

					if Config.ATMMarker.Type ~= -1 then
						DrawMarker(Config.ATMMarker.Type, v.ATMs[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.ATMMarker.x, Config.ATMMarker.y, Config.ATMMarker.z, Config.ATMMarker.r, Config.ATMMarker.g, Config.ATMMarker.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.ATMMarker.x then
						isInMarker, currentZone = true, 'ATMLocations'
					end
				end
			end
		end

		for k,v in pairs(Config.Locations) do
			for i=1, #v.Banks, 1 do
				local distance = #(playerCoords - v.Banks[i])

				if distance < Config.DrawDistance then
					letSleep = false

					if Config.BankMarker.Type ~= -1 then
						DrawMarker(Config.BankMarker.Type, v.Banks[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.BankMarker.x, Config.BankMarker.y, Config.BankMarker.z, Config.BankMarker.r, Config.BankMarker.g, Config.BankMarker.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.BankMarker.x then
						isInMarker, currentZone = true, 'BankLocations'
					end
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			LastZone = currentZone
			TriggerEvent('esx_advancedbanking:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_advancedbanking:hasExitedMarker', LastZone)
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
				if Config.UseAdvancedHoldup then
					if IsPedOnFoot(PlayerPedId()) then
						if CurrentAction == 'atm_menu' then
							openUI()
						elseif CurrentAction == 'bank_menu' then
							ESX.TriggerServerCallback('esx_advancedholdup:checkRob', function(success)
								if success then
									openUI()
								else
									ESX.ShowNotification(_U('error_robbery'))
								end
							end)
						end

						CurrentAction = nil
					else
						ESX.ShowNotification(_U('error_vehicle'))
					end
				else
					if IsPedOnFoot(PlayerPedId()) then
						if CurrentAction == 'atm_menu' then
							openUI()
						elseif CurrentAction == 'bank_menu' then
							openUI()
						end

						CurrentAction = nil
					else
						ESX.ShowNotification(_U('error_vehicle'))
					end
				end
			end
		else
			Wait(500)
		end

		if IsControlJustReleased(0, 322) then
			closeUI()
		end
	end
end)
