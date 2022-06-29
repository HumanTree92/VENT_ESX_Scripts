-- https://wiki.rage.mp/index.php?title=Weapons_Components#Pistol
-- https://vespura.com/fivem/parachutes/

RegisterNetEvent('esx_extraitems:OpenWeaMenu')
AddEventHandler('esx_extraitems:OpenWeaMenu', function()
	OpenWeaMenu()
end)

function OpenWeaMenu()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weapon_menu', {
		title = _U('weapon_menu'),
		align = GetConvar('esx_MenuAlign', 'top-left'),
		elements = {
			{label = _U('comp_menu'), value = 'comp_menu'},
			{label = _U('upgrade_menu'), value = 'upgrade_menu'},
			{label = _U('para_menu'), value = 'para_menu'}
	}}, function(data, menu)
		local action = data.current.value
		local playerPed = PlayerPedId()

		--== Component Menu ==--
		if action == 'comp_menu' then
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
			}}, function(data2, menu2)
				local action2 = data2.current.value
				local playerPed = PlayerPedId()

				--== Melee Menu ==--
				if action2 == 'melee_menu' then
					local elements2 = {}
					local weaponCat = Config.ComponentList.Melee

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local components, label = {}, nil
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
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							if #data3.current.components > 0 then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
									title = _U('comp_menu_list2'),
									align = GetConvar('esx_MenuAlign', 'top-left'),
									elements = data3.current.components
								}, function(data4, menu4)
									if data4.current.hasComponent then
										if Config.AllowRemove then
											ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
												if success then
													ESX.ShowNotification(_U('comp_uninstalled'))
												else
													ESX.ShowNotification(_U('comp_uninstalled_fail'))
												end
											end, weaponCat, data3.current.name, data4.current.componentNum)
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
										end, weaponCat, data3.current.name, data4.current.componentNum)
									end
								end, function(data4, menu4)
									menu4.close()
								end)
							end
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Pistol Menu ==--
				elseif action2 == 'pistol_menu' then
					local elements2 = {}
					local weaponCat = Config.ComponentList.Pistols

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local components, label = {}, nil
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
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							if #data3.current.components > 0 then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
									title = _U('comp_menu_list2'),
									align = GetConvar('esx_MenuAlign', 'top-left'),
									elements = data3.current.components
								}, function(data4, menu4)
									if data4.current.hasComponent then
										if Config.AllowRemove then
											ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
												if success then
													ESX.ShowNotification(_U('comp_uninstalled'))
												else
													ESX.ShowNotification(_U('comp_uninstalled_fail'))
												end
											end, weaponCat, data3.current.name, data4.current.componentNum)
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
										end, weaponCat, data3.current.name, data4.current.componentNum)
									end
								end, function(data4, menu4)
									menu4.close()
								end)
							end
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== SMG Menu ==--
				elseif action2 == 'smg_menu' then
					local elements2 = {}
					local weaponCat = Config.ComponentList.SMGs

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local components, label = {}, nil
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
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							if #data3.current.components > 0 then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
									title = _U('comp_menu_list2'),
									align = GetConvar('esx_MenuAlign', 'top-left'),
									elements = data3.current.components
								}, function(data4, menu4)
									if data4.current.hasComponent then
										if Config.AllowRemove then
											ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
												if success then
													ESX.ShowNotification(_U('comp_uninstalled'))
												else
													ESX.ShowNotification(_U('comp_uninstalled_fail'))
												end
											end, weaponCat, data3.current.name, data4.current.componentNum)
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
										end, weaponCat, data3.current.name, data4.current.componentNum)
									end
								end, function(data4, menu4)
									menu4.close()
								end)
							end
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Shotgun Menu ==--
				elseif action2 == 'shot_menu' then
					local elements2 = {}
					local weaponCat = Config.ComponentList.Shotguns

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local components, label = {}, nil
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
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							if #data3.current.components > 0 then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
									title = _U('comp_menu_list2'),
									align = GetConvar('esx_MenuAlign', 'top-left'),
									elements = data3.current.components
								}, function(data4, menu4)
									if data4.current.hasComponent then
										if Config.AllowRemove then
											ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
												if success then
													ESX.ShowNotification(_U('comp_uninstalled'))
												else
													ESX.ShowNotification(_U('comp_uninstalled_fail'))
												end
											end, weaponCat, data3.current.name, data4.current.componentNum)
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
										end, weaponCat, data3.current.name, data4.current.componentNum)
									end
								end, function(data4, menu4)
									menu4.close()
								end)
							end
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Assault Rifle Menu ==--
				elseif action2 == 'ar_menu' then
					local elements2 = {}
					local weaponCat = Config.ComponentList.Rifles

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local components, label = {}, nil
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
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							if #data3.current.components > 0 then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
									title = _U('comp_menu_list2'),
									align = GetConvar('esx_MenuAlign', 'top-left'),
									elements = data3.current.components
								}, function(data4, menu4)
									if data4.current.hasComponent then
										if Config.AllowRemove then
											ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
												if success then
													ESX.ShowNotification(_U('comp_uninstalled'))
												else
													ESX.ShowNotification(_U('comp_uninstalled_fail'))
												end
											end, weaponCat, data3.current.name, data4.current.componentNum)
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
										end, weaponCat, data3.current.name, data4.current.componentNum)
									end
								end, function(data4, menu4)
									menu4.close()
								end)
							end
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Machine Gun Menu ==--
				elseif action2 == 'mg_menu' then
					local elements2 = {}
					local weaponCat = Config.ComponentList.MGs

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local components, label = {}, nil
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
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							if #data3.current.components > 0 then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
									title = _U('comp_menu_list2'),
									align = GetConvar('esx_MenuAlign', 'top-left'),
									elements = data3.current.components
								}, function(data4, menu4)
									if data4.current.hasComponent then
										if Config.AllowRemove then
											ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
												if success then
													ESX.ShowNotification(_U('comp_uninstalled'))
												else
													ESX.ShowNotification(_U('comp_uninstalled_fail'))
												end
											end, weaponCat, data3.current.name, data4.current.componentNum)
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
										end, weaponCat, data3.current.name, data4.current.componentNum)
									end
								end, function(data4, menu4)
									menu4.close()
								end)
							end
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Sniper Rifle Menu ==--
				elseif action2 == 'sniper_menu' then
					local elements2 = {}
					local weaponCat = Config.ComponentList.Snipers

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local components, label = {}, nil
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
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							if #data3.current.components > 0 then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listcomponents', {
									title = _U('comp_menu_list2'),
									align = GetConvar('esx_MenuAlign', 'top-left'),
									elements = data3.current.components
								}, function(data4, menu4)
									if data4.current.hasComponent then
										if Config.AllowRemove then
											ESX.TriggerServerCallback('esx_extraitems:RemoveWeaponComponent', function(success)
												if success then
													ESX.ShowNotification(_U('comp_uninstalled'))
												else
													ESX.ShowNotification(_U('comp_uninstalled_fail'))
												end
											end, weaponCat, data3.current.name, data4.current.componentNum)
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
										end, weaponCat, data3.current.name, data4.current.componentNum)
									end
								end, function(data4, menu4)
									menu4.close()
								end)
							end
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Universal Skin Menu ==--
				elseif action2 == 'uni_skins' then
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
					}}, function(data3, menu3)
						local action3 = data3.current.value
						local CurrentWeaponHash = GetSelectedPedWeapon(playerPed)

						if action3 == 'tint_default' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 0)
						elseif action3 == 'tint_green' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 1)
						elseif action3 == 'tint_gold' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 2)
						elseif action3 == 'tint_pink' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 3)
						elseif action3 == 'tint_army' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 4)
						elseif action3 == 'tint_lspd' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 5)
						elseif action3 == 'skin_orange' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 6)
						elseif action3 == 'tint_platinum' then
							SetPedWeaponTintIndex(playerPed, CurrentWeaponHash, 7)
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				end
			end, function (data2, menu2)
				menu2.close()
			end)
		--== Upgrade Menu ==--
		elseif action == 'upgrade_menu' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'upgrade_menu', {
				title = _U('upgrade_menu'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = {
					{label = _U('pistol_menu'), value = 'pistol_menu'},
					{label = _U('smg_menu'), value = 'smg_menu'},
					{label = _U('shot_menu'), value = 'shot_menu'},
					{label = _U('ar_menu'), value = 'ar_menu'},
					{label = _U('mg_menu'), value = 'mg_menu'},
					{label = _U('sniper_menu'), value = 'sniper_menu'}
			}}, function(data2, menu2)
				--menu.close()
				local action2 = data2.current.value
				local playerPed = PlayerPedId()

				--== Pistol Menu ==--
				if action2 == 'pistol_menu' then
					local elements2 = {}
					local weaponCat = Config.WeaponUpgrades.Pistols

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local upgrade, label = v.upgrade, {}
						local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

						if hasWeapon then
							label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
						else
							label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
						end

						table.insert(elements2, {
							label = label,
							weaponLabel = weapon.label,
							name = weapon.name,
							upgrade = upgrade,
							hasWeapon = hasWeapon
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
						title = _U('upgrade_menu_list1'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = elements2
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listupgrades', {
								title = _U('upgrade_menu_list2'),
								align = GetConvar('esx_MenuAlign', 'top-left'),
								elements = {
									{label = _U('yes'), value = 'yes'},
									{label = _U('no'), value = 'no'}
							}}, function(data4, menu4)
								if data4.current.value == 'yes' then
									local count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data3.current.name))

									ESX.TriggerServerCallback('esx_extraitems:UpgradeWeapon', function(success)
										if success then
											ESX.ShowNotification(_U('wea_upgraded'))
										else
											ESX.ShowNotification(_U('wea_upgrade_fail'))
										end
									end, weaponCat, data3.current.name, data3.current.upgrade, count)
								else
									menu4.close()
								end
							end, function(data4, menu4)
								menu4.close()
							end)
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== SMG Menu ==--
				elseif action2 == 'smg_menu' then
					local elements2 = {}
					local weaponCat = Config.WeaponUpgrades.SMGs

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local upgrade, label = v.upgrade, {}
						local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

						if hasWeapon then
							label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
						else
							label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
						end

						table.insert(elements2, {
							label = label,
							weaponLabel = weapon.label,
							name = weapon.name,
							upgrade = upgrade,
							hasWeapon = hasWeapon
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
						title = _U('upgrade_menu_list1'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = elements2
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listupgrades', {
								title = _U('upgrade_menu_list2'),
								align = GetConvar('esx_MenuAlign', 'top-left'),
								elements = {
									{label = _U('yes'), value = 'yes'},
									{label = _U('no'), value = 'no'}
							}}, function(data4, menu4)
								if data4.current.value == 'yes' then
									local count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data3.current.name))

									ESX.TriggerServerCallback('esx_extraitems:UpgradeWeapon', function(success)
										if success then
											ESX.ShowNotification(_U('wea_upgraded'))
										else
											ESX.ShowNotification(_U('wea_upgrade_fail'))
										end
									end, weaponCat, data3.current.name, data3.current.upgrade, count)
								else
									menu4.close()
								end
							end, function(data4, menu4)
								menu4.close()
							end)
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Shotgun Menu ==--
				elseif action2 == 'shot_menu' then
					local elements2 = {}
					local weaponCat = Config.WeaponUpgrades.Shotguns

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local upgrade, label = v.upgrade, {}
						local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

						if hasWeapon then
							label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
						else
							label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
						end

						table.insert(elements2, {
							label = label,
							weaponLabel = weapon.label,
							name = weapon.name,
							upgrade = upgrade,
							hasWeapon = hasWeapon
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
						title = _U('upgrade_menu_list1'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = elements2
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listupgrades', {
								title = _U('upgrade_menu_list2'),
								align = GetConvar('esx_MenuAlign', 'top-left'),
								elements = {
									{label = _U('yes'), value = 'yes'},
									{label = _U('no'), value = 'no'}
							}}, function(data4, menu4)
								if data4.current.value == 'yes' then
									local count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data3.current.name))

									ESX.TriggerServerCallback('esx_extraitems:UpgradeWeapon', function(success)
										if success then
											ESX.ShowNotification(_U('wea_upgraded'))
										else
											ESX.ShowNotification(_U('wea_upgrade_fail'))
										end
									end, weaponCat, data3.current.name, data3.current.upgrade, count)
								else
									menu4.close()
								end
							end, function(data4, menu4)
								menu4.close()
							end)
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Assault Rifle Menu ==--
				elseif action2 == 'ar_menu' then
					local elements2 = {}
					local weaponCat = Config.WeaponUpgrades.Rifles

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local upgrade, label = v.upgrade, {}
						local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

						if hasWeapon then
							label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
						else
							label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
						end

						table.insert(elements2, {
							label = label,
							weaponLabel = weapon.label,
							name = weapon.name,
							upgrade = upgrade,
							hasWeapon = hasWeapon
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
						title = _U('upgrade_menu_list1'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = elements2
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listupgrades', {
								title = _U('upgrade_menu_list2'),
								align = GetConvar('esx_MenuAlign', 'top-left'),
								elements = {
									{label = _U('yes'), value = 'yes'},
									{label = _U('no'), value = 'no'}
							}}, function(data4, menu4)
								if data4.current.value == 'yes' then
									local count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data3.current.name))

									ESX.TriggerServerCallback('esx_extraitems:UpgradeWeapon', function(success)
										if success then
											ESX.ShowNotification(_U('wea_upgraded'))
										else
											ESX.ShowNotification(_U('wea_upgrade_fail'))
										end
									end, weaponCat, data3.current.name, data3.current.upgrade, count)
								else
									menu4.close()
								end
							end, function(data4, menu4)
								menu4.close()
							end)
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Machine Gun Menu ==--
				elseif action2 == 'mg_menu' then
					local elements2 = {}
					local weaponCat = Config.WeaponUpgrades.MGs

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local upgrade, label = v.upgrade, {}
						local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

						if hasWeapon then
							label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
						else
							label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
						end

						table.insert(elements2, {
							label = label,
							weaponLabel = weapon.label,
							name = weapon.name,
							upgrade = upgrade,
							hasWeapon = hasWeapon
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
						title = _U('upgrade_menu_list1'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = elements2
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listupgrades', {
								title = _U('upgrade_menu_list2'),
								align = GetConvar('esx_MenuAlign', 'top-left'),
								elements = {
									{label = _U('yes'), value = 'yes'},
									{label = _U('no'), value = 'no'}
							}}, function(data4, menu4)
								if data4.current.value == 'yes' then
									local count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data3.current.name))

									ESX.TriggerServerCallback('esx_extraitems:UpgradeWeapon', function(success)
										if success then
											ESX.ShowNotification(_U('wea_upgraded'))
										else
											ESX.ShowNotification(_U('wea_upgrade_fail'))
										end
									end, weaponCat, data3.current.name, data3.current.upgrade, count)
								else
									menu4.close()
								end
							end, function(data4, menu4)
								menu4.close()
							end)
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				--== Sniper Rifle Menu ==--
				elseif action2 == 'sniper_menu' then
					local elements2 = {}
					local weaponCat = Config.WeaponUpgrades.Snipers

					for k,v in ipairs(weaponCat) do
						local weaponNum, weapon = ESX.GetWeapon(v.weapon)
						local upgrade, label = v.upgrade, {}
						local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

						if hasWeapon then
							label = ('%s: %s'):format(weapon.label, _U('wea_owned'))
						else
							label = ('%s: <span style="color:red;">%s</span>'):format(weapon.label, _U('wea_not_owned'))
						end

						table.insert(elements2, {
							label = label,
							weaponLabel = weapon.label,
							name = weapon.name,
							upgrade = upgrade,
							hasWeapon = hasWeapon
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listweapons', {
						title = _U('upgrade_menu_list1'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = elements2
					}, function(data3, menu3)
						if data3.current.hasWeapon then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'listupgrades', {
								title = _U('upgrade_menu_list2'),
								align = GetConvar('esx_MenuAlign', 'top-left'),
								elements = {
									{label = _U('yes'), value = 'yes'},
									{label = _U('no'), value = 'no'}
							}}, function(data4, menu4)
								if data4.current.value == 'yes' then
									local count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data3.current.name))

									ESX.TriggerServerCallback('esx_extraitems:UpgradeWeapon', function(success)
										if success then
											ESX.ShowNotification(_U('wea_upgraded'))
										else
											ESX.ShowNotification(_U('wea_upgrade_fail'))
										end
									end, weaponCat, data3.current.name, data3.current.upgrade, count)
								else
									menu4.close()
								end
							end, function(data4, menu4)
								menu4.close()
							end)
						else
							ESX.ShowNotification(_U('not_owned'))
						end
					end, function(data3, menu3)
						menu3.close()
					end)
				end
			end, function (data, menu)
				menu.close()
			end)
		--== Parachute Menu ==--
		elseif action == 'para_menu' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'para_menu', {
				title = _U('para_menu'),
				align = GetConvar('esx_MenuAlign', 'top-left'),
				elements = {
					{label = _U('para_main'), value = 'para_main'},
					{label = _U('para_trails'), value = 'para_trails'}
			}}, function(data2, menu2)
				local action2 = data2.current.value

				if action2 == 'para_main' then
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'para_main', {
						title = _U('para_main'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = {
							{label = _U('para_main_0'), value = 0},
							{label = _U('para_main_1'), value = 1},
							{label = _U('para_main_2'), value = 2},
							{label = _U('para_main_3'), value = 3},
							{label = _U('para_main_4'), value = 4},
							{label = _U('para_main_5'), value = 5},
							{label = _U('para_main_6'), value = 6},
							{label = _U('para_main_7'), value = 7},
							{label = _U('para_main_8'), value = 8},
							{label = _U('para_main_9'), value = 9},
							{label = _U('para_main_10'), value = 10},
							{label = _U('para_main_11'), value = 11},
							{label = _U('para_main_12'), value = 12},
							{label = _U('para_main_13'), value = 13}
					}}, function(data3, menu3)
						local action3 = data3.current.value
						GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('GADGET_PARACHUTE'), true)
						SetPlayerHasReserveParachute(PlayerId())

						--SetPlayerParachutePackTintIndex(PlayerId(), action3)
						SetPlayerParachuteTintIndex(PlayerId(), action3)
						SetPlayerReserveParachuteTintIndex(PlayerId(), action3)

						SetPlayerParachuteModelOverride(PlayerId(), 'pil_p_para_pilot_sp_s')
						SetPlayerReserveParachuteModelOverride(PlayerId(), 'pil_p_para_pilot_sp_s')
						ESX.ShowNotification(_U('para_main_set', data3.current.label))
					end, function(data3, menu3)
						menu3.close()
					end)
				elseif action2 == 'para_trails' then
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'para_trails', {
						title = _U('para_trails'),
						align = GetConvar('esx_MenuAlign', 'top-left'),
						elements = {
							{label = _U('para_trails_red'), value = 'para_trails_red'},
							{label = _U('para_trails_green'), value = 'para_trails_green'},
							{label = _U('para_trails_blue'), value = 'para_trails_blue'},
							{label = _U('para_trails_orange'), value = 'para_trails_orange'},
							{label = _U('para_trails_black'), value = 'para_trails_black'},
							{label = _U('para_trails_white'), value = 'para_trails_white'},
							{label = _U('para_trails_rgb'), value = 'para_trails_rgb'}
					}}, function(data3, menu3)
						local action3 = data3.current.value

						if action3 == 'para_trails_red' then
							SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
							SetPlayerParachuteSmokeTrailColor(PlayerId(), 255, 0, 0)
							ESX.ShowNotification(_U('para_trails_set', data3.current.label))
						elseif action3 == 'para_trails_green' then
							SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
							SetPlayerParachuteSmokeTrailColor(PlayerId(), 0, 255, 0)
							ESX.ShowNotification(_U('para_trails_set', data3.current.label))
						elseif action3 == 'para_trails_blue' then
							SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
							SetPlayerParachuteSmokeTrailColor(PlayerId(), 0, 0, 255)
							ESX.ShowNotification(_U('para_trails_set', data3.current.label))
						elseif action3 == 'para_trails_orange' then
							SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
							SetPlayerParachuteSmokeTrailColor(PlayerId(), 255, 165, 0)
							ESX.ShowNotification(_U('para_trails_set', data3.current.label))
						elseif action3 == 'para_trails_black' then
							SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
							SetPlayerParachuteSmokeTrailColor(PlayerId(), 20, 20, 20)
							ESX.ShowNotification(_U('para_trails_set', data3.current.label))
						elseif action3 == 'para_trails_white' then
							SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
							SetPlayerParachuteSmokeTrailColor(PlayerId(), 255, 255, 255)
							ESX.ShowNotification(_U('para_trails_set', data3.current.label))
						elseif action3 == 'para_trails_rgb' then
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'para_trails_r', {
								title = _U('para_trails_r')
							}, function(data4, menu4)
								local action4 = data4.value

								menu4.close()
								ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'para_trails_g', {
									title = _U('para_trails_g')
								}, function(data5, menu5)
									local action5 = data5.value

									menu5.close()
									ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'para_trails_b', {
										title = _U('para_trails_b')
									}, function(data6, menu6)
										local action6 = data6.value

										SetPlayerCanLeaveParachuteSmokeTrail(PlayerId(), true)
										SetPlayerParachuteSmokeTrailColor(PlayerId(), action4, action5, action6)
										ESX.ShowNotification(_U('para_trails_set', data3.current.label))
										menu6.close()
										--menu5.close()
										--menu4.close()
									end, function(data6, menu6)
										menu6.close()
									end)
								end, function(data5, menu5)
									menu5.close()
								end)
							end, function(data4, menu4)
								menu4.close()
							end)
						end
					end, function(data3, menu3)
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
