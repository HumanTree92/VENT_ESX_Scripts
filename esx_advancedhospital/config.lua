Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.
Config.MedicRequired = 2 -- Amount of Medics online to prevent Healers.

Config.HospMarker = {Type = 1, r = 102, g = 102, b = 204, x = 1.5, y = 1.5, z = 1.0} -- Hospital Marker Settings.
Config.BlipHospital = {Sprite = 403, Color = 2, Display = 2, Scale = 1.0} -- Hospital Blip Settings.
Config.SurgMarker = {Type = 1, r = 102, g = 102, b = 204, x = 1.5, y = 1.5, z = 1.0} -- Surgery Marker Settings.
Config.BlipSurgery = {Sprite = 403, Color = 0, Display = 2, Scale = 1.0} -- Surgery Blip Settings.

Config.VIPScript = false -- true = Running a VIP Script. You must setup Script to Work with this Script.

Config.UseHospital = false -- true = Allows Players to Heal Themselves.
Config.UseHospitalBlips = false -- true = Use Hospital Blips.
Config.HealingPrice = 100 -- Healing Price.
Config.HealingDiscount = 75 -- Healing Discount Price.

Config.RevivePrice = 750 -- Revive Price.
Config.ReviveDiscount = 562 -- Revive Discount Price.

Config.UseSurgeon = false -- true = Allows Players to edit their Character.
Config.UseSurgeonBlips = false -- true = Use Surgery Blips.
Config.SurgeryPrice = 3700 -- Surgery Price.
Config.SurgeryDiscount = 2775 -- Surgery Discount Price.

Config.Locations = {
	Locs = {
		Healer = {
			vector3(265.8, -1355.6, 23.5), -- esx_ambulancejob Inside
			vector3(338.8, -1394.5, 31.5), -- Los Santos Central
			vector3(-449.6, -340.8, 33.5), -- Los Santos Mount Zonah
			vector3(-874.7, -307.5, 38.5), -- Los Santos Portola Trinity
			vector3(298.7, -584.6, 42.2), -- Los Santos Pillbox Hill Top
			vector3(1829.2, 3667.1, 33.2), -- Sandy Shores Medical Center
			vector3(-240.3, 6324.1, 31.4), -- Paleto Bay Medical Center
		},
		Surgery = {
			vector3(260.3, -1343.6, 23.5), -- esx_ambulancejob Inside
		}
	}
}
