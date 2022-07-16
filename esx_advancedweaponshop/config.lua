Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.
Config.MarkerInfo = {Type = 1, r = 0, g = 128, b = 255, x = 1.5, y = 1.5, z = 0.5} -- Marker Settings.

Config.UseBlips = false -- true = Use Weapon Shop Blips.

-- Require Licenses | Use only if you are using esx_license
Config.License = {
	Master = false, -- Master Toggle | Set to true if using esx_license.
	Melee = false, -- true = Will Require Players to have a Melee License to Purchase Melee Weapons.
	Handgun = true, -- true = Will Require Players to have a Handgun License to Purchase Handguns.
	SMG = true, -- true = Will Require Players to have a SMG License to Purchase SMGs.
	Shotgun = true, -- true = Will Require Players to have a Shotgun License to Purchase Shotguns.
	Assault = true, -- true = Will Require Players to have a Assault License to Purchase Assault Rifles.
	LMG = true, -- true = Will Require Players to have a LMG License to Purchase LMGs.
	Sniper = true -- true = Will Require Players to have a Sniper License to Purchase Sniper Rifles.
}

-- true = This shop has Weapons
Config.HasWeapons = {
	LegalShop = {
		Misc = true,
		Throw = true,
		Melee = true,
		Handgun = true,
		SMG = true,
		Shotgun = true,
		Assault = true,
		LMG = true,
		Sniper = true
	},

	IllegalShop = {
		Misc = false,
		Throw = true,
		Melee = true,
		Handgun = true,
		SMG = true,
		Shotgun = true,
		Assault = true,
		LMG = false,
		Sniper = false
	}
}

Config.Zones = {
	LegalShop = {
		Legal = true, -- DO NOT CHANGE
		Misc = {
			{cat = 'Misc', name = 'GADGET_PARACHUTE', price = 800},
			{cat = 'Misc', name = 'WEAPON_FIREEXTINGUISHER', price = 100}
		},
		Throw = {
			{cat = 'Throw', name = 'WEAPON_BALL', price = 25},
			{cat = 'Throw', name = 'WEAPON_BZGAS', price = 250},
			{cat = 'Throw', name = 'WEAPON_FLARE', price = 100},
			{cat = 'Throw', name = 'WEAPON_SNOWBALL', price = 25},
			{cat = 'Throw', name = 'WEAPON_SMOKEGRENADE', price = 250}
		},
		Melee = {
			{cat = 'Melee', name = 'WEAPON_DAGGER', price = 15},
			{cat = 'Melee', name = 'WEAPON_BAT', price = 20},
			{cat = 'Melee', name = 'WEAPON_BATTLEAXE', price = 125},
			{cat = 'Melee', name = 'WEAPON_BOTTLE', price = 10},
			{cat = 'Melee', name = 'WEAPON_CROWBAR', price = 15},
			{cat = 'Melee', name = 'WEAPON_FLASHLIGHT', price = 25},
			{cat = 'Melee', name = 'WEAPON_GOLFCLUB', price = 40},
			{cat = 'Melee', name = 'WEAPON_HAMMER', price = 5},
			{cat = 'Melee', name = 'WEAPON_HATCHET', price = 20},
			{cat = 'Melee', name = 'WEAPON_KNIFE', price = 30},
			{cat = 'Melee', name = 'WEAPON_KNUCKLE', price = 25},
			{cat = 'Melee', name = 'WEAPON_MACHETE', price = 20},
			{cat = 'Melee', name = 'WEAPON_NIGHTSTICK', price = 15},
			{cat = 'Melee', name = 'WEAPON_WRENCH', price = 40},
			{cat = 'Melee', name = 'WEAPON_POOLCUE', price = 10},
			{cat = 'Melee', name = 'WEAPON_STONE_HATCHET', price = 15},
			{cat = 'Melee', name = 'WEAPON_SWITCHBLADE', price = 25}
		},
		Handgun = {
			{cat = 'Handgun', name = 'WEAPON_APPISTOL', price = 2700},
			{cat = 'Handgun', name = 'WEAPON_CERAMICPISTOL', price = 400},
			{cat = 'Handgun', name = 'WEAPON_COMBATPISTOL', price = 400},
			{cat = 'Handgun', name = 'WEAPON_DOUBLEACTION', price = 650},
			{cat = 'Handgun', name = 'WEAPON_FLAREGUN', price = 500},
			--{cat = 'Handgun', name = 'WEAPON_GADGETPISTOL', price = 500},
			{cat = 'Handgun', name = 'WEAPON_HEAVYPISTOL', price = 550},
			{cat = 'Handgun', name = 'WEAPON_REVOLVER', price = 1300},
			{cat = 'Handgun', name = 'WEAPON_NAVYREVOLVER', price = 650},
			{cat = 'Handgun', name = 'WEAPON_PISTOL', price = 350},
			{cat = 'Handgun', name = 'WEAPON_PISTOL50', price = 1500},
			{cat = 'Handgun', name = 'WEAPON_SNSPISTOL', price = 150},
			{cat = 'Handgun', name = 'WEAPON_STUNGUN', price = 500},
			{cat = 'Handgun', name = 'WEAPON_VINTAGEPISTOL', price = 300},
			{cat = 'Handgun', name = 'WEAPON_MARKSMANPISTOL', price = 225}
		},
		SMG = {
			{cat = 'SMG', name = 'WEAPON_ASSAULTSMG', price = 1400},
			{cat = 'SMG', name = 'WEAPON_COMBATPDW', price = 1500},
			{cat = 'SMG', name = 'WEAPON_MACHINEPISTOL', price = 1300},
			{cat = 'SMG', name = 'WEAPON_MICROSMG', price = 900},
			{cat = 'SMG', name = 'WEAPON_MINISMG', price = 800},
			{cat = 'SMG', name = 'WEAPON_SMG', price = 1600}
		},
		Shotgun = {
			{cat = 'Shotgun', name = 'WEAPON_ASSAULTSHOTGUN', price = 1100},
			{cat = 'Shotgun', name = 'WEAPON_AUTOSHOTGUN', price = 1100},
			{cat = 'Shotgun', name = 'WEAPON_BULLPUPSHOTGUN', price = 400},
			--{cat = 'Shotgun', name = 'WEAPON_COMBATSHOTGUN', price = 550},
			{cat = 'Shotgun', name = 'WEAPON_DBSHOTGUN', price = 450},
			{cat = 'Shotgun', name = 'WEAPON_HEAVYSHOTGUN', price = 1000},
			{cat = 'Shotgun', name = 'WEAPON_MUSKET', price = 225},
			{cat = 'Shotgun', name = 'WEAPON_PUMPSHOTGUN', price = 350},
			{cat = 'Shotgun', name = 'WEAPON_SAWNOFFSHOTGUN', price = 500}
		},
		Assault = {
			{cat = 'Assault', name = 'WEAPON_ADVANCEDRIFLE', price = 2000},
			{cat = 'Assault', name = 'WEAPON_ASSAULTRIFLE', price = 1200},
			{cat = 'Assault', name = 'WEAPON_BULLPUPRIFLE', price = 1200},
			{cat = 'Assault', name = 'WEAPON_CARBINERIFLE', price = 2400},
			{cat = 'Assault', name = 'WEAPON_COMPACTRIFLE', price = 750},
			--{cat = 'Assault', name = 'WEAPON_MILITARYRIFLE', price = 2050},
			{cat = 'Assault', name = 'WEAPON_SPECIALCARBINE', price = 5200}
		},
		LMG = {
			{cat = 'LMG', name = 'WEAPON_COMBATMG', price = 13950},
			{cat = 'LMG', name = 'WEAPON_GUSENBERG', price = 4280},
			{cat = 'LMG', name = 'WEAPON_MG', price = 8250}
		},
		Sniper = {
			{cat = 'Sniper', name = 'WEAPON_HEAVYSNIPER', price = 9900},
			{cat = 'Sniper', name = 'WEAPON_MARKSMANRIFLE', price = 3800},
			{cat = 'Sniper', name = 'WEAPON_SNIPERRIFLE', price = 2000}
		},
		Locations = {
			vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1),
			vector3(-1306.2, -394.0, 35.6),
			vector3(-3171.97, 1087.4, 19.84)
		}
	},

	IllegalShop = {
		Legal = false, -- DO NOT CHANGE
		Misc = {
			--{cat = 'Misc', name = 'NAME_HERE', price = 1}
		},
		Throw = {
			{cat = 'Throw', name = 'WEAPON_BZGAS', price = 500},
			{cat = 'Throw', name = 'WEAPON_MOLOTOV', price = 150},
			{cat = 'Throw', name = 'WEAPON_SMOKEGRENADE', price = 500}
		},
		Melee = {
			{cat = 'Melee', name = 'WEAPON_BAT', price = 25},
			{cat = 'Melee', name = 'WEAPON_BOTTLE', price = 15},
			{cat = 'Melee', name = 'WEAPON_CROWBAR', price = 20},
			{cat = 'Melee', name = 'WEAPON_KNIFE', price = 35},
			{cat = 'Melee', name = 'WEAPON_KNUCKLE', price = 30},
			{cat = 'Melee', name = 'WEAPON_MACHETE', price = 25},
			{cat = 'Melee', name = 'WEAPON_SWITCHBLADE', price = 30}
		},
		Handgun = {
			{cat = 'Handgun', name = 'WEAPON_PISTOL', price = 700},
			{cat = 'Handgun', name = 'WEAPON_SNSPISTOL', price = 300},
			{cat = 'Handgun', name = 'WEAPON_VINTAGEPISTOL', price = 600}
		},
		SMG = {
			{cat = 'SMG', name = 'WEAPON_MICROSMG', price = 1800},
			{cat = 'SMG', name = 'WEAPON_MINISMG', price = 1600},
			{cat = 'SMG', name = 'WEAPON_SMG', price = 3200}
		},
		Shotgun = {
			{cat = 'Shotgun', name = 'WEAPON_DBSHOTGUN', price = 900},
			{cat = 'Shotgun', name = 'WEAPON_PUMPSHOTGUN', price = 700},
			{cat = 'Shotgun', name = 'WEAPON_SAWNOFFSHOTGUN', price = 1000}
		},
		Assault = {
			{cat = 'Assault', name = 'WEAPON_ASSAULTRIFLE', price = 2400},
			{cat = 'Assault', name = 'WEAPON_CARBINERIFLE', price = 4800}
		},
		LMG = {
			--{cat = 'LMG', name = 'NAME_HERE', price = 1}
		},
		Sniper = {
			--{cat = 'Sniper', name = 'NAME_HERE', price = 1}
		},
		Locations = {
			vector3(119.47, -1977.88, 19.93)
		}
	}
}
