-- https://wiki.rage.mp/index.php?title=Weapons_Components#Pistol

RegisterNetEvent('esx_extraitems:OpenCompMenu')
AddEventHandler('esx_extraitems:OpenCompMenu', function()
	OpenCompMenu()
end)

function OpenCompMenu()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'comp_menu', {
		title = _U('comp_menu'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = {
			{label = _U('melee_menu'), value = 'melee_menu'},
			{label = _U('pistol_menu'), value = 'pistol_menu'},
			{label = _U('smg_menu'), value = 'smg_menu'},
			{label = _U('shot_menu'), value = 'shot_menu'},
			{label = _U('ar_menu'), value = 'ar_menu'},
			{label = _U('mg_menu'), value = 'mg_menu'},
			{label = _U('sniper_menu'), value = 'sniper_menu'},
			{label = _U('uni_skins'), value = 'uni_skins'}
	}}, function(data, menu)
		--menu.close()
		local action = data.current.value
		local playerPed = PlayerPedId()

		--== Melee Menu ==--
		if action == 'melee_menu' then
			local elements2 = {}
			local weaponCat = Config.ComponentList.Melee
	
			for k,v in ipairs(weaponCat) do
				local weaponNum, weapon = ESX.GetWeapon(v.weapon)
				local components, label = {}
				local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

				if v.components then
					for i=1, #v.components do
						if v.components[i] then
							local component = weapon.components[i]
							local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

							if hasComponent then
								label = ('%s: %s'):format(component.label, _U('comp_install'))
							else
								if v.components[i] then
									label = ('%s: <span style="color:red;">%s</span>'):format(component.label, _U('comp_not_install'))
								end
							end

							table.insert(components, {
								label = label,
								componentLabel = component.label,
								hash = component.hash,
								name = component.name,
								hasComponent = hasComponent,
								componentNum = i
							})
						end
					end
				end

				if hasWeapon then
					label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
				else
					label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
				end

				table.insert(elements2, {
					label = label,
					weaponLabel = weapon.label,
					name = weapon.name,
					components = components,
					hasWeapon = hasWeapon
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
				title = _U('comp_menu_list1'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data2, menu2)
				if data2.current.hasWeapon then
					if #data2.current.components > 0 then
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
							title = _U('comp_menu_list2'),
							align = GetConvar('esx_MenuAlign', 'top-left'),
							elements = data2.current.components
						}, function(data3, menu3)
							if data3.current.hasComponent then
								if Config.AllowRemove then
									ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
										if success then
											ESX.ShowNotification(_U('comp_uninstalled'))
										else
											ESX.ShowNotification(_U('comp_uninstalled_fail'))
										end
									end, weaponCat, data2.current.name, data3.current.componentNum)
								else
									ESX.ShowNotification(_U('comp_already'))
								end
							else
								ESX.TriggerServerCallback('esx_extraitems:AddWeaponComponent', function(success)
									if success then
										ESX.ShowNotification(_U('comp_installed'))
									else
										ESX.ShowNotification(_U('comp_installed_fail'))
									end
								end, weaponCat, data2.current.name, data3.current.componentNum)
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				else
					ESX.ShowNotification(_U('not_owned'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		--== Pistol Menu ==--
		elseif action == 'pistol_menu' then
			local elements2 = {}
			local weaponCat = Config.ComponentList.Pistols
	
			for k,v in ipairs(weaponCat) do
				local weaponNum, weapon = ESX.GetWeapon(v.weapon)
				local components, label = {}
				local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

				if v.components then
					for i=1, #v.components do
						if v.components[i] then
							local component = weapon.components[i]
							local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

							if hasComponent then
								label = ('%s: %s'):format(component.label, _U('comp_install'))
							else
								if v.components[i] then
									label = ('%s: <span style="color:red;">%s</span>'):format(component.label, _U('comp_not_install'))
								end
							end

							table.insert(components, {
								label = label,
								componentLabel = component.label,
								hash = component.hash,
								name = component.name,
								hasComponent = hasComponent,
								componentNum = i
							})
						end
					end
				end

				if hasWeapon then
					label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
				else
					label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
				end

				table.insert(elements2, {
					label = label,
					weaponLabel = weapon.label,
					name = weapon.name,
					components = components,
					hasWeapon = hasWeapon
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
				title = _U('comp_menu_list1'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data2, menu2)
				if data2.current.hasWeapon then
					if #data2.current.components > 0 then
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
							title = _U('comp_menu_list2'),
							align = GetConvar('esx_MenuAlign', 'top-left'),
							elements = data2.current.components
						}, function(data3, menu3)
							if data3.current.hasComponent then
								if Config.AllowRemove then
									ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
										if success then
											ESX.ShowNotification(_U('comp_uninstalled'))
										else
											ESX.ShowNotification(_U('comp_uninstalled_fail'))
										end
									end, weaponCat, data2.current.name, data3.current.componentNum)
								else
									ESX.ShowNotification(_U('comp_already'))
								end
							else
								ESX.TriggerServerCallback('esx_extraitems:AddWeaponComponent', function(success)
									if success then
										ESX.ShowNotification(_U('comp_installed'))
									else
										ESX.ShowNotification(_U('comp_installed_fail'))
									end
								end, weaponCat, data2.current.name, data3.current.componentNum)
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				else
					ESX.ShowNotification(_U('not_owned'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		--== SMG Menu ==--
		elseif action == 'smg_menu' then
			local elements2 = {}
			local weaponCat = Config.ComponentList.SMGs
	
			for k,v in ipairs(weaponCat) do
				local weaponNum, weapon = ESX.GetWeapon(v.weapon)
				local components, label = {}
				local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

				if v.components then
					for i=1, #v.components do
						if v.components[i] then
							local component = weapon.components[i]
							local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

							if hasComponent then
								label = ('%s: %s'):format(component.label, _U('comp_install'))
							else
								if v.components[i] then
									label = ('%s: <span style="color:red;">%s</span>'):format(component.label, _U('comp_not_install'))
								end
							end

							table.insert(components, {
								label = label,
								componentLabel = component.label,
								hash = component.hash,
								name = component.name,
								hasComponent = hasComponent,
								componentNum = i
							})
						end
					end
				end

				if hasWeapon then
					label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
				else
					label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
				end

				table.insert(elements2, {
					label = label,
					weaponLabel = weapon.label,
					name = weapon.name,
					components = components,
					hasWeapon = hasWeapon
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
				title = _U('comp_menu_list1'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data2, menu2)
				if data2.current.hasWeapon then
					if #data2.current.components > 0 then
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
							title = _U('comp_menu_list2'),
							align = GetConvar('esx_MenuAlign', 'top-left'),
							elements = data2.current.components
						}, function(data3, menu3)
							if data3.current.hasComponent then
								if Config.AllowRemove then
									ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
										if success then
											ESX.ShowNotification(_U('comp_uninstalled'))
										else
											ESX.ShowNotification(_U('comp_uninstalled_fail'))
										end
									end, weaponCat, data2.current.name, data3.current.componentNum)
								else
									ESX.ShowNotification(_U('comp_already'))
								end
							else
								ESX.TriggerServerCallback('esx_extraitems:AddWeaponComponent', function(success)
									if success then
										ESX.ShowNotification(_U('comp_installed'))
									else
										ESX.ShowNotification(_U('comp_installed_fail'))
									end
								end, weaponCat, data2.current.name, data3.current.componentNum)
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				else
					ESX.ShowNotification(_U('not_owned'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		--== Shotgun Menu ==--
		elseif action == 'shot_menu' then
			local elements2 = {}
			local weaponCat = Config.ComponentList.Shotguns
	
			for k,v in ipairs(weaponCat) do
				local weaponNum, weapon = ESX.GetWeapon(v.weapon)
				local components, label = {}
				local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

				if v.components then
					for i=1, #v.components do
						if v.components[i] then
							local component = weapon.components[i]
							local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

							if hasComponent then
								label = ('%s: %s'):format(component.label, _U('comp_install'))
							else
								if v.components[i] then
									label = ('%s: <span style="color:red;">%s</span>'):format(component.label, _U('comp_not_install'))
								end
							end

							table.insert(components, {
								label = label,
								componentLabel = component.label,
								hash = component.hash,
								name = component.name,
								hasComponent = hasComponent,
								componentNum = i
							})
						end
					end
				end

				if hasWeapon then
					label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
				else
					label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
				end

				table.insert(elements2, {
					label = label,
					weaponLabel = weapon.label,
					name = weapon.name,
					components = components,
					hasWeapon = hasWeapon
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
				title = _U('comp_menu_list1'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data2, menu2)
				if data2.current.hasWeapon then
					if #data2.current.components > 0 then
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
							title = _U('comp_menu_list2'),
							align = GetConvar('esx_MenuAlign', 'top-left'),
							elements = data2.current.components
						}, function(data3, menu3)
							if data3.current.hasComponent then
								if Config.AllowRemove then
									ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
										if success then
											ESX.ShowNotification(_U('comp_uninstalled'))
										else
											ESX.ShowNotification(_U('comp_uninstalled_fail'))
										end
									end, weaponCat, data2.current.name, data3.current.componentNum)
								else
									ESX.ShowNotification(_U('comp_already'))
								end
							else
								ESX.TriggerServerCallback('esx_extraitems:AddWeaponComponent', function(success)
									if success then
										ESX.ShowNotification(_U('comp_installed'))
									else
										ESX.ShowNotification(_U('comp_installed_fail'))
									end
								end, weaponCat, data2.current.name, data3.current.componentNum)
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				else
					ESX.ShowNotification(_U('not_owned'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		--== Assault Rifle Menu ==--
		elseif action == 'ar_menu' then
			local elements2 = {}
			local weaponCat = Config.ComponentList.Rifles
	
			for k,v in ipairs(weaponCat) do
				local weaponNum, weapon = ESX.GetWeapon(v.weapon)
				local components, label = {}
				local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

				if v.components then
					for i=1, #v.components do
						if v.components[i] then
							local component = weapon.components[i]
							local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

							if hasComponent then
								label = ('%s: %s'):format(component.label, _U('comp_install'))
							else
								if v.components[i] then
									label = ('%s: <span style="color:red;">%s</span>'):format(component.label, _U('comp_not_install'))
								end
							end

							table.insert(components, {
								label = label,
								componentLabel = component.label,
								hash = component.hash,
								name = component.name,
								hasComponent = hasComponent,
								componentNum = i
							})
						end
					end
				end

				if hasWeapon then
					label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
				else
					label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
				end

				table.insert(elements2, {
					label = label,
					weaponLabel = weapon.label,
					name = weapon.name,
					components = components,
					hasWeapon = hasWeapon
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
				title = _U('comp_menu_list1'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data2, menu2)
				if data2.current.hasWeapon then
					if #data2.current.components > 0 then
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
							title = _U('comp_menu_list2'),
							align = GetConvar('esx_MenuAlign', 'top-left'),
							elements = data2.current.components
						}, function(data3, menu3)
							if data3.current.hasComponent then
								if Config.AllowRemove then
									ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
										if success then
											ESX.ShowNotification(_U('comp_uninstalled'))
										else
											ESX.ShowNotification(_U('comp_uninstalled_fail'))
										end
									end, weaponCat, data2.current.name, data3.current.componentNum)
								else
									ESX.ShowNotification(_U('comp_already'))
								end
							else
								ESX.TriggerServerCallback('esx_extraitems:AddWeaponComponent', function(success)
									if success then
										ESX.ShowNotification(_U('comp_installed'))
									else
										ESX.ShowNotification(_U('comp_installed_fail'))
									end
								end, weaponCat, data2.current.name, data3.current.componentNum)
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				else
					ESX.ShowNotification(_U('not_owned'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		--== Machine Gun Menu ==--
		elseif action == 'mg_menu' then
			local elements2 = {}
			local weaponCat = Config.ComponentList.MGs
	
			for k,v in ipairs(weaponCat) do
				local weaponNum, weapon = ESX.GetWeapon(v.weapon)
				local components, label = {}
				local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

				if v.components then
					for i=1, #v.components do
						if v.components[i] then
							local component = weapon.components[i]
							local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

							if hasComponent then
								label = ('%s: %s'):format(component.label, _U('comp_install'))
							else
								if v.components[i] then
									label = ('%s: <span style="color:red;">%s</span>'):format(component.label, _U('comp_not_install'))
								end
							end

							table.insert(components, {
								label = label,
								componentLabel = component.label,
								hash = component.hash,
								name = component.name,
								hasComponent = hasComponent,
								componentNum = i
							})
						end
					end
				end

				if hasWeapon then
					label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
				else
					label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
				end

				table.insert(elements2, {
					label = label,
					weaponLabel = weapon.label,
					name = weapon.name,
					components = components,
					hasWeapon = hasWeapon
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
				title = _U('comp_menu_list1'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data2, menu2)
				if data2.current.hasWeapon then
					if #data2.current.components > 0 then
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
							title = _U('comp_menu_list2'),
							align = GetConvar('esx_MenuAlign', 'top-left'),
							elements = data2.current.components
						}, function(data3, menu3)
							if data3.current.hasComponent then
								if Config.AllowRemove then
									ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
										if success then
											ESX.ShowNotification(_U('comp_uninstalled'))
										else
											ESX.ShowNotification(_U('comp_uninstalled_fail'))
										end
									end, weaponCat, data2.current.name, data3.current.componentNum)
								else
									ESX.ShowNotification(_U('comp_already'))
								end
							else
								ESX.TriggerServerCallback('esx_extraitems:AddWeaponComponent', function(success)
									if success then
										ESX.ShowNotification(_U('comp_installed'))
									else
										ESX.ShowNotification(_U('comp_installed_fail'))
									end
								end, weaponCat, data2.current.name, data3.current.componentNum)
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				else
					ESX.ShowNotification(_U('not_owned'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		--== Sniper Rifle Menu ==--
		elseif action == 'sniper_menu' then
			local elements2 = {}
			local weaponCat = Config.ComponentList.Snipers
	
			for k,v in ipairs(weaponCat) do
				local weaponNum, weapon = ESX.GetWeapon(v.weapon)
				local components, label = {}
				local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

				if v.components then
					for i=1, #v.components do
						if v.components[i] then
							local component = weapon.components[i]
							local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

							if hasComponent then
								label = ('%s: %s'):format(component.label, _U('comp_install'))
							else
								if v.components[i] then
									label = ('%s: <span style="color:red;">%s</span>'):format(component.label, _U('comp_not_install'))
								end
							end

							table.insert(components, {
								label = label,
								componentLabel = component.label,
								hash = component.hash,
								name = component.name,
								hasComponent = hasComponent,
								componentNum = i
							})
						end
					end
				end

				if hasWeapon then
					label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
				else
					label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
				end

				table.insert(elements2, {
					label = label,
					weaponLabel = weapon.label,
					name = weapon.name,
					components = components,
					hasWeapon = hasWeapon
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
				title = _U('comp_menu_list1'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = elements2
			}, function(data2, menu2)
				if data2.current.hasWeapon then
					if #data2.current.components > 0 then
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
							title = _U('comp_menu_list2'),
							align = GetConvar('esx_MenuAlign', 'top-left'),
							elements = data2.current.components
						}, function(data3, menu3)
							if data3.current.hasComponent then
								if Config.AllowRemove then
									ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
										if success then
											ESX.ShowNotification(_U('comp_uninstalled'))
										else
											ESX.ShowNotification(_U('comp_uninstalled_fail'))
										end
									end, weaponCat, data2.current.name, data3.current.componentNum)
								else
									ESX.ShowNotification(_U('comp_already'))
								end
							else
								ESX.TriggerServerCallback('esx_extraitems:AddWeaponComponent', function(success)
									if success then
										ESX.ShowNotification(_U('comp_installed'))
									else
										ESX.ShowNotification(_U('comp_installed_fail'))
									end
								end, weaponCat, data2.current.name, data3.current.componentNum)
							end
						end, function(data3, menu3)
							menu3.close()
						end)
					end
				else
					ESX.ShowNotification(_U('not_owned'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		--== Universal Skin Menu ==--
		elseif action == 'uni_skins' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'uni_skins', {
				title = _U('uni_skins'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = {
					{label = _U('tint_default'), value = 'tint_default'},
					{label = _U('tint_green'), value = 'tint_green'},
					{label = _U('tint_gold'), value = 'tint_gold'},
					{label = _U('tint_pink'), value = 'tint_pink'},
					{label = _U('tint_army'), value = 'tint_army'},
					{label = _U('tint_lspd'), value = 'tint_lspd'},
					{label = _U('tint_orange'), value = 'tint_orange'},
					{label = _U('tint_platinum'), value = 'tint_platinum'}
			}}, function(data2, menu2)
				local action2 = data2.current.value
				local CurrentWeaponHash = GetSelectedPedWeapon(playerPed)

				if action2 == 'tint_default' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 0)
				elseif action2 == 'tint_green' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 1)
				elseif action2 == 'tint_gold' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 2)
				elseif action2 == 'tint_pink' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 3)
				elseif action2 == 'tint_army' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 4)
				elseif action2 == 'tint_lspd' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 5)
				elseif action2 == 'skin_orange' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 6)
				elseif action2 == 'tint_platinum' then
					SetPedWeaponTintIndex(PlayerPed, CurrentWeaponHash, 7)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function (data, menu)
		menu.close()
	end)
end
