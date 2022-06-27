Config = {}
Config.Locale = 'en'

Config.DrawDistance = 20
Config.MenuMarker = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Menu Marker | Green w/Standard Size
Config.DelMarker = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Delete Marker | Red w/Large Size
Config.BlipVehicleSpawner = {Sprite = 479, Color = 2, Display = 2, Scale = 1.0}

Config.UseBlips = false -- true = Use Vehicle Spawner Blips

Config.Zones = {
	VehicleSpawner1 = { -- Los Santos Docks
		Pos = vector3(1246.3, -3256.8, 5.0), -- Enter Marker
		Loc = vector3(1250.2, -3243.2, 5.9), -- Spawn Location
		Del = vector3(1250.2, -3243.2, 4.9), -- Delete Location
		Heading = 179.3
	},
	VehicleSpawner2 = { -- Sandy Shores U-Tool
		Pos = vector3(2691.2, 3461.7, 55.2), -- Enter Marker
		Loc = vector3(2683.3, 3456.7, 55.7), -- Spawn Location
		Del = vector3(2683.3, 3456.7, 54.7), -- Delete Location
		Heading = 248.53
	},
	VehicleSpawner3 = { -- Paleto Bay Reds
		Pos = vector3(-185.1, 6271.8, 30.5), -- Enter Marker
		Loc = vector3(-196.7, 6274.1, 31.5), -- Spawn Location
		Del = vector3(-196.7, 6274.1, 30.5), -- Delete Location
		Heading = 337.68
	}
}

Config.Vehicles = {
	{model = 'boattrailer', label = 'Small Boat Trailer | Hitch'},
	{model = 'trailersmall', label = 'Small Trailer | Hitch'},
	{model = 'tanker', label = 'Black Tanker Trailer | Semi'},
	{model = 'tanker2', label = 'Chrome Tanker Trailer | Semi'},
	{model = 'docktrailer', label = 'Dock Trailer | Semi'},
	{model = 'trailerlogs', label = 'Logs Trailer | Semi'},
	{model = 'trailers', label = 'Curtain/Box Trailer | Semi'},
	{model = 'trailers2', label = 'Refrigeration Trailer | Semi'},
	{model = 'trailers3', label = 'Big G Goods Trailer | Semi'},
	{model = 'trailers4', label = 'White Container Trailer | Semi'}
}

Config.ListedVehicles = {
	'boattrailer',
	'trailersmall',
	'tanker',
	'tanker2',
	'docktrailer',
	'trailerlogs',
	'trailers',
	'trailers2',
	'trailers3',
	'trailers4'
}
