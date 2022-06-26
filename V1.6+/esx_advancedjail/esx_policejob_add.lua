-- If you are having problems figuring what goes where look at line 124 & below.
-- In order for this to work you must add the following to esx_policejob/client/main.lua 

-- Step 1: Add this to the bottom of the citizen_interaction in the elements
-- Note: Make sure you have commas in the correct spot
{label = _U('jail'), value = 'jail'},

-- Step 2: Add this after unpaid_bills
elseif action == 'jail' then
	JailMenu(GetPlayerServerId(closestPlayer))

-- Step 3: Add this at the end of the file
function JailMenu(player)
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jailmenu', {
		title = _U('jail_menu'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = {
			{label = _U('mission_row'), value = 'mission_row'},
			--{label = _U('sandy_shores'), value = 'sandy_shores'},
			--{label = _U('paleto_bay'), value = 'paleto_bay'},
			{label = _U('bolingbroke_pen'), value = 'bolingbroke_pen'}
	}}, function(data, menu)
		if data.current.value == 'mission_row' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mission_row', {
				title = _U('mission_row'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = {
					{label = _U('mission_row_1'),	value = 'mission_row_1'},
					{label = _U('mission_row_2'),	value = 'mission_row_2'},
					{label = _U('mission_row_3'),	value = 'mission_row_3'},
					--{label = _U('mission_row_4'),	value = 'mission_row_4'},
					--{label = _U('mission_row_5'),	value = 'mission_row_5'},
					--{label = _U('mission_row_6'),	value = 'mission_row_6'},
					--{label = _U('mission_row_7'),	value = 'mission_row_7'}
			}}, function(data2, menu2)
				local action = data2.current.value

				if action == 'mission_row_1' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr1')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_2' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr2')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_3' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr3')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_4' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr4')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_5' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr5')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_6' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr6')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'mission_row_7' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'mr7')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'sandy_shores' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sandy_shores', {
				title = _U('sandy_shores'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = {
					{label = _U('sandy_shores_1'),	value = 'sandy_shores_1'},
					{label = _U('sandy_shores_2'),	value = 'sandy_shores_2'}
			}}, function(data2, menu2)
				local action = data2.current.value

				if action == 'sandy_shores_1' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'ss1')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'sandy_shores_2' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'ss2')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'paleto_bay' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'paleto_bay', {
				title = _U('paleto_bay'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = {
					{label = _U('paleto_bay_1'),	value = 'paleto_bay_1'},
					{label = _U('paleto_bay_2'),	value = 'paleto_bay_2'}
			}}, function(data2, menu2)
				local action = data2.current.value

				if action == 'paleto_bay_1' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'pb1')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				elseif action == 'paleto_bay_2' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'pb2')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'bolingbroke_pen' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'bolingbroke_pen', {
				title = _U('bolingbroke_pen'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = {
					{label = _U('bolingbroke_pen_1'),	value = 'bolingbroke_pen_1'}
			}}, function(data2, menu2)
				local action = data2.current.value

				if action == 'bolingbroke_pen_1' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_dialog', {
						title = _U('jail_menu_info'),
					}, function (data3, menu3)
						local jailTime = tonumber(data3.value)

						if jailTime == nil then
							ESX.ShowNotification(_U('invalid_amount'))
						else
							TriggerServerEvent("esx_advancedjail:sendToJail", player, jailTime * 60, 'bp1')
							ESX.UI.Menu.CloseAll()
							menu3.close()
						end
					end, function (data3, menu3)
						menu3.close()
					end)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function (data, menu)
		menu.close()
	end)
end
