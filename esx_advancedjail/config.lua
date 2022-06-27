Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.
Config.MarkerInfo = {Type = 27, r = 100, g = 100, b = 204, x = 1.5, y = 1.5, z = 2.0} -- Marker Settings.
Config.JailTimeSyncInterval = 1 -- Jail Time Sync Interval in Seconds.

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
Config.DrawMarkers = {
	Show = false, -- Master Toggle
	MR0 = true, -- MissionRow0
	MR1 = true, -- MissionRow1
	MR2 = true, -- MissionRow2
	MR3 = true, -- MissionRow3
	BP0 = true, -- BolingBroke0
	BP1 = true -- BolingBroke1
}

-- Jail Locations
Config.JailLocations = {
	MissionRow0 = vector3(438.05, -982.90, 29.69), -- UnJail Location
	MissionRow1 = vector3(460.18, -994.38, 23.91), -- Jail Cell 1 | Default
	MissionRow2 = vector3(459.22, -997.97, 23.91), -- Jail Cell 2 | Default
	MissionRow3 = vector3(459.40, -1001.52, 23.91), -- Jail Cell 3 | Default
	BolingBroke0 = vector3(1848.85, 2585.7, 44.67), -- UnJail Location
	BolingBroke1 = vector3(1641.6, 2571.0, 45.5) -- Prison Yard
}

-- Clothing Locations
Config.Zones = {
	vector3(463.89, -998.08, 23.95), -- Mission Row
	vector3(1850.51, 2586.14, 44.67) -- Prison
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
