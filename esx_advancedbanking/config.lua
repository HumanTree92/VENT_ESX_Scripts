Config = {}
Config.Locale = 'en' -- Set Locale file to use.
Config.DrawDistance = 25 -- Marker Draw Distance.

Config.UseAdvancedHoldup = false -- true = Using esx_advancedholdup.

Config.ShowCharName = true -- true = Use Character Names. | false = Use Steam Name.
Config.ShowFirstLast = true -- true = Use Characters First & Last Name. | false = Use Characters First Name.

Config.UseATMBlips = false -- true = Use ATM Blips. | NOTE: Its best to leave this at false. There is a LOT of ATMs.
Config.ATMBlip = {Sprite = 277, Color = 0, Display = 2, Scale = 1.0} -- ATM Blip Settings.
Config.ATMMarker = {Type = 29, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.5} -- ATM Marker Settings.

Config.UseBankBlips = false -- true = Use Bank Blips.
Config.BankBlip = {Sprite = 108, Color = 0, Display = 2, Scale = 1.0} -- Bank Blip Settings.
Config.BankMarker = {Type = 29, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.5} -- Bank Marker Settings.

Config.Animation = {
	Active = true, -- true = Use Animation.
	Time = 2500 -- Time in Miliseconds.
}

Config.Locations = {
	Locs = {
		Banks = {
			vector3(149.15, -1040.54, 29.37), -- Vespucci Blvd | Fleeca Bank
			vector3(-1213.29, -331.05, 37.79), -- Boulevard Del Perro | Fleeca Bank
			vector3(-2962.51, 482.24, 15.7), -- Great Ocean Hwy | Fleeca Bank
			vector3(-112.5, 6469.71, 31.63), -- Paleto Blvd | Blaine County Savings Bank
			vector3(-111.45, 6468.64, 31.63), -- Paleto Blvd | Blaine County Savings Bank
			vector3(313.53, -278.93, 54.17), -- Hawick Ave | Fleeca Bank
			vector3(-351.65, -49.66, 49.04), -- Hawick Ave | Fleeca Bank
			vector3(242.34, 225.12, 106.29), -- Alta St | Pacific Standard Public Deposit Bank
			vector3(247.51, 223.29, 106.29), -- Alta St | Pacific Standard Public Deposit Bank
			vector3(252.61, 221.34, 106.29), -- Alta St | Pacific Standard Public Deposit Bank
			vector3(1175.74, 2706.88, 38.09) -- Route 68 | Fleeca Bank
		},
		ATMs = {
			-- Paleto Bay
			vector3(-386.8, 6046.14, 31.5), -- Paleto Blvd
			vector3(-97.23, 6455.42, 31.47), -- Paleto Blvd
			vector3(-95.45, 6457.15, 31.46), -- Paleto Blvd
			vector3(155.8, 6642.92, 31.6), -- Paleto Blvd
			vector3(174.16, 6637.93, 31.57), -- Paleto Blvd
			vector3(-133.03, 6366.51, 31.48), -- Paleto Blvd
			vector3(1701.28, 6426.49, 32.76), -- Senora Fwy
			vector3(1735.25, 6410.53, 35.04), -- Senora Fwy
			vector3(2683.11, 3286.59, 55.24), -- Senora Fwy
			vector3(-283.01, 6226.05, 31.49), -- Duluoz Ave
			-- Grapeseed
			vector3(1702.98, 4933.58, 42.06), -- Grapeseed Main St
			vector3(1686.84, 4815.89, 42.01), -- Grapeseed Main St
			-- Sandy Shores
			vector3(1968.09, 3743.56, 32.34), -- Alhambra Dr
			vector3(1171.99, 2702.56, 38.18), -- Route 68
			vector3(540.34, 2671.09, 42.16), -- Route 68
			vector3(-1091.5, 2708.65, 18.95), -- Route 68
			vector3(2564.57, 2584.73, 38.08), -- Senora Way
			vector3(1822.66, 3683.04, 34.28), -- Zancudo Ave
			-- Los Santos
			vector3(2558.76, 351.06, 108.62), -- Palomino Fwy
			vector3(2558.46, 389.46, 108.62), -- Palomino Fwy
			vector3(-821.51, -1082.19, 11.13), -- Palomino Ave
			vector3(-660.76, -853.82, 24.48), -- Palomino Ave
			vector3(1077.81, -776.55, 58.24), -- West Mirror Drive
			vector3(1153.65, -326.8, 69.21), -- West Mirror Drive
			vector3(1138.23, -468.92, 66.73), -- Mirrow Park Blvd
			vector3(1166.9, -456.05, 66.81), -- Mirrow Park Blvd
			vector3(236.72, 219.23, 106.29), -- Alta St
			vector3(237.41, 217.73, 106.29), -- Alta St
			vector3(238.04, 216.44, 106.29), -- Alta St
			vector3(265.56, 213.47, 106.28), -- Alta St
			vector3(265.15, 211.96, 106.28), -- Alta St
			vector3(264.57, 210.59, 106.28), -- Alta St
			vector3(-165.16, 232.69, 94.92), -- Eclipse Blvd
			vector3(-165.13, 234.86, 94.92), -- Eclipse Blvd
			vector3(-1827.23, 784.88, 138.3), -- Banham Canyon Dr
			vector3(-1409.68, -100.54, 52.38), -- Cougar Ave
			vector3(-1410.33, -98.75, 52.38), -- Cougar Ave
			vector3(-1204.91, -326.31, 37.83), -- Boulevard Del Perro
			vector3(-1205.7, -324.7, 37.83), -- Boulevard Del Perro
			vector3(-2072.38, -317.19, 13.32), -- Del Perro Fwy
			vector3(-1305.35, -706.46, 25.32), -- Del Perro Fwy
			vector3(-2975.06, 380.18, 15.0), -- Great Ocean Hwy
			vector3(-2956.77, 487.67, 15.46), -- Great Ocean Hwy
			vector3(-2958.98, 487.84, 15.46), -- Great Ocean Hwy
			vector3(-3144.33, 1127.59, 20.86), -- Great Ocean Hwy
			vector3(-717.61, -915.74, 19.22), -- Ginger St
			vector3(-526.59, -1222.96, 18.45), -- Calais Ave
			vector3(147.7, -1035.72, 29.34), -- Vespucci Blvd
			vector3(145.99, -1035.21, 29.34), -- Vespucci Blvd
			vector3(-303.36, -829.73, 32.42), -- Vespucci Blvd
			vector3(-301.7, -830.05, 32.42), -- Vespucci Blvd
			vector3(-537.75, -854.51, 29.3), -- Vespucci Blvd
			vector3(-712.91, -818.95, 23.73), -- Vespucci Blvd
			vector3(-710.12, -818.98, 23.73), -- Vespucci Blvd
			vector3(-203.83, -861.38, 30.27), -- Vespucci Blvd
			vector3(24.47, -946.04, 29.36), -- Vespucci Blvd
			vector3(-846.55, -340.77, 38.68), -- Heritage Way
			vector3(-56.95, -1752.09, 29.42), -- Grove St
			vector3(-272.99, -2024.58, 30.15), -- Davis Ave
			vector3(-261.99, -2012.41, 30.15), -- Davis Ave
			vector3(-1570.55, -546.99, 34.96), -- Bay City Ave
			vector3(-1315.82, -834.65, 16.96), -- Bay City Ave
			vector3(-1314.73, -836.05, 16.96), -- Bay City Ave
			vector3(33.15, -1348.2, 29.5), -- Innocence Blvd
			vector3(129.42, -1291.53, 29.27), -- Strawberry Ave
			vector3(129.84, -1292.3, 29.27), -- Strawberry Ave
			vector3(296.44, -894.19, 29.23), -- Strawberry Ave
			vector3(295.74, -896.05, 29.22), -- Strawberry Ave
			vector3(289.05, -1256.75, 29.44), -- Olympic Fwy
			vector3(5.2, -919.8, 29.56), -- Power St
			vector3(380.74, 323.4, 103.57), -- Clinton Ave
			vector3(285.48, 143.38, 104.17), -- Vinewood Blvd
			vector3(158.63, 234.08, 106.63), -- Vinewood Blvd
			vector3(-3043.93, 594.59, 7.74), -- Ineseno Road
			vector3(-3040.75, 593.06, 7.91), -- Ineseno Road
			vector3(-3241.13, 997.5, 12.55), -- Barbareno Rd
			vector3(-3240.67, 1008.63, 12.83), -- Barbareno Rd
			vector3(-258.77, -723.38, 33.46), -- Peaceful St
			vector3(-256.23, -716.0, 33.53), -- Peaceful St
			vector3(-254.25, -692.38, 33.61), -- Peaceful St
			vector3(111.29, -775.28, 31.44), -- San Andreas Ave
			vector3(114.45, -776.45, 31.42), -- San Andreas Ave
			vector3(112.61, -819.31, 31.34), -- San Andreas Ave
			vector3(119.15, -883.65, 31.12), -- Elgin Ave
			vector3(-1416.04, -212.02, 46.5), -- Morningwood Blvd
			vector3(-1430.14, -211.15, 46.5), -- Morningwood Blvd
			vector3(288.81, -1282.32, 29.64), -- Capital Blvd
			vector3(89.58, 2.42, 68.31), -- Spanish Ave
		}
	}
}
