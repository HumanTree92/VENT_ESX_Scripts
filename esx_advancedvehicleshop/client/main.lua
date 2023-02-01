local CurrentActionData, JobBlips, RegBlips, thisShop = {}, {}, {}, {}
local CategoriesAJ, CategoriesPJ, CategoriesD, CategoriesMJ, CategoriesTJ, CategoriesA, CategoriesB, CategoriesC, CategoriesT, CategoriesVA, CategoriesVB, CategoriesVC = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local VehiclesAJ, VehiclesPJ, VehiclesD, VehiclesMJ, VehiclesTJ, VehiclesA, VehiclesB, VehiclesC, VehiclesT, VehiclesVA, VehiclesVB, VehiclesVC = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, IsInMainMenu, YesAlready, ContinuePurchase = false, false, false, false
local LastZone, CurrentAction, CurrentActionMsg, currentDisplayVehicle
local sCategories, sVehicles

function getVehicles()
	if Config.Ambulance.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesAJ', function(categoriesaj)
			CategoriesAJ = categoriesaj
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesAJ', function(vehiclesaj)
			VehiclesAJ = vehiclesaj
		end)
	end

	if Config.Police.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesPJ', function(categoriespj)
			CategoriesPJ = categoriespj
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesPJ', function(vehiclespj)
			VehiclesPJ = vehiclespj
		end)
	end

	if Config.Division.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesD', function(categoriesd)
			CategoriesD = categoriesd
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesD', function(vehiclesd)
			VehiclesD = vehiclesd
		end)
	end

	if Config.Mechanic.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesMJ', function(categoriesmj)
			CategoriesMJ = categoriesmj
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesMJ', function(vehiclesmj)
			VehiclesMJ = vehiclesmj
		end)
	end

	if Config.Taxi.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesTJ', function(categoriestj)
			CategoriesTJ = categoriestj
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesTJ', function(vehiclestj)
			VehiclesTJ = vehiclestj
		end)
	end

	if Config.Aircraft.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesA', function(categoriesa)
			CategoriesA = categoriesa
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesA', function(vehiclesa)
			VehiclesA = vehiclesa
		end)
	end

	if Config.Boat.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesB', function(categoriesb)
			CategoriesB = categoriesb
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesB', function(vehiclesb)
			VehiclesB = vehiclesb
		end)
	end

	if Config.Car.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesC', function(categoriesc)
			CategoriesC = categoriesc
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesC', function(vehiclesc)
			VehiclesC = vehiclesc
		end)
	end

	if Config.Truck.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesT', function(categoriest)
			CategoriesT = categoriest
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesT', function(vehiclest)
			VehiclesT = vehiclest
		end)
	end

	if Config.VIPAircraft.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesVA', function(categoriesva)
			CategoriesVA = categoriesva
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesVA', function(vehiclesva)
			VehiclesVA = vehiclesva
		end)
	end

	if Config.VIPBoat.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesVB', function(categoriesvb)
			CategoriesVB = categoriesvb
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesVB', function(vehiclesvb)
			VehiclesVB = vehiclesvb
		end)
	end

	if Config.VIPCar.Shop then
		ESX.TriggerServerCallback('esx_advancedvehicleshop:getCategoriesVC', function(categoriesvc)
			CategoriesVC = categoriesvc
		end)

		ESX.TriggerServerCallback('esx_advancedvehicleshop:getVehiclesVC', function(vehiclesvc)
			VehiclesVC = vehiclesvc
		end)
	end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer

	if Config.Ambulance.Blips or Config.Police.Blips or Config.Division.Blips or Config.Mechanic.Blips or Config.Taxi.Blips then
		RefreshJobBlips()
	end

	CreateBlips()
	getVehicles()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	if Config.Ambulance.Blips or Config.Police.Blips or Config.Division.Blips or Config.Mechanic.Blips or Config.Taxi.Blips then
		DeleteJobBlips()
		RefreshJobBlips()
	end
end)

-- Ambulance Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesAJ')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesAJ', function(categoriesaj)
	CategoriesAJ = categoriesaj
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesAJ')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesAJ', function(vehiclesaj)
	VehiclesAJ = vehiclesaj
end)

-- Police Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesPJ')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesPJ', function(categoriespj)
	CategoriesPJ = categoriespj
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesPJ')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesPJ', function(vehiclespj)
	VehiclesPJ = vehiclespj
end)

-- Division Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesD')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesD', function(categoriesd)
	CategoriesD = categoriesd
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesD')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesD', function(vehiclesd)
	VehiclesD = vehiclesd
end)

-- Mechanic Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesMJ')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesMJ', function(categoriesmj)
	CategoriesMJ = categoriesmj
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesMJ')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesMJ', function(vehiclesmj)
	VehiclesMJ = vehiclesmj
end)

-- Taxi Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesTJ')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesTJ', function(categoriestj)
	CategoriesTJ = categoriestj
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesTJ')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesTJ', function(vehiclestj)
	VehiclesTJ = vehiclestj
end)

-- Aircraft Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesA')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesA', function(categoriesa)
	CategoriesA = categoriesa
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesA')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesA', function(vehiclesa)
	VehiclesA = vehiclesa
end)

-- Boat Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesB')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesB', function(categoriesb)
	CategoriesB = categoriesb
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesB')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesB', function(vehiclesb)
	VehiclesB = vehiclesb
end)

-- Car Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesC')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesC', function(categoriesc)
	CategoriesC = categoriesc
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesC')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesC', function(vehiclesc)
	VehiclesC = vehiclesc
end)

-- Truck Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesT')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesT', function(categoriest)
	CategoriesT = categoriest
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesT')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesT', function(vehiclest)
	VehiclesT = vehiclest
end)

-- VIP Aircraft Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesVA')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesVA', function(categoriesva)
	CategoriesVA = categoriesva
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesVA')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesVA', function(vehiclesva)
	VehiclesVA = vehiclesva
end)

-- VIP Boat Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesVB')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesVB', function(categoriesvb)
	CategoriesVB = categoriesvb
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesVB')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesVB', function(vehiclesvb)
	VehiclesVB = vehiclesvb
end)

-- VIP Car Shop
RegisterNetEvent('esx_advancedvehicleshop:sendCategoriesVC')
AddEventHandler('esx_advancedvehicleshop:sendCategoriesVC', function(categoriesvc)
	CategoriesVC = categoriesvc
end)

RegisterNetEvent('esx_advancedvehicleshop:sendVehiclesVC')
AddEventHandler('esx_advancedvehicleshop:sendVehiclesVC', function(vehiclesvc)
	VehiclesVC = vehiclesvc
end)

-- Delete Display Vehicle
function shopDeleteDisplayVehicle()
	local attempt = 0

	if currentDisplayVehicle and DoesEntityExist(currentDisplayVehicle) then
		while DoesEntityExist(currentDisplayVehicle) and not NetworkHasControlOfEntity(currentDisplayVehicle) and attempt < 100 do
			Wait(100)
			NetworkRequestControlOfEntity(currentDisplayVehicle)
			attempt = attempt + 1
		end

		if DoesEntityExist(currentDisplayVehicle) and NetworkHasControlOfEntity(currentDisplayVehicle) then
			ESX.Game.DeleteVehicle(currentDisplayVehicle)
		end
	end
end

-- Shop Restrction
function shopRestriction()
	CreateThread(function()
		while IsInMainMenu do
			Wait(0)

			DisableControlAction(0, 75, true) -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		end
	end)
end

-- Buy Vehicle Shop Menu
function BuyVehicleShopMenu(pJobC, sTypeC)
	if pJobC == 'ambulance' and sTypeC == 'car' then
		sCategories, sVehicles = CategoriesAJ, VehiclesAJ
	elseif pJobC == 'police' and sTypeC == 'car' then
		sCategories, sVehicles = CategoriesPJ, VehiclesPJ
	elseif pJobC == 'ambulance' and sTypeC == 'division' or pJobC == 'police' and sTypeC == 'division' then
		sCategories, sVehicles = CategoriesD, VehiclesD
	elseif pJobC == 'mechanic' and sTypeC == 'car' then
		sCategories, sVehicles = CategoriesMJ, VehiclesMJ
	elseif pJobC == 'taxi' and sTypeC == 'car' then
		sCategories, sVehicles = CategoriesTJ, VehiclesTJ
	elseif pJobC == 'civ' and sTypeC == 'aircraft' then
		sCategories, sVehicles = CategoriesA, VehiclesA
	elseif pJobC == 'civ' and sTypeC == 'boat' then
		sCategories, sVehicles = CategoriesB, VehiclesB
	elseif pJobC == 'civ' and sTypeC == 'car' then
		sCategories, sVehicles = CategoriesC, VehiclesC
	elseif pJobC == 'civ' and sTypeC == 'truck' then
		sCategories, sVehicles = CategoriesT, VehiclesT
	elseif pJobC == 'civ' and sTypeC == 'vipaircraft' then
		sCategories, sVehicles = CategoriesVA, VehiclesVA
	elseif pJobC == 'civ' and sTypeC == 'vipboat' then
		sCategories, sVehicles = CategoriesVB, VehiclesVB
	elseif pJobC == 'civ' and sTypeC == 'vipcar' then
		sCategories, sVehicles = CategoriesVC, VehiclesVC
	end

	if #sVehicles == 0 then
		print('[esx_advancedvehicleshop] [^3ERROR^7] No Vehicles Found in this Shop!!!')
		return
	end

	IsInMainMenu = true
	shopRestriction()
	ESX.UI.Menu.CloseAll()

	local playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, true)
	SetEntityVisible(playerPed, false)
	SetEntityCoords(playerPed, thisShop.Inside)

	local vehiclesByCategory = {}
	local elements = {}
	local firstVehicleData = nil

	for i=1, #sCategories, 1 do
		vehiclesByCategory[sCategories[i].name] = {}
	end

	for i=1, #sVehicles, 1 do
		if IsModelInCdimage(GetHashKey(sVehicles[i].model)) then
			table.insert(vehiclesByCategory[sVehicles[i].category], sVehicles[i])
		else
			print(('[esx_advancedvehicleshop] [^3ERROR^7] Vehicle "%s" does not exist'):format(sVehicles[i].model))
		end
	end

	for k,v in pairs(vehiclesByCategory) do
		table.sort(v, function(a, b)
			return a.name < b.name
		end)
	end

	for i=1, #sCategories, 1 do
		local category = sCategories[i]
		local categoryVehicles = vehiclesByCategory[category.name]
		local options = {}

		for j=1, #categoryVehicles, 1 do
			local vehicle = categoryVehicles[j]

			if i == 1 and j == 1 then
				firstVehicleData = vehicle
			end

			table.insert(options, ('%s - <span style="color:green;">%s</span>'):format(vehicle.name, _U('generic_shopitem', ESX.Math.GroupDigits(vehicle.price))))
		end

		table.sort(options)

		table.insert(elements, {
			name = category.name,
			label = category.label,
			value = 0,
			type = 'slider',
			max = #sCategories[i],
			options = options
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_buy', {
		title = _U('vehicle_dealer'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = elements
	}, function(data, menu)
		local elements2 = {}
		local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]

		if Config.Main.Financing then
			table.insert(elements2, {label = _U('finance'), value = 'finance'})
			table.insert(elements2, {label = _U('payfull'), value = 'payfull'})
			table.insert(elements2, {label = _U('cancel'), value = 'cancel'})
		else
			table.insert(elements2, {label = _U('payfull'), value = 'payfull'})
			table.insert(elements2, {label = _U('cancel'), value = 'cancel'})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_confirm', {
			title = _U('buy_vehicle', vehicleData.name, ESX.Math.GroupDigits(vehicleData.price)),
			align = GetConvar('esx_MenuAlign', 'top-left'),
			elements = elements2
		}, function(data2, menu2)
			local purchaseChoice = data2.current.value

			if purchaseChoice == 'finance' and not YesAlready or purchaseChoice == 'payfull' and not YesAlready then
				YesAlready = true
				local spawnloc, spawnhead = thisShop.Outside, thisShop.OutsideH
				local generatedPlate = GeneratePlate()

				if pJobC == 'ambulance' and sTypeC == 'car' or pJobC == 'police' and sTypeC == 'car' or pJobC == 'mechanic' and sTypeC == 'car' or pJobC == 'taxi' and sTypeC == 'car' then
					if ESX.PlayerData.job and ESX.PlayerData.job.name == pJobC and ESX.PlayerData.job.grade_name == vehicleData.category then
						ContinuePurchase = true
					else
						ContinuePurchase = false
						ESX.ShowNotification(_U('your_rank'))
					end
				elseif pJobC == 'ambulance' and sTypeC == 'division' or pJobC == 'police' and sTypeC == 'division' then
					if isVehicleAircraft(vehicleData.model) then
						ContinuePurchase = true
						spawnloc, spawnhead = thisShop.Outside2, thisShop.OutsideH2
					else
						ContinuePurchase = true
					end
				elseif pJobC == 'civ' and sTypeC == 'truck' then
					if isVehicleLarge(vehicleData.model) then
						ContinuePurchase = true
						spawnloc, spawnhead = thisShop.Outside2, thisShop.OutsideH2
					else
						ContinuePurchase = true
					end
				else
					ContinuePurchase = true
				end

				Wait(500)

				if ContinuePurchase then
					if ESX.Game.IsSpawnPointClear(spawnloc, 5.0) then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:buyVehicle', function(success)
							if success then
								IsInMainMenu, YesAlready, ContinuePurchase = false, false, false
								menu2.close()
								menu.close()
								shopDeleteDisplayVehicle()

								ESX.Game.SpawnVehicle(vehicleData.model, spawnloc, spawnhead, function(vehicle)
									TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
									SetVehicleNumberPlateText(vehicle, generatedPlate)

									if Config.Main.LegacyFuel then
										exports['LegacyFuel']:SetFuel(vehicle, 100)
									end

									FreezeEntityPosition(playerPed, false)
									SetEntityVisible(playerPed, true)
									--GiveKeys(generatedPlate)
								end)
							else
								ESX.ShowNotification(_U('not_enough_money'))
							end
						end, purchaseChoice, pJobC, sTypeC, vehicleData.model, generatedPlate, vehicleData.category, vehicleData.name, vehicleData.image)
					else
						YesAlready, ContinuePurchase = false, false
						ESX.ShowNotification(_U('spawnpoint_blocked'))
					end
				else
					print('Purchase has been Cancelled')
				end
			else
				menu2.close()
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()
		shopDeleteDisplayVehicle()
		local playerPed = PlayerPedId()

		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)
		SetEntityCoords(playerPed, thisShop.Enter)

		IsInMainMenu, YesAlready = false, false
	end, function(data, menu)
		local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]
		local playerPed = PlayerPedId()

		shopDeleteDisplayVehicle()
		Wait(100)
		shopWaitVehicle(vehicleData.model)

		ESX.Game.SpawnLocalVehicle(vehicleData.model, thisShop.Inside, thisShop.InsideH, function(vehicle)
			currentDisplayVehicle = vehicle
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
			SetModelAsNoLongerNeeded(vehicleData.model)
		end)
	end)

	shopDeleteDisplayVehicle()
	Wait(100)
	shopWaitVehicle(firstVehicleData.model)

	ESX.Game.SpawnLocalVehicle(firstVehicleData.model, thisShop.Inside, thisShop.InsideH, function(vehicle)
		currentDisplayVehicle = vehicle
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		FreezeEntityPosition(vehicle, true)
		SetModelAsNoLongerNeeded(firstVehicleData.model)
	end)
end

-- Vehicle Checks
function isVehicleAircraft(Model)
	for _,aircraftVehicle in pairs(Config.Division.Helis) do
		if Model == GetHashKey(aircraftVehicle) then
			return true
		end
	end
	return false
end

function isVehicleLarge(Model)
	for _,largeVehicle in pairs(Config.Truck.LargeVehs) do
		if Model == GetHashKey(largeVehicle) then
			return true
		end
	end
	return false
end

-- Wait for Vehicle to Load
function shopWaitVehicle(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyspinnerOn('STRING')
		AddTextComponentSubstringPlayerName(_U('shop_awaiting_model'))
		EndTextCommandBusyspinnerOn(4)

		while not HasModelLoaded(modelHash) do
			Wait(0)
			DisableAllControlActions(0)
		end

		BusyspinnerOff()
	else
		Wait(500)
	end
end

-- Give Keys
function GiveKeys(plate)
	Wait(1000)
	local playerPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local vehicleLabel = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	--print(vehicleLabel)
	TriggerServerEvent('SCRIPT_NAME_HERE:EVENT_NAME_HERE', GetPlayerServerId(PlayerId()), plate, vehicleLabel)
end

-- Entered Marker
AddEventHandler('esx_advancedvehicleshop:hasEnteredMarker', function(zone)
	if zone == 'ambulance_shop_enter' then
		if Config.Ambulance.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
				CurrentAction = 'ambulance_shop_enter'
				CurrentActionMsg = _U('ambulance_menu')
				CurrentActionData = {}
			end
		end
	elseif zone == 'ambulance_resell_point' then
		if Config.Ambulance.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
				local playerPed = PlayerPedId()

				if IsPedSittingInAnyVehicle(playerPed) then
					local vehicle = GetVehiclePedIsIn(playerPed, false)
					local vehicleData, model, resellPrice, plate

					if GetPedInVehicleSeat(vehicle, -1) == playerPed then
						for i=1, #VehiclesAJ, 1 do
							if GetHashKey(VehiclesAJ[i].model) == GetEntityModel(vehicle) then
								vehicleData = VehiclesAJ[i]
								break
							end
						end

						if vehicleData == nil then
							ESX.ShowNotification(_U('cant_sell'))
							Wait(10000)
						else
							resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Ambulance.ResellPerc)
							model = GetEntityModel(vehicle)
							plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

							CurrentAction = 'ambulance_resell_point'
							CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
							CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
						end
					end
				end
			end
		end
	elseif zone == 'police_shop_enter' then
		if Config.Police.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				CurrentAction = 'police_shop_enter'
				CurrentActionMsg = _U('police_menu')
				CurrentActionData = {}
			end
		end
	elseif zone == 'police_resell_point' then
		if Config.Police.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				local playerPed = PlayerPedId()

				if IsPedSittingInAnyVehicle(playerPed) then
					local vehicle = GetVehiclePedIsIn(playerPed, false)
					local vehicleData, model, resellPrice, plate

					if GetPedInVehicleSeat(vehicle, -1) == playerPed then
						for i=1, #VehiclesPJ, 1 do
							if GetHashKey(VehiclesPJ[i].model) == GetEntityModel(vehicle) then
								vehicleData = VehiclesPJ[i]
								break
							end
						end

						if vehicleData == nil then
							ESX.ShowNotification(_U('cant_sell'))
							Wait(10000)
						else
							resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Police.ResellPerc)
							model = GetEntityModel(vehicle)
							plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

							CurrentAction = 'police_resell_point'
							CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
							CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
						end
					end
				end
			end
		end
	elseif zone == 'division_shop_enter' then
		if Config.Division.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				CurrentAction = 'division_shop_enter'
				CurrentActionMsg = _U('division_menu')
				CurrentActionData = {}
			end
		end
	elseif zone == 'division_resell_point' then
		if Config.Division.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				local playerPed = PlayerPedId()

				if IsPedSittingInAnyVehicle(playerPed) then
					local vehicle = GetVehiclePedIsIn(playerPed, false)
					local vehicleData, model, resellPrice, plate

					if GetPedInVehicleSeat(vehicle, -1) == playerPed then
						for i=1, #VehiclesD, 1 do
							if GetHashKey(VehiclesD[i].model) == GetEntityModel(vehicle) then
								vehicleData = VehiclesD[i]
								break
							end
						end

						if vehicleData == nil then
							ESX.ShowNotification(_U('cant_sell'))
							Wait(10000)
						else
							resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Division.ResellPerc)
							model = GetEntityModel(vehicle)
							plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

							CurrentAction = 'division_resell_point'
							CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
							CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
						end
					end
				end
			end
		end
	elseif zone == 'mechanic_shop_enter' then
		if Config.Mechanic.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
				CurrentAction = 'mechanic_shop_enter'
				CurrentActionMsg = _U('mechanic_menu')
				CurrentActionData = {}
			end
		end
	elseif zone == 'mechanic_resell_point' then
		if Config.Mechanic.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
				local playerPed = PlayerPedId()

				if IsPedSittingInAnyVehicle(playerPed) then
					local vehicle = GetVehiclePedIsIn(playerPed, false)
					local vehicleData, model, resellPrice, plate

					if GetPedInVehicleSeat(vehicle, -1) == playerPed then
						for i=1, #VehiclesMJ, 1 do
							if GetHashKey(VehiclesMJ[i].model) == GetEntityModel(vehicle) then
								vehicleData = VehiclesMJ[i]
								break
							end
						end

						if vehicleData == nil then
							ESX.ShowNotification(_U('cant_sell'))
							Wait(10000)
						else
							resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Mechanic.ResellPerc)
							model = GetEntityModel(vehicle)
							plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

							CurrentAction = 'mechanic_resell_point'
							CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
							CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
						end
					end
				end
			end
		end
	elseif zone == 'taxi_shop_enter' then
		if Config.Taxi.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
				CurrentAction = 'taxi_shop_enter'
				CurrentActionMsg = _U('taxi_menu')
				CurrentActionData = {}
			end
		end
	elseif zone == 'taxi_resell_point' then
		if Config.Taxi.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
				local playerPed = PlayerPedId()

				if IsPedSittingInAnyVehicle(playerPed) then
					local vehicle = GetVehiclePedIsIn(playerPed, false)
					local vehicleData, model, resellPrice, plate

					if GetPedInVehicleSeat(vehicle, -1) == playerPed then
						for i=1, #VehiclesTJ, 1 do
							if GetHashKey(VehiclesTJ[i].model) == GetEntityModel(vehicle) then
								vehicleData = VehiclesMJ[i]
								break
							end
						end

						if vehicleData == nil then
							ESX.ShowNotification(_U('cant_sell'))
							Wait(10000)
						else
							resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Taxi.ResellPerc)
							model = GetEntityModel(vehicle)
							plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

							CurrentAction = 'taxi_resell_point'
							CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
							CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
						end
					end
				end
			end
		end
	elseif zone == 'aircraft_shop_enter' then
		if Config.Aircraft.Shop then
			CurrentAction = 'aircraft_shop_enter'
			CurrentActionMsg = _U('aircraft_menu')
			CurrentActionData = {}
		end
	elseif zone == 'aircraft_resell_point' then
		if Config.Aircraft.Shop then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleData, model, resellPrice, plate

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					for i=1, #VehiclesA, 1 do
						if GetHashKey(VehiclesA[i].model) == GetEntityModel(vehicle) then
							vehicleData = VehiclesA[i]
							break
						end
					end

					if vehicleData == nil then
						ESX.ShowNotification(_U('cant_sell'))
						Wait(10000)
					else
						resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Aircraft.ResellPerc)
						model = GetEntityModel(vehicle)
						plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

						CurrentAction = 'aircraft_resell_point'
						CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
						CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
					end
				end
			end
		end
	elseif zone == 'boat_shop_enter' then
		if Config.Boat.Shop then
			CurrentAction = 'boat_shop_enter'
			CurrentActionMsg = _U('boat_menu')
			CurrentActionData = {}
		end
	elseif zone == 'boat_resell_point' then
		if Config.Boat.Shop then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleData, model, resellPrice, plate

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					for i=1, #VehiclesB, 1 do
						if GetHashKey(VehiclesB[i].model) == GetEntityModel(vehicle) then
							vehicleData = VehiclesB[i]
							break
						end
					end

					if vehicleData == nil then
						ESX.ShowNotification(_U('cant_sell'))
						Wait(10000)
					else
						resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Boat.ResellPerc)
						model = GetEntityModel(vehicle)
						plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

						CurrentAction = 'boat_resell_point'
						CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
						CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
					end
				end
			end
		end
	elseif zone == 'car_shop_enter' then
		if Config.Car.Shop then
			CurrentAction = 'car_shop_enter'
			CurrentActionMsg = _U('car_menu')
			CurrentActionData = {}
		end
	elseif zone == 'car_resell_point' then
		if Config.Car.Shop then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleData, model, resellPrice, plate

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					for i=1, #VehiclesC, 1 do
						if GetHashKey(VehiclesC[i].model) == GetEntityModel(vehicle) then
							vehicleData = VehiclesC[i]
							break
						end
					end

					if vehicleData == nil then
						ESX.ShowNotification(_U('cant_sell'))
						Wait(10000)
					else
						resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Car.ResellPerc)
						model = GetEntityModel(vehicle)
						plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

						CurrentAction = 'car_resell_point'
						CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
						CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
					end
				end
			end
		end
	elseif zone == 'truck_shop_enter' then
		if Config.Truck.Shop then
			CurrentAction = 'truck_shop_enter'
			CurrentActionMsg = _U('truck_menu')
			CurrentActionData = {}
		end
	elseif zone == 'truck_resell_point' then
		if Config.Truck.Shop then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleData, model, resellPrice, plate

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					for i=1, #VehiclesT, 1 do
						if GetHashKey(VehiclesT[i].model) == GetEntityModel(vehicle) then
							vehicleData = VehiclesT[i]
							break
						end
					end

					if vehicleData == nil then
						ESX.ShowNotification(_U('cant_sell'))
						Wait(10000)
					else
						resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.Truck.ResellPerc)
						model = GetEntityModel(vehicle)
						plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

						CurrentAction = 'truck_resell_point'
						CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
						CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
					end
				end
			end
		end
	elseif zone == 'vipa_shop_enter' then
		if Config.VIPAircraft.Shop then
			CurrentAction = 'vipa_shop_enter'
			CurrentActionMsg = _U('vipa_menu')
			CurrentActionData = {}
		end
	elseif zone == 'vipa_resell_point' then
		if Config.VIPAircraft.Shop then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleData, model, resellPrice, plate

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					for i=1, #VehiclesVA, 1 do
						if GetHashKey(VehiclesVA[i].model) == GetEntityModel(vehicle) then
							vehicleData = VehiclesVA[i]
							break
						end
					end

					if vehicleData == nil then
						ESX.ShowNotification(_U('cant_sell'))
						Wait(10000)
					else
						resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.VIPAircraft.ResellPerc)
						model = GetEntityModel(vehicle)
						plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

						CurrentAction = 'vipa_resell_point'
						CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
						CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
					end
				end
			end
		end
	elseif zone == 'vipb_shop_enter' then
		if Config.VIPBoat.Shop then
			CurrentAction = 'vipb_shop_enter'
			CurrentActionMsg = _U('vipb_menu')
			CurrentActionData = {}
		end
	elseif zone == 'vipb_resell_point' then
		if Config.VIPBoat.Shop then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleData, model, resellPrice, plate

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					for i=1, #VehiclesVB, 1 do
						if GetHashKey(VehiclesVB[i].model) == GetEntityModel(vehicle) then
							vehicleData = VehiclesVB[i]
							break
						end
					end

					if vehicleData == nil then
						ESX.ShowNotification(_U('cant_sell'))
						Wait(10000)
					else
						resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.VIPBoat.ResellPerc)
						model = GetEntityModel(vehicle)
						plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

						CurrentAction = 'vipb_resell_point'
						CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
						CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
					end
				end
			end
		end
	elseif zone == 'vipc_shop_enter' then
		if Config.VIPCar.Shop then
			CurrentAction = 'vipc_shop_enter'
			CurrentActionMsg = _U('vipc_menu')
			CurrentActionData = {}
		end
	elseif zone == 'vipc_resell_point' then
		if Config.VIPCar.Shop then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				local vehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleData, model, resellPrice, plate

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					for i=1, #VehiclesVC, 1 do
						if GetHashKey(VehiclesVC[i].model) == GetEntityModel(vehicle) then
							vehicleData = VehiclesVC[i]
							break
						end
					end

					if vehicleData == nil then
						ESX.ShowNotification(_U('cant_sell'))
						Wait(10000)
					else
						resellPrice = ESX.Math.Round(vehicleData.price / 100 * Config.VIPCar.ResellPerc)
						model = GetEntityModel(vehicle)
						plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

						CurrentAction = 'vipc_resell_point'
						CurrentActionMsg = _U('sell_menu', vehicleData.name, ESX.Math.GroupDigits(resellPrice))
						CurrentActionData = {vehicle = vehicle, label = vehicleData.name, price = resellPrice, model = model, plate = plate}
					end
				end
			end
		end
	end
end)

-- Exited Marker
AddEventHandler('esx_advancedvehicleshop:hasExitedMarker', function(zone)
	if not IsInMainMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if IsInMainMenu then
			ESX.UI.Menu.CloseAll()

			local playerPed = PlayerPedId()
			FreezeEntityPosition(playerPed, false)
			SetEntityVisible(playerPed, true)
		end

		shopDeleteDisplayVehicle()
	end
end)

-- Enter / Exit marker events & Draw Markers
CreateThread(function()
	while true do
		Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, true, nil

		if Config.Ambulance.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
				for k,v in pairs(Config.Ambulance.Locations) do
					local distance = #(playerCoords - v.Enter)
					local distance2 = #(playerCoords - v.Resell)

					if distance < Config.Main.DrawDistanceE then
						letSleep = false

						if Config.Ambulance.Markers.Enter.Type ~= -1 then
							DrawMarker(Config.Ambulance.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Ambulance.Markers.Enter.x, Config.Ambulance.Markers.Enter.y, Config.Ambulance.Markers.Enter.z, Config.Ambulance.Markers.Enter.r, Config.Ambulance.Markers.Enter.g, Config.Ambulance.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.Ambulance.Markers.Enter.x then
							isInMarker, thisShop, currentZone = true, v, 'ambulance_shop_enter'
						end
					end

					if distance2 < Config.Main.DrawDistanceR then
						letSleep = false

						if Config.Ambulance.Markers.Resell.Type ~= -1 then
							DrawMarker(Config.Ambulance.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Ambulance.Markers.Resell.x, Config.Ambulance.Markers.Resell.y, Config.Ambulance.Markers.Resell.z, Config.Ambulance.Markers.Resell.r, Config.Ambulance.Markers.Resell.g, Config.Ambulance.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
						end

						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							if distance2 < Config.Ambulance.Markers.Resell.x then
								isInMarker, thisShop, currentZone = true, v, 'ambulance_resell_point'
							end
						end
					end
				end
			end
		end

		if Config.Police.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				for k,v in pairs(Config.Police.Locations) do
					local distance = #(playerCoords - v.Enter)
					local distance2 = #(playerCoords - v.Resell)

					if distance < Config.Main.DrawDistanceE then
						letSleep = false

						if Config.Police.Markers.Enter.Type ~= -1 then
							DrawMarker(Config.Police.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Police.Markers.Enter.x, Config.Police.Markers.Enter.y, Config.Police.Markers.Enter.z, Config.Police.Markers.Enter.r, Config.Police.Markers.Enter.g, Config.Police.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.Police.Markers.Enter.x then
							isInMarker, thisShop, currentZone = true, v, 'police_shop_enter'
						end
					end

					if distance2 < Config.Main.DrawDistanceR then
						letSleep = false

						if Config.Police.Markers.Resell.Type ~= -1 then
							DrawMarker(Config.Police.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Police.Markers.Resell.x, Config.Police.Markers.Resell.y, Config.Police.Markers.Resell.z, Config.Police.Markers.Resell.r, Config.Police.Markers.Resell.g, Config.Police.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
						end

						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							if distance2 < Config.Police.Markers.Resell.x then
								isInMarker, thisShop, currentZone = true, v, 'police_resell_point'
							end
						end
					end
				end
			end
		end

		if Config.Division.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				for k,v in pairs(Config.Division.Locations) do
					local distance = #(playerCoords - v.Enter)
					local distance2 = #(playerCoords - v.Resell)
					local distance3 = #(playerCoords - v.Resell2)

					if distance < Config.Main.DrawDistanceE then
						letSleep = false

						if Config.Division.Markers.Enter.Type ~= -1 then
							DrawMarker(Config.Division.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Division.Markers.Enter.x, Config.Division.Markers.Enter.y, Config.Division.Markers.Enter.z, Config.Division.Markers.Enter.r, Config.Division.Markers.Enter.g, Config.Division.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.Division.Markers.Enter.x then
							isInMarker, thisShop, currentZone = true, v, 'division_shop_enter'
						end
					end

					if distance2 < Config.Main.DrawDistanceR then
						letSleep = false

						if Config.Division.Markers.Resell.Type ~= -1 then
							DrawMarker(Config.Division.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Division.Markers.Resell.x, Config.Division.Markers.Resell.y, Config.Division.Markers.Resell.z, Config.Division.Markers.Resell.r, Config.Division.Markers.Resell.g, Config.Division.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
						end

						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							if distance2 < Config.Division.Markers.Resell.x then
								isInMarker, thisShop, currentZone = true, v, 'division_resell_point'
							end
						end
					end

					if distance3 < Config.Main.DrawDistanceR then
						letSleep = false

						if Config.Division.Markers.Resell.Type ~= -1 then
							DrawMarker(Config.Division.Markers.Resell.Type, v.Resell2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Division.Markers.Resell.x, Config.Division.Markers.Resell.y, Config.Division.Markers.Resell.z, Config.Division.Markers.Resell.r, Config.Division.Markers.Resell.g, Config.Division.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
						end

						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							if distance3 < Config.Division.Markers.Resell.x then
								isInMarker, thisShop, currentZone = true, v, 'division_resell_point'
							end
						end
					end
				end
			end
		end

		if Config.Mechanic.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
				for k,v in pairs(Config.Mechanic.Locations) do
					local distance = #(playerCoords - v.Enter)
					local distance2 = #(playerCoords - v.Resell)

					if distance < Config.Main.DrawDistanceE then
						letSleep = false

						if Config.Mechanic.Markers.Enter.Type ~= -1 then
							DrawMarker(Config.Mechanic.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Mechanic.Markers.Enter.x, Config.Mechanic.Markers.Enter.y, Config.Mechanic.Markers.Enter.z, Config.Mechanic.Markers.Enter.r, Config.Mechanic.Markers.Enter.g, Config.Mechanic.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.Mechanic.Markers.Enter.x then
							isInMarker, thisShop, currentZone = true, v, 'mechanic_shop_enter'
						end
					end

					if distance2 < Config.Main.DrawDistanceR then
						letSleep = false

						if Config.Mechanic.Markers.Resell.Type ~= -1 then
							DrawMarker(Config.Mechanic.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Mechanic.Markers.Resell.x, Config.Mechanic.Markers.Resell.y, Config.Mechanic.Markers.Resell.z, Config.Mechanic.Markers.Resell.r, Config.Mechanic.Markers.Resell.g, Config.Mechanic.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
						end

						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							if distance2 < Config.Mechanic.Markers.Resell.x then
								isInMarker, thisShop, currentZone = true, v, 'mechanic_resell_point'
							end
						end
					end
				end
			end
		end

		if Config.Taxi.Shop then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
				for k,v in pairs(Config.Taxi.Locations) do
					local distance = #(playerCoords - v.Enter)
					local distance2 = #(playerCoords - v.Resell)

					if distance < Config.Main.DrawDistanceE then
						letSleep = false

						if Config.Taxi.Markers.Enter.Type ~= -1 then
							DrawMarker(Config.Taxi.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Taxi.Markers.Enter.x, Config.Taxi.Markers.Enter.y, Config.Taxi.Markers.Enter.z, Config.Taxi.Markers.Enter.r, Config.Taxi.Markers.Enter.g, Config.Taxi.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.Taxi.Markers.Enter.x then
							isInMarker, thisShop, currentZone = true, v, 'taxi_shop_enter'
						end
					end

					if distance2 < Config.Main.DrawDistanceR then
						letSleep = false

						if Config.Taxi.Markers.Resell.Type ~= -1 then
							DrawMarker(Config.Taxi.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Taxi.Markers.Resell.x, Config.Taxi.Markers.Resell.y, Config.Taxi.Markers.Resell.z, Config.Taxi.Markers.Resell.r, Config.Taxi.Markers.Resell.g, Config.Taxi.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
						end

						if IsPedSittingInAnyVehicle(PlayerPedId()) then
							if distance2 < Config.Taxi.Markers.Resell.x then
								isInMarker, thisShop, currentZone = true, v, 'taxi_resell_point'
							end
						end
					end
				end
			end
		end

		if Config.Aircraft.Shop then
			for k,v in pairs(Config.Aircraft.Locations) do
				local distance = #(playerCoords - v.Enter)
				local distance2 = #(playerCoords - v.Resell)

				if distance < Config.Main.DrawDistanceE then
					letSleep = false

					if Config.Aircraft.Markers.Enter.Type ~= -1 then
						DrawMarker(Config.Aircraft.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Aircraft.Markers.Enter.x, Config.Aircraft.Markers.Enter.y, Config.Aircraft.Markers.Enter.z, Config.Aircraft.Markers.Enter.r, Config.Aircraft.Markers.Enter.g, Config.Aircraft.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.Aircraft.Markers.Enter.x then
						isInMarker, thisShop, currentZone = true, v, 'aircraft_shop_enter'
					end
				end

				if distance2 < Config.Main.DrawDistanceR then
					letSleep = false

					if Config.Aircraft.Markers.Resell.Type ~= -1 then
						DrawMarker(Config.Aircraft.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Aircraft.Markers.Resell.x, Config.Aircraft.Markers.Resell.y, Config.Aircraft.Markers.Resell.z, Config.Aircraft.Markers.Resell.r, Config.Aircraft.Markers.Resell.g, Config.Aircraft.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
					end

					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						if distance2 < Config.Aircraft.Markers.Resell.x then
							isInMarker, thisShop, currentZone = true, v, 'aircraft_resell_point'
						end
					end
				end
			end
		end

		if Config.Boat.Shop then
			for k,v in pairs(Config.Boat.Locations) do
				local distance = #(playerCoords - v.Enter)
				local distance2 = #(playerCoords - v.Resell)

				if distance < Config.Main.DrawDistanceE then
					letSleep = false

					if Config.Boat.Markers.Enter.Type ~= -1 then
						DrawMarker(Config.Boat.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Boat.Markers.Enter.x, Config.Boat.Markers.Enter.y, Config.Boat.Markers.Enter.z, Config.Boat.Markers.Enter.r, Config.Boat.Markers.Enter.g, Config.Boat.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.Boat.Markers.Enter.x then
						isInMarker, thisShop, currentZone = true, v, 'boat_shop_enter'
					end
				end

				if distance2 < Config.Main.DrawDistanceR then
					letSleep = false

					if Config.Boat.Markers.Resell.Type ~= -1 then
						DrawMarker(Config.Boat.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Boat.Markers.Resell.x, Config.Boat.Markers.Resell.y, Config.Boat.Markers.Resell.z, Config.Boat.Markers.Resell.r, Config.Boat.Markers.Resell.g, Config.Boat.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
					end

					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						if distance2 < Config.Boat.Markers.Resell.x then
							isInMarker, thisShop, currentZone = true, v, 'boat_resell_point'
						end
					end
				end
			end
		end

		if Config.Car.Shop then
			for k,v in pairs(Config.Car.Locations) do
				local distance = #(playerCoords - v.Enter)
				local distance2 = #(playerCoords - v.Resell)

				if distance < Config.Main.DrawDistanceE then
					letSleep = false

					if Config.Car.Markers.Enter.Type ~= -1 then
						DrawMarker(Config.Car.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Car.Markers.Enter.x, Config.Car.Markers.Enter.y, Config.Car.Markers.Enter.z, Config.Car.Markers.Enter.r, Config.Car.Markers.Enter.g, Config.Car.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.Car.Markers.Enter.x then
						isInMarker, thisShop, currentZone = true, v, 'car_shop_enter'
					end
				end

				if distance2 < Config.Main.DrawDistanceR then
					letSleep = false

					if Config.Car.Markers.Resell.Type ~= -1 then
						DrawMarker(Config.Car.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Car.Markers.Resell.x, Config.Car.Markers.Resell.y, Config.Car.Markers.Resell.z, Config.Car.Markers.Resell.r, Config.Car.Markers.Resell.g, Config.Car.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
					end

					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						if distance2 < Config.Car.Markers.Resell.x then
							isInMarker, thisShop, currentZone = true, v, 'car_resell_point'
						end
					end
				end
			end
		end

		if Config.Truck.Shop then
			for k,v in pairs(Config.Truck.Locations) do
				local distance = #(playerCoords - v.Enter)
				local distance2 = #(playerCoords - v.Resell)

				if distance < Config.Main.DrawDistanceE then
					letSleep = false

					if Config.Truck.Markers.Enter.Type ~= -1 then
						DrawMarker(Config.Truck.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Truck.Markers.Enter.x, Config.Truck.Markers.Enter.y, Config.Truck.Markers.Enter.z, Config.Truck.Markers.Enter.r, Config.Truck.Markers.Enter.g, Config.Truck.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.Truck.Markers.Enter.x then
						isInMarker, thisShop, currentZone = true, v, 'truck_shop_enter'
					end
				end

				if distance2 < Config.Main.DrawDistanceR then
					letSleep = false

					if Config.Truck.Markers.Resell.Type ~= -1 then
						DrawMarker(Config.Truck.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Truck.Markers.Resell.x, Config.Truck.Markers.Resell.y, Config.Truck.Markers.Resell.z, Config.Truck.Markers.Resell.r, Config.Truck.Markers.Resell.g, Config.Truck.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
					end

					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						if distance2 < Config.Truck.Markers.Resell.x then
							isInMarker, thisShop, currentZone = true, v, 'truck_resell_point'
						end
					end
				end
			end
		end

		if Config.VIPAircraft.Shop then
			for k,v in pairs(Config.VIPAircraft.Locations) do
				local distance = #(playerCoords - v.Enter)
				local distance2 = #(playerCoords - v.Resell)

				if distance < Config.Main.DrawDistanceE then
					letSleep = false

					if Config.VIPAircraft.Markers.Enter.Type ~= -1 then
						DrawMarker(Config.VIPAircraft.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.VIPAircraft.Markers.Enter.x, Config.VIPAircraft.Markers.Enter.y, Config.VIPAircraft.Markers.Enter.z, Config.VIPAircraft.Markers.Enter.r, Config.VIPAircraft.Markers.Enter.g, Config.VIPAircraft.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.VIPAircraft.Markers.Enter.x then
						isInMarker, thisShop, currentZone = true, v, 'vipa_shop_enter'
					end
				end

				if distance2 < Config.Main.DrawDistanceR then
					letSleep = false

					if Config.VIPAircraft.Markers.Resell.Type ~= -1 then
						DrawMarker(Config.VIPAircraft.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.VIPAircraft.Markers.Resell.x, Config.VIPAircraft.Markers.Resell.y, Config.VIPAircraft.Markers.Resell.z, Config.VIPAircraft.Markers.Resell.r, Config.VIPAircraft.Markers.Resell.g, Config.VIPAircraft.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
					end

					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						if distance2 < Config.VIPAircraft.Markers.Resell.x then
							isInMarker, thisShop, currentZone = true, v, 'vipa_resell_point'
						end
					end
				end
			end
		end

		if Config.VIPBoat.Shop then
			for k,v in pairs(Config.VIPBoat.Locations) do
				local distance = #(playerCoords - v.Enter)
				local distance2 = #(playerCoords - v.Resell)

				if distance < Config.Main.DrawDistanceE then
					letSleep = false

					if Config.VIPBoat.Markers.Enter.Type ~= -1 then
						DrawMarker(Config.VIPBoat.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.VIPBoat.Markers.Enter.x, Config.VIPBoat.Markers.Enter.y, Config.VIPBoat.Markers.Enter.z, Config.VIPBoat.Markers.Enter.r, Config.VIPBoat.Markers.Enter.g, Config.VIPBoat.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.VIPBoat.Markers.Enter.x then
						isInMarker, thisShop, currentZone = true, v, 'vipb_shop_enter'
					end
				end

				if distance2 < Config.Main.DrawDistanceR then
					letSleep = false

					if Config.VIPBoat.Markers.Resell.Type ~= -1 then
						DrawMarker(Config.VIPBoat.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.VIPBoat.Markers.Resell.x, Config.VIPBoat.Markers.Resell.y, Config.VIPBoat.Markers.Resell.z, Config.VIPBoat.Markers.Resell.r, Config.VIPBoat.Markers.Resell.g, Config.VIPBoat.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
					end

					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						if distance2 < Config.VIPBoat.Markers.Resell.x then
							isInMarker, thisShop, currentZone = true, v, 'vipb_resell_point'
						end
					end
				end
			end
		end

		if Config.VIPCar.Shop then
			for k,v in pairs(Config.VIPCar.Locations) do
				local distance = #(playerCoords - v.Enter)
				local distance2 = #(playerCoords - v.Resell)

				if distance < Config.Main.DrawDistanceE then
					letSleep = false

					if Config.VIPCar.Markers.Enter.Type ~= -1 then
						DrawMarker(Config.VIPCar.Markers.Enter.Type, v.Enter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.VIPCar.Markers.Enter.x, Config.VIPCar.Markers.Enter.y, Config.VIPCar.Markers.Enter.z, Config.VIPCar.Markers.Enter.r, Config.VIPCar.Markers.Enter.g, Config.VIPCar.Markers.Enter.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.VIPCar.Markers.Enter.x then
						isInMarker, thisShop, currentZone = true, v, 'vipc_shop_enter'
					end
				end

				if distance2 < Config.Main.DrawDistanceR then
					letSleep = false

					if Config.VIPCar.Markers.Resell.Type ~= -1 then
						DrawMarker(Config.VIPCar.Markers.Resell.Type, v.Resell, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.VIPCar.Markers.Resell.x, Config.VIPCar.Markers.Resell.y, Config.VIPCar.Markers.Resell.z, Config.VIPCar.Markers.Resell.r, Config.VIPCar.Markers.Resell.g, Config.VIPCar.Markers.Resell.b, 100, false, true, 2, false, nil, nil, false)
					end

					if IsPedSittingInAnyVehicle(PlayerPedId()) then
						if distance2 < Config.VIPCar.Markers.Resell.x then
							isInMarker, thisShop, currentZone = true, v, 'vipc_resell_point'
						end
					end
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			LastZone = currentZone
			TriggerEvent('esx_advancedvehicleshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_advancedvehicleshop:hasExitedMarker', LastZone)
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
				if CurrentAction == 'ambulance_shop_enter' then
					if Config.Ambulance.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
							if Config.Ambulance.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu('ambulance', 'car')
									else
										ESX.ShowNotification(_U('car_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'drive')
							else
								BuyVehicleShopMenu('ambulance', 'car')
							end
						end
					end
				elseif CurrentAction == 'ambulance_resell_point' then
					if Config.Ambulance.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
							ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
								if vehicleSold then
									ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
									ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
								else
									ESX.ShowNotification(_U('not_yours'))
								end
							end, 'ambulance', 'car', CurrentActionData.plate, CurrentActionData.model)
						end
					end
				elseif CurrentAction == 'police_shop_enter' then
					if Config.Police.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
							if Config.Police.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu('police', 'car')
									else
										ESX.ShowNotification(_U('car_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'drive')
							else
								BuyVehicleShopMenu('police', 'car')
							end
						end
					end
				elseif CurrentAction == 'police_resell_point' then
					if Config.Police.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
							ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
								if vehicleSold then
									ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
									ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
								else
									ESX.ShowNotification(_U('not_yours'))
								end
							end, 'police', 'car', CurrentActionData.plate, CurrentActionData.model)
						end
					end
				elseif CurrentAction == 'division_shop_enter' then
					if Config.Division.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
							if Config.Division.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu(ESX.PlayerData.job.name, 'division')
									else
										ESX.ShowNotification(_U('car_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'drive')
							else
								BuyVehicleShopMenu(ESX.PlayerData.job.name, 'division')
							end
						end
					end
				elseif CurrentAction == 'division_resell_point' then
					if Config.Division.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
							ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
								if vehicleSold then
									ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
									ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
								else
									ESX.ShowNotification(_U('not_yours'))
								end
							end, ESX.PlayerData.job.name, 'division', CurrentActionData.plate, CurrentActionData.model)
						end
					end
				elseif CurrentAction == 'mechanic_shop_enter' then
					if Config.Mechanic.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
							if Config.Mechanic.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu('mechanic', 'car')
									else
										ESX.ShowNotification(_U('truck_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'drive_truck')
							else
								BuyVehicleShopMenu('mechanic', 'car')
							end
						end
					end
				elseif CurrentAction == 'mechanic_resell_point' then
					if Config.Mechanic.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
							ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
								if vehicleSold then
									ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
									ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
								else
									ESX.ShowNotification(_U('not_yours'))
								end
							end, 'mechanic', 'car', CurrentActionData.plate, CurrentActionData.model)
						end
					end
				elseif CurrentAction == 'taxi_shop_enter' then
					if Config.Taxi.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
							if Config.Taxi.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu('taxi', 'car')
									else
										ESX.ShowNotification(_U('car_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'drive')
							else
								BuyVehicleShopMenu('taxi', 'car')
							end
						end
					end
				elseif CurrentAction == 'taxi_resell_point' then
					if Config.Taxi.Shop then
						if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
							ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
								if vehicleSold then
									ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
									ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
								else
									ESX.ShowNotification(_U('not_yours'))
								end
							end, 'taxi', 'car', CurrentActionData.plate, CurrentActionData.model)
						end
					end
				elseif CurrentAction == 'aircraft_shop_enter' then
					if Config.Aircraft.Shop then
						if Config.Aircraft.License then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
								if hasLicense then
									BuyVehicleShopMenu('civ', 'aircraft')
								else
									ESX.ShowNotification(_U('aircraft_missing'))
									ESX.ShowNotification(_U('go_to'))
								end
							end, GetPlayerServerId(PlayerId()), 'aircraft')
						else
							BuyVehicleShopMenu('civ', 'aircraft')
						end
					end
				elseif CurrentAction == 'aircraft_resell_point' then
					if Config.Aircraft.Shop then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
							if vehicleSold then
								ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
							else
								ESX.ShowNotification(_U('not_yours'))
							end
						end, 'civ', 'aircraft', CurrentActionData.plate, CurrentActionData.model)
					end
				elseif CurrentAction == 'boat_shop_enter' then
					if Config.Boat.Shop then
						if Config.Boat.License then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
								if hasLicense then
									BuyVehicleShopMenu('civ', 'boat')
								else
									ESX.ShowNotification(_U('boat_missing'))
									ESX.ShowNotification(_U('go_to'))
								end
							end, GetPlayerServerId(PlayerId()), 'boating')
						else
							BuyVehicleShopMenu('civ', 'boat')
						end
					end
				elseif CurrentAction == 'boat_resell_point' then
					if Config.Boat.Shop then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
							if vehicleSold then
								ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
							else
								ESX.ShowNotification(_U('not_yours'))
							end
						end, 'civ', 'boat', CurrentActionData.plate, CurrentActionData.model)
					end
				elseif CurrentAction == 'car_shop_enter' then
					if Config.Car.Shop then
						if Config.Car.License then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
								if hasLicense then
									BuyVehicleShopMenu('civ', 'car')
								else
									ESX.ShowNotification(_U('car_missing'))
								end
							end, GetPlayerServerId(PlayerId()), 'drive')
						else
							BuyVehicleShopMenu('civ', 'car')
						end
					end
				elseif CurrentAction == 'car_resell_point' then
					if Config.Car.Shop then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
							if vehicleSold then
								ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
							else
								ESX.ShowNotification(_U('not_yours'))
							end
						end, 'civ', 'car', CurrentActionData.plate, CurrentActionData.model)
					end
				elseif CurrentAction == 'truck_shop_enter' then
					if Config.Truck.Shop then
						if Config.Truck.License then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
								if hasLicense then
									BuyVehicleShopMenu('civ', 'truck')
								else
									ESX.ShowNotification(_U('truck_missing'))
								end
							end, GetPlayerServerId(PlayerId()), 'drive_truck')
						else
							BuyVehicleShopMenu('civ', 'truck')
						end
					end
				elseif CurrentAction == 'truck_resell_point' then
					if Config.Truck.Shop then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
							if vehicleSold then
								ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
							else
								ESX.ShowNotification(_U('not_yours'))
							end
						end, 'civ', 'truck', CurrentActionData.plate, CurrentActionData.model)
					end
				elseif CurrentAction == 'vipa_shop_enter' then
					if Config.VIPAircraft.Shop then
						if Config.Main.VIPScript then
							if Config.VIPAircraft.License then
								ESX.TriggerServerCallback('esx_advancedvehicleshop:GetVIP', function(success)
									if success then
										ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
											if hasLicense then
												BuyVehicleShopMenu('civ', 'vipaircraft')
											else
												ESX.ShowNotification(_U('aircraft_missing'))
											end
										end, GetPlayerServerId(PlayerId()), 'aircraft')
									else
										ESX.ShowNotification(_U('vip_no'))
									end
								end)
							else
								ESX.TriggerServerCallback('esx_advancedvehicleshop:GetVIP', function(success)
									if success then
										BuyVehicleShopMenu('civ', 'vipaircraft')
									else
										ESX.ShowNotification(_U('vip_no'))
									end
								end)
							end
						else
							if Config.VIPAircraft.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu('civ', 'vipaircraft')
									else
										ESX.ShowNotification(_U('aircraft_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'aircraft')
							else
								BuyVehicleShopMenu('civ', 'vipaircraft')
							end
						end
					end
				elseif CurrentAction == 'vipa_resell_point' then
					if Config.VIPAircraft.Shop then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
							if vehicleSold then
								ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
							else
								ESX.ShowNotification(_U('not_yours'))
							end
						end, 'civ', 'vipaircraft', CurrentActionData.plate, CurrentActionData.model)
					end
				elseif CurrentAction == 'vipb_shop_enter' then
					if Config.VIPBoat.Shop then
						if Config.Main.VIPScript then
							if Config.VIPBoat.License then
								ESX.TriggerServerCallback('esx_advancedvehicleshop:GetVIP', function(success)
									if success then
										ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
											if hasLicense then
												BuyVehicleShopMenu('civ', 'vipboat')
											else
												ESX.ShowNotification(_U('boat_missing'))
											end
										end, GetPlayerServerId(PlayerId()), 'boating')
									else
										ESX.ShowNotification(_U('vip_no'))
									end
								end)
							else
								ESX.TriggerServerCallback('esx_advancedvehicleshop:GetVIP', function(success)
									if success then
										BuyVehicleShopMenu('civ', 'vipboat')
									else
										ESX.ShowNotification(_U('vip_no'))
									end
								end)
							end
						else
							if Config.VIPBoat.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu('civ', 'vipboat')
									else
										ESX.ShowNotification(_U('boat_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'boating')
							else
								BuyVehicleShopMenu('civ', 'vipboat')
							end
						end
					end
				elseif CurrentAction == 'vipb_resell_point' then
					if Config.VIPBoat.Shop then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
							if vehicleSold then
								ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
							else
								ESX.ShowNotification(_U('not_yours'))
							end
						end, 'civ', 'vipboat', CurrentActionData.plate, CurrentActionData.model)
					end
				elseif CurrentAction == 'vipc_shop_enter' then
					if Config.VIPCar.Shop then
						if Config.Main.VIPScript then
							if Config.VIPCar.License then
								ESX.TriggerServerCallback('esx_advancedvehicleshop:GetVIP', function(success)
									if success then
										ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
											if hasLicense then
												BuyVehicleShopMenu('civ', 'vipcar')
											else
												ESX.ShowNotification(_U('car_missing'))
											end
										end, GetPlayerServerId(PlayerId()), 'drive')
									else
										ESX.ShowNotification(_U('vip_no'))
									end
								end)
							else
								ESX.TriggerServerCallback('esx_advancedvehicleshop:GetVIP', function(success)
									if success then
										BuyVehicleShopMenu('civ', 'vipcar')
									else
										ESX.ShowNotification(_U('vip_no'))
									end
								end)
							end
						else
							if Config.VIPCar.License then
								ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
									if hasLicense then
										BuyVehicleShopMenu('civ', 'vipcar')
									else
										ESX.ShowNotification(_U('car_missing'))
									end
								end, GetPlayerServerId(PlayerId()), 'drive')
							else
								BuyVehicleShopMenu('civ', 'vipcar')
							end
						end
					end
				elseif CurrentAction == 'vipc_resell_point' then
					if Config.VIPCar.Shop then
						ESX.TriggerServerCallback('esx_advancedvehicleshop:resellVehicle', function(vehicleSold)
							if vehicleSold then
								ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								ESX.ShowNotification(_U('sold_for', CurrentActionData.label, ESX.Math.GroupDigits(CurrentActionData.price)))
							else
								ESX.ShowNotification(_U('not_yours'))
							end
						end, 'civ', 'vipcar', CurrentActionData.plate, CurrentActionData.model)
					end
				end

				CurrentAction = nil
			end
		else
			Wait(500)
		end
	end
end)

-- Create Blips
function CreateBlips()
	if Config.Aircraft.Shop and Config.Aircraft.Blips then
		for k,v in pairs(Config.Aircraft.Locations) do
			local blip = AddBlipForCoord(v.Enter)

			SetBlipSprite(blip, Config.Aircraft.Blip.Sprite)
			SetBlipColour(blip, Config.Aircraft.Blip.Color)
			SetBlipDisplay(blip, Config.Aircraft.Blip.Display)
			SetBlipScale(blip, Config.Aircraft.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('aircraft_dealer'))
			EndTextCommandSetBlipName(blip)
			table.insert(RegBlips, blip)
		end
	end

	if Config.Boat.Shop and Config.Boat.Blips then
		for k,v in pairs(Config.Boat.Locations) do
			local blip = AddBlipForCoord(v.Enter)

			SetBlipSprite(blip, Config.Boat.Blip.Sprite)
			SetBlipColour(blip, Config.Boat.Blip.Color)
			SetBlipDisplay(blip, Config.Boat.Blip.Display)
			SetBlipScale(blip, Config.Boat.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('boat_dealer'))
			EndTextCommandSetBlipName(blip)
			table.insert(RegBlips, blip)
		end
	end

	if Config.Car.Shop and Config.Car.Blips then
		for k,v in pairs(Config.Car.Locations) do
			local blip = AddBlipForCoord(v.Enter)

			SetBlipSprite(blip, Config.Car.Blip.Sprite)
			SetBlipColour(blip, Config.Car.Blip.Color)
			SetBlipDisplay(blip, Config.Car.Blip.Display)
			SetBlipScale(blip, Config.Car.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('car_dealer'))
			EndTextCommandSetBlipName(blip)
			table.insert(RegBlips, blip)
		end
	end

	if Config.Truck.Shop and Config.Truck.Blips then
		for k,v in pairs(Config.Truck.Locations) do
			local blip = AddBlipForCoord(v.Enter)

			SetBlipSprite(blip, Config.Truck.Blip.Sprite)
			SetBlipColour(blip, Config.Truck.Blip.Color)
			SetBlipDisplay(blip, Config.Truck.Blip.Display)
			SetBlipScale(blip, Config.Truck.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('truck_dealer'))
			EndTextCommandSetBlipName(blip)
			table.insert(RegBlips, blip)
		end
	end

	if Config.VIPAircraft.Shop and Config.VIPAircraft.Blips then
		for k,v in pairs(Config.VIPAircraft.Locations) do
			local blip = AddBlipForCoord(v.Enter)

			SetBlipSprite(blip, Config.VIPAircraft.Blip.Sprite)
			SetBlipColour(blip, Config.VIPAircraft.Blip.Color)
			SetBlipDisplay(blip, Config.VIPAircraft.Blip.Display)
			SetBlipScale(blip, Config.VIPAircraft.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('vip_dealer'))
			EndTextCommandSetBlipName(blip)
			table.insert(RegBlips, blip)
		end
	end

	if Config.VIPBoat.Shop and Config.VIPBoat.Blips then
		for k,v in pairs(Config.VIPBoat.Locations) do
			local blip = AddBlipForCoord(v.Enter)

			SetBlipSprite(blip, Config.VIPBoat.Blip.Sprite)
			SetBlipColour(blip, Config.VIPBoat.Blip.Color)
			SetBlipDisplay(blip, Config.VIPBoat.Blip.Display)
			SetBlipScale(blip, Config.VIPBoat.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('vip_dealer'))
			EndTextCommandSetBlipName(blip)
			table.insert(RegBlips, blip)
		end
	end

	if Config.VIPCar.Shop and Config.VIPCar.Blips then
		for k,v in pairs(Config.VIPCar.Locations) do
			local blip = AddBlipForCoord(v.Enter)

			SetBlipSprite(blip, Config.VIPCar.Blip.Sprite)
			SetBlipColour(blip, Config.VIPCar.Blip.Color)
			SetBlipDisplay(blip, Config.VIPCar.Blip.Display)
			SetBlipScale(blip, Config.VIPCar.Blip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('vip_dealer'))
			EndTextCommandSetBlipName(blip)
			table.insert(RegBlips, blip)
		end
	end
end

-- Handles Job Blips
function DeleteJobBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function RefreshJobBlips()
	if Config.Ambulance.Shop and Config.Ambulance.Blips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			for k,v in pairs(Config.Ambulance.Locations) do
				local blip = AddBlipForCoord(v.Enter)

				SetBlipSprite(blip, Config.Ambulance.Blip.Sprite)
				SetBlipColour(blip, Config.Ambulance.Blip.Color)
				SetBlipDisplay(blip, Config.Ambulance.Blip.Display)
				SetBlipScale(blip, Config.Ambulance.Blip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(_U('ambulance_dealer'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.Police.Shop and Config.Police.Blips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			for k,v in pairs(Config.Police.Locations) do
				local blip = AddBlipForCoord(v.Enter)

				SetBlipSprite(blip, Config.Police.Blip.Sprite)
				SetBlipColour(blip, Config.Police.Blip.Color)
				SetBlipDisplay(blip, Config.Police.Blip.Display)
				SetBlipScale(blip, Config.Police.Blip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(_U('police_dealer'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.Division.Shop and Config.Division.Blips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			for k,v in pairs(Config.Division.Locations) do
				local blip = AddBlipForCoord(v.Enter)

				SetBlipSprite(blip, Config.Division.Blip.Sprite)
				SetBlipColour(blip, Config.Division.Blip.Color)
				SetBlipDisplay(blip, Config.Division.Blip.Display)
				SetBlipScale(blip, Config.Division.Blip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(_U('division_dealer'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.Mechanic.Shop and Config.Mechanic.Blips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
			for k,v in pairs(Config.Mechanic.Locations) do
				local blip = AddBlipForCoord(v.Enter)

				SetBlipSprite(blip, Config.Mechanic.Blip.Sprite)
				SetBlipColour(blip, Config.Mechanic.Blip.Color)
				SetBlipDisplay(blip, Config.Mechanic.Blip.Display)
				SetBlipScale(blip, Config.Mechanic.Blip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(_U('mechanic_dealer'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.Taxi.Shop and Config.Taxi.Blips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
			for k,v in pairs(Config.Taxi.Locations) do
				local blip = AddBlipForCoord(v.Enter)

				SetBlipSprite(blip, Config.Taxi.Blip.Sprite)
				SetBlipColour(blip, Config.Taxi.Blip.Color)
				SetBlipDisplay(blip, Config.Taxi.Blip.Display)
				SetBlipScale(blip, Config.Taxi.Blip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(_U('taxi_dealer'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end
end

CreateThread(function()
	RequestIpl('shr_int') -- Load Walls & Floors
	LoadInterior(7170)
	EnableInteriorProp(7170, 'csr_beforeMission') -- Load Large Window
	RefreshInterior(7170)
end)
