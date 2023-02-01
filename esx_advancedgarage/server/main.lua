-- Is VIP
function getVIPData(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.Main.VIPScript then
		MySQL.single('SELECT is_vip FROM users WHERE identifier = ?', {xPlayer.identifier}, function(result)
			if result then
				local data = {isVIP = result.is_vip}
				cb(data)
			end
		end)
	else
		local data = {isVIP = 0}
		cb(data)
	end
end

ESX.RegisterServerCallback('esx_advancedgarage:GetVIP', function(source, cb)
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

-- Make sure all Vehicles are Stored on restart
AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		ParkVehicles()
	end
end)

function ParkVehicles()
	if Config.Main.ParkVehicles then
		MySQL.update('UPDATE owned_vehicles SET `stored` = true WHERE `stored` = false', {}, function(rowsChanged)
			if rowsChanged > 0 then
				print(('esx_advancedgarage: %s vehicle(s) have been stored!'):format(rowsChanged))
			end
		end)
	else
		print('esx_advancedgarage: Parking Vehicles on restart is currently set to false.')
	end
end

-- Add Command for Getting Properties
if Config.Main.Commands then
	ESX.RegisterCommand('getgarages', 'user', function(xPlayer, args, showError)
		xPlayer.triggerEvent('esx_advancedgarage:getPropertiesC')
	end, true, {help = 'Get Private Garages', validate = false})
end

-- Add Print Command for Getting Properties
RegisterServerEvent('esx_advancedgarage:printGetProperties')
AddEventHandler('esx_advancedgarage:printGetProperties', function()
	print('Getting Properties')
end)

-- Get Owned Properties
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedProperties', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local properties = {}

	MySQL.query('SELECT * FROM owned_properties WHERE owner = ?', {xPlayer.identifier}, function(data)
		for _,v in pairs(data) do
			table.insert(properties, v.name)
		end
		cb(properties)
	end)
end)

-- Start of Garage Fetch Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedVehicles', function(source, cb, job, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	if job == 'ambulance' then
		if type == 'cars' then
			local ownedAmbulanceCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'ambulance', 'cars'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedAmbulanceCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedAmbulanceCars)
			end)
		elseif type == 'helis' then
			local ownedAmbulanceHelis = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'aircraft', 'ambulance', 'helis'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedAmbulanceHelis, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedAmbulanceHelis)
			end)
		end
	elseif job == 'police' then
		if type == 'cars' then
			local ownedPoliceCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'police', 'cars'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedPoliceCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedPoliceCars)
			end)
		elseif type == 'helis' then
			local ownedPoliceHelis = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'aircraft', 'police', 'helis'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedPoliceHelis, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedPoliceHelis)
			end)
		end
	elseif job == 'mechanic' then
		if type == 'cars' then
			local ownedMechanicCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'mechanic', 'cars'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedMechanicCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedMechanicCars)
			end)
		end
	elseif job == 'taxi' then
		if type == 'cars' then
			local ownedTaxiCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'taxi', 'cars'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedTaxiCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedTaxiCars)
			end)
		end
	elseif job == 'civ' then
		if type == 'helis' then
			local ownedHelis = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'aircraft', 'civ', 'helis'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedHelis, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedHelis)
			end)
		elseif type == 'planes' then
			local ownedPlanes = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'aircraft', 'civ', 'planes'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedPlanes, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedPlanes)
			end)
		elseif type == 'boats' then
			local ownedBoats = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'boat', 'civ', 'boats'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedBoats, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedBoats)
			end)
		elseif type == 'subs' then
			local ownedSubs = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'boat', 'civ', 'subs'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedSubs, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedSubs)
			end)
		elseif type == 'box' then
			local ownedBox = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'box'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedBox, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedBox)
			end)
		elseif type == 'haul' then
			local ownedHaul = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'haul'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedHaul, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedHaul)
			end)
		elseif type == 'other' then
			local ownedOther = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'other'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedOther, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedOther)
			end)
		elseif type == 'trans' then
			local ownedTrans = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'trans'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedTrans, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedTrans)
			end)
		elseif type == 'cycles' then
			local ownedCycles = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'cycles'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedCycles, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedCycles)
			end)
		elseif type == 'compacts' then
			local ownedCompacts = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'compacts'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedCompacts, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedCompacts)
			end)
		elseif type == 'coupes' then
			local ownedCoupes = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'coupes'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedCoupes, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedCoupes)
			end)
		elseif type == 'motorcycles' then
			local ownedMotorcycles = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'motorcycles'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedMotorcycles, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedMotorcycles)
			end)
		elseif type == 'muscles' then
			local ownedMuscles = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'muscles'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedMuscles, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedMuscles)
			end)
		elseif type == 'offroads' then
			local ownedOffRoads = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'offroads'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedOffRoads, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedOffRoads)
			end)
		elseif type == 'sedans' then
			local ownedSedans = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'sedans'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedSedans, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedSedans)
			end)
		elseif type == 'sports' then
			local ownedSports = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'sports'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedSports, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedSports)
			end)
		elseif type == 'sportsclassics' then
			local ownedSportsClassics = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'sportsclassics'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedSportsClassics, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedSportsClassics)
			end)
		elseif type == 'supers' then
			local ownedSupers = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'supers'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedSupers, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedSupers)
			end)
		elseif type == 'suvs' then
			local ownedSUVs = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'suvs'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedSUVs, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedSUVs)
			end)
		elseif type == 'vans' then
			local ownedVans = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vans'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVans, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVans)
			end)
		elseif type == 'vipboats' then
			local ownedVIPBoats = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'boat', 'civ', 'vipboats'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPBoats, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPBoats)
			end)
		elseif type == 'vipsubs' then
			local ownedVIPSubs = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'boat', 'civ', 'vipsubs'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPSubs, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPSubs)
			end)
		elseif type == 'vipcompacts' then
			local ownedVIPCompacts = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipcompacts'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPCompacts, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPCompacts)
			end)
		elseif type == 'vipcoupes' then
			local ownedVIPCoupes = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipcoupes'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPCoupes, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPCoupes)
			end)
		elseif type == 'vipmotos' then
			local ownedVIPMotos = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipmotos'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPMotos, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPMotos)
			end)
		elseif type == 'vipmuscles' then
			local ownedVIPMuscles = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipmuscles'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPMuscles, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPMuscles)
			end)
		elseif type == 'vipoffroads' then
			local ownedVIPOffRoads = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipoffroads'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPOffRoads, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPOffRoads)
			end)
		elseif type == 'vipsedans' then
			local ownedVIPSedans = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipsedans'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPSedans, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPSedans)
			end)
		elseif type == 'vipsports' then
			local ownedVIPSports = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipsports'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPSports, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPSports)
			end)
		elseif type == 'vipsportscs' then
			local ownedVIPSportsCs = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipsportscs'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPSportsCs, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPSportsCs)
			end)
		elseif type == 'vipsupers' then
			local ownedVIPSupers = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipsupers'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPSupers, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPSupers)
			end)
		elseif type == 'vipsuvs' then
			local ownedVIPSUVs = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipsuvs'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPSUVs, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPSUVs)
			end)
		elseif type == 'vipvans' then
			local ownedVIPVans = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'vipvans'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPVans, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPVans)
			end)
		elseif type == 'viptrucks' then
			local ownedVIPTrucks = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND category = ?', {xPlayer.identifier, 'car', 'civ', 'viptrucks'}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(ownedVIPTrucks, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel, stored = v.stored})
				end
				cb(ownedVIPTrucks)
			end)
		end
	end
end)
-- End of Garage Fetch Vehicles

-- Start of Impound Fetch Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedVehiclesOut', function(source, cb, job, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	if job == 'ambulance' then
		if type == 'cars' then
			local outAmbulanceCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'car', 'ambulance', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outAmbulanceCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outAmbulanceCars)
			end)
		elseif type == 'helis' then
			local outAmbulanceHelis = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'aircraft', 'ambulance', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outAmbulanceHelis, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outAmbulanceHelis)
			end)
		end
	elseif job == 'police' then
		if type == 'cars' then
			local outPoliceCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'car', 'police', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outPoliceCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outPoliceCars)
			end)
		elseif type == 'helis' then
			local outPoliceHelis = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'aircraft', 'police', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outPoliceHelis, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outPoliceHelis)
			end)
		end
	elseif job == 'mechanic' then
		if type == 'cars' then
			local outMechanicCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'mechanic', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outMechanicCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outMechanicCars)
			end)
		end
	elseif job == 'taxi' then
		if type == 'cars' then
			local outTaxiCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'taxi', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outTaxiCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outTaxiCars)
			end)
		end
	elseif job == 'civ' then
		if type == 'aircrafts' then
			local outCivAircrafts = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'aircraft', 'civ', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outCivAircrafts, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outCivAircrafts)
			end)
		elseif type == 'boats' then
			local outCivBoats = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'boat', 'civ', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outCivBoats, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outCivBoats)
			end)
		elseif type == 'cars' then
			local outCivCars = {}
			MySQL.query('SELECT * FROM owned_vehicles WHERE owner = ? AND Type = ? AND job = ? AND `stored` = ?', {xPlayer.identifier, 'car', 'civ', false}, function(data)
				for _,v in pairs(data) do
					local vehicle = json.decode(v.vehicle)
					table.insert(outCivCars, {vehicle = vehicle, plate = v.plate, vehName = v.name, fuel = v.fuel})
				end
				cb(outCivCars)
			end)
		end
	end
end)
-- End of Impound Fetch Vehicles

-- Start of Impound Pay
ESX.RegisterServerCallback('esx_advancedgarage:payImpound', function(source, cb, job, type, attempt)
	local xPlayer = ESX.GetPlayerFromId(source)

	getVIPData(source, function(data)
		if data.isVIP then
			if job == 'ambulance' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Ambulance.PoundD then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Ambulance.PoundD)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Ambulance.PoundD)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Ambulance.PoundD)
							end)
						end

						cb()
					end
				end
			elseif job == 'police' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Police.PoundD then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Police.PoundD)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Police.PoundD)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Police.PoundD)
							end)
						end

						cb()
					end
				end
			elseif job == 'mechanic' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Mechanic.PoundD then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Mechanic.PoundD)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Mechanic.PoundD)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Mechanic.PoundD)
							end)
						end

						cb()
					end
				end
			elseif job == 'taxi' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Taxi.PoundD then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Taxi.PoundD)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Taxi.PoundD)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Taxi.PoundD)
							end)
						end

						cb()
					end
				end
			elseif job == 'civ' then
				if type == 'aircrafts' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Aircrafts.PoundD then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Aircrafts.PoundD)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Aircrafts.PoundD)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Aircrafts.PoundD)
							end)
						end

						cb()
					end
				elseif type == 'boats' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Boats.PoundD then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Boats.PoundD)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Boats.PoundD)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Boats.PoundD)
							end)
						end

						cb()
					end
				elseif type == 'cars' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Cars.PoundD then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Cars.PoundD)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Cars.PoundD)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Cars.PoundD)
							end)
						end

						cb()
					end
				end
			end
		else
			if job == 'ambulance' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Ambulance.PoundP then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Ambulance.PoundP)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Ambulance.PoundP)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Ambulance.PoundP)
							end)
						end

						cb()
					end
				end
			elseif job == 'police' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Police.PoundP then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Police.PoundP)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Police.PoundP)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Police.PoundP)
							end)
						end

						cb()
					end
				end
			elseif job == 'mechanic' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Mechanic.PoundP then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Mechanic.PoundP)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Mechanic.PoundP)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Mechanic.PoundP)
							end)
						end

						cb()
					end
				end
			elseif job == 'taxi' then
				if type == 'none' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Taxi.PoundP then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Taxi.PoundP)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Taxi.PoundP)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Taxi.PoundP)
							end)
						end

						cb()
					end
				end
			elseif job == 'civ' then
				if type == 'aircrafts' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Aircrafts.PoundP then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Aircrafts.PoundP)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Aircrafts.PoundP)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Aircrafts.PoundP)
							end)
						end

						cb()
					end
				elseif type == 'boats' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Boats.PoundP then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Boats.PoundP)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Boats.PoundP)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Boats.PoundP)
							end)
						end

						cb()
					end
				elseif type == 'cars' then
					if attempt == 'check' then
						if xPlayer.getMoney() >= Config.Cars.PoundP then
							cb(true)
						else
							cb(false)
						end
					else
						xPlayer.removeMoney(Config.Cars.PoundP)
						TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.Cars.PoundP)
						if Config.Main.GiveSocMoney then
							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
								account.addMoney(Config.Cars.PoundP)
							end)
						end

						cb()
					end
				end
			end
		end
	end)
end)
-- End of Impound Pay

-- Store Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:storeVehicle', function(source, cb, vehicleProps)
	local vehiclemodel = vehicleProps.model
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.single('SELECT * FROM owned_vehicles WHERE owner = ? AND plate = ?', {xPlayer.identifier, vehicleProps.plate}, function(result)
		if result then
			local originalvehprops = json.decode(result.vehicle)
			if originalvehprops.model == vehiclemodel then
				MySQL.update('UPDATE owned_vehicles SET vehicle = ? WHERE owner = ? AND plate = ?', {json.encode(vehicleProps), xPlayer.identifier, vehicleProps.plate}, function(rowsChanged)
					if rowsChanged == 0 then
						print(('esx_advancedgarage: %s attempted to store an vehicle they don\'t own!'):format(xPlayer.identifier))
					end
					cb(true)
				end)
			else
				if Config.Main.KickCheaters then
					print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: %s | Original Vehicle: %s '):format(xPlayer.identifier, vehiclemodel, originalvehprops.model))

					DropPlayer(source, _U('custom_kick'))
					cb(false)
				else
					print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: %s | Original Vehicle: %s '):format(xPlayer.identifier, vehiclemodel, originalvehprops.model))
					cb(false)
				end
			end
		else
			print(('esx_advancedgarage: %s attempted to store an vehicle they don\'t own!'):format(xPlayer.identifier))
			cb(false)
		end
	end)
end)

-- Pay to Return Broken Vehicles
RegisterServerEvent('esx_advancedgarage:payhealth')
AddEventHandler('esx_advancedgarage:payhealth', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(price)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. price)

	if Config.Main.GiveSocMoney then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
			account.addMoney(price)
		end)
	end
end)

-- Rename Vehicle
RegisterServerEvent('esx_advancedgarage:renameVehicle')
AddEventHandler('esx_advancedgarage:renameVehicle', function(plate, name)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.update('UPDATE owned_vehicles SET name = ? WHERE plate = ?', {name, plate}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_advancedgarage: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

-- Modify State of Vehicles
RegisterServerEvent('esx_advancedgarage:setVehicleState')
AddEventHandler('esx_advancedgarage:setVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.update('UPDATE owned_vehicles SET `stored` = ? WHERE plate = ?', {state, plate}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_advancedgarage: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

-- Set Fuel Level
RegisterServerEvent('esx_advancedgarage:setVehicleFuel')
AddEventHandler('esx_advancedgarage:setVehicleFuel', function(plate, fuel)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.update('UPDATE owned_vehicles SET fuel = ? WHERE plate = ?', {fuel, plate}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_advancedgarage: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)
