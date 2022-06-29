local CurrentActionData = {}
local HasAlreadyEnteredMarker, IsInMainMenu = false, false
local LastZone, CurrentAction, CurrentActionMsg

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Show Job Menu
function ShowJobListingMenu()
	IsInMainMenu = true
	ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(jobs)
		local elements = {}

		for i=1, #jobs, 1 do
			table.insert(elements, {
				label = jobs[i].label,
				job = jobs[i].job
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'joblisting', {
			title = _U('job_center'),
			align = GetConvar('esx_MenuAlign', 'top-left'),
			elements = elements
		}, function(data, menu)
			TriggerServerEvent('esx_joblisting:setJob', data.current.job)
			ESX.ShowNotification(_U('new_job'))
			IsInMainMenu = false
			menu.close()
		end, function(data, menu)
			IsInMainMenu = false
			menu.close()
			CurrentAction = 'job_menu'
			CurrentActionData = {}
		end)
	end)
end

-- Entered Marker
AddEventHandler('esx_joblisting:hasEnteredMarker', function(zone)
	if zone == 'JobLocs' then
		CurrentAction = 'job_menu'
		CurrentActionMsg = _U('job_menu')
		CurrentActionData = {}
	end
end)

-- Exited Marker
AddEventHandler('esx_joblisting:hasExitedMarker', function(zone)
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

				if Config.Marker.Type ~= -1 then
					DrawMarker(Config.Marker.Type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, 100, false, true, 2, false, nil, nil, false)
				end

				if distance < Config.Marker.x then
					isInMarker, currentZone = true, 'JobLocs'
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			LastZone = currentZone
			TriggerEvent('esx_joblisting:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_joblisting:hasExitedMarker', LastZone)
		end

		if letSleep then
			Wait(500)
		end
	end
end)

-- Create blips
CreateThread(function()
	for k,v in ipairs(Config.Locs) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 1.2)
		SetBlipColour(blip, 27)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('job_center'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Menu Controls
CreateThread(function()
	while true do
		Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'job_menu' then
					ShowJobListingMenu()
				end

				CurrentAction = nil
			end
		else
			Wait(500)
		end
	end
end)
