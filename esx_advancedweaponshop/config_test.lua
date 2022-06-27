Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.
Config.MarkerInfo = {Type = 1, r = 0, g = 128, b = 255, x = 1.5, y = 1.5, z = 0.5} -- Marker Settings.

Config.UseBlips = false -- true = Use Weapon Shop Blips.
Config.LicenseEnable = false -- Only turn this on if using esx_license.
Config.RequireMeleeLicense = false -- Will Require Players to have Melee License to Purchase Melee Weapons.

--{name = 'NAME_HERE', price = 0000, discount = 0000},
Config.Zones = {
	GunShop = {
		Legal = true, -- DO NOT CHANGE
		Items = {
			-- Misc
			{cat = 'Misc', name = 'GADGET_PARACHUTE', price = 800, discount = 600},
			{cat = 'Misc', name = 'WEAPON_FIREEXTINGUISHER', price = 100, discount = 75},
			-- Throw
			{cat = 'Throw', name = 'WEAPON_BALL', price = 25, discount = 18},
			{cat = 'Throw', name = 'WEAPON_BZGAS', price = 250, discount = 188},
			{cat = 'Throw', name = 'WEAPON_FLARE', price = 100, discount = 75},
			{cat = 'Throw', name = 'WEAPON_SNOWBALL', price = 25, discount = 18},
			{cat = 'Throw', name = 'WEAPON_SMOKEGRENADE', price = 250, discount = 188},
			-- Melee
			{cat = 'Melee', name = 'WEAPON_DAGGER', price = 15, discount = 11},
			{cat = 'Melee', name = 'WEAPON_BAT', price = 20, discount = 15},
			{cat = 'Melee', name = 'WEAPON_BATTLEAXE', price = 125, discount = 94},
			{cat = 'Melee', name = 'WEAPON_BOTTLE', price = 10, discount = 8},
			{cat = 'Melee', name = 'WEAPON_CROWBAR', price = 15, discount = 11},
			{cat = 'Melee', name = 'WEAPON_FLASHLIGHT', price = 25, discount = 18},
			{cat = 'Melee', name = 'WEAPON_GOLFCLUB', price = 40, discount = 30},
			{cat = 'Melee', name = 'WEAPON_HAMMER', price = 5, discount = 3},
			{cat = 'Melee', name = 'WEAPON_HATCHET', price = 20, discount = 15},
			{cat = 'Melee', name = 'WEAPON_KNIFE', price = 30, discount = 22},
			{cat = 'Melee', name = 'WEAPON_KNUCKLE', price = 25, discount = 18},
			{cat = 'Melee', name = 'WEAPON_MACHETE', price = 20, discount = 15},
			{cat = 'Melee', name = 'WEAPON_NIGHTSTICK', price = 15, discount = 11},
			{cat = 'Melee', name = 'WEAPON_WRENCH', price = 40, discount = 30},
			{cat = 'Melee', name = 'WEAPON_POOLCUE', price = 10, discount = 8},
			{cat = 'Melee', name = 'WEAPON_STONE_HATCHET', price = 15, discount = 11},
			{cat = 'Melee', name = 'WEAPON_SWITCHBLADE', price = 25, discount = 18},
			-- Handgun
			{cat = 'Handgun', name = 'WEAPON_APPISTOL', price = 2700, discount = 2025},
			{cat = 'Handgun', name = 'WEAPON_CERAMICPISTOL', price = 400, discount = 300},
			{cat = 'Handgun', name = 'WEAPON_COMBATPISTOL', price = 400, discount = 300},
			{cat = 'Handgun', name = 'WEAPON_DOUBLEACTION', price = 650, discount = 488},
			{cat = 'Handgun', name = 'WEAPON_FLAREGUN', price = 500, discount = 375},
			--{cat = 'Handgun', name = 'WEAPON_GADGETPISTOL', price = 500, discount = 375},
			{cat = 'Handgun', name = 'WEAPON_HEAVYPISTOL', price = 550, discount = 413},
			{cat = 'Handgun', name = 'WEAPON_REVOLVER', price = 1300, discount = 975},
			{cat = 'Handgun', name = 'WEAPON_NAVYREVOLVER', price = 650, discount = 488},
			{cat = 'Handgun', name = 'WEAPON_PISTOL', price = 350, discount = 263},
			{cat = 'Handgun', name = 'WEAPON_PISTOL50', price = 1500, discount = 1125},
			{cat = 'Handgun', name = 'WEAPON_SNSPISTOL', price = 150, discount = 113},
			{cat = 'Handgun', name = 'WEAPON_STUNGUN', price = 500, discount = 375},
			{cat = 'Handgun', name = 'WEAPON_VINTAGEPISTOL', price = 300, discount = 225},
			{cat = 'Handgun', name = 'WEAPON_MARKSMANPISTOL', price = 225, discount = 169},
			-- SMG
			{cat = 'SMG', name = 'WEAPON_ASSAULTSMG', price = 1400, discount = 1050},
			{cat = 'SMG', name = 'WEAPON_COMBATPDW', price = 1500, discount = 1125},
			{cat = 'SMG', name = 'WEAPON_MACHINEPISTOL', price = 1300, discount = 975},
			{cat = 'SMG', name = 'WEAPON_MICROSMG', price = 900, discount = 675},
			{cat = 'SMG', name = 'WEAPON_MINISMG', price = 800, discount = 600},
			{cat = 'SMG', name = 'WEAPON_SMG', price = 1600, discount = 1200},
			-- Shotgun
			{cat = 'Shotgun', name = 'WEAPON_ASSAULTSHOTGUN', price = 1100, discount = 825},
			{cat = 'Shotgun', name = 'WEAPON_AUTOSHOTGUN', price = 1100, discount = 825},
			{cat = 'Shotgun', name = 'WEAPON_BULLPUPSHOTGUN', price = 400, discount = 300},
			--{cat = 'Shotgun', name = 'WEAPON_COMBATSHOTGUN', price = 550, discount = 413},
			{cat = 'Shotgun', name = 'WEAPON_DBSHOTGUN', price = 450, discount = 338},
			{cat = 'Shotgun', name = 'WEAPON_HEAVYSHOTGUN', price = 1000, discount = 750},
			{cat = 'Shotgun', name = 'WEAPON_MUSKET', price = 225, discount = 169},
			{cat = 'Shotgun', name = 'WEAPON_PUMPSHOTGUN', price = 350, discount = 263},
			{cat = 'Shotgun', name = 'WEAPON_SAWNOFFSHOTGUN', price = 500, discount = 375},
			-- Assault
			{cat = 'Assault', name = 'WEAPON_ADVANCEDRIFLE', price = 2000, discount = 1500},
			{cat = 'Assault', name = 'WEAPON_ASSAULTRIFLE', price = 1200, discount = 900},
			{cat = 'Assault', name = 'WEAPON_BULLPUPRIFLE', price = 1200, discount = 900},
			{cat = 'Assault', name = 'WEAPON_CARBINERIFLE', price = 2400, discount = 1800},
			{cat = 'Assault', name = 'WEAPON_COMPACTRIFLE', price = 750, discount = 563},
			--{cat = 'Assault', name = 'WEAPON_MILITARYRIFLE', price = 2050, discount = 1538},
			{cat = 'Assault', name = 'WEAPON_SPECIALCARBINE', price = 5200, discount = 3900},
			-- LMG
			{cat = 'LMG', name = 'WEAPON_COMBATMG', price = 13950, discount = 10436},
			{cat = 'LMG', name = 'WEAPON_GUSENBERG', price = 4280, discount = 3210},
			{cat = 'LMG', name = 'WEAPON_MG', price = 8250, discount = 6188},
			-- Sniper
			{cat = 'Sniper', name = 'WEAPON_HEAVYSNIPER', price = 9900, discount = 7425},
			{cat = 'Sniper', name = 'WEAPON_MARKSMANRIFLE', price = 3800, discount = 2850},
			{cat = 'Sniper', name = 'WEAPON_SNIPERRIFLE', price = 2000, discount = 1500}
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

	BlackShop = {
		Legal = false, -- DO NOT CHANGE
		Items = {
			-- Misc
			-- Throw
			{cat = 'Throw', name = 'WEAPON_BZGAS', price = 500, discount = 375},
			{cat = 'Throw', name = 'WEAPON_MOLOTOV', price = 150, discount = 113},
			{cat = 'Throw', name = 'WEAPON_SMOKEGRENADE', price = 500, discount = 375},
			-- Melee
			{cat = 'Melee', name = 'WEAPON_BAT', price = 25, discount = 18},
			{cat = 'Melee', name = 'WEAPON_BOTTLE', price = 15, discount = 11},
			{cat = 'Melee', name = 'WEAPON_CROWBAR', price = 20, discount = 15},
			{cat = 'Melee', name = 'WEAPON_KNIFE', price = 35, discount = 27},
			{cat = 'Melee', name = 'WEAPON_KNUCKLE', price = 30, discount = 22},
			{cat = 'Melee', name = 'WEAPON_MACHETE', price = 25, discount = 18},
			{cat = 'Melee', name = 'WEAPON_SWITCHBLADE', price = 30, discount = 22},
			-- Handgun
			{cat = 'Handgun', name = 'WEAPON_PISTOL', price = 700, discount = 525},
			{cat = 'Handgun', name = 'WEAPON_SNSPISTOL', price = 300, discount = 225},
			{cat = 'Handgun', name = 'WEAPON_VINTAGEPISTOL', price = 600, discount = 450},
			-- SMG
			{cat = 'SMG', name = 'WEAPON_MICROSMG', price = 1800, discount = 1350},
			{cat = 'SMG', name = 'WEAPON_MINISMG', price = 1600, discount = 1200},
			{cat = 'SMG', name = 'WEAPON_SMG', price = 3200, discount = 2400},
			-- Shotgun
			{cat = 'Shotgun', name = 'WEAPON_DBSHOTGUN', price = 900, discount = 675},
			{cat = 'Shotgun', name = 'WEAPON_PUMPSHOTGUN', price = 700, discount = 525},
			{cat = 'Shotgun', name = 'WEAPON_SAWNOFFSHOTGUN', price = 1000, discount = 750},
			-- Assault
			{cat = 'Assault', name = 'WEAPON_ASSAULTRIFLE', price = 2400, discount = 1800},
			{cat = 'Assault', name = 'WEAPON_CARBINERIFLE', price = 4800, discount = 3600}
			-- LMG
			-- Sniper
		},
		Locations = {
			vector3(119.47, -1977.88, 19.93)
		}
	}
}
