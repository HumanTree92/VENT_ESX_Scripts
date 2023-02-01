local categoriesaj, categoriespj, categoriesd, categoriesmj, categoriestj, categoriesa, categoriesb, categoriesc, categoriest, categoriesva, categoriesvb, categoriesvc = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local vehiclesaj, vehiclespj, vehiclesd, vehiclesmj, vehiclestj, vehiclesa, vehiclesb, vehiclesc, vehiclest, vehiclesva, vehiclesvb, vehiclesvc = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}

ESX.RegisterServerCallback('esx_advancedvehicleshop:GetVIP', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.Main.VIPScript then
		MySQL.query('SELECT is_vip FROM users WHERE identifier = ?', {xPlayer.identifier}, function(success)
			cb(success)
		end)
	else
		local success = false
		cb(success)
	end
end)

function RemoveOwnedVehicle(vPlateS)
	-- Delete Vehicle
	MySQL.update('DELETE FROM owned_vehicles WHERE plate = ?', {vPlateS})
end

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		if Config.Ambulance.Shop then mysqlAmbulance() end
		if Config.Police.Shop then mysqlPolice() end
		if Config.Division.Shop then mysqlDivision() end
		if Config.Mechanic.Shop then mysqlMechanic() end
		if Config.Taxi.Shop then mysqlTaxi() end
		if Config.Aircraft.Shop then mysqlAircraft() end
		if Config.Boat.Shop then mysqlBoat() end
		if Config.Car.Shop then mysqlCar() end
		if Config.Truck.Shop then mysqlTruck() end
		if Config.VIPAircraft.Shop then mysqlVIPAircraft() end
		if Config.VIPBoat.Shop then mysqlVIPBoat() end
		if Config.VIPCar.Shop then mysqlVIPCar() end
	end
end)

-- Ambulance Shop
function mysqlAmbulance()
	MySQL.query('SELECT * FROM `vs_ambulance_categories`', {}, function(_categories)
		categoriesaj = _categories

		MySQL.query('SELECT * FROM `vs_ambulance`', {}, function(_vehicles)
			vehiclesaj = _vehicles
			GetAmbulance(categoriesaj, vehiclesaj)
		end)
	end)
end

function GetAmbulance(categoriesaj, vehiclesaj)
	for k,v in ipairs(vehiclesaj) do
		for k2,v2 in ipairs(categoriesaj) do
			if v2.name == v.category then
				vehiclesaj[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesAJ', -1, categoriesaj)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesAJ', -1, vehiclesaj)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesAJ', function(source, cb)
	cb(categoriesaj)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesAJ', function(source, cb)
	cb(vehiclesaj)
end)

-- Police Shop
function mysqlPolice()
	MySQL.query('SELECT * FROM `vs_police_categories`', {}, function(_categories)
		categoriespj = _categories

		MySQL.query('SELECT * FROM `vs_police`', {}, function(_vehicles)
			vehiclespj = _vehicles
			GetPolice(categoriespj, vehiclespj)
		end)
	end)
end

function GetPolice(categoriespj, vehiclespj)
	for k,v in ipairs(vehiclespj) do
		for k2,v2 in ipairs(categoriespj) do
			if v2.name == v.category then
				vehiclespj[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesPJ', -1, categoriespj)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesPJ', -1, vehiclespj)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesPJ', function(source, cb)
	cb(categoriespj)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesPJ', function(source, cb)
	cb(vehiclespj)
end)

-- Division Shop
function mysqlDivision()
	MySQL.query('SELECT * FROM `vs_division_categories`', {}, function(_categories)
		categoriesd = _categories

		MySQL.query('SELECT * FROM `vs_divisions`', {}, function(_vehicles)
			vehiclesd = _vehicles
			GetDivision(categoriesd, vehiclesd)
		end)
	end)
end

function GetDivision(categoriesd, vehiclesd)
	for k,v in ipairs(vehiclesd) do
		for k2,v2 in ipairs(categoriesd) do
			if v2.name == v.category then
				vehiclesd[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesD', -1, categoriesd)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesD', -1, vehiclesd)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesD', function(source, cb)
	cb(categoriesd)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesD', function(source, cb)
	cb(vehiclesd)
end)

-- Mechanic Shop
function mysqlMechanic()
	MySQL.query('SELECT * FROM `vs_mechanic_categories`', {}, function(_categories)
		categoriesmj = _categories

		MySQL.query('SELECT * FROM `vs_mechanic`', {}, function(_vehicles)
			vehiclesmj = _vehicles
			GetMechanic(categoriesmj, vehiclesmj)
		end)
	end)
end

function GetMechanic(categoriesmj, vehiclesmj)
	for k,v in ipairs(vehiclesmj) do
		for k2,v2 in ipairs(categoriesmj) do
			if v2.name == v.category then
				vehiclesmj[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesMJ', -1, categoriesmj)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesMJ', -1, vehiclesmj)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesMJ', function(source, cb)
	cb(categoriesmj)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesMJ', function(source, cb)
	cb(vehiclesmj)
end)

-- Taxi Shop
function mysqlTaxi()
	MySQL.query('SELECT * FROM `vs_taxi_categories`', {}, function(_categories)
		categoriestj = _categories

		MySQL.query('SELECT * FROM `vs_taxi`', {}, function(_vehicles)
			vehiclestj = _vehicles
			GetTaxi(categoriestj, vehiclestj)
		end)
	end)
end

function GetTaxi(categoriestj, vehiclestj)
	for k,v in ipairs(vehiclestj) do
		for k2,v2 in ipairs(categoriestj) do
			if v2.name == v.category then
				vehiclestj[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesTJ', -1, categoriestj)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesTJ', -1, vehiclestj)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesTJ', function(source, cb)
	cb(categoriestj)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesTJ', function(source, cb)
	cb(vehiclestj)
end)

-- Aircraft Shop
function mysqlAircraft()
	MySQL.query('SELECT * FROM `vs_aircraft_categories`', {}, function(_categories)
		categoriesa = _categories

		MySQL.query('SELECT * FROM `vs_aircrafts`', {}, function(_vehicles)
			vehiclesa = _vehicles
			GetAircraft(categoriesa, vehiclesa)
		end)
	end)
end

function GetAircraft(categoriesa, vehiclesa)
	for k,v in ipairs(vehiclesa) do
		for k2,v2 in ipairs(categoriesa) do
			if v2.name == v.category then
				vehiclesa[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesA', -1, categoriesa)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesA', -1, vehiclesa)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesA', function(source, cb)
	cb(categoriesa)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesA', function(source, cb)
	cb(vehiclesa)
end)

-- Boat Shop
function mysqlBoat()
	MySQL.query('SELECT * FROM `vs_boat_categories`', {}, function(_categories)
		categoriesb = _categories

		MySQL.query('SELECT * FROM `vs_boats`', {}, function(_vehicles)
			vehiclesb = _vehicles
			GetBoat(categoriesb, vehiclesb)
		end)
	end)
end

function GetBoat(categoriesb, vehiclesb)
	for k,v in ipairs(vehiclesb) do
		for k2,v2 in ipairs(categoriesb) do
			if v2.name == v.category then
				vehiclesb[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesB', -1, categoriesb)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesB', -1, vehiclesb)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesB', function(source, cb)
	cb(categoriesb)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesB', function(source, cb)
	cb(vehiclesb)
end)

-- Car Shop
function mysqlCar()
	MySQL.query('SELECT * FROM `vs_car_categories`', {}, function(_categories)
		categoriesc = _categories

		MySQL.query('SELECT * FROM `vs_cars`', {}, function(_vehicles)
			vehiclesc = _vehicles
			GetCar(categoriesc, vehiclesc)
		end)
	end)
end

function GetCar(categoriesc, vehiclesc)
	for k,v in ipairs(vehiclesc) do
		for k2,v2 in ipairs(categoriesc) do
			if v2.name == v.category then
				vehiclesc[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesC', -1, categoriesc)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesC', -1, vehiclesc)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesC', function(source, cb)
	cb(categoriesc)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesC', function(source, cb)
	cb(vehiclesc)
end)

-- Truck Shop
function mysqlTruck()
	MySQL.query('SELECT * FROM `vs_truck_categories`', {}, function(_categories)
		categoriest = _categories

		MySQL.query('SELECT * FROM `vs_trucks`', {}, function(_vehicles)
			vehiclest = _vehicles
			GetTruck(categoriest, vehiclest)
		end)
	end)
end

function GetTruck(categoriest, vehiclest)
	for k,v in ipairs(vehiclest) do
		for k2,v2 in ipairs(categoriest) do
			if v2.name == v.category then
				vehiclest[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesT', -1, categoriest)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesT', -1, vehiclest)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesT', function(source, cb)
	cb(categoriest)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesT', function(source, cb)
	cb(vehiclest)
end)

-- VIP Aircraft Shop
function mysqlVIPAircraft()
	MySQL.query('SELECT * FROM `vs_vipaircraft_categories`', {}, function(_categories)
		categoriesva = _categories

		MySQL.query('SELECT * FROM `vs_vipaircrafts`', {}, function(_vehicles)
			vehiclesva = _vehicles
			GetVIPAircraft(categoriesva, vehiclesva)
		end)
	end)
end

function GetVIPAircraft(categoriesva, vehiclesva)
	for k,v in ipairs(vehiclesva) do
		for k2,v2 in ipairs(categoriesva) do
			if v2.name == v.category then
				vehiclesva[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesVA', -1, categoriesva)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesVA', -1, vehiclesva)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesVA', function(source, cb)
	cb(categoriesva)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesVA', function(source, cb)
	cb(vehiclesva)
end)

-- VIP Boat Shop
function mysqlVIPBoat()
	MySQL.query('SELECT * FROM `vs_vipboat_categories`', {}, function(_categories)
		categoriesvb = _categories

		MySQL.query('SELECT * FROM `vs_vipboats`', {}, function(_vehicles)
			vehiclesvb = _vehicles
			GetVIPBoat(categoriesvb, vehiclesvb)
		end)
	end)
end

function GetVIPBoat(categoriesvb, vehiclesvb)
	for k,v in ipairs(vehiclesvb) do
		for k2,v2 in ipairs(categoriesvb) do
			if v2.name == v.category then
				vehiclesvb[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesVB', -1, categoriesvb)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesVB', -1, vehiclesvb)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesVB', function(source, cb)
	cb(categoriesvb)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesVB', function(source, cb)
	cb(vehiclesvb)
end)

-- VIP Car Shop
function mysqlVIPCar()
	MySQL.query('SELECT * FROM `vs_vipcar_categories`', {}, function(_categories)
		categoriesvc = _categories

		MySQL.query('SELECT * FROM `vs_vipcars`', {}, function(_vehicles)
			vehiclesvc = _vehicles
			GetVIPCar(categoriesvc, vehiclesvc)
		end)
	end)
end

function GetVIPCar(categoriesvc, vehiclesvc)
	for k,v in ipairs(vehiclesvc) do
		for k2,v2 in ipairs(categoriesvc) do
			if v2.name == v.category then
				vehiclesvc[k].categoryLabel = v2.label
				break
			end
		end
	end

	TriggerClientEvent('esx_advancedvehicleshop:sendCategoriesVC', -1, categoriesvc)
	TriggerClientEvent('esx_advancedvehicleshop:sendVehiclesVC', -1, vehiclesvc)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getCategoriesVC', function(source, cb)
	cb(categoriesvc)
end)

ESX.RegisterServerCallback('esx_advancedvehicleshop:getVehiclesVC', function(source, cb)
	cb(vehiclesvc)
end)

-- Is Plate Taken
ESX.RegisterServerCallback('esx_advancedvehicleshop:isPlateTaken', function(source, cb, vPlateS)
	MySQL.query('SELECT 1 FROM owned_vehicles WHERE plate = ?', {vPlateS}, function(result)
		cb(result[1] ~= nil)
	end)
end)

-- Retrieve Job Vehicles
ESX.RegisterServerCallback('esx_advancedvehicleshop:retrieveJobVehicles', function(source, cb, vTypeS)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND type = ? AND job = ?', {xPlayer.identifier, vTypeS, xPlayer.job.name}, function(result)
		cb(result)
	end)
end)

-- Set Job Vehicle State
RegisterNetEvent('esx_advancedvehicleshop:setJobVehicleState')
AddEventHandler('esx_advancedvehicleshop:setJobVehicleState', function(vPlateS, vStateS)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.update('UPDATE owned_vehicles SET `stored` = ? WHERE plate = ? AND job = ?', {vStateS, vPlateS, xPlayer.job.name}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('[esx_advancedvehicleshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

-- Get Player Data
function getPlayerData(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.query.await('SELECT `group` FROM `users` WHERE identifier = ?', {xPlayer.identifier})
	local data = {group = result.group}
	cb(data)
end

ESX.RegisterServerCallback('esx_advancedvehicleshop:getPlayerData', function(source, cb)
	getPlayerData(source, function(data)
		if data ~= nil then
			cb(data)
		end
	end)
end)

-- Buy Vehicle
ESX.RegisterServerCallback('esx_advancedvehicleshop:buyVehicle', function(source, cb, pChoiceS, pJobS, sTypeS, vModelS, vPlateS, vCatS, vNameS, vImageS)
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice, type, category

	if pJobS == 'ambulance' and sTypeS == 'car' then
		for k,v in ipairs(vehiclesaj) do
			if vModelS == v.model then
				modelPrice = v.price
				break
			end
		end
	elseif pJobS == 'police' and sTypeS == 'car' then
		for k,v in ipairs(vehiclespj) do
			if vModelS == v.model then
				modelPrice = v.price
				break
			end
		end
	elseif pJobS == 'ambulance' and sTypeS == 'division' or pJobS == 'police' and sTypeS == 'division' then
		for k,v in ipairs(vehiclesd) do
			if vModelS == v.model then
				modelPrice = v.price
				break
			end
		end
	elseif pJobS == 'mechanic' and sTypeS == 'car' then
		for k,v in ipairs(vehiclesmj) do
			if vModelS == v.model then
				modelPrice = v.price
				break
			end
		end
	elseif pJobS == 'taxi' and sTypeS == 'car' then
		for k,v in ipairs(vehiclestj) do
			if vModelS == v.model then
				modelPrice = v.price
				break
			end
		end
	elseif pJobS == 'civ' then
		if sTypeS == 'aircraft' then
			for k,v in ipairs(vehiclesa) do
				if vModelS == v.model then
					modelPrice = v.price
					break
				end
			end
		elseif sTypeS == 'boat' then
			for k,v in ipairs(vehiclesb) do
				if vModelS == v.model then
					modelPrice = v.price
					break
				end
			end
		elseif sTypeS == 'car' then
			for k,v in ipairs(vehiclesc) do
				if vModelS == v.model then
					modelPrice = v.price
					break
				end
			end
		elseif sTypeS == 'truck' then
			for k,v in ipairs(vehiclest) do
				if vModelS == v.model then
					modelPrice = v.price
					break
				end
			end
		elseif sTypeS == 'vipaircraft' then
			for k,v in ipairs(vehiclesva) do
				if vModelS == v.model then
					modelPrice = v.price
					break
				end
			end
		elseif sTypeS == 'vipboat' then
			for k,v in ipairs(vehiclesvb) do
				if vModelS == v.model then
					modelPrice = v.price
					break
				end
			end
		elseif sTypeS == 'vipcar' then
			for k,v in ipairs(vehiclesvc) do
				if vModelS == v.model then
					modelPrice = v.price
					break
				end
			end
		end
	end

	if pChoiceS == 'finance' then
		--[[if then

		else

		end]]--
	elseif pChoiceS == 'payfull' then
		if modelPrice and xPlayer.getMoney() >= modelPrice then
			xPlayer.removeMoney(modelPrice)

			if vCatS == 'aviation' then
				type = 'aircraft'
				category = 'helis'
			else
				if pJobS == 'ambulance' or pJobS == 'police' or pJobS == 'mechanic' or pJobS == 'taxi' then
					type = 'car'
					category = 'cars'
				elseif pJobS == 'civ' and sTypeS == 'aircraft' and vCatS == 'helis' or pJobS == 'civ' and sTypeS == 'vipaircraft' and vCatS == 'helis' then
					type = 'aircraft'
					category = 'helis'
				elseif pJobS == 'civ' and sTypeS == 'aircraft' and vCatS == 'planes' or pJobS == 'civ' and sTypeS == 'vipaircraft' and vCatS == 'planes' then
					type = 'aircraft'
					category = 'planes'
				elseif pJobS == 'civ' and sTypeS == 'boat' and vCatS == 'boats' or pJobS == 'civ' and sTypeS == 'vipboat' and vCatS == 'boats' then
					type = 'boat'
					category = 'boats'
				elseif pJobS == 'civ' and sTypeS == 'boat' and vCatS == 'subs' or pJobS == 'civ' and sTypeS == 'vipboat' and vCatS == 'subs' then
					type = 'boat'
					category = 'subs'
				else
					type = 'car'
					category = vCatS
				end
			end

			MySQL.update('INSERT INTO owned_vehicles (owner, plate, vehicle, type, job, category, name, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {xPlayer.identifier, vPlateS, json.encode({model = GetHashKey(vModelS), plate = vPlateS}), type, pJobS, category, vNameS, vImageS}, function(rowsChanged)
				xPlayer.showNotification(_U('vehicle_belongs', vNameS, vPlateS))
				cb(true)
			end)
		else
			cb(false)
		end
	end
end)

-- Resell Vehicle
ESX.RegisterServerCallback('esx_advancedvehicleshop:resellVehicle', function(source, cb, pJobS, sTypeS, vPlateS, vModelS)
	local xPlayer, resellPrice, vehicleName = ESX.GetPlayerFromId(source)

	if pJobS == 'ambulance' and sTypeS == 'car' then
		for i=1, #vehiclesaj, 1 do
			if GetHashKey(vehiclesaj[i].model) == vModelS then
				resellPrice = ESX.Math.Round(vehiclesaj[i].price / 100 * Config.Ambulance.ResellPerc)
				vehicleName = vehiclesaj[i].model
				break
			end
		end
	elseif pJobS == 'police' and sTypeS == 'car' then
		for i=1, #vehiclespj, 1 do
			if GetHashKey(vehiclespj[i].model) == vModelS then
				resellPrice = ESX.Math.Round(vehiclespj[i].price / 100 * Config.Police.ResellPerc)
				vehicleName = vehiclespj[i].model
				break
			end
		end
	elseif pJobS == 'ambulance' and sTypeS == 'division' or pJobS == 'police' and sTypeS == 'division' then
		for i=1, #vehiclesd, 1 do
			if GetHashKey(vehiclesd[i].model) == vModelS then
				resellPrice = ESX.Math.Round(vehiclesd[i].price / 100 * Config.Division.ResellPerc)
				vehicleName = vehiclesd[i].model
				break
			end
		end
	elseif pJobS == 'mechanic' and sTypeS == 'car' then
		for i=1, #vehiclesmj, 1 do
			if GetHashKey(vehiclesmj[i].model) == vModelS then
				resellPrice = ESX.Math.Round(vehiclesmj[i].price / 100 * Config.Mechanic.ResellPerc)
				vehicleName = vehiclesmj[i].model
				break
			end
		end
	elseif pJobS == 'taxi' and sTypeS == 'car' then
		for i=1, #vehiclestj, 1 do
			if GetHashKey(vehiclestj[i].model) == vModelS then
				resellPrice = ESX.Math.Round(vehiclestj[i].price / 100 * Config.Taxi.ResellPerc)
				vehicleName = vehiclestj[i].model
				break
			end
		end
	elseif pJobS == 'civ' then
		if sTypeS == 'aircraft' then
			for i=1, #vehiclesa, 1 do
				if GetHashKey(vehiclesa[i].model) == vModelS then
					resellPrice = ESX.Math.Round(vehiclesa[i].price / 100 * Config.Aircraft.ResellPerc)
					vehicleName = vehiclesa[i].model
					break
				end
			end
		elseif sTypeS == 'boat' then
			for i=1, #vehiclesb, 1 do
				if GetHashKey(vehiclesb[i].model) == vModelS then
					resellPrice = ESX.Math.Round(vehiclesb[i].price / 100 * Config.Boat.ResellPerc)
					vehicleName = vehiclesb[i].model
					break
				end
			end
		elseif sTypeS == 'car' then
			for i=1, #vehiclesc, 1 do
				if GetHashKey(vehiclesc[i].model) == vModelS then
					resellPrice = ESX.Math.Round(vehiclesc[i].price / 100 * Config.Car.ResellPerc)
					vehicleName = vehiclesc[i].model
					break
				end
			end
		elseif sTypeS == 'truck' then
			for i=1, #vehiclest, 1 do
				if GetHashKey(vehiclest[i].model) == vModelS then
					resellPrice = ESX.Math.Round(vehiclest[i].price / 100 * Config.Truck.ResellPerc)
					vehicleName = vehiclest[i].model
					break
				end
			end
		elseif sTypeS == 'vipaircraft' then
			for i=1, #vehiclesva, 1 do
				if GetHashKey(vehiclesva[i].model) == vModelS then
					resellPrice = ESX.Math.Round(vehiclesva[i].price / 100 * Config.VIPAircraft.ResellPerc)
					vehicleName = vehiclesva[i].model
					break
				end
			end
		elseif sTypeS == 'vipboat' then
			for i=1, #vehiclesvb, 1 do
				if GetHashKey(vehiclesvb[i].model) == vModelS then
					resellPrice = ESX.Math.Round(vehiclesvb[i].price / 100 * Config.VIPBoat.ResellPerc)
					vehicleName = vehiclesvb[i].model
					break
				end
			end
		elseif sTypeS == 'vipcar' then
			for i=1, #vehiclesvc, 1 do
				if GetHashKey(vehiclesvc[i].model) == vModelS then
					resellPrice = ESX.Math.Round(vehiclesvc[i].price / 100 * Config.VIPCar.ResellPerc)
					vehicleName = vehiclesvc[i].model
					break
				end
			end
		end
	end

	if not resellPrice then
		print(('[esx_advancedvehicleshop] [^3WARNING^7] %s Attempted to Sell an UNKNOWN Vehicle!'):format(GetPlayerIdentifiers(source)[1]))
		cb(false)
	else
		MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND plate = ?', {xPlayer.identifier, vPlateS}, function(result)
			if result[1] then
				local vehicle = json.decode(result[1].vehicle)

				if vehicle.model == vModelS then
					if vehicle.plate == vPlateS then
						xPlayer.addMoney(resellPrice)
						RemoveOwnedVehicle(vPlateS)

						cb(true)
					else
						print(('[esx_advancedvehicleshop] [^3WARNING^7] %s Attempted to Sell an Vehicle with Plate Mismatch!'):format(xPlayer.identifier))
						cb(false)
					end
				else
					print(('[esx_advancedvehicleshop] [^3WARNING^7] %s Attempted to Sell an Vehicle with Model Mismatch!'):format(xPlayer.identifier))
					cb(false)
				end
			else
				cb(false)
			end
		end)
	end
end)
