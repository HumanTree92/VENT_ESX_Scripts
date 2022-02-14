Config = {}
Config.Locale = 'en'

Config.DrawDistance = 10
Config.MarkerInfo = {Type = 1, r = 0, g = 128, b = 255, x = 1.5, y = 1.5, z = 0.5}

Config.UseBlips = false -- true = Use Weapon Shop Blips
Config.LicenseEnable = false -- Only turn this on if using esx_license
Config.RequireMeleeLicense = false -- Will Require Players to have Melee License to Purchase Melee Weapons.

Config.Zones = {
	GunShop = {
		Legal = true,
		Misc = {}, Throw = {}, Melee = {}, Handgun = {}, SMG = {}, Shotgun = {}, Assault = {}, LMG = {}, Sniper = {},
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
		Legal = false,
		Misc = {}, Throw = {}, Melee = {}, Handgun = {}, SMG = {}, Shotgun = {}, Assault = {}, LMG = {}, Sniper = {},
		Locations = {
			vector3(119.47, -1977.88, 19.93)
		}
	}
}
