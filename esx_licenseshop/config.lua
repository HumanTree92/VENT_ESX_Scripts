Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.

Config.MarkerInfo = {Type = 1, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0} -- Marker Settings.
Config.Blip = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0} -- Blip Settings.

Config.UseBlips = false -- true = Use License Shop Blips
Config.RequireDMV = false -- true = Will Require Players to have Drivers Permit to buy other Licenses.
Config.AdvancedVehicleShop = false -- true = Using esx_advancedvehicleshop
Config.AdvancedWeaponShop = false -- true = Using esx_advancedweaponshop
Config.DMVSchool = false -- true = Using esx_dmvschool
Config.SellDMV = false -- true = If 'Config.RequireDMV' = false & you want Players to be able to buy Drivers Permit.
Config.Drugs = false -- true = Using esx_drugs
Config.WeaponShop = false -- true = Using esx_weaponshop

Config.Custom = {
	Licenses = false, -- true = If wanting to sell Custom Licenses.
	C1 = false, -- true= Using Custom License 1
	C1Name = 'change_me', -- Name must be LowerCase | Example: chemical
	C2 = false, -- true= Using Custom License 2
	C2Name = 'change_me', -- Name must be LowerCase | Example: chemical
	C3 = false, -- true= Using Custom License 3
	C3Name = 'change_me', -- Name must be LowerCase | Example: chemical
	C4 = false, -- true= Using Custom License 4
	C4Name = 'change_me', -- Name must be LowerCase | Example: chemical
	C5 = false, -- true= Using Custom License 5
	C5Name = 'change_me' -- Name must be LowerCase | Example: chemical
}

-- Prices of Licenses
Config.Prices = {
	Aircraft = 10000,
	Boating = 50,
	Melee = 1,
	Handgun = 10,
	SMG = 100,
	Shotgun = 50,
	Assault = 250,
	LMG = 1000,
	Sniper = 1500,
	Commercial = 300,
	Drivers = 150,
	DriversP = 75,
	Motorcycle = 225,
	Weed = 10000,
	Weapon = 1000,
	-- Custom Licenses
	Custom1 = 1000,
	Custom2 = 1000,
	Custom3 = 1000,
	Custom4 = 1000,
	Custom5 = 1000
}

Config.Locs = {
	vector3(241.0, -1378.9, 32.7)
}
