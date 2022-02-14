-- To have this work with esx_lscustom you must edit
ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)
	if not Vehicles then
		MySQL.Async.fetchAll('SELECT * FROM vs_cars', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)

-- New Fix
ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)
	if not Vehicles then
		MySQL.Async.fetchAll('SELECT model, price FROM vs_ambulance UNION SELECT model, price FROM vs_police UNION SELECT model, price FROM vs_divisions UNION SELECT model, price FROM vs_mechanic UNION SELECT model, price FROM vs_taxi UNION SELECT model, price FROM vs_aircrafts UNION SELECT model, price FROM vs_boats UNION SELECT model, price FROM vs_cars UNION SELECT model, price FROM vs_trucks UNION SELECT model, price FROM vs_vipcars UNION SELECT model, price FROM vs_vipaircrafts UNION SELECT model, price FROM vs_vipboats;', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)
