local availableJobs = {}

-- Get Job List
ESX.RegisterServerCallback('esx_joblisting:getJobsList', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier2 = GetPlayerIdentifiers(source)[1]
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT name, label FROM jobs WHERE whitelisted = @whitelisted', {
		['@whitelisted'] = false
	}, function(result)
		local availableJobs = {}

		for i=1, #result, 1 do
			table.insert(availableJobs, {
				job = result[i].name,
				label = result[i].label
			})
		end

		getPlayerData(source, function(data)
			if data.fish > -1 then
				table.insert(availableJobs, {job = 'fisherman', label = 'Fisherman'})
			end

			if data.fuel > -1 then
				table.insert(availableJobs, {job = 'fueler', label = 'Fueler'})
			end

			if data.lumb > -1 then
				table.insert(availableJobs, {job = 'lumberjack', label = 'Lumberjack'})
			end

			if data.mine > -1 then
				table.insert(availableJobs, {job = 'miner', label = 'Miner'})
			end

			if data.butch > -1 then
				table.insert(availableJobs, {job = 'slaughterer', label = 'Butcher'})
			end

			if data.tail > -1 then
				table.insert(availableJobs, {job = 'tailor', label = 'Tailor'})
			end

			if data.taxi > -1 then
				table.insert(availableJobs, {job = 'taxi', label = 'Taxi'})
			end

			if data.leo > -1 then
				table.insert(availableJobs, {job = 'police', label = 'Policing/Staff'})
			end

			if data.ems > -1 then
				table.insert(availableJobs, {job = 'ambulance', label = 'Fire/Rescue'})
			end

			if data.tow > -1 then
				table.insert(availableJobs, {job = 'mechanic', label = 'Mechanic'})
			end

			cb(availableJobs)
		end)
	end)
end)

-- Set Job
RegisterServerEvent('esx_joblisting:setJob')
AddEventHandler('esx_joblisting:setJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	function injection()
		print(('esx_joblisting: %s attempted to set a whitelisted job! (lua injector)'):format(xPlayer.identifier))
	end

	MySQL.Async.fetchAll('SELECT whitelisted FROM jobs WHERE name = @name', {
		['@name'] = job
	}, function(result)
		if not result[1].whitelisted then
			xPlayer.setJob(job, 0)
		elseif job == 'fisherman' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.fish then
					xPlayer.setJob(job, data.fish)
				else
					injection()
				end
			end)
		elseif job == 'fueler' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.fuel then
					xPlayer.setJob(job, data.fuel)
				else
					injection()
				end
			end)
		elseif job == 'lumberjack' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.lumb then
					xPlayer.setJob(job, data.lumb)
				else
					injection()
				end
			end)
		elseif job == 'miner' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.mine then
					xPlayer.setJob(job, data.mine)
				else
					injection()
				end
			end)
		elseif job == 'slaughterer' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.butch then
					xPlayer.setJob(job, data.butch)
				else
					injection()
				end
			end)
		elseif job == 'tailor' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.tail then
					xPlayer.setJob(job, data.tail)
				else
					injection()
				end
			end)
		elseif job == 'taxi' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.taxi then
					xPlayer.setJob(job, data.taxi)
				else
					injection()
				end
			end)
		elseif job == 'police' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.leo then
					xPlayer.setJob(job, data.leo)
				else
					injection()
				end
			end)
		elseif job == 'ambulance' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.ems then
					xPlayer.setJob(job, data.ems)
				else
					injection()
				end
			end)
		elseif job == 'mechanic' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.tow then
					xPlayer.setJob(job, data.tow)
				else
					injection()
				end
			end)
		else
			injection()
		end
	end)
end)

-- getPlayerData
function getPlayerData(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.Sync.fetchAll('SELECT `leo_rank`, `ems_rank`, `tow_rank`, `fish_rank`, `fuel_rank`, `lumb_rank`, `mine_rank`, `butch_rank`, `tail_rank`, `taxi_rank` FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	})

	local data = {
		leo = result[1].leo_rank,
		ems = result[1].ems_rank,
		tow = result[1].tow_rank,
		fish = result[1].fish_rank,
		fuel = result[1].fuel_rank,
		lumb = result[1].lumb_rank,
		mine = result[1].mine_rank,
		butch = result[1].butch_rank,
		tail = result[1].tail_rank,
		taxi = result[1].taxi_rank
	}

	cb(data)
end

-- getPlayerData2
function getPlayerData2(identifier, cb)
	local result = MySQL.Sync.fetchAll('SELECT `leo_rank`, `ems_rank`, `tow_rank`, `fish_rank`, `fuel_rank`, `lumb_rank`, `mine_rank`, `butch_rank`, `tail_rank`, `taxi_rank` FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	})

	local data = {
		leo = result[1].leo_rank,
		ems = result[1].ems_rank,
		tow = result[1].tow_rank,
		fish = result[1].fish_rank,
		fuel = result[1].fuel_rank,
		lumb = result[1].lumb_rank,
		mine = result[1].mine_rank,
		butch = result[1].butch_rank,
		tail = result[1].tail_rank,
		taxi = result[1].taxi_rank
	}

	cb(data)
end
