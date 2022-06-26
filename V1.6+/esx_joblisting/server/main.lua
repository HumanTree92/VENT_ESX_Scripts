local availableJobs = {}

-- Get Job List
ESX.RegisterServerCallback('esx_joblisting:getJobsList', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier2 = GetPlayerIdentifiers(source)[1]
	local identifier = xPlayer.identifier

	MySQL.query('SELECT name, label FROM jobs WHERE whitelisted = @whitelisted', {
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
				table.insert(availableJobs, {job = 'police', label = 'Policing'})
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

	MySQL.query('SELECT whitelisted FROM jobs WHERE name = @name', {
		['@name'] = job
	}, function(result)
		if not result[1].whitelisted then
			xPlayer.setJob(job, 0)
		elseif job == 'fisherman' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.fish then
					xPlayer.setJob(job, data.fish)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'fueler' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.fuel then
					xPlayer.setJob(job, data.fuel)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'lumberjack' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.lumb then
					xPlayer.setJob(job, data.lumb)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'miner' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.mine then
					xPlayer.setJob(job, data.mine)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'slaughterer' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.butch then
					xPlayer.setJob(job, data.butch)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'tailor' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.tail then
					xPlayer.setJob(job, data.tail)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'taxi' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.taxi then
					xPlayer.setJob(job, data.taxi)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'police' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.leo then
					xPlayer.setJob(job, data.leo)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'ambulance' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.ems then
					xPlayer.setJob(job, data.ems)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		elseif job == 'mechanic' then
			getPlayerData2(xPlayer.identifier, function(data)
				if data.tow then
					xPlayer.setJob(job, data.tow)
				else
					print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
				end
			end)
		else
			print(('esx_joblisting: %s Attempted to SET a Whitelisted Job! (LUA Injector)'):format(xPlayer.identifier))
		end
	end)
end)

-- getPlayerData
function getPlayerData(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.query.await('SELECT `leo_rank`, `ems_rank`, `tow_rank`, `fish_rank`, `fuel_rank`, `lumb_rank`, `mine_rank`, `butch_rank`, `tail_rank`, `taxi_rank` FROM users WHERE identifier = ?', {xPlayer.identifier})
	local data = {
		leo = result.leo_rank,
		ems = result.ems_rank,
		tow = result.tow_rank,
		fish = result.fish_rank,
		fuel = result.fuel_rank,
		lumb = result.lumb_rank,
		mine = result.mine_rank,
		butch = result.butch_rank,
		tail = result.tail_rank,
		taxi = result.taxi_rank
	}

	cb(data)
end

-- getPlayerData2
function getPlayerData2(identifier, cb)
	local result = MySQL.query.await('SELECT `leo_rank`, `ems_rank`, `tow_rank`, `fish_rank`, `fuel_rank`, `lumb_rank`, `mine_rank`, `butch_rank`, `tail_rank`, `taxi_rank` FROM users WHERE identifier = ?', {identifier})
	local data = {
		leo = result.leo_rank,
		ems = result.ems_rank,
		tow = result.tow_rank,
		fish = result.fish_rank,
		fuel = result.fuel_rank,
		lumb = result.lumb_rank,
		mine = result.mine_rank,
		butch = result.butch_rank,
		tail = result.tail_rank,
		taxi = result.taxi_rank
	}

	cb(data)
end
