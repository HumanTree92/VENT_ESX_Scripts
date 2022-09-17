local NumberCharset, Charset = {}, {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Wait(2)
		math.randomseed(GetGameTimer())

		-- The Maximum Plate Length is 8 Characters (including Spaces & Symbols), DON'T GO PAST IT!!!
		if Config.Main.PlateSingleSpace then
			generatedPlate = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))
		elseif Config.Main.PlateDoubleSpace then
			generatedPlate = string.upper(GetRandomLetter(3) .. '  ' .. GetRandomNumber(3))
		else
			generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))
		end

		ESX.TriggerServerCallback('esx_advancedvehicleshop:isPlateTaken', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('esx_advancedvehicleshop:isPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Wait(0)

	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Wait(0)

	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end
