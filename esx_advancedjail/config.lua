Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.
Config.MarkerInfo = {Type = 27, r = 100, g = 100, b = 204, x = 1.5, y = 1.5, z = 2.0} -- Marker Settings.
Config.Sync = 1 -- Jail Time Sync Interval in Seconds.

Config.AllowEscape = false -- true = Allows Players to Escape Jail & will notify Police.
Config.OnlyFirstname = false -- true = Will only show 1st Name if someone tries to Escape.

Config.RemoveLoadout = false -- true = Will Remove Players Loadout when Jailed & UnJailed.
Config.RemoveInventory = false -- true = Will Remove Players Inventory when Jailed & UnJailed.
Config.RemoveDirtyMoney = false -- true = Will Remove Players Dirty Money when Jailed & UnJailed.

Config.GiveFoodDrink = false -- true = Will Give Players Food & Drinks while in Jail & when they are Released.
Config.FoodItem = 'bread' -- Food Item to Give.
Config.FoodAmount = 5 -- Amount of Food to Give.
Config.DrinkItem = 'water' -- Drink Item to Give.
Config.DrinkAmount = 5 -- Amount of Water to Give.

-- DrawMarkers | Use only if you want to see a Marker around Jail Positions
Config.DM = {
	Show = false, -- Master Toggle
	LSMR0 = true, -- Los Santos Mission Row | UnJail Marker
	LSMR1 = true, -- Los Santos Mission Row | Jail Marker 1
	LSMR2 = true, -- Los Santos Mission Row | Jail Marker 2
	LSMR3 = true, -- Los Santos Mission Row | Jail Marker 3
	LSMR4 = true, -- Los Santos Mission Row | Jail Marker 4
	SSSD0 = true, -- Sandy Shores Sheriffs Dept | UnJail Marker
	SSSD1 = true, -- Sandy Shores Sheriffs Dept | Jail Marker 1
	SSSD2 = true, -- Sandy Shores Sheriffs Dept | Jail Marker 2
	PBSD0 = true, -- Paleto Bay Sheriffs Dept | UnJail Marker
	PBSD1 = true, -- Paleto Bay Sheriffs Dept | Jail Marker 1
	PBSD2 = true, -- Paleto Bay Sheriffs Dept | Jail Marker 2
	SSBP0 = true, -- Sandy Shores Bolingbroke Penitentiary | UnJail Marker
	SSBP1 = true -- Sandy Shores Bolingbroke Penitentiary | Jail Marker
}

-- Jail Locations
Config.JL = {
	LSMR0 = vector3(438.05, -982.90, 29.69), -- Los Santos Mission Row | UnJail Coords
	LSMR1 = vector3(460.18, -994.38, 23.91), -- Los Santos Mission Row | Jail Cell 1 Coords
	LSMR2 = vector3(459.22, -997.97, 23.91), -- Los Santos Mission Row | Jail Cell 2 Coords
	LSMR3 = vector3(459.40, -1001.52, 23.91), -- Los Santos Mission Row | Jail Cell 3 Coords
	--LSMR4 = vector3(0.0, 0.0, 0.0), -- Los Santos Mission Row | Jail Cell 4 Coords
	--SSSD0 = vector3(0.0, 0.0, 0.0), -- Sandy Shores Sheriffs Dept | UnJail Coords
	--SSSD1 = vector3(0.0, 0.0, 0.0), -- Sandy Shores Sheriffs Dept | Jail Cell 1 Coords
	--SSSD2 = vector3(0.0, 0.0, 0.0), -- Sandy Shores Sheriffs Dept | Jail Cell 2 Coords
	--PBSD0 = vector3(0.0, 0.0, 0.0), -- Paleto Bay Sheriffs Dept | UnJail Coords
	--PBSD1 = vector3(0.0, 0.0, 0.0), -- Paleto Bay Sheriffs Dept | Jail Cell 1 Coords
	--PBSD2 = vector3(0.0, 0.0, 0.0), -- Paleto Bay Sheriffs Dept | Jail Cell 2 Coords
	SSBP0 = vector3(1848.85, 2585.7, 44.67), -- Sandy Shores Bolingbroke Penitentiary | UnJail Coords
	SSBP1 = vector3(1641.6, 2571.0, 45.5) -- Sandy Shores Bolingbroke Penitentiary | Jail Coords
}

-- 3D Text Locations
Config.TL = {
	Show = false, -- Master Toggle of 3D Text.
	ShowLSMR = false, -- Show Los Santos Mission Row 3D Text.
	LSMR0 = {x = 463.8985, y = -998.0825, z = 23.95, d = 5.0}, -- Los Santos Mission Row | Center of Room
	LSMR1 = {x = 461.8, y = -993.3, z = 25.0  -1.400, text = 'Cell 1'}, -- Los Santos Mission Row | Jail Cell 1
	LSMR2 = {x = 461.8, y = -998.8, z = 25.0  -1.400, text = 'Cell 2'}, -- Los Santos Mission Row | Jail Cell 2
	LSMR3 = {x = 461.8, y = -1002.4, z = 25.0  -1.400, text = 'Cell 3'}, -- Los Santos Mission Row | Jail Cell 3
	LSMR4 = {x = 0.0, y = 0.0, z = 0.0, text = 'Cell 4'}, -- Los Santos Mission Row | Jail Cell 4
	ShowSSSD = false, -- Show Los Santos Mission Row 3D Text.
	SSSD0 = {x = 0.0, y = 0.0, z = 0.0, d = 5.0}, -- Sandy Shores Sheriffs Dept | Center of Room
	SSSD1 = {x = 0.0, y = 0.0, z = 0.0, text = 'Cell 1'}, -- Sandy Shores Sheriffs Dept | Jail Cell 1
	SSSD2 = {x = 0.0, y = 0.0, z = 0.0, text = 'Cell 2'}, -- Sandy Shores Sheriffs Dept | Jail Cell 2
	ShowPBSD = false, -- Show Los Santos Mission Row 3D Text.
	PBSD0 = {x = 0.0, y = 0.0, z = 0.0, d = 5.0}, -- Paleto Bay Sheriffs Dept | Center of Room
	PBSD1 = {x = 0.0, y = 0.0, z = 0.0, text = 'Cell 1'}, -- Paleto Bay Sheriffs Dept | Jail Cell 1
	PBSD2 = {x = 0.0, y = 0.0, z = 0.0, text = 'Cell 2'} -- Paleto Bay Sheriffs Dept | Jail Cell 2
}

-- Clothing Locations
Config.Zones = {
	vector3(463.89, -998.08, 23.95), -- Los Santos Mission
	vector3(1850.51, 2586.14, 44.67) -- Sandy Shores Bolingbroke Penitentiary
}

Config.Uniforms = {
	prison_wear = {
		male = {
			tshirt_1 = 15, tshirt_2 = 0,
			torso_1 = 146, torso_2 = 0,
			decals_1 = 0, decals_2 = 0,
			arms = 0, arms_2 = 0,
			pants_1 = 3, pants_2 = 7,
			shoes_1 = 12, shoes_2 = 12,
			mask_1 = 0, mask_2 = 0,
			bproof_1 = 0, bproof_2 = 0,
			chain_1 = 0, chain_2 = 0,
			helmet_1 = -1, helmet_2 = 0,
			glasses_1 = -1, glasses_2 = 0,
			watches_1 = -1, watches_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			bags_1 = 0, bags_2 = 0,
			ears_1 = -1, ears_2 = 0
		},
		female = {
			tshirt_1 = 3, tshirt_2 = 0,
			torso_1 = 38, torso_2 = 3,
			decals_1 = 0, decals_2 = 0,
			arms = 2, arms_2 = 0,
			pants_1 = 3, pants_2 = 15,
			shoes_1 = 66, shoes_2 = 5,
			mask_1 = 0, mask_2 = 0,
			bproof_1 = 0, bproof_2 = 0,
			chain_1 = 0, chain_2 = 0,
			helmet_1 = -1, helmet_2 = 0,
			glasses_1 = -1, glasses_2 = 0,
			watches_1 = -1, watches_2 = 0,
			bracelets_1 = -1, bracelets_2 = 0,
			bags_1 = 0, bags_2 = 0,
			ears_1 = -1, ears_2 = 0
		}
	}
}
