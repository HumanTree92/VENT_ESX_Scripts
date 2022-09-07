Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.Main = {
	DrawDistance = 50, -- Marker Draw Distance.
	PoliceReq = 2, -- The Minium Amount of Police to be Online.
	BlipTime = 10, -- Blip Update Time in Seconds.
	CoolDown = 20, -- How long in Minutes before a New Vehicle Theft can be Started.
	AuthorizedJobs = {'unemployed', 'ballas', 'cartel', 'families', 'lostmc', 'vagos'}, -- Jobs that are allowed to do Vehicle Thefts.
	Plate = true, -- true = Give Vehicle Custom Plate Text.
	SetPlate = ' STOLEN ', -- Custom Plate Text. | Max of 8 Characters including Spaces.
	LegacyFuel = true, -- true = Using LegacyFuel.
	SetFuel = math.random(50,100) -- If using LegacyFuel give Vehicle Random Fuel.
}

Config.Zones = {
	Markers = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Marker Settings.
	Locations = {
		Los_Santos_Docks = {
			Marker = vector3(1208.6, -3114.88, 4.56), -- Marker Location
			Spawner = vector3(1196.82, -3104.65, 6.03), -- Spawn Location
			Heading = 0.06 -- Spawn Heading
		}
	}
}

Config.Delivery = {
	Markers = {Type = 1, r = 204, g = 204, b = 0, x = 3.0, y = 3.0, z = 1.0}, -- Delivery Marker Settings.
	Locations = {
		Sandy_Shores_Airfield = {
			Marker = vector3(1703.47, 3283.23, 40.12), -- Marker Location
			Reward = math.random(15000,20000), -- Reward to Give once Delivered.
			Vehicles = {'dominator3', 'dukes', 'nightshade', 'phoenix', 'picador', 'ratloader'} -- Random Vehicle to Give Player to Deliver.
		},
		Grapeseed_ONeil = {
			Marker = vector3(2413.76, 4990.87, 45.23), -- Marker Location
			Reward = math.random(20000,25000), -- Reward to Give once Delivered.
			Vehicles = {'beinjection', 'rebel2', 'sandking', 'trophytruck', 'trophytruck2', 'dune2'} -- Random Vehicle to Give Player to Deliver.
		}
	}
}
