Config = {}
Config.Locale = 'en'

Config.DrawDistance	= 25
Config.CoolDown = 20 -- How long in Mins before a New Robbery can be Started

Config.Zones = {
	-- 24/7
	["24/7 Innocence Boulevard | Los Santos"] = {
		Coords = vector3(28.22, -1339.17, 28.5),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Senora Fwy 1 | Paleto Bay"] = {
		Coords = vector3(1734.89, 6420.87, 34.04),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Senora Fwy 2 | Sandy Shores"] = {
		Coords = vector3(2672.71, 3286.62, 54.24),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Alhambra Dr | Sandy Shores"] = {
		Coords = vector3(1959.32, 3749.0, 31.34),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Palomino Fwy | Sandy Shores"] = {
		Coords = vector3(2549.23, 384.87, 107.62),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Little Seoul | Los Santos"] = {
		Coords = vector3(-709.75, -904.16, 18.22),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Clinton Ave | Los Santos"] = {
		Coords = vector3(378.19, 333.41, 102.57),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Ineseno Road | Los Santos"] = {
		Coords = vector3(-3047.85, 585.66, 6.91),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Barbareno Rd | Los Santos"] = {
		Coords = vector3(-3250.09, 1004.4, 11.83),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["24/7 Route 68 | Paleto Bay"] = {
		Coords = vector3(546.36, 2662.75, 41.16),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	-- LTD GAS
	["LTD Gasoline Grove Street | Los Santos"] = {
		Coords = vector3(-43.47, -1748.38, 28.42),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["LTD Gasoline Mirror Park | Los Santos"] = {
		Coords = vector3(1159.54, -314.07, 68.21),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["LTD Gasoline Banham Canyon Dr | Los Santos"] = {
		Coords = vector3(-1829.27, 798.78, 137.19),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["LTD Gasoline Grapeseed Main St | Grapeseed"] = {
		Coords = vector3(1707.88, 4920.5, 41.06),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	-- ROBS LIQUOR
	["Robs Liquor Great Ocean Hwy | Los Santos"] = {
		Coords = vector3(-2959.54, 387.05, 13.04),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Robs Liquor El Rancho Blvd | Los Santos"] = {
		Coords = vector3(1126.81, -980.06, 44.42),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Robs Liquor San Andreas Ave | Los Santos"] = {
		Coords = vector3(-1220.87, -916.05, 10.33),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Robs Liquor Prosperity St | Los Santos"] = {
		Coords = vector3(-1478.93, -375.49, 38.16),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Scoops Liquor Barn Route 68 | Sandy Shores"] = {
		Coords = vector3(1169.33, 2717.78, 36.16),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Ace Liquor Algonquin Blvd | Sandy Shores"] = {
		Coords = vector3(1387.72, 3607.46, 33.98),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	-- BARS
	["Yellow Jack Panorama Dr | Sandy Shores"] = {
		Coords = vector3(1994.85, 3043.5, 46.21),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Tequi-La-La Eclipse Blvd | Los Santos"] = {
		Coords = vector3(-571.13, 291.53, 78.18),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Vanilla Unicorn Elgin Ave | Los Santos"] = {
		Coords = vector3(93.24, -1292.1, 28.27),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	["Bahama Mamas Marathon Ave | Los Santos"] = {
		Coords = vector3(-1381.79, -632.53, 29.82),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(2500,12500),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- Default 300 (5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 3
	},
	-- BANKS
	["Fleeca Bank Vespucci Boulevard | Los Santos"] = {
		Coords = vector3(147.5, -1045.03, 28.37),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(25000,75000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 6
	},
	["Fleeca Bank Great Ocean Hwy | Los Santos"] = {
		Coords = vector3(-2957.63, 481.98, 14.7),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(25000,75000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 6
	},
	["Fleeca Bank Route 68 | Paleto Bay"] = {
		Coords = vector3(1175.85, 2711.72, 37.09),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(25000,75000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 6
	},
	["Fleeca Bank Blvd Del Perro | Los Santos"] = {
		Coords = vector3(-1211.12, -335.57, 36.78),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(25000,75000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 6
	},
	["Fleeca Bank Hawick Ave 1 | Los Santos"] = {
		Coords = vector3(-353.41, -54.5, 48.04),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(25000,75000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 6
	},
	["Fleeca Bank Hawick Ave 2 | Los Santos"] = {
		Coords = vector3(311.69, -283.6, 53.16),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(25000,75000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 6
	},
	["Blaine County Savings Paleto Blvd | Paleto Bay"] = {
		Coords = vector3(-103.51, 6478.13, 30.63),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(25000,75000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- Default 450 (7.5Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 6
	},
	["Pacific Standard Vinewood Blvd | Los Santos"] = {
		Coords = vector3(254.02, 225.16, 100.88),
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0},
		AreaSize = 15,
		Reward = math.random(125000,1000000),
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- Default 600 (10Mins)
		TimeBeforeNewRob = 1800, -- Default 1800 (30Mins)
		PoliceRequired = 8
	},
}
