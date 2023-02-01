Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.Main = {
	DrawDistanceP = 20, -- Point/Pound Marker Draw Distance.
	DrawDistanceD = 50, -- Delete Marker Draw Distance.
	Commands = false, -- true = Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
	VIPScript = false, -- true = Running a VIP Script. You must setup Script to Work with this Script.
	ParkVehicles = false, -- true = Automatically Park all Vehicles in Garage on Server/Script Restart. | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
	KickCheaters = true, -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
	CustomKickMsg = 'You have been Kicked from the Server for Possible Garage Cheating!!!', -- true = Sets Custom Kick Message for those that try to Cheat. Note: 'Config.KickCheaters' must be true.
	GiveSocMoney = false, -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
	DamageMult = false, -- true = Costs more to Store a Broken/Damaged Vehicle.
	MultAmount = 3, -- Higher Number = Higher Repair Price.
	RenameVehs = false, -- true = Allows Players to Rename their Vehicles.
	RenameMin = 4, -- Minimum Characters.
	RenameMax = 61, -- Max Characters + 1 (If you want Max Characters to be 45 then set it 46).
	TruckShop = false, -- true = Using esx_advancedvehicleshop Truck Dealership.
	LegacyFuel = false, -- true = Using LegacyFuel & you want Fuel to Save.
	SepGarages = false, -- true = Only allow Vehicles to be Taken out of the Garage they put it in. WIP Feature
	SepJobGarages = false -- true = Only allow Job Vehicles to be Taken out of the Garage they put it in. WIP Feature
}

Config.Blips = {
	Garages = {Sprite = 290, Color = 38, Display = 2, Scale = 1.0}, -- Public Garage Blip Settings.
	PGarages = {Sprite = 290, Color = 53, Display = 2, Scale = 1.0}, -- Private Garage Blip Settings.
	Pounds = {Sprite = 67, Color = 64, Display = 2, Scale = 1.0}, -- Pound Blip Settings.
	JGarages = {Sprite = 290, Color = 49, Display = 2, Scale = 1.0}, -- Job Garage Blip Settings.
	JPounds = {Sprite = 67, Color = 49, Display = 2, Scale = 1.0}, -- Job Pound Blip Settings.
}

Config.LargeVehicles = {'swatmrap', 'mcc'} -- Large Vehicles that will spawn in Spawner3

Config.Ambulance = {
	UseG = false, -- true = Allows use of Ambulance Garages.
	UseP = false, -- true = Allows use of Ambulance Pounds.
	Blips = false, -- true = Use Ambulance Blips.
	PoundP = 80, -- Regular Price to get Vehicles from the Ambulance Pound.
	PoundD = 60, -- Discount Price to get Vehicles from the Ambulance Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Training = {
			Name = 'TrainingEMS1', -- Garage Name
			Marker = vector3(-1831.6, 2989.43, 31.81), -- Enter Location
			Spawner = vector3(-1849.46, 2969.48, 31.81), -- Spawn Location
			Spawner2 = vector3(-1928.91, 3018.5, 31.81), -- Aircraft Spawn Location
			Deleter = vector3(-1849.46, 2969.48, 31.81), -- Delete Location
			Deleter2 = vector3(-1928.91, 3018.5, 31.81), -- Aircraft Delete Location
			Heading = 330.25, -- Spawn Heading
			Heading2 = 328.35 -- Aircraft Spawn Heading
		},
		Los_Santos_Pillbox = {
			Name = 'LosSantosEMS1', -- Garage Name
			Marker = vector3(338.28, -586.38, 27.8), -- Enter Location
			Spawner = vector3(338.56, -574.51, 28.8), -- Spawn Location
			Spawner2 = vector3(351.8, -587.9, 74.17), -- Aircraft Spawn Location
			Deleter = vector3(339.0, -575.11, 27.8), -- Delete Location
			Deleter2 = vector3(351.8, -587.9, 73.17), -- Aircraft Delete Location
			Heading = 337.92, -- Spawn Heading
			Heading2 = 173.0 -- Aircraft Spawn Heading
		},
		Los_Santos_FD_Davis = {
			Name = 'LosSantosEMS2', -- Garage Name
			Marker = vector3(185.56, -1655.19, 28.93), -- Enter Location
			Spawner = vector3(186.78, -1663.63, 28.8), -- Spawn Location
			Spawner2 = vector3(205.92, -1651.13, 41.65), -- Aircraft Spawn Location
			Deleter = vector3(186.78, -1663.63, 28.8), -- Delete Location
			Deleter2 = vector3(205.92, -1651.13, 40.65), -- Aircraft Delete Location
			Heading = 233.91, -- Spawn Heading
			Heading2 = 51.5 -- Aircraft Spawn Heading
		},
		Los_Santos_FD_7 = {
			Name = 'LosSantosEMS3', -- Garage Name
			Marker = vector3(1193.26, -1487.63, 33.84), -- Enter Location
			Spawner = vector3(1215.17, -1516.26, 33.7), -- Spawn Location
			Spawner2 = vector3(1179.94, -1474.69, 41.03), -- Aircraft Spawn Location
			Deleter = vector3(1215.17, -1516.26, 33.7), -- Delete Location
			Deleter2 = vector3(1179.94, -1474.69, 40.03), -- Aircraft Delete Location
			Heading = 89.01, -- Spawn Heading
			Heading2 = 92.7 -- Aircraft Spawn Heading
		},
		Sandy_Shores = {
			Name = 'SandyShoresEMS1', -- Garage Name
			Marker = vector3(1837.33, 3694.86, 33.27), -- Enter Location
			Spawner = vector3(1841.21, 3702.33, 33.81), -- Spawn Location
			Spawner2 = vector3(1832.03, 3690.99, 39.74), -- Aircraft Spawn Location
			Deleter = vector3(1841.21, 3702.33, 32.81), -- Delete Location
			Deleter2 = vector3(1832.03, 3690.99, 38.74), -- Aircraft Delete Location
			Heading = 303.57, -- Spawn Heading
			Heading2 = 121.26 -- Aircraft Spawn Heading
		},
		Sandy_Shores_FD = {
			Name = 'SandyShoresEMS2', -- Garage Name
			Marker = vector3(1699.59, 3603.98, 35.5), -- Enter Location
			Spawner = vector3(1708.4, 3604.6, 36.5), -- Spawn Location
			Spawner2 = vector3(1706.44, 3620.35, 38.36), -- Aircraft Spawn Location
			Deleter = vector3(1708.4, 3604.6, 35.5), -- Delete Location
			Deleter2 = vector3(1705.85, 3618.93, 37.36), -- Aircraft Delete Location
			Heading = 119.59, -- Spawn Heading
			Heading2 = 342.64 -- Aircraft Spawn Heading
		},
		Paleto_Bay = {
			Name = 'PaletoBayEMS1', -- Garage Name
			Marker = vector3(-250.51, 6338.79, 31.49), -- Enter Location
			Spawner = vector3(-261.25, 6337.81, 32.42), -- Spawn Location
			Spawner2 = vector3(-253.92, 6319.15, 39.63), -- Aircraft Spawn Location
			Deleter = vector3(-261.25, 6337.81, 31.42), -- Delete Location
			Deleter2 = vector3(-253.92, 6319.15, 38.63), -- Aircraft Delete Location
			Heading = 133.62, -- Spawn Heading
			Heading2 = 320.37 -- Aircraft Spawn Heading
		},
		Paleto_Bay_FD = {
			Name = 'PaletoBayEMS2', -- Garage Name
			Marker = vector3(-369.79, 6113.83, 30.69), -- Enter Location
			Spawner = vector3(-355.16, 6099.89, 30.44), -- Spawn Location
			Spawner2 = vector3(-309.29, 6117.83, 33.16), -- Aircraft Spawn Location
			Deleter = vector3(-355.16, 6099.89, 30.44), -- Delete Location
			Deleter2 = vector3(-309.29, 6117.83, 32.16), -- Aircraft Delete Location
			Heading = 318.85, -- Spawn Heading
			Heading2 = 44.2 -- Aircraft Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(-194.22, -1164.39, 22.67), -- Enter Location
			Spawner = vector3(-238.13, -1171.73, 22.04), -- Spawn Location
			Spawner2 = vector3(-238.13, -1171.73, 22.04), -- Aircraft Spawn Location
			Heading = 173.65, -- Spawn Heading
			Heading2 = 357.78 -- Aircraft Spawn Heading
		}
	}
}

Config.Police = {
	UseG = false, -- true = Allows use of Police Garages.
	UseP = false, -- true = Allows use of Police Pounds.
	Blips = false, -- true = Use Police Blips.
	PoundP = 80, -- Regular Price to get Vehicles from the Police Pound.
	PoundD = 60, -- Discount Price to get Vehicles from the Police Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Training = {
			Name = 'TrainingLEO1', -- Garage Name
			Marker = vector3(-1831.6, 2989.43, 31.81), -- Enter Location
			Spawner = vector3(-1849.46, 2969.48, 31.81), -- Spawn Location
			Spawner2 = vector3(-1928.91, 3018.5, 31.81), -- Aircraft Spawn Location
			Spawner3 = vector3(-1849.46, 2969.48, 31.81), -- Large Spawn Location
			Deleter = vector3(-1849.46, 2969.48, 31.81), -- Delete Location
			Deleter2 = vector3(-1928.91, 3018.5, 31.81), -- Aircraft Delete Location
			Deleter3 = vector3(0.0, 0.0, 0.0), -- Large Delete Location
			Heading = 330.25, -- Spawn Heading
			Heading2 = 328.35, -- Aircraft Spawn Heading
			Heading3 = 330.25 -- Large Spawn Heading
		},
		Los_Santos = {
			Name = 'LosSantosLEO1', -- Garage Name
			Marker = vector3(462.96, -986.71, 24.7), -- Enter Location
			Spawner = vector3(450.46, -977.94, 25.7), -- Spawn Location
			Spawner2 = vector3(449.21, -981.35, 43.69), -- Aircraft Spawn Location
			Spawner3 = vector3(441.78, -1015.18, 28.67), -- Large Spawn Location
			Deleter = vector3(435.27, -975.33, 24.7), -- Delete Location
			Deleter2 = vector3(449.21, -981.35, 42.69), -- Aircraft Delete Location
			Deleter3 = vector3(456.31, -1024.74, 27.45), -- Large Delete Location
			Heading = 88.62, -- Spawn Heading
			Heading2 = 184.53, -- Aircraft Spawn Heading
			Heading3 = 89.96 -- Large Spawn Heading
		},
		Sandy_Shores = {
			Name = 'SandyShoresLEO1', -- Garage Name
			Marker = vector3(1862.85, 3694.45, 33.27), -- Enter Location
			Spawner = vector3(1867.13, 3696.38, 33.65), -- Spawn Location
			Spawner2 = vector3(1822.71, 3673.4, 40.28), -- Aircraft Spawn Location
			Spawner3 = vector3(1867.13, 3696.38, 33.65), -- Large Spawn Location
			Deleter = vector3(1867.13, 3696.38, 32.65), -- Delete Location
			Deleter2 = vector3(1822.71, 3673.4, 39.28), -- Aircraft Delete Location
			Deleter3 = vector3(0.0, 0.0, 0.0), -- Large Delete Location
			Heading = 17.0, -- Spawn Heading
			Heading2 = 211.17, -- Aircraft Spawn Heading
			Heading3 = 17.0 -- Large Spawn Heading
		},
		Sandy_Shores_Prison = {
			Name = 'SandyShoresLEO2', -- Garage Name
			Marker = vector3(1790.92, 2559.58, 44.56), -- Enter Location
			Spawner = vector3(1801.99, 2566.47, 45.79), -- Spawn Location
			Spawner2 = vector3(1778.01, 2595.24, 59.88), -- Aircraft Spawn Location
			Spawner3 = vector3(1801.99, 2566.47, 45.79), -- Large Spawn Location
			Deleter = vector3(1784.66, 2535.49, 44.56), -- Delete Location
			Deleter2 = vector3(1778.01, 2595.24, 58.88), -- Aircraft Delete Location
			Deleter3 = vector3(0.0, 0.0, 0.0), -- Large Delete Location
			Heading = 175.73, -- Spawn Heading
			Heading2 = 183.11, -- Aircraft Spawn Heading
			Heading3 = 175.73 -- Large Spawn Heading
		},
		Paleto_Bay = {
			Name = 'PaletoBayLEO1', -- Garage Name
			Marker = vector3(-460.46, 6015.01, 30.34), -- Enter Location
			Spawner = vector3(-482.61, 6025.01, 31.34), -- Spawn Location
			Spawner2 = vector3(-475.35, 5988.67, 31.34), -- Aircraft Spawn Location
			Spawner3 = vector3(-482.61, 6025.01, 31.34), -- Large Spawn Location
			Deleter = vector3(-482.61, 6025.01, 30.34), -- Delete Location
			Deleter2 = vector3(-475.35, 5988.67, 30.34), -- Aircraft Delete Location
			Deleter3 = vector3(0.0, 0.0, 0.0), -- Large Delete Location
			Heading = 221.84, -- Spawn Heading
			Heading2 = 133.65, -- Aircraft Spawn Heading
			Heading3 = 221.84 -- Large Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(-194.22, -1164.39, 22.67), -- Enter Location
			Spawner = vector3(-238.13, -1171.73, 22.04), -- Spawn Location
			Spawner2 = vector3(-238.13, -1171.73, 22.04), -- Aircraft Spawn Location
			Heading = 173.65, -- Spawn Heading
			Heading2 = 357.78 -- Aircraft Spawn Heading
		}
	}
}

Config.Mechanic = {
	UseG = false, -- true = Allows use of Mechanic Garages.
	UseP = false, -- true = Allows use of Mechanic Pounds.
	Blips = false, -- true = Use Mechanic Blips.
	PoundP = 150, -- Regular Price to get Vehicles from the Mechanic Pound.
	PoundD = 113, -- Discount Price to get Vehicles from the Mechanic Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
			Name = 'LosSantosMechanic1', -- Garage Name
			Marker = vector3(-184.14, -1164.47, 22.67), -- Enter Location
			Spawner = vector3(-209.17, -1168.94, 22.04), -- Spawn Location
			Deleter = vector3(-209.17, -1168.94, 22.04), -- Delete Location
			Heading = 185.85 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(-194.22, -1164.39, 22.67), -- Enter Location
			Spawner = vector3(-238.13, -1171.73, 22.04), -- Spawn Location
			Heading = 173.65 -- Spawn Heading
		}
	}
}

Config.Taxi = {
	UseG = false, -- true = Allows use of Taxi Garages.
	UseP = false, -- true = Allows use of Taxi Pounds.
	Blips = false, -- true = Use Mechanic Blips.
	PoundP = 150, -- Regular Price to get Vehicles from the Mechanic Pound.
	PoundD = 113, -- Discount Price to get Vehicles from the Mechanic Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
			Name = 'LosSantosTaxi1', -- Garage Name
			Marker = vector3(898.99, -168.47, 73.17), -- Enter Location
			Spawner = vector3(902.79, -183.52, 72.91), -- Spawn Location
			Deleter = vector3(894.92, -186.39, 72.74), -- Delete Location
			Heading = 327.45 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(-194.22, -1164.39, 22.67), -- Enter Location
			Spawner = vector3(-238.13, -1171.73, 22.04), -- Spawn Location
			Heading = 173.65 -- Spawn Heading
		}
	}
}

Config.Aircrafts = {
	UseG = false, -- true = Allows use of Aircraft Garages.
	Blips = false, -- true = Use Aircraft Blips.
	PoundP = 2500, -- Regular Price to get Vehicles from the Aircraft Pound.
	PoundD = 1875, -- Discount Price to get Vehicles from the Aircraft Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos_Airport = {
			Name = 'LosSantosAirport1', -- Garage Name
			Marker = vector3(-1617.14, -3145.52, 12.99), -- Enter Location
			Spawner = vector3(-1657.99, -3134.38, 12.99), -- Spawn Location
			Deleter = vector3(-1642.12, -3144.25, 12.99), -- Delete Location
			Heading = 330.11 -- Spawn Heading
		},
		Sandy_Shores_Airport = {
			Name = 'SandyShoresAirport1', -- Garage Name
			Marker = vector3(1723.84, 3288.29, 40.16), -- Enter Location
			Spawner = vector3(1710.85, 3259.06, 40.69), -- Spawn Location
			Deleter = vector3(1714.45, 3246.75, 40.07), -- Delete Location
			Heading = 104.66 -- Spawn Heading
		},
		Grapeseed_Airport = {
			Name = 'GrapeseedAirport1', -- Garage Name
			Marker = vector3(2152.83, 4797.03, 40.19), -- Enter Location
			Spawner = vector3(2122.72, 4804.85, 40.78), -- Spawn Location
			Deleter = vector3(2082.36, 4806.06, 40.07), -- Delete Location
			Heading = 115.04 -- Spawn Heading
		},
		Cayo_Perico_Airport = {
			Name = 'CayoPericoAirport1', -- Garage Name
			Marker = vector3(4460.86, -4472.47, 3.27), -- Enter Location
			Spawner = vector3(4485.77, -4462.86, 4.23), -- Spawn Location
			Deleter = vector3(4485.77, -4462.86, 3.23), -- Delete Location
			Heading = 198.75 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos_Airport = {
			Marker = vector3(-1237.96, -3386.61, 12.94), -- Enter Location
			Spawner = vector3(-1272.27, -3382.46, 12.94), -- Spawn Location
			Heading = 330.25 -- Spawn Heading
		}
	}
}

Config.Boats = {
	UseG = false, -- true = Allows use of Boat Garages.
	Blips = false, -- true = Use Boat Blips.
	PoundP = 500, -- Regular Price to get Vehicles from the Boat Pound.
	PoundD = 375, -- Discount Price to get Vehicles from the Boat Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos_Dock = {
			Name = 'LosSantosBoat1', -- Garage Name
			Marker = vector3(-801.45, -1346.98, 4.22), -- Enter Location
			Spawner = vector3(-855.04, -1410.41, -0.47), -- Spawn Location
			Deleter = vector3(-855.04, -1410.41, -0.47), -- Delete Location
			Heading = 201.31 -- Spawn Heading
		},
		Sandy_Shores_Dock = {
			Name = 'SandyShoresBoat1', -- Garage Name
			Marker = vector3(1299.22, 4216.64, 32.92), -- Enter Location
			Spawner = vector3(1326.8, 4192.74, 29.85), -- Spawn Location
			Deleter = vector3(1326.8, 4192.74, 29.85), -- Delete Location
			Heading = 288.61 -- Spawn Heading
		},
		Paleto_Bay_Dock = {
			Name = 'PaletoBayBoat1', -- Garage Name
			Marker = vector3(-283.74, 6629.51, 6.3), -- Enter Location
			Spawner = vector3(-311.33, 6641.21, -0.47), -- Spawn Location
			Deleter = vector3(-311.33, 6641.21, -0.47), -- Delete Location
			Heading = 138.01 -- Spawn Heading
		},
		Cayo_Perico_Dock = {
			Name = 'CayoPericoBoat1', -- Garage Name
			Marker = vector3(4877.95, -5169.9, 1.45), -- Enter Location
			Spawner = vector3(4790.57, -5209.31, 1.02), -- Spawn Location
			Deleter = vector3(4790.57, -5209.31, 0.02), -- Delete Location
			Heading = 0.64 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos_Dock = {
			Marker = vector3(-804.42, -1348.77, 4.22), -- Enter Location
			Spawner = vector3(-855.04, -1410.41, -0.47), -- Spawn Location
			Heading = 201.31 -- Spawn Heading
		}
	}
}

Config.Cars = {
	UseG = false, -- true = Allows use of Car Garages.
	Blips = false, -- true = Use Car Blips.
	PoundP = 300, -- Regular Price to get Vehicles from the Car Pound.
	PoundD = 225, -- Discount Price to get Vehicles from the Car Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
			Name = 'LosSantosCar1', -- Garage Name
			Marker = vector3(213.65, -809.02, 30.01), -- Enter Location
			Spawner = vector3(229.70, -800.12, 29.57), -- Spawn Location
			Deleter = vector3(223.80, -760.42, 29.65), -- Delete Location
			Heading = 157.84 -- Spawn Heading
		},
		Los_Santos_Airport = {
			Name = 'LosSantosCar2', -- Garage Name
			Marker = vector3(-1016.65, -2696.04, 12.98), -- Enter Location
			Spawner = vector3(-980.4, -2701.06, 12.86), -- Spawn Location
			Deleter = vector3(-951.55, -2705.48, 12.83), -- Delete Location
			Heading = 56.0 -- Spawn Heading
		},
		Los_Santos_Arena = {
			Name = 'LosSantosCar9', -- Garage Name
			Marker = vector3(-256.77, -2024.68, 29.15), -- Enter Location
			Spawner = vector3(-286.52, -2033.54, 29.11), -- Spawn Location
			Deleter = vector3(-286.52, -2033.54, 29.11), -- Delete Location
			Heading = 94.38 -- Spawn Heading
		},
		Sandy_Shores = {
			Name = 'SandyShoresCar1', -- Garage Name
			Marker = vector3(1769.67, 3322.21, 40.44), -- Enter Location
			Spawner = vector3(1776.48, 3315.82, 40.37), -- Spawn Location
			Deleter = vector3(1751.45, 3327.48, 40.07), -- Delete Location
			Heading = 299.03 -- Spawn Heading
		},
		Paleto_Bay = {
			Name = 'PaletoBayCar1', -- Garage Name
			Marker = vector3(-202.81, 6237.84, 30.75), -- Enter Location
			Spawner = vector3(-235.42, 6263.53, 30.49), -- Spawn Location
			Deleter = vector3(-222.21, 6268.64, 30.68), -- Delete Location
			Heading = 137.34 -- Spawn Heading
		},
		Cayo_Perico = {
			Name = 'CayoPericoCar1', -- Garage Name
			Marker = vector3(4503.25, -4520.67, 3.41), -- Enter Location
			Spawner = vector3(4511.52, -4517.73, 4.11), -- Spawn Location
			Deleter = vector3(4503.27, -4536.21, 3.13), -- Delete Location
			Heading = 22.2 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(-191.76, -1162.79, 22.67), -- Enter Location
			Spawner = vector3(-141.95, -1173.41, 22.77), -- Spawn Location
			Heading = 124.33 -- Spawn Heading
		}
	}
}

Config.Pvt = {
	UseG = false, -- Set to true if using esx_property & want Private Car Garages for Properties.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Delete Location Marker Settings.
	},
	Garages = {
		-- Start of Maze Bank Building
		MazeBankBuilding_OldSpiceWarm = {
			Private = 'OldSpiceWarm', -- esx_property Name
			Name = 'OldSpiceWarm', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_OldSpiceClassical = {
			Private = 'OldSpiceClassical', -- esx_property Name
			Name = 'OldSpiceClassical', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_OldSpiceVintage = {
			Private = 'OldSpiceVintage', -- esx_property Name
			Name = 'OldSpiceVintage', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_ExecutiveRich = {
			Private = 'ExecutiveRich', -- esx_property Name
			Name = 'ExecutiveRich', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_ExecutiveCool = {
			Private = 'ExecutiveCool', -- esx_property Name
			Name = 'ExecutiveCool', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_ExecutiveContrast = {
			Private = 'ExecutiveContrast', -- esx_property Name
			Name = 'ExecutiveContrast', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_PowerBrokerIce = {
			Private = 'PowerBrokerIce', -- esx_property Name
			Name = 'PowerBrokerIce', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_PowerBrokerConservative = {
			Private = 'PowerBrokerConservative', -- esx_property Name
			Name = 'PowerBrokerConservative', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_PowerBrokerPolished = {
			Private = 'PowerBrokerPolished', -- esx_property Name
			Name = 'PowerBrokerPolished', -- Garage Name
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		-- End of Maze Bank Building

		-- Start of Lom Bank
		LomBank_LBOldSpiceWarm = {
			Private = 'LBOldSpiceWarm', -- esx_property Name
			Name = 'LBOldSpiceWarm', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBOldSpiceClassical = {
			Private = 'LBOldSpiceClassical', -- esx_property Name
			Name = 'LBOldSpiceClassical', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBOldSpiceVintage = {
			Private = 'LBOldSpiceVintage', -- esx_property Name
			Name = 'LBOldSpiceVintage', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBExecutiveRich = {
			Private = 'LBExecutiveRich', -- esx_property Name
			Name = 'LBExecutiveRich', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBExecutiveCool = {
			Private = 'LBExecutiveCool', -- esx_property Name
			Name = 'LBExecutiveCool', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBExecutiveContrast = {
			Private = 'LBExecutiveContrast', -- esx_property Name
			Name = 'LBExecutiveContrast', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBPowerBrokerIce = {
			Private = 'LBPowerBrokerIce', -- esx_property Name
			Name = 'LBPowerBrokerIce', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBPowerBrokerConservative = {
			Private = 'LBPowerBrokerConservative', -- esx_property Name
			Name = 'LBPowerBrokerConservative', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBPowerBrokerPolished = {
			Private = 'LBPowerBrokerPolished', -- esx_property Name
			Name = 'LBPowerBrokerPolished', -- Garage Name
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		-- End of Lom Bank

		-- Start of Maze Bank West
		MazeBankWest_MBWOldSpiceWarm = {
			Private = 'MBWOldSpiceWarm', -- esx_property Name
			Name = 'MBWOldSpiceWarm', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWOldSpiceClassical = {
			Private = 'MBWOldSpiceClassical', -- esx_property Name
			Name = 'MBWOldSpiceClassical', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWOldSpiceVintage = {
			Private = 'MBWOldSpiceVintage', -- esx_property Name
			Name = 'MBWOldSpiceVintage', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWExecutiveRich = {
			Private = 'MBWExecutiveRich', -- esx_property Name
			Name = 'MBWExecutiveRich', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWExecutiveCool = {
			Private = 'MBWExecutiveCool', -- esx_property Name
			Name = 'MBWExecutiveCool', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWExecutiveContrast = {
			Private = 'MBWExecutiveContrast', -- esx_property Name
			Name = 'MBWExecutiveContrast', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWPowerBrokerIce = {
			Private = 'MBWPowerBrokerIce', -- esx_property Name
			Name = 'MBWPowerBrokerIce', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWPowerBrokerConvservative = {
			Private = 'MBWPowerBrokerConvservative', -- esx_property Name
			Name = 'MBWPowerBrokerConvservative', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWPowerBrokerPolished = {
			Private = 'MBWPowerBrokerPolished', -- esx_property Name
			Name = 'MBWPowerBrokerPolished', -- Garage Name
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		-- End of Maze Bank West

		-- Start of Intergrity Way
		IntegrityWay_IntegrityWay28 = {
			Private = 'IntegrityWay28', -- esx_property Name
			Name = 'IntegrityWay28', -- Garage Name
			Marker = vector3(-14.1, -614.93, 34.86), -- Enter Location
			Spawner = vector3(-7.35, -635.1, 34.72), -- Spawn Location
			Deleter = vector3(-37.57, -620.39, 34.07), -- Delete Location
			Heading = 66.632 -- Spawn Heading
		},
		IntegrityWay_IntegrityWay30 = {
			Private = 'IntegrityWay30', -- esx_property Name
			Name = 'IntegrityWay30', -- Garage Name
			Marker = vector3(-14.1, -614.93, 34.86), -- Enter Location
			Spawner = vector3(-7.35, -635.1, 34.72), -- Spawn Location
			Deleter = vector3(-37.57, -620.39, 34.07), -- Delete Location
			Heading = 66.632 -- Spawn Heading
		},
		-- End of Intergrity Way

		-- Start of Dell Perro Heights
		DellPerroHeights_DellPerroHeightst4 = {
			Private = 'DellPerroHeightst4', -- esx_property Name
			Name = 'DellPerroHeightst4', -- Garage Name
			Marker = vector3(-1477.15, -517.17, 33.74), -- Enter Location
			Spawner = vector3(-1483.16, -505.1, 31.81), -- Spawn Location
			Deleter = vector3(-1452.61, -508.78, 30.58), -- Delete Location
			Heading = 299.89 -- Spawn Heading
		},
		DellPerroHeights_DellPerroHeightst7 = {
			Private = 'DellPerroHeightst7', -- esx_property Name
			Name = 'DellPerroHeightst7', -- Garage Name
			Marker = vector3(-1477.15, -517.17, 33.74), -- Enter Location
			Spawner = vector3(-1483.16, -505.1, 31.81), -- Spawn Location
			Deleter = vector3(-1452.61, -508.78, 30.58), -- Delete Location
			Heading = 299.89 -- Spawn Heading
		},
		-- End of Dell Perro Heights

		-- Start of Milton Drive
		MiltonDrive_Modern1Apartment = {
			Private = 'Modern1Apartment', -- esx_property Name
			Name = 'Modern1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Modern2Apartment = {
			Private = 'Modern2Apartment', -- esx_property Name
			Name = 'Modern2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Modern3Apartment = {
			Private = 'Modern3Apartment', -- esx_property Name
			Name = 'Modern3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Mody1Apartment = {
			Private = 'Mody1Apartment', -- esx_property Name
			Name = 'Mody1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Mody2Apartment = {
			Private = 'Mody2Apartment', -- esx_property Name
			Name = 'Mody2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Mody3Apartment = {
			Private = 'Mody3Apartment', -- esx_property Name
			Name = 'Mody3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Vibrant1Apartment = {
			Private = 'Vibrant1Apartment', -- esx_property Name
			Name = 'Vibrant1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Vibrant2Apartment = {
			Private = 'Vibrant2Apartment', -- esx_property Name
			Name = 'Vibrant2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Vibrant3Apartment = {
			Private = 'Vibrant3Apartment', -- esx_property Name
			Name = 'Vibrant3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Sharp1Apartment = {
			Private = 'Sharp1Apartment', -- esx_property Name
			Name = 'Sharp1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Sharp2Apartment = {
			Private = 'Sharp2Apartment', -- esx_property Name
			Name = 'Sharp2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Sharp3Apartment = {
			Private = 'Sharp3Apartment', -- esx_property Name
			Name = 'Sharp3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Monochrome1Apartment = {
			Private = 'Monochrome1Apartment', -- esx_property Name
			Name = 'Monochrome1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Monochrome2Apartment = {
			Private = 'Monochrome2Apartment', -- esx_property Name
			Name = 'Monochrome2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Monochrome3Apartment = {
			Private = 'Monochrome3Apartment', -- esx_property Name
			Name = 'Monochrome3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Seductive1Apartment = {
			Private = 'Seductive1Apartment', -- esx_property Name
			Name = 'Seductive1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Seductive2Apartment = {
			Private = 'Seductive2Apartment', -- esx_property Name
			Name = 'Seductive2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Seductive3Apartment = {
			Private = 'Seductive3Apartment', -- esx_property Name
			Name = 'Seductive3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Regal1Apartment = {
			Private = 'Regal1Apartment', -- esx_property Name
			Name = 'Regal1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Regal2Apartment = {
			Private = 'Regal2Apartment', -- esx_property Name
			Name = 'Regal2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Regal3Apartment = {
			Private = 'Regal3Apartment', -- esx_property Name
			Name = 'Regal3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Aqua1Apartment = {
			Private = 'Aqua1Apartment', -- esx_property Name
			Name = 'Aqua1Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Aqua2Apartment = {
			Private = 'Aqua2Apartment', -- esx_property Name
			Name = 'Aqua2Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Aqua3Apartment = {
			Private = 'Aqua3Apartment', -- esx_property Name
			Name = 'Aqua3Apartment', -- Garage Name
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		-- End of Milton Drive

		-- Start of Single
		RichardMajesticApt2 = {
			Private = 'RichardMajesticApt2', -- esx_property Name
			Name = 'RichardMajesticApt2', -- Garage Name
			Marker = vector3(-887.5, -349.58, 33.53), -- Enter Location
			Spawner = vector3(-886.03, -343.78, 33.53), -- Spawn Location
			Deleter = vector3(-894.32, -349.33, 33.53), -- Delete Location
			Heading = 206.79 -- Spawn Heading
		},
		WildOatsDrive = {
			Private = 'WildOatsDrive', -- esx_property Name
			Name = 'WildOatsDrive', -- Garage Name
			Marker = vector3(-178.65, 503.45, 135.85), -- Enter Location
			Spawner = vector3(-189.98, 505.8, 133.48), -- Spawn Location
			Deleter = vector3(-189.28, 500.56, 132.93), -- Delete Location
			Heading = 282.62 -- Spawn Heading
		},
		WhispymoundDrive = {
			Private = 'WhispymoundDrive', -- esx_property Name
			Name = 'WhispymoundDrive', -- Garage Name
			Marker = vector3(123.65, 565.75, 183.04), -- Enter Location
			Spawner = vector3(130.11, 571.47, 182.42), -- Spawn Location
			Deleter = vector3(131.97, 566.77, 181.95), -- Delete Location
			Heading = 270.71 -- Spawn Heading
		},
		NorthConkerAvenue2044 = {
			Private = 'NorthConkerAvenue2044', -- esx_property Name
			Name = 'NorthConkerAvenue2044', -- Garage Name
			Marker = vector3(348.18, 443.01, 146.7), -- Enter Location
			Spawner = vector3(358.39, 437.06, 144.27), -- Spawn Location
			Deleter = vector3(351.38, 438.86, 145.66), -- Delete Location
			Heading = 285.911 -- Spawn Heading
		},
		NorthConkerAvenue2045 = {
			Private = 'NorthConkerAvenue2045', -- esx_property Name
			Name = 'NorthConkerAvenue2045', -- Garage Name
			Marker = vector3(370.69, 430.76, 144.11), -- Enter Location
			Spawner = vector3(392.88, 434.54, 142.17), -- Spawn Location
			Deleter = vector3(389.72, 429.95, 141.81), -- Delete Location
			Heading = 264.94 -- Spawn Heading
		},
		HillcrestAvenue2862 = {
			Private = 'HillcrestAvenue2862', -- esx_property Name
			Name = 'HillcrestAvenue2862', -- Garage Name
			Marker = vector3(-688.71, 597.57, 142.64), -- Enter Location
			Spawner = vector3(-683.72, 609.88, 143.28), -- Spawn Location
			Deleter = vector3(-685.26, 601.08, 142.36), -- Delete Location
			Heading = 338.06 -- Spawn Heading
		},
		HillcrestAvenue2868 = {
			Private = 'HillcrestAvenue2868', -- esx_property Name
			Name = 'HillcrestAvenue2868', -- Garage Name
			Marker = vector3(-752.75, 624.90, 141.2), -- Enter Location
			Spawner = vector3(-749.32, 628.61, 141.48), -- Spawn Location
			Deleter = vector3(-754.28, 631.58, 141.2), -- Delete Location
			Heading = 197.14 -- Spawn Heading
		},
		HillcrestAvenue2874 = {
			Private = 'HillcrestAvenue2874', -- esx_property Name
			Name = 'HillcrestAvenue2874', -- Garage Name
			Marker = vector3(-859.01, 695.95, 147.93), -- Enter Location
			Spawner = vector3(-863.68, 698.72, 147.05), -- Spawn Location
			Deleter = vector3(-855.66, 698.77, 147.81), -- Delete Location
			Heading = 341.77 -- Spawn Heading
		},
		MadWayneThunder = {
			Private = 'MadWayneThunder', -- esx_property Name
			Name = 'MadWayneThunder', -- Garage Name
			Marker = vector3(-1290.95, 454.52, 96.66), -- Enter Location
			Spawner = vector3(-1297.62, 459.28, 96.48), -- Spawn Location
			Deleter = vector3(-1298.09, 468.95, 96.0), -- Delete Location
			Heading = 285.652 -- Spawn Heading
		},
		TinselTowersApt12 = {
			Private = 'TinselTowersApt12', -- esx_property Name
			Name = 'TinselTowersApt12', -- Garage Name
			Marker = vector3(-616.74, 56.38, 42.73), -- Enter Location
			Spawner = vector3(-620.59, 60.10, 42.73), -- Spawn Location
			Deleter = vector3(-621.13, 52.69, 42.73), -- Delete Location
			Heading = 109.316 -- Spawn Heading
		},
		-- End of Single

		-- Start of VENT Custom
		MedEndApartment1 = {
			Private = 'MedEndApartment1', -- esx_property Name
			Name = 'MedEndApartment1', -- Garage Name
			Marker = vector3(240.23, 3102.84, 41.49), -- Enter Location
			Spawner = vector3(233.58, 3094.29, 41.49), -- Spawn Location
			Deleter = vector3(237.52, 3112.63, 41.39), -- Delete Location
			Heading = 93.91 -- Spawn Heading
		},
		MedEndApartment2 = {
			Private = 'MedEndApartment2', -- esx_property Name
			Name = 'MedEndApartment2', -- Garage Name
			Marker = vector3(246.08, 3174.63, 41.72), -- Enter Location
			Spawner = vector3(234.15, 3164.37, 41.54), -- Spawn Location
			Deleter = vector3(240.72, 3165.53, 41.65), -- Delete Location
			Heading = 102.03 -- Spawn Heading
		},
		MedEndApartment3 = {
			Private = 'MedEndApartment3', -- esx_property Name
			Name = 'MedEndApartment3', -- Garage Name
			Marker = vector3(984.92, 2668.95, 39.06), -- Enter Location
			Spawner = vector3(993.96, 2672.68, 39.06), -- Spawn Location
			Deleter = vector3(994.04, 2662.1, 39.13), -- Delete Location
			Heading = 0.61 -- Spawn Heading
		},
		MedEndApartment4 = {
			Private = 'MedEndApartment4', -- esx_property Name
			Name = 'MedEndApartment4', -- Garage Name
			Marker = vector3(196.49, 3027.48, 42.89), -- Enter Location
			Spawner = vector3(203.1, 3039.47, 42.08), -- Spawn Location
			Deleter = vector3(192.24, 3037.95, 42.89), -- Delete Location
			Heading = 271.3 -- Spawn Heading
		},
		MedEndApartment5 = {
			Private = 'MedEndApartment5', -- esx_property Name
			Name = 'MedEndApartment5', -- Garage Name
			Marker = vector3(1724.49, 4638.13, 42.31), -- Enter Location
			Spawner = vector3(1723.98, 4630.19, 42.23), -- Spawn Location
			Deleter = vector3(1733.66, 4635.08, 42.24), -- Delete Location
			Heading = 117.88 -- Spawn Heading
		},
		MedEndApartment6 = {
			Private = 'MedEndApartment6', -- esx_property Name
			Name = 'MedEndApartment6', -- Garage Name
			Marker = vector3(1670.76, 4740.99, 41.08), -- Enter Location
			Spawner = vector3(1673.47, 4756.51, 40.91), -- Spawn Location
			Deleter = vector3(1668.46, 4750.83, 40.88), -- Delete Location
			Heading = 12.82
		},
		MedEndApartment7 = {
			Private = 'MedEndApartment7', -- esx_property Name
			Name = 'MedEndApartment7', -- Garage Name
			Marker = vector3(15.24, 6573.38, 31.72), -- Enter Location
			Spawner = vector3(16.77, 6581.68, 31.42), -- Spawn Location
			Deleter = vector3(10.45, 6588.04, 31.47), -- Delete Location
			Heading = 222.6 -- Spawn Heading
		},
		MedEndApartment8 = {
			Private = 'MedEndApartment8', -- esx_property Name
			Name = 'MedEndApartment8', -- Garage Name
			Marker = vector3(-374.73, 6187.06, 30.54), -- Enter Location
			Spawner = vector3(-377.97, 6183.73, 30.49), -- Spawn Location
			Deleter = vector3(-383.31, 6188.85, 30.49), -- Delete Location
			Heading = 223.71 -- Spawn Heading
		},
		MedEndApartment9 = {
			Private = 'MedEndApartment9', -- esx_property Name
			Name = 'MedEndApartment9', -- Garage Name
			Marker = vector3(-24.6, 6605.99, 30.45), -- Enter Location
			Spawner = vector3(-16.0, 6607.74, 30.18), -- Spawn Location
			Deleter = vector3(-9.36, 6598.86, 30.47), -- Delete Location
			Heading = 35.31 -- Spawn Heading
		},
		MedEndApartment10 = {
			Private = 'MedEndApartment10', -- esx_property Name
			Name = 'MedEndApartment10', -- Garage Name
			Marker = vector3(-365.18, 6323.95, 28.9), -- Enter Location
			Spawner = vector3(-359.49, 6327.41, 28.83), -- Spawn Location
			Deleter = vector3(-353.47, 6334.57, 28.83), -- Delete Location
			Heading = 218.58 -- Spawn Heading
		},
		-- End of VENT Custom

		-- Start of Player Custom
		--[[ExampleName = {
			Private = 'ExampleName', -- esx_property Name
			Name = 'ExampleName', -- Garage Name
			Marker = vector3(0.0, 0.0, 0.0), -- Enter Location
			Spawner = vector3(0.0, 0.0, 0.0), -- Spawn Location
			Deleter = vector3(0.0, 0.0, 0.0), -- Delete Location
			Heading = 0.0 -- Spawn Heading
		},]]--
		-- End of Player Custom
	}
}
