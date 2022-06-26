# About esx_advancedgarage:
Made by Human Tree92 ([Velociti Entertainment Customs & Wiki]( http://www.velocitientertainment.com/customs/ ))

# Helpfull Info:
* Unable to Store Vehicles you don't own.
* Ability to Kick people who try to Cheat using the Garage & Set Custom Kick Message.
* Private Property Garages. Must have esx_property
* Ambulance, Police, Mechanic, Taxi, Aircraft, Boat, & Car Garages/Impounds.
* Uses esx_menu_list instead of esx_menu_default.
* Ability to Rename Vehicle.
* No longer needing a vehicle_names.lua file. New system pulls name from Advanced Vehicle Shop.
* Vehicles are stored in a Class basses. Example: If you buy a Super Car it will show up under the Super Car Class in Garage.
* WILL NOT WORK WITH esx_vehicleshop & WILL ONLY WORK WITH esx_advancedvehicleshop
* Now supports LegacyFuel

# Requirements:
* Required:
  * [ESX Legacy V1.6+]( https://github.com/esx-framework/esx-legacy/tree/1.6.0 )
  * [esx_advancedvehicleshop]( https://github.com/HumanTree92/VENT_ESX_Scripts/tree/main/esx_advancedvehicleshop )
* Optional:
  * [esx_property]( https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_property )
  * [esx_mechanicjob]( https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_mechanicjob )
  * [esx_taxijob]( https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_taxijob )

# Download & Installation:
1) Place `esx_advancedgarage` in your ESX Directory
2) Add `start esx_advancedgarage` to your server.cfg
3) Edit the `config.lua` to your liking

# KNOWN BUGS:
* With the New Menu Design there is still a Limit before the Menu breaks. This is something i can't fix. But each Class can holdup to roughly 36 Vehicles for a total of 432 Vehicles.
* It is Possible to Duplicate Vehicles if the resource is restarted while vehicles are out.
