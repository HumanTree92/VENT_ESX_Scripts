Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.Main = {
	DrawDistanceP = 20, -- Point/Pound Marker Draw Distance.
	DrawDistanceD = 50, -- Delete Marker Draw Distance.
	Commands = false, -- true = Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
	ParkVehicles = false, -- true = Automatically Park all Vehicles in Garage on Server/Script Restart. | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
	KickCheaters = true, -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
	CustomKickMsg = false, -- true = Sets Custom Kick Message for those that try to Cheat. Note: 'Config.KickPossibleCheaters' must be true.
	GiveSocMoney = false, -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
	DamageMult = false, -- true = Costs more to Store a Broken/Damaged Vehicle.
	MultAmount = 3, -- Higher Number = Higher Repair Price.
	RenameVehs = false, -- true = Allows Players to Rename their Vehicles.
	RenameMin = 4, -- Minimum Characters.
	RenameMax = 61, -- Max Characters + 1 (If you want Max Characters to be 45 then set it 46).
	TruckShop = false, -- true = Using esx_advancedvehicleshop Truck Dealership.
	LegacyFuel = false -- ture = Using LegacyFuel & you want Fuel to Save.
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
	PoundP = 80, -- How much it Costs to get Vehicles from the Ambulance Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
			Marker = vector3(302.95, -1453.5, 28.97), -- Enter Location
			Spawner = vector3(300.33, -1431.91, 29.8), -- Spawn Location
			Spawner2 = vector3(313.36, -1465.17, 46.51), -- Aircraft Spawn Location
			Deleter = vector3(300.33, -1431.91, 28.8), -- Delete Location
			Deleter2 = vector3(313.36, -1465.17, 45.51), -- Aircraft Delete Location
			Heading = 226.71, -- Spawn Heading
			Heading2 = 318.34 -- Aircraft Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(374.42, -1620.68, 28.29), -- Enter Location
			Spawner = vector3(391.74, -1619.0, 28.29), -- Spawn Location
			Spawner2 = vector3(362.75, -1598.33, 35.95), -- Aircraft Spawn Location
			Heading = 318.34, -- Spawn Heading
			Heading2 = 311.87 -- Aircraft Spawn Heading
		}
	}
}

Config.Police = {
	UseG = false, -- true = Allows use of Police Garages.
	UseP = false, -- true = Allows use of Police Pounds.
	Blips = false, -- true = Use Police Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from the Police Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
			Marker = vector3(425.41, -1003.43, 29.71), -- Enter Location
			Spawner = vector3(434.28, -1015.8, 28.83), -- Spawn Location
			Spawner2 = vector3(449.21, -981.35, 43.69), -- Aircraft Spawn Location
			Spawner3 = vector3(441.78, -1015.18, 28.67), -- Large Spawn Location
			Deleter = vector3(462.95, -1014.56, 27.07), -- Delete Location
			Deleter2 = vector3(449.21, -981.35, 42.69), -- Aircraft Delete Location
			Deleter3 = vector3(456.31, -1024.74, 27.45), -- Large Delete Location
			Heading = 90.46, -- Spawn Heading
			Heading2 = 184.53, -- Aircraft Spawn Heading
			Heading3 = 89.96 -- Large Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(374.42, -1620.68, 28.29), -- Enter Location
			Spawner = vector3(391.74, -1619.0, 28.29), -- Spawn Location
			Spawner2 = vector3(362.75, -1598.33, 35.95), -- Aircraft Spawn Location
			Heading = 318.34, -- Spawn Heading
			Heading2 = 311.87 -- Aircraft Spawn Heading
		}
	}
}

Config.Mechanic = {
	UseG = false, -- true = Allows use of Mechanic Garages.
	UseP = false, -- true = Allows use of Mechanic Pounds.
	Blips = false, -- true = Use Mechanic Blips.
	PoundP = 150, -- How much it Costs to get Vehicles from the Mechanic Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
			Marker = vector3(-344.25, -123.4, 38.01), -- Enter Location
			Spawner = vector3(-370.1, -108.28, 37.68), -- Spawn Location
			Deleter = vector3(-370.1, -108.28, 37.68), -- Delete Location
			Heading = 73.9 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(374.42, -1620.68, 28.29), -- Enter Location
			Spawner = vector3(391.74, -1619.0, 28.29), -- Spawn Location
			Heading = 318.34 -- Spawn Heading
		}
	}
}

Config.Taxi = {
	UseG = false, -- true = Allows use of Taxi Garages.
	UseP = false, -- true = Allows use of Taxi Pounds.
	Blips = false, -- true = Use Mechanic Blips.
	PoundP = 150, -- How much it Costs to get Vehicles from the Mechanic Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
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
	PoundP = 2500, -- How much it Costs to get Vehicles from the Aircraft Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos_Airport = {
			Marker = vector3(-1617.14, -3145.52, 12.99), -- Enter Location
			Spawner = vector3(-1657.99, -3134.38, 12.99), -- Spawn Location
			Deleter = vector3(-1642.12, -3144.25, 12.99), -- Delete Location
			Heading = 330.11 -- Spawn Heading
		},
		Sandy_Shores_Airport = {
			Marker = vector3(1723.84, 3288.29, 40.16), -- Enter Location
			Spawner = vector3(1710.85, 3259.06, 40.69), -- Spawn Location
			Deleter = vector3(1714.45, 3246.75, 40.07), -- Delete Location
			Heading = 104.66 -- Spawn Heading
		},
		Grapeseed_Airport = {
			Marker = vector3(2152.83, 4797.03, 40.19), -- Enter Location
			Spawner = vector3(2122.72, 4804.85, 40.78), -- Spawn Location
			Deleter = vector3(2082.36, 4806.06, 40.07), -- Delete Location
			Heading = 115.04 -- Spawn Heading
		},
		Cayo_Airport = {
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
	PoundP = 500, -- How much it Costs to get Vehicles from the Boat Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos_Dock = {
			Marker = vector3(-735.87, -1325.08, 0.6), -- Enter Location
			Spawner = vector3(-718.87, -1320.18, -0.47), -- Spawn Location
			Deleter = vector3(-731.15, -1334.71, -0.47), -- Delete Location
			Heading = 45.0 -- Spawn Heading
		},
		Sandy_Shores_Dock = {
			Marker = vector3(1333.2, 4269.92, 30.5), -- Enter Location
			Spawner = vector3(1334.61, 4264.68, 29.86), -- Spawn Location
			Deleter = vector3(1323.73, 4269.94, 29.86), -- Delete Location
			Heading = 87.0 -- Spawn Heading
		},
		Paleto_Bay_Dock = {
			Marker = vector3(-283.74, 6629.51, 6.3), -- Enter Location
			Spawner = vector3(-290.46, 6622.72, -0.47), -- Spawn Location
			Deleter = vector3(-304.66, 6607.36, -0.47), -- Delete Location
			Heading = 52.0 -- Spawn Heading
		},
		Cayo_Perico_Dock = {
			Marker = vector3(4877.95, -5169.9, 1.45), -- Enter Location
			Spawner = vector3(4790.57, -5209.31, 1.02), -- Spawn Location
			Deleter = vector3(4790.57, -5209.31, 0.02), -- Delete Location
			Heading = 0.64 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos_Dock = {
			Marker = vector3(-738.67, -1400.43, 4.0), -- Enter Location
			Spawner = vector3(-738.33, -1381.51, 0.12), -- Spawn Location
			Heading = 137.85 -- Spawn Heading
		}
	}
}

Config.Cars = {
	UseG = false, -- true = Allows use of Car Garages.
	Blips = false, -- true = Use Car Blips.
	PoundP = 300, -- How much it Costs to get Vehicles from the Car Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Location Marker Settings.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Delete Location Marker Settings.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Pound Enter Location Marker Settings.
	},
	Garages = {
		Los_Santos = {
			Marker = vector3(213.65, -809.02, 30.01), -- Enter Location
			Spawner = vector3(229.70, -800.12, 29.57), -- Spawn Location
			Deleter = vector3(223.80, -760.42, 29.65), -- Delete Location
			Heading = 157.84 -- Spawn Heading
		},
		Los_Santos_Airport = {
			Marker = vector3(-1016.65, -2696.04, 12.98), -- Enter Location
			Spawner = vector3(-980.4, -2701.06, 12.86), -- Spawn Location
			Deleter = vector3(-951.55, -2705.48, 12.83), -- Delete Location
			Heading = 56.0 -- Spawn Heading
		},
		Sandy_Shores = {
			Marker = vector3(1737.59, 3710.2, 33.14), -- Enter Location
			Spawner = vector3(1737.84, 3719.28, 33.04), -- Spawn Location
			Deleter = vector3(1722.66, 3713.74, 33.21), -- Delete Location
			Heading = 21.22 -- Spawn Heading
		},
		Paleto_Bay = {
			Marker = vector3(105.36, 6613.59, 31.40), -- Enter Location
			Spawner = vector3(128.78, 6622.99, 30.78), -- Spawn Location
			Deleter = vector3(126.36, 6608.41, 30.86), -- Delete Location
			Heading = 315.01 -- Spawn Heading
		},
		Cayo_Perico = {
			Marker = vector3(4503.25, -4520.67, 3.41), -- Enter Location
			Spawner = vector3(4511.52, -4517.73, 4.11), -- Spawn Location
			Deleter = vector3(4503.27, -4536.21, 3.13), -- Delete Location
			Heading = 22.2 -- Spawn Heading
		}
	},
	Pounds = {
		Los_Santos = {
			Marker = vector3(408.61, -1625.47, 28.29), -- Enter Location
			Spawner = vector3(405.64, -1643.4, 27.61), -- Spawn Location
			Heading = 229.54 -- Spawn Heading
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
			Private = 'OldSpiceWarm',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_OldSpiceClassical = {
			Private = 'OldSpiceClassical',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_OldSpiceVintage = {
			Private = 'OldSpiceVintage',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_ExecutiveRich = {
			Private = 'ExecutiveRich',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_ExecutiveCool = {
			Private = 'ExecutiveCool',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_ExecutiveContrast = {
			Private = 'ExecutiveContrast',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_PowerBrokerIce = {
			Private = 'PowerBrokerIce',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_PowerBrokerConservative = {
			Private = 'PowerBrokerConservative',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		MazeBankBuilding_PowerBrokerPolished = {
			Private = 'PowerBrokerPolished',
			Marker = vector3(-60.38, -790.31, 43.23), -- Enter Location
			Spawner = vector3(-44.03, -787.36, 43.19), -- Spawn Location
			Deleter = vector3(-58.88, -778.63, 43.18), -- Delete Location
			Heading = 254.322 -- Spawn Heading
		},
		-- End of Maze Bank Building
		-- Start of Lom Bank
		LomBank_LBOldSpiceWarm = {
			Private = 'LBOldSpiceWarm',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBOldSpiceClassical = {
			Private = 'LBOldSpiceClassical',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBOldSpiceVintage = {
			Private = 'LBOldSpiceVintage',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBExecutiveRich = {
			Private = 'LBExecutiveRich',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBExecutiveCool = {
			Private = 'LBExecutiveCool',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBExecutiveContrast = {
			Private = 'LBExecutiveContrast',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBPowerBrokerIce = {
			Private = 'LBPowerBrokerIce',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBPowerBrokerConservative = {
			Private = 'LBPowerBrokerConservative',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		LomBank_LBPowerBrokerPolished = {
			Private = 'LBPowerBrokerPolished',
			Marker = vector3(-1545.17, -566.24, 24.85), -- Enter Location
			Spawner = vector3(-1551.88, -581.38, 24.71), -- Spawn Location
			Deleter = vector3(-1538.56, -576.05, 24.71), -- Delete Location
			Heading = 331.176 -- Spawn Heading
		},
		-- End of Lom Bank 
		-- Start of Maze Bank West 
		MazeBankWest_MBWOldSpiceWarm = {
			Private = 'MBWOldSpiceWarm',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWOldSpiceClassical = {
			Private = 'MBWOldSpiceClassical',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWOldSpiceVintage = {
			Private = 'MBWOldSpiceVintage',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWExecutiveRich = {
			Private = 'MBWExecutiveRich',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWExecutiveCool = {
			Private = 'MBWExecutiveCool',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWExecutiveContrast = {
			Private = 'MBWExecutiveContrast',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWPowerBrokerIce = {
			Private = 'MBWPowerBrokerIce',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWPowerBrokerConvservative = {
			Private = 'MBWPowerBrokerConvservative',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		MazeBankWest_MBWPowerBrokerPolished = {
			Private = 'MBWPowerBrokerPolished',
			Marker = vector3(-1368.14, -468.01, 30.6), -- Enter Location
			Spawner = vector3(-1376.93, -474.32, 30.5), -- Spawn Location
			Deleter = vector3(-1362.07, -471.98, 30.5), -- Delete Location
			Heading = 97.95 -- Spawn Heading
		},
		-- End of Maze Bank West
		-- Start of Intergrity Way
		IntegrityWay_IntegrityWay28 = {
			Private = 'IntegrityWay28',
			Marker = vector3(-14.1, -614.93, 34.86), -- Enter Location
			Spawner = vector3(-7.35, -635.1, 34.72), -- Spawn Location
			Deleter = vector3(-37.57, -620.39, 34.07), -- Delete Location
			Heading = 66.632 -- Spawn Heading
		},
		IntegrityWay_IntegrityWay30 = {
			Private = 'IntegrityWay30',
			Marker = vector3(-14.1, -614.93, 34.86), -- Enter Location
			Spawner = vector3(-7.35, -635.1, 34.72), -- Spawn Location
			Deleter = vector3(-37.57, -620.39, 34.07), -- Delete Location
			Heading = 66.632 -- Spawn Heading
		},
		-- End of Intergrity Way
		-- Start of Dell Perro Heights
		DellPerroHeights_DellPerroHeightst4 = {
			Private = 'DellPerroHeightst4',
			Marker = vector3(-1477.15, -517.17, 33.74), -- Enter Location
			Spawner = vector3(-1483.16, -505.1, 31.81), -- Spawn Location
			Deleter = vector3(-1452.61, -508.78, 30.58), -- Delete Location
			Heading = 299.89 -- Spawn Heading
		},
		DellPerroHeights_DellPerroHeightst7 = {
			Private = 'DellPerroHeightst7',
			Marker = vector3(-1477.15, -517.17, 33.74), -- Enter Location
			Spawner = vector3(-1483.16, -505.1, 31.81), -- Spawn Location
			Deleter = vector3(-1452.61, -508.78, 30.58), -- Delete Location
			Heading = 299.89 -- Spawn Heading
		},
		-- End of Dell Perro Heights
		-- Start of Milton Drive
		MiltonDrive_Modern1Apartment = {
			Private = 'Modern1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Modern2Apartment = {
			Private = 'Modern2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Modern3Apartment = {
			Private = 'Modern3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Mody1Apartment = {
			Private = 'Mody1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Mody2Apartment = {
			Private = 'Mody2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Mody3Apartment = {
			Private = 'Mody3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Vibrant1Apartment = {
			Private = 'Vibrant1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Vibrant2Apartment = {
			Private = 'Vibrant2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Vibrant3Apartment = {
			Private = 'Vibrant3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Sharp1Apartment = {
			Private = 'Sharp1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Sharp2Apartment = {
			Private = 'Sharp2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Sharp3Apartment = {
			Private = 'Sharp3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Monochrome1Apartment = {
			Private = 'Monochrome1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Monochrome2Apartment = {
			Private = 'Monochrome2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Monochrome3Apartment = {
			Private = 'Monochrome3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Seductive1Apartment = {
			Private = 'Seductive1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Seductive2Apartment = {
			Private = 'Seductive2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Seductive3Apartment = {
			Private = 'Seductive3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Regal1Apartment = {
			Private = 'Regal1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Regal2Apartment = {
			Private = 'Regal2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Regal3Apartment = {
			Private = 'Regal3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Aqua1Apartment = {
			Private = 'Aqua1Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Aqua2Apartment = {
			Private = 'Aqua2Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		MiltonDrive_Aqua3Apartment = {
			Private = 'Aqua3Apartment',
			Marker = vector3(-795.96, 331.83, 84.5), -- Enter Location
			Spawner = vector3(-800.49, 333.47, 84.5), -- Spawn Location
			Deleter = vector3(-791.75, 333.47, 84.5), -- Delete Location
			Heading = 180.494 -- Spawn Heading
		},
		-- End of Milton Drive
		-- Start of Single
		RichardMajesticApt2 = {
			Private = 'RichardMajesticApt2',
			Marker = vector3(-887.5, -349.58, 33.53), -- Enter Location
			Spawner = vector3(-886.03, -343.78, 33.53), -- Spawn Location
			Deleter = vector3(-894.32, -349.33, 33.53), -- Delete Location
			Heading = 206.79 -- Spawn Heading
		},
		WildOatsDrive = {
			Private = 'WildOatsDrive',
			Marker = vector3(-178.65, 503.45, 135.85), -- Enter Location
			Spawner = vector3(-189.98, 505.8, 133.48), -- Spawn Location
			Deleter = vector3(-189.28, 500.56, 132.93), -- Delete Location
			Heading = 282.62 -- Spawn Heading
		},
		WhispymoundDrive = {
			Private = 'WhispymoundDrive',
			Marker = vector3(123.65, 565.75, 183.04), -- Enter Location
			Spawner = vector3(130.11, 571.47, 182.42), -- Spawn Location
			Deleter = vector3(131.97, 566.77, 181.95), -- Delete Location
			Heading = 270.71 -- Spawn Heading
		},
		NorthConkerAvenue2044 = {
			Private = 'NorthConkerAvenue2044',
			Marker = vector3(348.18, 443.01, 146.7), -- Enter Location
			Spawner = vector3(358.39, 437.06, 144.27), -- Spawn Location
			Deleter = vector3(351.38, 438.86, 145.66), -- Delete Location
			Heading = 285.911 -- Spawn Heading
		},
		NorthConkerAvenue2045 = {
			Private = 'NorthConkerAvenue2045',
			Marker = vector3(370.69, 430.76, 144.11), -- Enter Location
			Spawner = vector3(392.88, 434.54, 142.17), -- Spawn Location
			Deleter = vector3(389.72, 429.95, 141.81), -- Delete Location
			Heading = 264.94 -- Spawn Heading
		},
		HillcrestAvenue2862 = {
			Private = 'HillcrestAvenue2862',
			Marker = vector3(-688.71, 597.57, 142.64), -- Enter Location
			Spawner = vector3(-683.72, 609.88, 143.28), -- Spawn Location
			Deleter = vector3(-685.26, 601.08, 142.36), -- Delete Location
			Heading = 338.06 -- Spawn Heading
		},
		HillcrestAvenue2868 = {
			Private = 'HillcrestAvenue2868',
			Marker = vector3(-752.75, 624.90, 141.2), -- Enter Location
			Spawner = vector3(-749.32, 628.61, 141.48), -- Spawn Location
			Deleter = vector3(-754.28, 631.58, 141.2), -- Delete Location
			Heading = 197.14 -- Spawn Heading
		},
		HillcrestAvenue2874 = {
			Private = 'HillcrestAvenue2874',
			Marker = vector3(-859.01, 695.95, 147.93), -- Enter Location
			Spawner = vector3(-863.68, 698.72, 147.05), -- Spawn Location
			Deleter = vector3(-855.66, 698.77, 147.81), -- Delete Location
			Heading = 341.77 -- Spawn Heading
		},
		MadWayneThunder = {
			Private = 'MadWayneThunder',
			Marker = vector3(-1290.95, 454.52, 96.66), -- Enter Location
			Spawner = vector3(-1297.62, 459.28, 96.48), -- Spawn Location
			Deleter = vector3(-1298.09, 468.95, 96.0), -- Delete Location
			Heading = 285.652 -- Spawn Heading
		},
		TinselTowersApt12 = {
			Private = 'TinselTowersApt12',
			Marker = vector3(-616.74, 56.38, 42.73), -- Enter Location
			Spawner = vector3(-620.59, 60.10, 42.73), -- Spawn Location
			Deleter = vector3(-621.13, 52.69, 42.73), -- Delete Location
			Heading = 109.316 -- Spawn Heading
		},
		-- End of Single
		-- Start of VENT Custom
		MedEndApartment1 = {
			Private = 'MedEndApartment1',
			Marker = vector3(240.23, 3102.84, 41.49), -- Enter Location
			Spawner = vector3(233.58, 3094.29, 41.49), -- Spawn Location
			Deleter = vector3(237.52, 3112.63, 41.39), -- Delete Location
			Heading = 93.91 -- Spawn Heading
		},
		MedEndApartment2 = {
			Private = 'MedEndApartment2',
			Marker = vector3(246.08, 3174.63, 41.72), -- Enter Location
			Spawner = vector3(234.15, 3164.37, 41.54), -- Spawn Location
			Deleter = vector3(240.72, 3165.53, 41.65), -- Delete Location
			Heading = 102.03 -- Spawn Heading
		},
		MedEndApartment3 = {
			Private = 'MedEndApartment3',
			Marker = vector3(984.92, 2668.95, 39.06), -- Enter Location
			Spawner = vector3(993.96, 2672.68, 39.06), -- Spawn Location
			Deleter = vector3(994.04, 2662.1, 39.13), -- Delete Location
			Heading = 0.61 -- Spawn Heading
		},
		MedEndApartment4 = {
			Private = 'MedEndApartment4',
			Marker = vector3(196.49, 3027.48, 42.89), -- Enter Location
			Spawner = vector3(203.1, 3039.47, 42.08), -- Spawn Location
			Deleter = vector3(192.24, 3037.95, 42.89), -- Delete Location
			Heading = 271.3 -- Spawn Heading
		},
		MedEndApartment5 = {
			Private = 'MedEndApartment5',
			Marker = vector3(1724.49, 4638.13, 42.31), -- Enter Location
			Spawner = vector3(1723.98, 4630.19, 42.23), -- Spawn Location
			Deleter = vector3(1733.66, 4635.08, 42.24), -- Delete Location
			Heading = 117.88 -- Spawn Heading
		},
		MedEndApartment6 = {
			Private = 'MedEndApartment6',
			Marker = vector3(1670.76, 4740.99, 41.08), -- Enter Location
			Spawner = vector3(1673.47, 4756.51, 40.91), -- Spawn Location
			Deleter = vector3(1668.46, 4750.83, 40.88), -- Delete Location
			Heading = 12.82
		},
		MedEndApartment7 = {
			Private = 'MedEndApartment7',
			Marker = vector3(15.24, 6573.38, 31.72), -- Enter Location
			Spawner = vector3(16.77, 6581.68, 31.42), -- Spawn Location
			Deleter = vector3(10.45, 6588.04, 31.47), -- Delete Location
			Heading = 222.6 -- Spawn Heading
		},
		MedEndApartment8 = {
			Private = 'MedEndApartment8',
			Marker = vector3(-374.73, 6187.06, 30.54), -- Enter Location
			Spawner = vector3(-377.97, 6183.73, 30.49), -- Spawn Location
			Deleter = vector3(-383.31, 6188.85, 30.49), -- Delete Location
			Heading = 223.71 -- Spawn Heading
		},
		MedEndApartment9 = {
			Private = 'MedEndApartment9',
			Marker = vector3(-24.6, 6605.99, 30.45), -- Enter Location
			Spawner = vector3(-16.0, 6607.74, 30.18), -- Spawn Location
			Deleter = vector3(-9.36, 6598.86, 30.47), -- Delete Location
			Heading = 35.31 -- Spawn Heading
		},
		MedEndApartment10 = {
			Private = 'MedEndApartment10',
			Marker = vector3(-365.18, 6323.95, 28.9), -- Enter Location
			Spawner = vector3(-359.49, 6327.41, 28.83), -- Spawn Location
			Deleter = vector3(-353.47, 6334.57, 28.83), -- Delete Location
			Heading = 218.58 -- Spawn Heading
		}
		-- End of VENT Custom
	}
}
