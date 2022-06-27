local NumberCharset, Charset, RegisteredPlateTable = {}, {}, {}
local currentExecuting = 0

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

RegisterCommand('migrate', function(source, args, rawCommand)
	migrateVehicles()
end, true)

function migrateVehicles()
	MySQL.query('SELECT * FROM owned_vehicles', {}, function(result)
		for i=1, #result, 1 do
			Citizen.Wait(0)

			local vehicleID = result[i].id
			local vehicleProps = json.decode(result[i].vehicle)
			local oldPlate = vehicleProps.plate

			vehicleProps.plate = GeneratePlate() -- generate plate

			migrateVehicle(vehicleProps, oldPlate, vehicleID)
		end

		print('\n\n\n')
		print('esx_migrate: done!')
		print('\n\n\n')
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		if currentExecuting > (Config.Main.MaxMigrates / 2) then
			currentExecuting = currentExecuting - 1
		end
	end
end)

function migrateVehicle(vehicleProps, oldPlate, vehicleID)
	while currentExecuting > Config.Main.MaxMigrates do
		Citizen.Wait(2)
	end

	io.write('esx_migrate: migrating . . . ')
	currentExecuting = currentExecuting + 1

	MySQL.update('UPDATE `owned_vehicles` SET `vehicle` = ?, `plate` = ? WHERE `id` = ?', {json.encode(vehicleProps), vehicleProps.plate, vehicleID}, function(rowsChanged)
		io.write(('OK! (%s > %s)\n'):format(oldPlate, vehicleProps.plate))
		currentExecuting = currentExecuting - 1
	end)
end

-- customize the plate generator here
function GeneratePlate()
	local generatedPlate

	while true do
		if Config.Main.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(3) .. '  ' .. GetRandomNumber(3))
		else
			generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))
		end

		if IsPlateTaken(generatedPlate) then
			Citizen.Wait(2) -- don't break the loop til we got an plate that isn't taken
		else
			break
		end
	end

	RegisteredPlateTable[generatedPlate] = true
	return generatedPlate
end

function IsPlateTaken(plate)
	return RegisteredPlateTable[plate]
end

function GetRandomNumber(length)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end
