Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance	= 25 -- Marker Draw Distance.
Config.CoolDown = 20 -- How long in Minutes before a New Robbery can be Started.
Config.StartTimer = false -- If true it will start the CoolDown Timer when the script is Started/Restarted.
Config.ReqWeapon = false -- If true it will Require a Weapon to be out for Markers to show up & Start Robbery.

Config.AuthorizedJobs = {'unemployed', 'ballas', 'cartel', 'families', 'lostmc', 'vagos'} -- Jobs that are allowed to do Robberies.

Config.Zones = {
	-- 24/7
	["24/7 Innocence Boulevard | Los Santos"] = {
		Coords = vector3(28.22, -1339.17, 28.5), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Senora Fwy 1 | Paleto Bay"] = {
		Coords = vector3(1734.89, 6420.87, 34.04), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Senora Fwy 2 | Sandy Shores"] = {
		Coords = vector3(2672.71, 3286.62, 54.24), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Alhambra Dr | Sandy Shores"] = {
		Coords = vector3(1959.32, 3749.0, 31.34), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Palomino Fwy | Sandy Shores"] = {
		Coords = vector3(2549.23, 384.87, 107.62), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Little Seoul | Los Santos"] = {
		Coords = vector3(-709.75, -904.16, 18.22), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Clinton Ave | Los Santos"] = {
		Coords = vector3(378.19, 333.41, 102.57), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Ineseno Road | Los Santos"] = {
		Coords = vector3(-3047.85, 585.66, 6.91), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Barbareno Rd | Los Santos"] = {
		Coords = vector3(-3250.09, 1004.4, 11.83), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["24/7 Route 68 | Paleto Bay"] = {
		Coords = vector3(546.36, 2662.75, 41.16), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	-- LTD GAS
	["LTD Gasoline Grove Street | Los Santos"] = {
		Coords = vector3(-43.47, -1748.38, 28.42), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["LTD Gasoline Mirror Park | Los Santos"] = {
		Coords = vector3(1159.54, -314.07, 68.21), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["LTD Gasoline Banham Canyon Dr | Los Santos"] = {
		Coords = vector3(-1829.27, 798.78, 137.19), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["LTD Gasoline Grapeseed Main St | Grapeseed"] = {
		Coords = vector3(1707.88, 4920.5, 41.06), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	-- ROBS LIQUOR
	["Robs Liquor Great Ocean Hwy | Los Santos"] = {
		Coords = vector3(-2959.54, 387.05, 13.04), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Robs Liquor El Rancho Blvd | Los Santos"] = {
		Coords = vector3(1126.81, -980.06, 44.42), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Robs Liquor San Andreas Ave | Los Santos"] = {
		Coords = vector3(-1220.87, -916.05, 10.33), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Robs Liquor Prosperity St | Los Santos"] = {
		Coords = vector3(-1478.93, -375.49, 38.16), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Scoops Liquor Barn Route 68 | Sandy Shores"] = {
		Coords = vector3(1169.33, 2717.78, 36.16), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Ace Liquor Algonquin Blvd | Sandy Shores"] = {
		Coords = vector3(1387.72, 3607.46, 33.98), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	-- BARS
	["Yellow Jack Panorama Dr | Sandy Shores"] = {
		Coords = vector3(1994.85, 3043.5, 46.21), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Tequi-La-La Eclipse Blvd | Los Santos"] = {
		Coords = vector3(-571.13, 291.53, 78.18), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Vanilla Unicorn Elgin Ave | Los Santos"] = {
		Coords = vector3(93.24, -1292.1, 28.27), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Bahama Mamas Marathon Ave | Los Santos"] = {
		Coords = vector3(-1381.79, -632.53, 29.82), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(2500,12500), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 300, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 3 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	-- BANKS
	["Fleeca Bank Vespucci Boulevard | Los Santos"] = {
		Coords = vector3(147.5, -1045.03, 28.37), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(25000,75000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 6 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Fleeca Bank Great Ocean Hwy | Los Santos"] = {
		Coords = vector3(-2957.63, 481.98, 14.7), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(25000,75000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 6 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Fleeca Bank Route 68 | Paleto Bay"] = {
		Coords = vector3(1175.85, 2711.72, 37.09), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(25000,75000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 6 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Fleeca Bank Blvd Del Perro | Los Santos"] = {
		Coords = vector3(-1211.12, -335.57, 36.78), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(25000,75000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 6 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Fleeca Bank Hawick Ave 1 | Los Santos"] = {
		Coords = vector3(-353.41, -54.5, 48.04), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(25000,75000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 6 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Fleeca Bank Hawick Ave 2 | Los Santos"] = {
		Coords = vector3(311.69, -283.6, 53.16), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(25000,75000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 6 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Blaine County Savings Paleto Blvd | Paleto Bay"] = {
		Coords = vector3(-103.51, 6478.13, 30.63), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(25000,75000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 450, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 6 -- Amount of Policing Offices that must be on Duty to Rob.
	},
	["Pacific Standard Vinewood Blvd | Los Santos"] = {
		Coords = vector3(254.02, 225.16, 100.88), -- Marker Location
		Marker = {Type = 1, r = 220, g = 110, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings
		AreaSize = 15, -- Marker Area Size | Bigger Number increases Size | If Players Distance is Greater then they Fail Robbery.
		Reward = math.random(125000,1000000), -- Reward Amount (Will give Amount between 2 Numbers).
		Robbed = 0, -- DO NOT CHANGE
		TimeToRob = 600, -- How long it takes to Rob in Seconds.
		TimeBeforeNewRob = 1800, -- How long Players must wait to Rob again in Seconds.
		PoliceRequired = 8 -- Amount of Policing Offices that must be on Duty to Rob.
	},
}
