Config = {}
Config.Locale = 'en' -- Set Locale file to use.

-- If you Set PlateSingleSpace & PlateDoubleSpace to false the plate will be like 'LLLLNNNN'
Config.Main = {
	DrawDistanceE = 20, -- Enter Marker Draw Distance.
	DrawDistanceR = 50, -- Resell Marker Draw Distance.
	VIPScript = false, -- true = Running a VIP Script. You must setup Script to Work with this Script.
	PlateSingleSpace = false, -- true = 'LLL NNN' | Where L is a Random Letter & N is a Random Number.
	PlateDoubleSpace = true, -- true = 'LLL  NNN' | Where L is a Random Letter & N is a Random Number.
	MaxMigrates = 6, -- Higher Value will cause Deadlocks on the Database.
	LegacyFuel = false, -- true = Using LegacyFuel.
	Financing = false, -- WIP Feature Keep false for now.
	Limit = false -- WIP Feature Keep false for now.
}

Config.Ambulance = {
	Shop = false, -- true = Use Ambulance Shop.
	Blips = false, -- true = Use Ambulance Blips.
	Blip = {Sprite = 326, Color = 1, Display = 4, Scale = 1.0}, -- Ambulance Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(416.63, -1099.95, 29.06), -- Marker for Accessing the Shop.
			Inside = vector3(432.78, -1094.29, 28.22), -- Location for Viewing Vehicles.
			Outside = vector3(480.95, -1109.62, 28.2), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(485.47, -1097.45, 28.2), -- Marker for Selling Vehicles.
			InsideH = 359.74, -- Heading for Viewing Vehicles.
			OutsideH = 180.01 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.Police = {
	Shop = false, -- true = Use Police Shop.
	Blips = false, -- true = Use Police Blips.
	Blip = {Sprite = 326, Color = 3, Display = 4, Scale = 1.0}, -- Police Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 0, g = 0, b = 255, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 0, g = 0, b = 255, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(416.63, -1093.59, 29.06), -- Marker for Accessing the Shop.
			Inside = vector3(432.78, -1094.29, 28.22), -- Location for Viewing Vehicles.
			Outside = vector3(465.18, -1108.62, 28.2), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(485.47, -1097.45, 28.2), -- Marker for Selling Vehicles.
			InsideH = 359.74, -- Heading for Viewing Vehicles.
			OutsideH = 177.5 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.Division = {
	Shop = false, -- true = Use Division Shop.
	Blips = false, -- true = Use Division Blips.
	Blip = {Sprite = 326, Color = 3, Display = 4, Scale = 1.0}, -- Division Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Helis = {'polmav'}, -- Helicopters that will spawn in Outside2.
	Markers = {
		Enter = {Type = 1, r = 0, g = 0, b = 255, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 0, g = 0, b = 255, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(416.77, -1096.54, 29.06), -- Marker for Accessing the Shop.
			Inside = vector3(432.78, -1094.29, 28.22), -- Location for Viewing Vehicles.
			Outside = vector3(465.18, -1108.62, 28.2), -- Spawn Location for Purchased Vehicles.
			Outside2 = vector3(465.13, -1095.78, 42.08), -- Spawn Location for Purchased Aircrafts.
			Resell = vector3(458.58, -1104.11, 28.2), -- Marker for Selling Vehicles.
			Resell2 = vector3(476.74, -1106.44, 42.08), -- Marker for Selling Aircrafts.
			InsideH = 359.74, -- Heading for Viewing Vehicles.
			OutsideH = 177.5, -- Heading for Spawning Purchased Vehicles.
			OutsideH2 = 177.21 -- Heading for Spawning Purchased Aircrafts.
		}
	}
}

Config.Mechanic = {
	Shop = false, -- true = Use Mechanic Shop.
	Blips = false, -- true = Use Mechanic Blips.
	Blip = {Sprite = 326, Color = 17, Display = 4, Scale = 1.0}, -- Mechanic Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 255, g = 165, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 255, g = 165, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(0.37, -1658.99, 28.48), -- Marker for Accessing the Shop.
			Inside = vector3(-17.27, -1658.88, 38.62), -- Location for Viewing Vehicles.
			Outside = vector3(-48.61, -1690.86, 28.43), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(-17.96, -1680.72, 28.49), -- Marker for Selling Vehicles.
			InsideH = 46.47, -- Heading for Viewing Vehicles.
			OutsideH = 297.7 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.Taxi = {
	Shop = false, -- true = Use Taxi Shop.
	Blips = false, -- true = Use Taxi Blips.
	Blip = {Sprite = 326, Color = 17, Display = 4, Scale = 1.0}, -- Taxi Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 255, g = 165, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 255, g = 165, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(0.37, -1658.99, 28.48), -- Marker for Accessing the Shop.
			Inside = vector3(-17.27, -1658.88, 38.62), -- Location for Viewing Vehicles.
			Outside = vector3(-48.61, -1690.86, 28.43), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(-17.96, -1680.72, 28.49), -- Marker for Selling Vehicles.
			InsideH = 46.47, -- Heading for Viewing Vehicles.
			OutsideH = 297.7 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.Aircraft = {
	Shop = false, -- true = Use Aircraft Shop.
	Blips = false, -- true = Use Aircraft Blips.
	Blip = {Sprite = 90, Color = 4, Display = 4, Scale = 1.0}, -- Aircraft Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 145, g = 0, b = 255, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 145, g = 0, b = 255, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(-941.6, -2956.1, 12.9), -- Marker for Accessing the Shop.
			Inside = vector3(-1874.7, -3137.5, 14.9), -- Location for Viewing Vehicles.
			Outside = vector3(-965.2, -2983.5, 14.5), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(-1003.2, -2920.7, 12.9), -- Marker for Selling Vehicles.
			InsideH = 333.95, -- Heading for Viewing Vehicles.
			OutsideH = 59.9 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.Boat = {
	Shop = false, -- true = Use Boat Shop.
	Blips = false, -- true = Use Boat Blips.
	Blip = {Sprite = 410, Color = 3, Display = 4, Scale = 1.0}, -- Boat Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 0, g = 17, b = 255, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 0, g = 17, b = 255, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(-806.5, -1350.9, 4.2), -- Marker for Accessing the Shop.
			Inside = vector3(-816.1, -1422.0, -0.4), -- Location for Viewing Vehicles.
			Outside = vector3(-782.0, -1421.4, -0.4), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(-769.1, -1378.0, -0.4), -- Marker for Selling Vehicles.
			InsideH = 138.4, -- Heading for Viewing Vehicles.
			OutsideH = 141.35 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.Car = {
	Shop = false, -- true = Use Car Shop.
	Blips = false, -- true = Use Car Blips.
	Blip = {Sprite = 326, Color = 2, Display = 4, Scale = 1.0}, -- Car Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 0, g = 255, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(-55.0, -1095.9, 25.4), -- Marker for Accessing the Shop.
			Inside = vector3(-47.5, -1097.2, 25.4), -- Location for Viewing Vehicles.
			Outside = vector3(-26.8, -1083.5, 26.6), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(-44.6, -1080.7, 25.6), -- Marker for Selling Vehicles.
			InsideH = -20.0, -- Heading for Viewing Vehicles.
			OutsideH = 70.68 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.Truck = {
	Shop = false, -- true = Use Truck Shop.
	Blips = false, -- true = Use Truck Blips.
	Blip = {Sprite = 67, Color = 2, Display = 4, Scale = 1.0}, -- Truck Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	LargeVehs = {'pbus2'}, -- Large Vehicles that will spawn in Outside2.
	Markers = {
		Enter = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 0, g = 255, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(-23.47, -1660.45, 28.48), -- Marker for Accessing the Shop.
			Inside = vector3(-24.82, -1650.54, 28.48), -- Location for Viewing Vehicles.
			Outside = vector3(-55.05, -1685.02, 28.49), -- Spawn Location for Purchased Vehicles.
			Outside2 = vector3(-55.05, -1685.02, 28.49), -- Spawn Location for Purchased Large Vehicles.
			Resell = vector3(-29.7, -1674.8, 28.49), -- Marker for Selling Vehicles.
			InsideH = 140.62, -- Heading for Viewing Vehicles.
			OutsideH = 321.05, -- Heading for Spawning Purchased Vehicles.
			OutsideH2 = 321.05 -- Heading for Spawning Purchased Large Vehicles.
		}
	}
}

-- You will need to Setup your Own Stuff for the VIP Shops. I will NOT be providing support to help with this.
Config.VIPAircraft = {
	Shop = false, -- true = Use VIP Aircraft Shop.
	Blips = false, -- true = Use VIP Aircraft Blips.
	Blip = {Sprite = 326, Color = 5, Display = 4, Scale = 1.0}, -- VIP Aircraft Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 255, g = 222, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 255, g = 222, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(0.0, 0.0, 0.0), -- Marker for Accessing the Shop.
			Inside = vector3(0.0, 0.0, 0.0), -- Location for Viewing Vehicles.
			Outside = vector3(0.0, 0.0, 0.0), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(0.0, 0.0, 0.0), -- Marker for Selling Vehicles.
			InsideH = 0.0, -- Heading for Viewing Vehicles.
			OutsideH = 0.0 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.VIPBoat = {
	Shop = false, -- true = Use VIP Boat Shop.
	Blips = false, -- true = Use VIP Boat Blips.
	Blip = {Sprite = 326, Color = 5, Display = 4, Scale = 1.0}, -- VIP Boat Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 255, g = 222, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 255, g = 222, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(0.0, 0.0, 0.0), -- Marker for Accessing the Shop.
			Inside = vector3(0.0, 0.0, 0.0), -- Location for Viewing Vehicles.
			Outside = vector3(0.0, 0.0, 0.0), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(0.0, 0.0, 0.0), -- Marker for Selling Vehicles.
			InsideH = 0.0, -- Heading for Viewing Vehicles.
			OutsideH = 0.0 -- Heading for Spawning Purchased Vehicles.
		}
	}
}

Config.VIPCar = {
	Shop = false, -- true = Use VIP Car Shop.
	Blips = false, -- true = Use VIP Car Blips.
	Blip = {Sprite = 326, Color = 5, Display = 4, Scale = 1.0}, -- VIP Car Blip Settings.
	License = false, -- true = Requires a License to Buy Vehicles.
	ResellPerc = 50, -- The Resell % of Vehicles Sold. | Example: $10,000 / 50% = $5,000 Back.
	Markers = {
		Enter = {Type = 1, r = 255, g = 222, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Enter Marker Settings.
		Resell = {Type = 1, r = 255, g = 222, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Resell Marker Settings.
	},
	Locations = {
		Los_Santos = {
			Enter = vector3(0.0, 0.0, 0.0), -- Marker for Accessing the Shop.
			Inside = vector3(0.0, 0.0, 0.0), -- Location for Viewing Vehicles.
			Outside = vector3(0.0, 0.0, 0.0), -- Spawn Location for Purchased Vehicles.
			Resell = vector3(0.0, 0.0, 0.0), -- Marker for Selling Vehicles.
			InsideH = 0.0, -- Heading for Viewing Vehicles.
			OutsideH = 0.0 -- Heading for Spawning Purchased Vehicles.
		}
	}
}
