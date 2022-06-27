# About esx_advancedvehicleshop:
Edited/Made by Human Tree92 ([Velociti Entertainment Customs & Wiki]( http://www.velocitientertainment.com/customs/ ))

# Helpfull Info:
* This Vehicle Shops works exactly like esx_vehicleshop.
* Currently has 11 Different Vehicle Shops.
  * Ambulance, Police, Mechanic, Taxi, Aircrafts, Boats, Cars, Trucks, & 3 VIP Shops (Aircrafts, Boats & Cars)
* To make this Script fully work with `esx_policejob & esx_ambulancejob`
  * edit `client/vehicle.lua` and do a search for `esx_vehicleshop` & change it to `esx_advancedvehicleshop` then edit the `fxmanifest.lua` & remove the dependency for `esx_vehicleshop`.
* You can only sell vehicles at the shop you bought it from.
  * Example: If you a buy a vehicle at the Truck Shop you won't be able to sell it at the Car Shop.
* If you want to use the Ambulance or Police Shop you will need to Edit the sql to your needs before you upload it.
* I have added my VIP Aircraft, Boat & Car Shop but you will need to setup that on your own. There will be no help from me.
* This works perfectly with my esx_advancedgarage. I suggest using it over any other garage system including esx_policejob & esx_ambulancejob Garages.
* New System will pull Vehicle Name & Vehicle Category & save it in the Database. This way you don't need a vehicle_names.lua file.
* In order to Migrate Vehicle go to fxmanifest.lua and uncomment the 'server/migrate.lua'
* Config.Main.PlateUseSpace will add a Double Space in between the Letters and Numbers.

# Requirements:
* Required:
  * FiveM Client/Server Build 4267 or Higher
  * Set Game Build to Tuner Update `+set sv_enforceGameBuild tuner`
  * [ESX Legacy V1.6+]( https://github.com/esx-framework/esx-legacy/tree/1.6.0 )
* Optional:
  * [esx_advancedgarage]( https://github.com/HumanTree92/VENT_ESX_Scripts/tree/main/esx_advancedgarage )
  * [esx_dmvschool]( https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_dmvschool )
  * [esx_licenseshop]( https://github.com/HumanTree92/VENT_ESX_Scripts/tree/main/esx_licenseshop )

# Download & Installation:
1) Import the `esx_advancedvehicleshop.sql` into your database.
2) Place `esx_advancedvehicleshop` in your ESX Directory
3) Add `start esx_advancedvehicleshop` to your server.cfg
4) Edit the `config.lua` to your liking

# How to use Ambulance, Police, Mechanic, & Taxi Shop
1) For `vs_ambulance_categories` & `vs_police_categories` & `vs_mechanic_categories` & `vs_taxi_categories`
  * The column `name` should be the job_grades name
  * The column `label` should be the job_grades label
2) For `vs_ambulance` & `vs_police` & `vs_mechanic` & `vs_taxi`
  * The column `id` should start at 1 and so on.
  * The column `name` should be the vehicle name.
  * The column `model` should be spawn name.
  * The column `price` should be the vehicles price.
  * The column `category` should be the job_grades name
3) You can find Examples in the `esx_advancedvehicleshop.sql`

# Credits/Original Code:
* [ESX-Framework]( https://github.com/esx-framework )
  * [esx_vehicleshop]( https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_vehicleshop )
