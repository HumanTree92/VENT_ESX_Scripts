USE `es_extended`;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('darknet', 'Dark Net', 1, 0, 1),
	('bandage', 'Bandage', 1, 0, 1),
	('binoculars', 'Binoculars', 1, 0, 1),
	('boxbig', 'Ammo Box Big', 1, 0, 1),
	('boxsmall', 'Ammo Box Small', 1, 0, 1),
	('bulletproof', 'Bullet-Proof Vest', 1, 0, 1),
	('cleankit', 'Cleaning Kit', 1, 0, 1),
	('defib', 'Defib', 1, 0, 1),
	('drill', 'Drill', 1, 0, 1),
	('firework', 'Firework', 1, 0, 1),
	('firstaidkit', 'First Aid Kit', 1, 0, 1),
	('handcuffs', 'Handcuffs', 1, 0, 1),
	('handcuffkey', 'Handcuff Keys', 1, 0, 1),
	('lockpick', 'Lock Pick', 1, 0, 1),
	('oxygenmask', 'Oxygen Mask', 1, 0, 1),
	('repairkit', 'Repair Kit', 1, 0, 1),
	('tirekit', 'Tire Kit', 1, 0, 1),
	('vape', 'Vape', 1, 0, 1),
	('vehgps', 'Vehicle GPS', 1, 0, 1),
	('weakit', 'Weapon Kit', 1, 0, 1)
;

INSERT INTO `shops` (store, item, price) VALUES
	('ExtraItemsShop', 'darknet', 25),
	('ExtraItemsShop', 'bandage', 2),
	('ExtraItemsShop', 'binoculars', 10),
	('ExtraItemsShop', 'boxbig', 60),
	('ExtraItemsShop', 'boxsmall', 25),
	('ExtraItemsShop', 'bulletproof', 300),
	('ExtraItemsShop', 'cleankit', 5),
	('ExtraItemsShop', 'defib', 1200),
	('ExtraItemsShop', 'drill', 180),
	('ExtraItemsShop', 'firework', 15),
	('ExtraItemsShop', 'firstaidkit', 80),
	('ExtraItemsShop', 'handcuffs', 27),
	('ExtraItemsShop', 'handcuffkey', 5),
	('ExtraItemsShop', 'lockpick', 20),
	('ExtraItemsShop', 'oxygenmask', 400),
	('ExtraItemsShop', 'repairkit', 150),
	('ExtraItemsShop', 'tirekit', 25),
	('ExtraItemsShop', 'vape', 50),
	('ExtraItemsShop', 'vehgps', 25),
	('ExtraItemsShop', 'weakit', 75)
;
