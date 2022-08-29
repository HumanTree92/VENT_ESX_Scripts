# About esx_extraitems:
Edited/Made by Human Tree92 ([Velociti Entertainment Customs & Wiki]( http://www.velocitientertainment.com/customs/ ))

# Helpfull Info:
* Code was pulled from various Scripts out there. Credits have been Given.
* Has Ammo Boxes, Bandages, Binoculars, Bullet-Proof Vest, Dark Net, Defib, Drill, First Aid Kit, Lock Pick, Oxygen Mask, Repair Kit, Tire Kit, Vehicle GPS, Weapon Kit.
* Now using 2 Different Types of Ammo Boxes.
  * Advanced Ammo Boxes require players to purchase specific Ammo Boxes for their Guns. So if you need Pistol Ammo you must buy a Ammo Box Pistol.
  * Simple Ammo Boxes doesn't require players to purchase specific Ammo Boxes for their Guns. However there are 2 different sizes.
* Defib & Lock Pick use a chance system. Example: If lock pick fails you lose your lock pick. 

# Requirements:
* Required:
  * [ESX Legacy V1.6+]( https://github.com/esx-framework/esx-legacy/tree/1.6.0 )
  * [esx_shops]( https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_shops )
* Optional:
  * NONE

# Download & Installation:
1) Pick which SQL you want to use:
  1.1) If you want to use Advanced Ammo Boxes Import `esx_extraitems_advammo.sql` in your database
  1.2) If you want to use Simple Ammo Boxes Import `esx_extraitems_simammo.sql` in your database
  1.3) If you are using the new `esx_shops` please use `esx_shops.lua` on adding items
2) Place `esx_extraitems` in your ESX Directory
3) Add `start esx_extraitems` to your server.cfg
4) Edit the `config.lua` to your liking

# How to add Stuff to your Shops:
1) Depending on which Ammo Boxes you picked edit that SQL and go to the INSERT INTO `shops`
2) On the ones Marked `ExtraItemsShop` change them to the Shops that you want.
3) Import the Modified SQL to your DB.

# Credits/Original Code:
* [StockholmCityRP]( https://github.com/StockholmCityRP )
  * [esx_extraitems]( https://github.com/StockholmCityRP/esx_extraitems )
* [Vanheden]( https://github.com/Vanheden )
  * [esx_borrmaskin]( https://github.com/Vanheden/esx_borrmaskin )
* [Manups4e]( https://github.com/manups4e )
  * [esx_weashops_with_munitions]( https://github.com/manups4e/esx_weashops_with_munitions )
* [ESX-PUBLIC]( https://github.com/ESX-PUBLIC )
  * [eden_darknet]( https://github.com/ESX-PUBLIC/eden_darknet )
* [Clementinise]( https://github.com/clementinise )
  * [esx_repairkit]( https://github.com/clementinise/esx_repairkit )
* [bzisniper]( https://forum.cfx.re/u/bzisniper/summary )
  * [Standalone Firework Box on Ground]( https://forum.cfx.re/t/standalone-firework-box-on-ground/1407408 )
