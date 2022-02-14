Config = {}
Config.Locale = 'en'

Config.Removeables = {
	-- true = Removes when used | false = Does opposite of true
	Bandage = true,
	BulletProofVest = true,
	Defib = false,
	Drill = false,
	Firework = true,
	FirstAidKit = true,
	OxygenMask = true,
	CleanKit = true,
	RepairKit = true,
	TireKit = true,
	WeaKit = false,
	AmmoBoxes = true,
	-- true = Removes if Failed | false = Doesn't remove if Failed
	LockPick = true
}

-- Item Scenario Wait Times in MS
Config.Wait = {
	Drill = 10000,
	LockPick = 10000,
	CleanKit = 10000,
	RepairKit = 10000,
	TireKit = 10000
}

Config.Heal = true -- true = Will allow First Aid Kits to Heal Players | false = Will give 3 Bandages
Config.BandageHP = 10

-- Binoculars
Config.BinocularsPutAway = 177 -- Backspace Key

-- Weapon Ammos
Config.AmmoBoxes = {
	Pistol = 50, -- 9mm @ 0.28 per round | 50 x 1.05 = 14
	SMG = 50, -- 9mm @ 0.28 per round | 50 x 1.05 = 14
	Shotgun = 25, -- 12g @ 0.36 per round | 25 x 0.36 = 9
	Rifle = 25, -- 5.56 @ 0.47 per round | 25 x 0.47 = 11.75 (12)
	MG = 50, -- 5.56 @ 0.47 per round | 50 x 0.47 = 23.50 (24)
	Sniper = 20, -- 7.62 @ 1.05 per round | 20 x 1.05 = 21
	Flare = 5, -- Not doing Realistic Price
	BoxBig = 100,
	BoxSmall = 50
}

Config.AllowRemove = true -- Allows removing Weapon Attachments

Config.ComponentList = {
	Melee = {
		{weapon = 'WEAPON_KNUCKLE', components = {true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_SWITCHBLADE', components = {true, true, true}}
	},
	Pistols = {
		{weapon = 'WEAPON_APPISTOL', components = {true, true, true, true, true}},
		{weapon = 'WEAPON_CERAMICPISTOL', components = {true, true, true}},
		{weapon = 'WEAPON_COMBATPISTOL', components = {true, true, true, true, true}},
		{weapon = 'WEAPON_HEAVYPISTOL', components = {true, true, true, true, true}},
		{weapon = 'WEAPON_REVOLVER', components = {true, true, true}},
		{weapon = 'WEAPON_REVOLVER_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_PISTOL', components = {true, true, true, true, true}},
		{weapon = 'WEAPON_PISTOL_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_PISTOL50', components = {true, true, true, true, true}},
		{weapon = 'WEAPON_SNSPISTOL', components = {true, true, true}},
		{weapon = 'WEAPON_SNSPISTOL_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_VINTAGEPISTOL', components = {true, true, true}}
	},
	SMGs = {
		{weapon = 'WEAPON_ASSAULTSMG', components = {true, true, true, true, true, true}},
		{weapon = 'WEAPON_COMBATPDW', components = {true, true, true, true, true, true}},
		{weapon = 'WEAPON_MACHINEPISTOL', components = {true, true, true, true}},
		{weapon = 'WEAPON_MICROSMG', components = {true, true, true, true, true, true}},
		{weapon = 'WEAPON_MINISMG', components = {true, true}},
		{weapon = 'WEAPON_SMG', components = {true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_SMG_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}}
	},
	Shotguns = {
		{weapon = 'WEAPON_ASSAULTSHOTGUN', components = {true, true, true, true, true}},
		{weapon = 'WEAPON_BULLPUPSHOTGUN', components = {true, true, true}},
		{weapon = 'WEAPON_COMBATSHOTGUN', components = {true, true}},
		{weapon = 'WEAPON_HEAVYSHOTGUN', components = {true, true, true, true, true, true}},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {true, true, true}},
		{weapon = 'WEAPON_PUMPSHOTGUN_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_SAWNOFFSHOTGUN', components = {true}}
	},
	Rifles = {
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {true, true, true, true, true, true}},
		{weapon = 'WEAPON_ASSAULTRIFLE', components = {true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_ASSAULTRIFLE_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_BULLPUPRIFLE', components = {true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_BULLPUPRIFLE_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_CARBINERIFLE', components = {true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_CARBINERIFLE_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_COMPACTRIFLE', components = {true, true, true}},
		{weapon = 'WEAPON_MILITARYRIFLE', components = {true, true, true, true, true, true}},
		{weapon = 'WEAPON_SPECIALCARBINE', components = {true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_SPECIALCARBINE_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}}
	},
	MGs = {
		{weapon = 'WEAPON_COMBATMG', components = {true, true, true, true, true}},
		{weapon = 'WEAPON_COMBATMG_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_GUSENBERG', components = {true, true}},
		{weapon = 'WEAPON_MG', components = {true, true, true, true}}
	},
	Snipers = {
		{weapon = 'WEAPON_HEAVYSNIPER', components = {true, true}},
		{weapon = 'WEAPON_HEAVYSNIPER_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_MARKSMANRIFLE', components = {true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_MARKSMANRIFLE_MK2', components = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}},
		{weapon = 'WEAPON_SNIPERRIFLE', components = {true, true, true, true}}
	}
}

Config.WeaponList = {
	Pistols = {
		'WEAPON_APPISTOL',
		'WEAPON_CERAMICPISTOL',
		'WEAPON_COMBATPISTOL',
		'WEAPON_DOUBLEACTION',
		'WEAPON_GADGETPISTOL',
		'WEAPON_HEAVYPISTOL',
		'WEAPON_REVOLVER',
		'WEAPON_REVOLVER_MK2',
		'WEAPON_MARKSMANPISTOL',
		'WEAPON_NAVYREVOLVER',
		'WEAPON_PISTOL',
		'WEAPON_PISTOL_MK2',
		'WEAPON_PISTOL50',
		'WEAPON_SNSPISTOL',
		'WEAPON_SNSPISTOL_MK2',
		'WEAPON_VINTAGEPISTOL',
		'WEAPON_MACHINEPISTOL',
	},
	SMGs = {
		'WEAPON_ASSAULTSMG',
		'WEAPON_COMBATPDW',
		'WEAPON_MICROSMG',
		'WEAPON_MINISMG',
		'WEAPON_SMG',
		'WEAPON_SMG_MK2',
	},
	Shotguns = {
		'WEAPON_ASSAULTSHOTGUN',
		'WEAPON_AUTOSHOTGUN',
		'WEAPON_BULLPUPSHOTGUN',
		'WEAPON_COMBATSHOTGUN',
		'WEAPON_DBSHOTGUN',
		'WEAPON_HEAVYSHOTGUN',
		'WEAPON_MUSKET',
		'WEAPON_PUMPSHOTGUN',
		'WEAPON_PUMPSHOTGUN_MK2',
		'WEAPON_SAWNOFFSHOTGUN',
	},
	Rifles = {
		'WEAPON_ADVANCEDRIFLE',
		'WEAPON_ASSAULTRIFLE',
		'WEAPON_ASSAULTRIFLE_MK2',
		'WEAPON_BULLPUPRIFLE',
		'WEAPON_BULLPUPRIFLE_MK2',
		'WEAPON_CARBINERIFLE',
		'WEAPON_CARBINERIFLE_MK2',
		'WEAPON_COMPACTRIFLE',
		'WEAPON_MILITARYRIFLE',
		'WEAPON_SPECIALCARBINE',
		'WEAPON_SPECIALCARBINE_MK2',
	},
	MGs = {
		'WEAPON_COMBATMG',
		'WEAPON_COMBATMG_MK2',
		'WEAPON_GUSENBERG',
		'WEAPON_MG',
	},
	Snipers = {
		'WEAPON_HEAVYSNIPER',
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE',
		'WEAPON_MARKSMANRIFLE_MK2',
		'WEAPON_SNIPERRIFLE',
	},
	Flares = {
		'WEAPON_FLAREGUN'
	}
}

-- Vape
Config.Vape = {
	SmokeSize = 0.5, -- Size of Vape Clouds
	FailurePerc = 100, -- Odds of Vape Exploding | 10594 = 0.0001% Chance
	HealAmt = 10, -- How much to Heal the Player
	Cooldown = 4000, -- Amount of Time in MS must wait to take Hit again
	SmokeTime = 2800 -- Amount of Time in MS the smoke will linger
}

-- Vehicle GPS
Config.GPS = {
	VehicleGPS = false, -- Set to true to use Vehicle GPS.
	LimitedVehicles = false, -- Set to true to only allow Aircrafts, Boats, & Cars to use GPS.
	OnlyFrontSeats = false, -- Set to true to only allow the front 2 seats to be able to see Radar if they used it.
	BikeGPS = {
		'sanchez'
	}
}
