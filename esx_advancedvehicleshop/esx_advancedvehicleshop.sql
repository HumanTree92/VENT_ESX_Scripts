USE `es_extended`;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft', 'Aircraft License'),
	('boating', 'Boating License')
;

CREATE TABLE `owned_vehicles` (
	`owner` varchar(60) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext NOT NULL,
	`type` VARCHAR(20) NOT NULL DEFAULT 'car',
	`job` VARCHAR(20) NOT NULL DEFAULT 'civ',
	`category` VARCHAR(50) DEFAULT NULL,
	`name` varchar(60) NOT NULL DEFAULT 'Unknown',
	`garage` VARCHAR(50) NOT NULL DEFAULT 'all',
	`fuel` int(11) NOT NULL DEFAULT '100',
	`stored` TINYINT(1) NOT NULL DEFAULT '0',
	`image` longtext,

	PRIMARY KEY (`plate`)
);

CREATE TABLE `vs_ambulance_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_ambulance_categories` (id, name, label) VALUES
	(1, 'ambulance', 'Jr. EMT'),
	(2, 'doctor', 'EMT'),
	(3, 'chief_doctor', 'Sr. EMT'),
	(4, 'boss', 'EMT Supervisor')
;

CREATE TABLE `vs_ambulance` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_ambulance` (id, name, model, price, category, image) VALUES
	(1, 'Ambulance', 'ambulance', 500, 'ambulance', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(2, 'Fire Truck', 'firetruk', 750, 'ambulance', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png'),
	(3, 'Ambulance', 'ambulance', 500, 'doctor', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(4, 'Fire Truck', 'firetruk', 750, 'doctor', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png'),
	(5, 'Ambulance', 'ambulance', 500, 'chief_doctor', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(6, 'Fire Truck', 'firetruk', 750, 'chief_doctor', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png'),
	(7, 'Ambulance', 'ambulance', 500, 'boss', 'https://wiki.rage.mp/images/thumb/f/f5/Ambulance.png/800px-Ambulance.png'),
	(8, 'Fire Truck', 'firetruk', 750, 'boss', 'https://wiki.rage.mp/images/thumb/5/5b/FireTruck.png/800px-FireTruck.png')
;

CREATE TABLE `vs_police_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_police_categories` (id, name, label) VALUES
	(1, 'recruit', 'Recruit'),
	(2, 'officer', 'Officer'),
	(3, 'sergeant', 'Sergeant'),
	(4, 'lieutenant', 'Lieutenant'),
	(5, 'boss', 'Chief')
;

CREATE TABLE `vs_police` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_police` (id, name, model, price, category, image) VALUES
	(1, 'Police Cruiser', 'police', 500, 'recruit', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(2, 'Police Cruiser', 'police2', 750, 'recruit', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(3, 'Police Cruiser', 'police', 500, 'officer', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(4, 'Police Cruiser', 'police2', 750, 'officer', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(5, 'Police Cruiser', 'police', 500, 'sergeant', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(6, 'Police Cruiser', 'police2', 750, 'sergeant', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(7, 'Police Cruiser', 'police', 500, 'lieutenant', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(8, 'Police Cruiser', 'police2', 750, 'lieutenant', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png'),
	(9, 'Police Cruiser', 'police', 500, 'boss', 'https://wiki.rage.mp/images/thumb/b/bf/Police.png/800px-Police.png'),
	(10, 'Police Cruiser', 'police2', 750, 'boss', 'https://wiki.rage.mp/images/thumb/c/c9/Police2.png/800px-Police2.png')
;

CREATE TABLE `vs_division_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_division_categories` (id, name, label) VALUES
	(1, 'aviation', 'Aviation')
;

CREATE TABLE `vs_divisions` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_divisions` (id, name, model, price, category, image) VALUES
	(1, 'Maverick', 'polmav', 1000, 'aviation', 'https://wiki.rage.mp/images/thumb/f/fc/Polmav.png/800px-Polmav.png')
;

CREATE TABLE `vs_mechanic_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_mechanic_categories` (id, name, label) VALUES
	(1, 'recrue', 'Recruit'),
	(2, 'novice', 'Novice'),
	(3, 'experimente', 'Experienced'),
	(4, 'chief', 'Chief'),
	(5, 'boss', 'Boss')
;

CREATE TABLE `vs_mechanic` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_mechanic` (id, name, model, price, category, image) VALUES
	(1, 'Flatbed', 'flatbed', 1000, 'recrue', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(2, 'Tow Truck', 'towtruck', 750, 'recrue', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(3, 'Tow Truck', 'towtruck2', 500, 'recrue', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(4, 'Flatbed', 'flatbed', 1000, 'novice', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(5, 'Tow Truck', 'towtruck', 750, 'novice', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(6, 'Tow Truck', 'towtruck2', 500, 'novice', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(7, 'Flatbed', 'flatbed', 1000, 'experimente', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(8, 'Tow Truck', 'towtruck', 750, 'experimente', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(9, 'Tow Truck', 'towtruck2', 500, 'experimente', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(10, 'Flatbed', 'flatbed', 1000, 'chief', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(11, 'Tow Truck', 'towtruck', 750, 'chief', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(12, 'Tow Truck', 'towtruck2', 500, 'chief', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png'),
	(13, 'Flatbed', 'flatbed', 1000, 'boss', 'https://wiki.rage.mp/images/thumb/c/c2/Flatbed.png/800px-Flatbed.png'),
	(14, 'Tow Truck', 'towtruck', 750, 'boss', 'https://wiki.rage.mp/images/thumb/5/52/Towtruck.png/800px-Towtruck.png'),
	(15, 'Tow Truck', 'towtruck2', 500, 'boss', 'https://wiki.rage.mp/images/thumb/3/34/Towtruck2.png/800px-Towtruck2.png')
;

CREATE TABLE `vs_taxi_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_taxi_categories` (id, name, label) VALUES
	(1, 'recrue', 'Recruit'),
	(2, 'novice', 'Novice'),
	(3, 'experimente', 'Experienced'),
	(4, 'uber', 'Uber'),
	(5, 'boss', 'Boss')
;

CREATE TABLE `vs_taxi` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_taxi` (id, name, model, price, category, image) VALUES
	(1, 'Taxi', 'taxi', 1000, 'recrue', 'https://wiki.rage.mp/images/a/a6/Taxi.png'),
	(2, 'Taxi', 'taxi', 1000, 'novice', 'https://wiki.rage.mp/images/a/a6/Taxi.png'),
	(3, 'Taxi', 'taxi', 1000, 'experimente', 'https://wiki.rage.mp/images/a/a6/Taxi.png'),
	(4, 'Taxi', 'taxi', 1000, 'uber', 'https://wiki.rage.mp/images/a/a6/Taxi.png'),
	(5, 'Taxi', 'taxi', 1000, 'boss', 'https://wiki.rage.mp/images/a/a6/Taxi.png')
;

CREATE TABLE `vs_aircraft_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_aircraft_categories` (id, name, label) VALUES
	(1, 'helis', 'Helicopters'),
	(2, 'planes', 'Planes')
;

CREATE TABLE `vs_aircrafts` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_aircrafts` (id, name, model, price, category, image) VALUES
	(1, 'Buzzard', 'buzzard2', 500000, 'helis', 'https://wiki.rage.mp/images/thumb/6/6e/Buzzard2.png/800px-Buzzard2.png'),
	(2, 'Frogger', 'frogger', 750000, 'helis', 'https://wiki.rage.mp/images/thumb/2/2d/Frogger.png/800px-Frogger.png'),
	(3, 'Havok', 'havok', 250000, 'helis', 'https://wiki.rage.mp/images/thumb/4/40/Havok.png/800px-Havok.png'),
	(4, 'Maverick', 'maverick', 625000, 'helis', 'https://wiki.rage.mp/images/thumb/7/73/Maverick.png/800px-Maverick.png'),
	(5, 'Sea Sparrow', 'seasparrow', 375000, 'helis', 'https://wiki.rage.mp/images/thumb/d/d5/Seasparrow.png/800px-Seasparrow.png'),
	(6, 'SuperVolito', 'supervolito', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/9/9e/Supervolito.png/800px-Supervolito.png'),
	(7, 'SuperVolito Carbon', 'supervolito2', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/a/a8/Supervolito2.png/800px-Supervolito2.png'),
	(8, 'Swift', 'swift', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/0/00/Swift.png/800px-Swift.png'),
	(9, 'Swift Deluxe', 'swift2', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/5/5f/Swift2.png/800px-Swift2.png'),
	(10, 'Volatus', 'volatus', 875000, 'helis', 'https://wiki.rage.mp/images/thumb/6/65/Volatus.png/800px-Volatus.png'),
	(20, 'Alpha Z1', 'alphaz1', 450000, 'planes', 'https://wiki.rage.mp/images/thumb/4/46/Alphaz1.png/800px-Alphaz1.png'),
	(21, 'Besra', 'besra', 500000, 'planes', 'https://wiki.rage.mp/images/thumb/3/35/Besra.png/800px-Besra.png'),
	(22, 'Cuban 800', 'cuban800', 200000, 'planes', 'https://wiki.rage.mp/images/thumb/6/63/Cuban800.png/800px-Cuban800.png'),
	(23, 'Dodo', 'dodo', 350000, 'planes', 'https://wiki.rage.mp/images/thumb/f/fc/Dodo.png/800px-Dodo.png'),
	(24, 'Duster', 'duster', 100000, 'planes', 'https://wiki.rage.mp/images/thumb/a/a0/Duster.png/800px-Duster.png'),
	(25, 'Howard NX25', 'howard', 450000, 'planes', 'https://wiki.rage.mp/images/thumb/0/09/Howard.png/800px-Howard.png'),
	(26, 'Luxor', 'luxor', 700000, 'planes', 'https://wiki.rage.mp/images/f/f3/Luxor.png'),
	(27, 'Luxor Deluxe', 'luxor2', 750000, 'planes', 'https://wiki.rage.mp/images/thumb/a/a8/Luxor2.png/800px-Luxor2.png'),
	(28, 'Mammatus', 'mammatus', 250000, 'planes', 'https://wiki.rage.mp/images/thumb/a/a7/Mammatus.png/800px-Mammatus.png'),
	(29, 'Ultra Light', 'microlight', 50000, 'planes', 'https://wiki.rage.mp/images/thumb/6/62/Microlight.png/800px-Microlight.png'),
	(30, 'Nimbus', 'nimbus', 600000, 'planes', 'https://wiki.rage.mp/images/thumb/c/c8/Nimbus.png/800px-Nimbus.png'),
	(31, 'Rogue', 'rogue', 450000, 'planes', 'https://wiki.rage.mp/images/thumb/5/59/Rogue.png/800px-Rogue.png'),
	(32, 'Sea Breeze', 'seabreeze', 400000, 'planes', 'https://wiki.rage.mp/images/thumb/a/ae/Seabreeze.png/800px-Seabreeze.png'),
	(33, 'Shamal', 'shamal', 650000, 'planes', 'https://wiki.rage.mp/images/thumb/b/be/Shamal.png/800px-Shamal.png'),
	(34, 'Mallard', 'stunt', 150000, 'planes', 'https://wiki.rage.mp/images/thumb/a/aa/Stunt.png/800px-Stunt.png'),
	(35, 'Velum', 'velum', 300000, 'planes', 'https://wiki.rage.mp/images/c/c3/Velum.png'),
	(36, 'Velum 5-Seater', 'velum2', 300000, 'planes', 'https://wiki.rage.mp/images/thumb/e/e7/Velum2.png/800px-Velum2.png'),
	(37, 'Vestra', 'vestra', 500000, 'planes', 'https://wiki.rage.mp/images/thumb/8/8f/Vestra.png/800px-Vestra.png')
;

CREATE TABLE `vs_boat_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_boat_categories` (id, name, label) VALUES
	(1, 'boats', 'Boats'),
	(2, 'subs', 'Submersibles')
;

CREATE TABLE `vs_boats` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_boats` (id, name, model, price, category, image) VALUES
	(1, 'Dinghy 1', 'dinghy', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/3/39/Dinghy.png/800px-Dinghy.png'),
	(2, 'Dinghy 2', 'dinghy2', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/0/09/Dinghy2.png/800px-Dinghy2.png'),
	(3, 'Dinghy 3', 'dinghy3', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/5/56/Dinghy3.png/800px-Dinghy3.png'),
	(4, 'Dinghy 4', 'dinghy4', 15000, 'boats', 'https://wiki.rage.mp/images/thumb/8/86/Dinghy4.png/800px-Dinghy4.png'),
	(5, 'Jetmax', 'jetmax', 22500, 'boats', 'https://wiki.rage.mp/images/thumb/e/e6/Jetmax.png/800px-Jetmax.png'),
	(6, 'Marquis', 'marquis', 37500, 'boats', 'https://wiki.rage.mp/images/thumb/7/70/Marquis.png/800px-Marquis.png'),
	(7, 'Longfin', 'longfin', 40000, 'boats', 'https://wiki.rage.mp/images/thumb/3/34/0x6EF89CCC.png/800px-0x6EF89CCC.png'),
	(8, 'Seashark', 'seashark', 8000, 'boats', 'https://wiki.rage.mp/images/thumb/e/e7/Seashark.png/800px-Seashark.png'),
	(9, 'Seashark 3', 'seashark3', 8000, 'boats', 'https://wiki.rage.mp/images/thumb/f/f3/Seashark3.png/800px-Seashark3.png'),
	(10, 'Speeder', 'speeder', 35000, 'boats', 'https://wiki.rage.mp/images/thumb/f/f4/Speeder.png/800px-Speeder.png'),
	(11, 'Speeder 2', 'speeder2', 35000, 'boats', 'https://wiki.rage.mp/images/thumb/8/89/Speeder2.png/800px-Speeder2.png'),
	(12, 'Squalo', 'squalo', 25000, 'boats', 'https://wiki.rage.mp/images/thumb/e/ec/Squalo.png/800px-Squalo.png'),
	(13, 'Suntrap', 'suntrap', 27500, 'boats', 'https://wiki.rage.mp/images/thumb/2/27/Suntrap.png/800px-Suntrap.png'),
	(14, 'Toro', 'toro', 30000, 'boats', 'https://wiki.rage.mp/images/thumb/9/94/Toro.png/800px-Toro.png'),
	(15, 'Toro 2', 'toro2', 32500, 'boats', 'https://wiki.rage.mp/images/thumb/d/d7/Toro2.png/800px-Toro2.png'),
	(16, 'Tropic', 'tropic', 20000, 'boats', 'https://wiki.rage.mp/images/thumb/8/86/Tropic.png/800px-Tropic.png'),
	(17, 'Tropic 2', 'tropic2', 20000, 'boats', 'https://wiki.rage.mp/images/thumb/a/a7/Tropic2.png/800px-Tropic2.png'),
	(20, 'Kraken', 'submersible2', 32500, 'subs', 'https://wiki.rage.mp/images/thumb/6/62/Submersible2.png/800px-Submersible2.png'),
	(21, 'Submarine', 'submersible', 30000, 'subs', 'https://wiki.rage.mp/images/3/3c/Submersible.png'),
	(22, 'Avisa', 'avisa', 35000, 'subs', 'https://wiki.rage.mp/images/thumb/1/19/0x9A474B5E.png/800px-0x9A474B5E.png')
;

CREATE TABLE `vs_car_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_car_categories` (id, name, label) VALUES
	(1, 'cycles', 'Cycles'),
	(2, 'compacts', 'Compacts'),
	(3, 'coupes', 'Coupes'),
	(4, 'motorcycles', 'Motorcycles'),
	(5, 'muscles', 'Muscles'),
	(6, 'offroads', 'Off-Roads'),
	(7, 'sedans', 'Sedans'),
	(8, 'sports', 'Sports'),
	(9, 'sportsclassics', 'Sports Classics'),
	(10, 'supers', 'Supers'),
	(11, 'suvs', 'SUVs'),
	(12, 'vans', 'Vans')
;

CREATE TABLE `vs_cars` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_cars` (id, name, model, price, category, image) VALUES
	(1, 'Asbo', 'asbo', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/c/cb/Asbo.png/800px-Asbo.png'),
	(2, 'Blista', 'blista', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/5/58/Blista.png/800px-Blista.png'),
	(3, 'Brioso R/A', 'brioso', 17500, 'compacts', 'https://wiki.rage.mp/images/thumb/6/6f/Brioso.png/800px-Brioso.png'),
	(4, 'Brioso 300', 'brioso2', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/4/41/0x55365079.png/800px-0x55365079.png'),
	(5, 'Club', 'club', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/5/50/Club.png/800px-Club.png'),
	(6, 'Dilettante', 'dilettante', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/b/b9/Dilettante.png/800px-Dilettante.png'),
	(7, 'Issi', 'issi2', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/0/0b/Issi2.png/800px-Issi2.png'),
	(8, 'Issi Classic', 'issi3', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/7/73/Issi3.png/800px-Issi3.png'),
	(9, 'Kanjo Blista', 'kanjo', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/2/25/Kanjo.png/800px-Kanjo.png'),
	(10, 'Panto', 'panto', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/e/e5/Panto.png/800px-Panto.png'),
	(11, 'Prairie', 'prairie', 15000, 'compacts', 'https://wiki.rage.mp/images/thumb/3/3d/Prairie.png/800px-Prairie.png'),
	(12, 'Rhapsody', 'rhapsody', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/e/e2/Rhapsody.png/800px-Rhapsody.png'),
	(13, 'WeEvil', 'weevil', 12500, 'compacts', 'https://wiki.rage.mp/images/thumb/c/c0/0x61FE4D6A.png/800px-0x61FE4D6A.png'),
	(50, 'Asea', 'asea', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/c/ce/Asea.png/800px-Asea.png'),
	(51, 'Asterope', 'asterope', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/0/05/Asterope.png/800px-Asterope.png'),
	(52, 'Cognoscenti S', 'cog55', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/d/d5/Cog55.png/800px-Cog55.png'),
	(53, 'Cognoscenti S Armored', 'cog552', 75000, 'sedans', 'https://wiki.rage.mp/images/thumb/7/79/Cog552.png/800px-Cog552.png'),
	(54, 'Cognoscenti L', 'cognoscenti', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/5/51/Cognoscenti.png/800px-Cognoscenti.png'),
	(55, 'Cognoscenti L Armored', 'cognoscenti2', 75000, 'sedans', 'https://wiki.rage.mp/images/thumb/2/2e/Cognoscenti2.png/800px-Cognoscenti2.png'),
	(56, 'Emperor', 'emperor', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/c/c5/Emperor.png/800px-Emperor.png'),
	(57, 'Emperor 2', 'emperor2', 10000, 'sedans', 'https://wiki.rage.mp/images/thumb/1/16/Emperor2.png/800px-Emperor2.png'),
	(58, 'Fugitive', 'fugitive', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/7/73/Fugitive.png/800px-Fugitive.png'),
	(59, 'Glendale', 'glendale', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/b/b2/Glendale.png/800px-Glendale.png'),
	(60, 'Glendale Custom', 'glendale2', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/b/bd/Glendale2.png/800px-Glendale2.png'),
	(61, 'Ingot', 'ingot', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/7/74/Ingot.png/800px-Ingot.png'),
	(62, 'Intruder', 'intruder', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/9/92/Intruder.png/800px-Intruder.png'),
	(63, 'Premier', 'premier', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/9/9d/Premier.png/800px-Premier.png'),
	(64, 'Primo', 'primo', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/4/45/Primo.png/800px-Primo.png'),
	(65, 'Primo Custom', 'primo2', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/3/30/Primo2.png/800px-Primo2.png'),
	(66, 'Regina', 'regina', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/5/5f/Regina.png/800px-Regina.png'),
	(67, 'Romero Hearse', 'romero', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/7/73/Romero.png/800px-Romero.png'),
	(68, 'Schafter', 'schafter2', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/c/cc/Schafter2.png/800px-Schafter2.png'),
	(69, 'Schafter V12 Armored', 'schafter5', 40000, 'sedans', 'https://wiki.rage.mp/images/thumb/2/28/Schafter5.png/800px-Schafter5.png'),
	(70, 'Schafter LWB Armored', 'schafter6', 40000, 'sedans', 'https://wiki.rage.mp/images/thumb/a/a6/Schafter6.png/800px-Schafter6.png'),
	(71, 'Stafford', 'stafford', 25000, 'sedans', 'https://wiki.rage.mp/images/e/e9/Stafford.png'),
	(72, 'Stanier', 'stanier', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/5/57/Stanier.png/800px-Stanier.png'),
	(73, 'Stratum', 'stratum', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/b/ba/Stratum.png/800px-Stratum.png'),
	(74, 'Stretch', 'stretch', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/8/8a/Stretch.png/800px-Stretch.png'),
	(75, 'Super Diamond', 'superd', 50000, 'sedans', 'https://wiki.rage.mp/images/thumb/6/6e/Superd.png/800px-Superd.png'),
	(76, 'Surge', 'surge', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/1/1a/Surge.png/800px-Surge.png'),
	(77, 'Tailgater', 'tailgater', 15000, 'sedans', 'https://wiki.rage.mp/images/thumb/a/af/Tailgater.png/800px-Tailgater.png'),
	(78, 'Warrener', 'warrener', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/2/22/Warrener.png/800px-Warrener.png'),
	(79, 'Washington', 'washington', 12500, 'sedans', 'https://wiki.rage.mp/images/thumb/e/e2/Washington.png/800px-Washington.png'),
	(100, 'Baller', 'baller', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/7/79/Baller.png/800px-Baller.png'),
	(101, 'Baller 2', 'baller2', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/9/98/Baller2.png/800px-Baller2.png'),
	(102, 'Baller LE', 'baller3', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/9/9b/Baller3.png/800px-Baller3.png'),
	(103, 'Baller LE LWB', 'baller4', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/e/e8/Baller4.png/800px-Baller4.png'),
	(104, 'Baller LE Armored', 'baller5', 50000, 'suvs', 'https://wiki.rage.mp/images/thumb/3/34/Baller5.png/800px-Baller5.png'),
	(105, 'Baller LE LWB Armored', 'baller6', 50000, 'suvs', 'https://wiki.rage.mp/images/thumb/8/81/Baller6.png/800px-Baller6.png'),
	(106, 'BeeJay XL', 'bjxl', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/d/da/Bjxl.png/800px-Bjxl.png'),
	(107, 'Cavalcade', 'cavalcade', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/9/9e/Cavalcade.png/800px-Cavalcade.png'),
	(108, 'Cavalcade 2', 'cavalcade2', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/b/bc/Cavalcade2.png/800px-Cavalcade2.png'),
	(109, 'Dubsta', 'dubsta', 45000, 'suvs', 'https://wiki.rage.mp/images/thumb/e/ec/Dubsta.png/800px-Dubsta.png'),
	(110, 'Dubsta Luxuary', 'dubsta2', 45000, 'suvs', 'https://wiki.rage.mp/images/thumb/3/36/Dubsta2.png/800px-Dubsta2.png'),
	(111, 'Fhantom', 'fq2', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/a/a4/Fq2.png/800px-Fq2.png'),
	(112, 'Grabger', 'granger', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/4/4d/Granger.png/800px-Granger.png'),
	(113, 'Gresley', 'gresley', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/d/d6/Gresley.png/800px-Gresley.png'),
	(114, 'Habanero', 'habanero', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/1/1e/Habanero.png/800px-Habanero.png'),
	(115, 'Huntley S', 'huntley', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/1/1c/Huntley.png/800px-Huntley.png'),
	(116, 'Landstalker', 'landstalker', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/7/70/Landstalker.png/800px-Landstalker.png'),
	(117, 'Landstalker XL', 'landstalker2', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/b/b1/Landstalker2.png/800px-Landstalker2.png'),
	(118, 'Mesa', 'mesa', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/c/cc/Mesa.png/800px-Mesa.png'),
	(119, 'Novak', 'novak', 25000, 'suvs', 'https://wiki.rage.mp/images/7/76/Novak.png'),
	(120, 'Patriot', 'patriot', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/1/12/Patriot.png/800px-Patriot.png'),
	(121, 'Patriot Stretch', 'patriot2', 45000, 'suvs', 'https://wiki.rage.mp/images/8/83/Patriot2.png'),
	(122, 'Radius', 'radi', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/9/9c/Radi.png/800px-Radi.png'),
	(123, 'Rebla GTS', 'rebla', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/9/94/Rebla.png/800px-Rebla.png'),
	(124, 'Rocoto', 'rocoto', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/2/23/Rocoto.png/800px-Rocoto.png'),
	(125, 'Seminole', 'seminole', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/c/cc/Seminole.png/800px-Seminole.png'),
	(126, 'Seminole Frontier', 'seminole2', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/d/d9/Seminole2.png/800px-Seminole2.png'),
	(127, 'Serrano', 'serrano', 22500, 'suvs', 'https://wiki.rage.mp/images/thumb/a/ac/Serrano.png/800px-Serrano.png'),
	(128, 'Toros', 'toros', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/f/f1/Toros.png/800px-Toros.png'),
	(129, 'XLS', 'xls', 25000, 'suvs', 'https://wiki.rage.mp/images/thumb/0/0f/Xls.png/800px-Xls.png'),
	(130, 'XLS Armored', 'xls2', 50000, 'suvs', 'https://wiki.rage.mp/images/thumb/3/35/Xls2.png/800px-Xls2.png'),
	(150, 'Cognoscenti Cabrio', 'cogcabrio', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/1/1b/CogCabrio.png/800px-CogCabrio.png'),
	(151, 'Exemplar', 'exemplar', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/a/a4/Exemplar.png/800px-Exemplar.png'),
	(152, 'F620', 'f620', 45000, 'coupes', 'https://wiki.rage.mp/images/thumb/2/21/F620.png/800px-F620.png'),
	(153, 'Felon', 'felon', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/0/04/Felon.png/800px-Felon.png'),
	(154, 'Felon GT', 'felon2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/6/6e/Felon2.png/800px-Felon2.png'),
	(155, 'Jackal', 'jackal', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/7/70/Jackal.png/800px-Jackal.png'),
	(156, 'Oracle XS', 'oracle', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/1/17/Oracle.png/800px-Oracle.png'),
	(157, 'Oracle', 'oracle2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/4/4d/Oracle2.png/800px-Oracle2.png'),
	(158, 'Sentinel', 'sentinel', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/9/91/Sentinel.png/800px-Sentinel.png'),
	(159, 'Sentinel XS', 'sentinel2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/d/dd/Sentinel2.png/800px-Sentinel2.png'),
	(160, 'Windsor', 'windsor', 50000, 'coupes', 'https://wiki.rage.mp/images/thumb/2/2d/Windsor.png/800px-Windsor.png'),
	(161, 'Windsor Drop', 'windsor2', 50000, 'coupes', 'https://wiki.rage.mp/images/thumb/5/57/Windsor2.png/800px-Windsor2.png'),
	(162, 'Zion', 'zion', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/5/51/Zion.png/800px-Zion.png'),
	(163, 'Zion Cabrio', 'zion2', 35000, 'coupes', 'https://wiki.rage.mp/images/thumb/f/f2/Zion2.png/800px-Zion2.png'),
	(200, 'Blade', 'blade', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/a/ad/Blade.png/800px-Blade.png'),
	(201, 'Buccaneer', 'buccaneer', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/d/de/Buccaneer.png/800px-Buccaneer.png'),
	(202, 'Buccaneer Rider', 'buccaneer2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/16/Buccaneer2.png/800px-Buccaneer2.png'),
	(203, 'Chino', 'chino', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/4d/Chino.png/800px-Chino.png'),
	(204, 'Chino Custom', 'chino2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/61/Chino2.png/800px-Chino2.png'),
	(205, 'Clique', 'clique', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/3c/Clique.png/800px-Clique.png'),
	(206, 'Coquette BlackFin', 'coquette3', 50000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/67/Coquette3.png/800px-Coquette3.png'),
	(207, 'Deviant', 'deviant', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/d/d5/Deviant.png/800px-Deviant.png'),
	(208, 'Dominator', 'dominator', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/6e/Dominator.png/800px-Dominator.png'),
	(209, 'Dominator Pisswasser', 'dominator2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/57/Dominator2.png/800px-Dominator2.png'),
	(210, 'Dominator GTX', 'dominator3', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/ba/Dominator3.png/800px-Dominator3.png'),
	(211, 'Dukes', 'dukes', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/6/6e/Dukes.png/800px-Dukes.png'),
	(212, 'Dukes Beater', 'dukes3', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/45/Dukes3.png/800px-Dukes3.png'),
	(213, 'Ellie', 'ellie', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/e/ef/Ellie.png/800px-Ellie.png'),
	(214, 'Faction', 'faction', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/55/Faction.png/800px-Faction.png'),
	(215, 'Faction Custom', 'faction2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/41/Faction2.png/800px-Faction2.png'),
	(216, 'Faction Custom Donk', 'faction3', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/a/a8/Faction3.png/800px-Faction3.png'),
	(217, 'Gauntlet', 'gauntlet', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/7/71/Gauntlet.png/800px-Gauntlet.png'),
	(218, 'Gauntlet Redwood', 'gauntlet2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/b0/Gauntlet2.png/800px-Gauntlet2.png'),
	(219, 'Gauntlet Classic', 'gauntlet3', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/8/88/Gauntlet3.png/800px-Gauntlet3.png'),
	(220, 'Gauntlet Hellfire', 'gauntlet4', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/e/ec/Gauntlet4.png/800px-Gauntlet4.png'),
	(221, 'Gauntlet Classic Custom', 'gauntlet5', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/d/de/Gauntlet5.png/800px-Gauntlet5.png'),
	(222, 'Hermes', 'hermes', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/0d/Hermes.png/800px-Hermes.png'),
	(223, 'Hotknife', 'hotknife', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/16/Hotknife.png/800px-Hotknife.png'),
	(224, 'Hustler', 'hustler', 30000, 'muscles', 'https://wiki.rage.mp/images/3/3f/Hustler.png'),
	(225, 'Impaler', 'impaler', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/31/Impaler.png/800px-Impaler.png'),
	(226, 'Lurcher', 'lurcher', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/03/Lurcher.png/800px-Lurcher.png'),
	(227, 'Manana Custom', 'manana2', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/9/9e/Manana2.png/800px-Manana2.png'),
	(228, 'Moonbeam', 'moonbeam', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/5d/Moonbeam.png/800px-Moonbeam.png'),
	(229, 'Moonbeam Custom', 'moonbeam2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/c/c1/Moonbeam2.png/800px-Moonbeam2.png'),
	(230, 'Nightshade', 'nightshade', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/e/ec/Nightshade.png/800px-Nightshade.png'),
	(231, 'Peyote Gasser', 'peyote2', 30000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/35/Peyote2.png/800px-Peyote2.png'),
	(232, 'Phoenix', 'phoenix', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/53/Pheonix.png/800px-Pheonix.png'),
	(233, 'Picador', 'picador', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/15/Picador.png/800px-Picador.png'),
	(234, 'Rat-Loader', 'ratloader', 12500, 'muscles', 'https://wiki.rage.mp/images/thumb/7/7a/Ratloader.png/800px-Ratloader.png'),
	(235, 'Rat-Truck', 'ratloader2', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/b7/Ratloader2.png/800px-Ratloader2.png'),
	(236, 'Ruiner', 'ruiner', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/b4/Ruiner.png/800px-Ruiner.png'),
	(237, 'Sabre Turbo', 'sabregt', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/04/Sabregt.png/800px-Sabregt.png'),
	(238, 'Sabre Turbo Custom', 'sabregt2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/b/ba/Sabregt2.png/800px-Sabregt2.png'),
	(239, 'Slamvan', 'slamvan', 15000, 'muscles', 'https://wiki.rage.mp/images/3/39/SlamVan.png'),
	(240, 'Slamvan Lost', 'slamvan2', 15000, 'muscles', 'https://wiki.rage.mp/images/3/3a/SlamVan2.png'),
	(241, 'Slamvan Custom', 'slamvan3', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/f/fe/Slamvan3.png/800px-Slamvan3.png'),
	(242, 'Stallion', 'stalion', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/c/ce/Stalion.png/800px-Stalion.png'),
	(243, 'Stallion Burger Shot', 'stalion2', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/4a/Stalion2.png/800px-Stalion2.png'),
	(244, 'Tampa', 'tampa', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/3/30/Tampa.png/800px-Tampa.png'),
	(245, 'Tulip', 'tulip', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/c/cf/Tulip.png/800px-Tulip.png'),
	(246, 'Vamos', 'vamos', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/0/07/Vamos.png/800px-Vamos.png'),
	(247, 'Vigero', 'vigero', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/2/22/Vigero.png/800px-Vigero.png'),
	(248, 'Virgo', 'virgo', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/41/Virgo.png/800px-Virgo.png'),
	(249, 'Virgo Classic Custom', 'virgo2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/8/81/Virgo2.png/800px-Virgo2.png'),
	(250, 'Virgo Classic', 'virgo3', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/4/4d/Virgo3.png/800px-Virgo3.png'),
	(251, 'Voodoo Custom', 'voodoo', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/1/1e/Voodoo.png/800px-Voodoo.png'),
	(252, 'Voodoo', 'voodoo2', 12500, 'muscles', 'https://wiki.rage.mp/images/thumb/5/5e/Voodoo2.png/800px-Voodoo2.png'),
	(253, 'Yosemite', 'yosemite', 15000, 'muscles', 'https://wiki.rage.mp/images/thumb/7/7a/Yosemite.png/800px-Yosemite.png'),
	(254, 'Yosemite Drift', 'yosemite2', 20000, 'muscles', 'https://wiki.rage.mp/images/thumb/5/58/Yosemite2.png/800px-Yosemite2.png'),
	(260, 'Roosevelt', 'btype', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/6/64/Btype.png/800px-Btype.png'),
	(261, 'Franken Strange', 'btype3', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/3/34/Btype3.png/800px-Btype3.png'),
	(262, 'Roosevelt Valor', 'btype2', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/9/98/Btype2.png/800px-Btype2.png'),
	(263, 'Casco', 'casco', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/d/d7/Casco.png/800px-Casco.png'),
	(264, 'Cheburek', 'cheburek', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/4/4f/Cheburek.png/800px-Cheburek.png'),
	(265, 'Cheetah Classic', 'cheetah2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/d/dd/Cheetah2.png/800px-Cheetah2.png'),
	(266, 'Coquette Classic', 'coquette2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/8a/Coquette2.png/800px-Coquette2.png'),
	(267, 'Dynasty', 'dynasty', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/8/88/Dynasty.png'),
	(268, 'Fagaloa', 'fagaloa', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/1/15/Fagaloa.png/800px-Fagaloa.png'),
	(269, 'Stirling GT', 'feltzer3', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/0/0b/Feltzer3.png/800px-Feltzer3.png'),
	(270, 'GT 500', 'gt500', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/84/Gt500.png/800px-Gt500.png'),
	(271, 'Infernus Classic', 'infernus2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/9/91/Infernus2.png/800px-Infernus2.png'),
	(272, 'Mamba', 'mamba', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/c/c0/Mamba.png/800px-Mamba.png'),
	(273, 'Manana', 'manana', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/50/Manana.png/800px-Manana.png'),
	(274, 'Michelli GT', 'michelli', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/1/15/Michelli.png'),
	(275, 'Monroe', 'monroe', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/6/64/Monroe.png/800px-Monroe.png'),
	(276, 'Nebula Turbo', 'nebula', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/e/ea/Nebula.png'),
	(277, 'Peyote', 'peyote', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/2/21/Peyote.png/800px-Peyote.png'),
	(278, 'Peyote Gasser', 'peyote3', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/d/d9/Peyote3.png/800px-Peyote3.png'),
	(279, 'Pigalle', 'pigalle', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/7/76/Pigalle.png/800px-Pigalle.png'),
	(280, 'Rapid GT Classic', 'rapidgt3', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/0/09/Rapidgt3.png/800px-Rapidgt3.png'),
	(281, 'Retinue', 'retinue', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/53/Retinue.png/800px-Retinue.png'),
	(282, 'Retinue MK II', 'retinue2', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/86/Retinue2.png/800px-Retinue2.png'),
	(283, 'Savestra', 'savestra', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/2/26/Savestra.png/800px-Savestra.png'),
	(284, 'Stinger', 'stinger', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/b/b6/Stinger.png/800px-Stinger.png'),
	(285, 'Stinger GT', 'stingergt', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/8d/Stingergt.png/800px-Stingergt.png'),
	(286, 'Swinger', 'swinger', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/8/86/Swinger.png'),
	(287, 'Torero', 'torero', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/5f/Torero.png/800px-Torero.png'),
	(288, 'Tornado', 'tornado', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/4/40/Tornado.png/800px-Tornado.png'),
	(289, 'Tornado 2', 'tornado2', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/0/05/Tornado2.png/800px-Tornado2.png'),
	(290, 'Tornado 3', 'tornado3', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/7/7d/Tornado3.png/800px-Tornado3.png'),
	(291, 'Tornado 4', 'tornado4', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/f/fa/Tornado4.png/800px-Tornado4.png'),
	(292, 'Tornado Custom', 'tornado5', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/8/83/Tornado5.png/800px-Tornado5.png'),
	(293, 'Tornado Rat Rod', 'tornado6', 35000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/6/69/Tornado6.png/800px-Tornado6.png'),
	(294, 'Turismo Classic', 'turismo2', 50000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/f/fa/Turismo2.png/800px-Turismo2.png'),
	(295, 'Viseris', 'viseris', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/2/24/Viseris.png/800px-Viseris.png'),
	(296, '190z', 'z190', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/e/e1/Z190.png'),
	(297, 'Zion Classic', 'zion3', 30000, 'sportsclassics', 'https://wiki.rage.mp/images/5/5a/Zion3.png'),
	(298, 'Z-Type', 'ztype', 40000, 'sportsclassics', 'https://wiki.rage.mp/images/thumb/5/56/Ztype.png/800px-Ztype.png'),
	(300, 'Alpha', 'alpha', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/a/a8/Alpha.png/800px-Alpha.png'),
	(301, 'Banshee', 'banshee', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/d/d3/Banshee.png/800px-Banshee.png'),
	(302, 'Bestia GTS', 'bestiagts', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/5c/Bestiagts.png/800px-Bestiagts.png'),
	(303, 'Blista Compact', 'blista2', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/0/0c/Blista2.png/800px-Blista2.png'),
	(304, 'Blista Go Go Monkey', 'blista3', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/8/8c/Blista3.png/800px-Blista3.png'),
	(305, 'Buffalo', 'buffalo', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/0/0a/Buffalo.png/800px-Buffalo.png'),
	(306, 'Buffalo S', 'buffalo2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/2c/Buffalo2.png/800px-Buffalo2.png'),
	(307, 'Buffalo Sprunk', 'buffalo3', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/6/68/Buffalo3.png/800px-Buffalo3.png'),
	(308, 'Carbonizzare', 'carbonizzare', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/4/43/Carbonizzare.png/800px-Carbonizzare.png'),
	(309, 'Comet', 'comet2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/c/cb/Comet2.png/800px-Comet2.png'),
	(310, 'Comet Retro Custom', 'comet3', 52500, 'sports', 'https://wiki.rage.mp/images/thumb/b/b6/Comet3.png/800px-Comet3.png'),
	(311, 'Comet Safari', 'comet4', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f1/Comet4.png/800px-Comet4.png'),
	(312, 'Comet SR', 'comet5', 55000, 'sports', 'https://wiki.rage.mp/images/c/ca/Comet5.png'),
	(313, 'Coquette', 'coquette', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/d/d6/Coquette.png/800px-Coquette.png'),
	(314, 'Coquette D10', 'coquette4', 100000, 'sports', 'https://wiki.rage.mp/images/thumb/9/97/Coquette4.png/800px-Coquette4.png'),
	(315, '8F Drafter', 'drafter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/a/aa/Drafter.png/800px-Drafter.png'),
	(316, 'Elegy Retro Custom', 'elegy', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/e/ea/Elegy.png/800px-Elegy.png'),
	(317, 'Elegy RH8', 'elegy2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/3/33/Elegy2.png/800px-Elegy2.png'),
	(318, 'Feltzer', 'feltzer2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/7c/Feltzer2.png/800px-Feltzer2.png'),
	(319, 'Flash GT', 'flashgt', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/8/80/Flashgt.png/800px-Flashgt.png'),
	(320, 'Furore GT', 'furoregt', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/c/cb/Furoregt.png/800px-Furoregt.png'),
	(321, 'Fusilade', 'fusilade', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/56/Fusilade.png/800px-Fusilade.png'),
	(322, 'Futo', 'futo', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/0/04/Futo.png/800px-Futo.png'),
	(323, 'GB200', 'gb200', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/3/35/Gb200.png/800px-Gb200.png'),
	(324, 'Hotring Sabre', 'hotring', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/26/Hotring.png/800px-Hotring.png'),
	(325, 'Imorgon', 'imorgon', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1f/Imorgon.png/800px-Imorgon.png'),
	(326, 'Issi Sport', 'issi7', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/0/04/Issi7.png/727px-Issi7.png'),
	(327, 'Itali GTO', 'italigto', 100000, 'sports', 'https://wiki.rage.mp/images/thumb/8/83/ItaliGTO.png/800px-ItaliGTO.png'),
	(328, 'Itali RSX', 'italirsx', 100000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1a/0xBB78956A.png/800px-0xBB78956A.png'),
	(329, 'Jester', 'jester', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/e/e0/Jester.png/800px-Jester.png'),
	(330, 'Jester (Racecar)', 'jester2', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/3/34/Jester2.png/800px-Jester2.png'),
	(331, 'Jester Classic', 'jester3', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/1/19/Jester3.png/800px-Jester3.png'),
	(332, 'Jugular', 'jugular', 50000, 'sports', 'https://wiki.rage.mp/images/6/69/Jugular.png'),
	(333, 'Khamelion', 'khamelion', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/2e/Khamelion.png/800px-Khamelion.png'),
	(334, 'Komoda', 'komoda', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/4/47/Komoda.png/800px-Komoda.png'),
	(335, 'Kuruma', 'kuruma', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/8/8f/Kuruma.png/800px-Kuruma.png'),
	(336, 'Locust', 'locust', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1e/Locust.png/780px-Locust.png'),
	(337, 'Lynx', 'lynx', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/a/a7/Lynx2.png/800px-Lynx2.png'),
	(338, 'Massacro', 'massacro', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/78/Massacro.png/800px-Massacro.png'),
	(339, 'Massacro (Racecar)', 'massacro2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/b/be/Massacro2.png/800px-Massacro2.png'),
	(340, 'Neo', 'neo', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/74/Neo.png/800px-Neo.png'),
	(341, 'Neon', 'neon', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/1/17/Neon.png/800px-Neon.png'),
	(342, '9F', 'ninef', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/59/Ninef.png/800px-Ninef.png'),
	(343, '9F Cabrio', 'ninef2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f6/Ninef2.png/800px-Ninef2.png'),
	(344, 'Omnis', 'omnis', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/1/12/Omnis.png/800px-Omnis.png'),
	(345, 'Paragon R', 'paragon', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/1/1e/Paragon.png/800px-Paragon.png'),
	(346, 'Pariah', 'pariah', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/d/df/Pariah.png/800px-Pariah.png'),
	(347, 'Penumbra', 'penumbra', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/9/93/Penumbra.png/800px-Penumbra.png'),
	(348, 'Penumbra FF', 'penumbra2', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/d/dd/Penumbra2.png/800px-Penumbra2.png'),
	(349, 'Raiden', 'raiden', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/5/5f/Raiden.png/800px-Raiden.png'),
	(350, 'Rapid GT', 'rapidgt', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/e/e9/Rapidgt.png/800px-Rapidgt.png'),
	(351, 'Rapid GT 2', 'rapidgt2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/3/3e/Rapidgt2.png/800px-Rapidgt2.png'),
	(352, 'Raptor', 'raptor', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/0/08/Raptor.png/800px-Raptor.png'),
	(353, 'Revolter', 'revolter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/24/Revolter.png/800px-Revolter.png'),
	(354, 'Ruston', 'ruston', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/b/ba/Ruston.png/800px-Ruston.png'),
	(355, 'Schafter V12', 'schafter3', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/a/a9/Schafter3.png/800px-Schafter3.png'),
	(356, 'Schafter LWB', 'schafter4', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/2/29/Schafter4.png/800px-Schafter4.png'),
	(357, 'Schlagen GT', 'schlagen', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/9/97/Schlagen.png/800px-Schlagen.png'),
	(358, 'Schwartzer', 'schwarzer', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/1/19/Schwarzer.png/800px-Schwarzer.png'),
	(359, 'Sentinel Classic', 'sentinel3', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/0/0f/Sentinel3.png/800px-Sentinel3.png'),
	(360, 'Seven 70', 'seven70', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/6/60/Seven70.png/800px-Seven70.png'),
	(361, 'Specter', 'specter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f1/Specter.png/800px-Specter.png'),
	(362, 'Specter Custom', 'specter2', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/9/9f/Specter2.png/800px-Specter2.png'),
	(363, 'Streiter', 'streiter', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/8/81/Streiter.png/800px-Streiter.png'),
	(364, 'Sugoi', 'sugoi', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/2/25/Sugoi.png/800px-Sugoi.png'),
	(365, 'Sultan', 'sultan', 25000, 'sports', 'https://wiki.rage.mp/images/thumb/f/f4/Sultan.png/800px-Sultan.png'),
	(366, 'Sultan Classic', 'sultan2', 37500, 'sports', 'https://wiki.rage.mp/images/thumb/5/57/Sultan2.png/800px-Sultan2.png'),
	(367, 'Surano', 'surano', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/9/96/Surano.png/800px-Surano.png'),
	(368, 'Drift Tampa', 'tampa2', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/a/af/Tampa2.png/800px-Tampa2.png'),
	(369, 'Tropos Rallye', 'tropos', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/7/71/Tropos.png/800px-Tropos.png'),
	(370, 'Verlierer', 'verlierer2', 75000, 'sports', 'https://wiki.rage.mp/images/thumb/8/81/Verlierer2.png/800px-Verlierer2.png'),
	(371, 'V-STR', 'vstr', 50000, 'sports', 'https://wiki.rage.mp/images/thumb/4/43/Vstr.png/800px-Vstr.png'),
	(400, 'Adder', 'adder', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/c/c2/Adder.png/800px-Adder.png'),
	(401, 'Autarch', 'autarch', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/3/38/Autarch.png/800px-Autarch.png'),
	(402, 'Banshee 900R', 'banshee2', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/9/9b/Banshee2.png/800px-Banshee2.png'),
	(403, 'Bullet', 'bullet', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/7/7a/Bullet.png/800px-Bullet.png'),
	(404, 'Cheetah', 'cheetah', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/9/9e/Cheetah.png/800px-Cheetah.png'),
	(405, 'Cyclone', 'cyclone', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/7/79/Cyclone.png/800px-Cyclone.png'),
	(406, 'Deveste Eight', 'deveste', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/3/3f/Deveste.png/800px-Deveste.png'),
	(407, 'Emerus', 'emerus', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/0/0a/Emerus.png/790px-Emerus.png'),
	(408, 'Entity XF', 'entityxf', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/6/61/Entityxf.png/800px-Entityxf.png'),
	(409, 'Entity XXR', 'entity2', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/f/f3/Entity2.png/800px-Entity2.png'),
	(410, 'FMJ', 'fmj', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/d/d2/Fmj.png/800px-Fmj.png'),
	(411, 'PR4', 'formula', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/c/cf/Formula.png/800px-Formula.png'),
	(412, 'R88', 'formula2', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/0/03/Formula2.png/800px-Formula2.png'),
	(413, 'Furia', 'furia', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/0/05/Furia.png/800px-Furia.png'),
	(414, 'GP1', 'gp1', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/a/a4/Gp1.png/800px-Gp1.png'),
	(415, 'Infernus', 'infernus', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/d/d2/Infernus.png/800px-Infernus.png'),
	(416, 'Itali GTB', 'italigtb', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/d/dd/Italigtb.png/800px-Italigtb.png'),
	(417, 'Itali GTB Custom', 'italigtb2', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/5/57/Italigtb2.png/800px-Italigtb2.png'),
	(418, 'Krieger', 'krieger', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/f/fc/Krieger.png/732px-Krieger.png'),
	(419, 'RE-7B', 'le7b', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ee/Le7b.png/800px-Le7b.png'),
	(420, 'Nero', 'nero', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ed/Nero.png/800px-Nero.png'),
	(421, 'Nero Custom', 'nero2', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ec/Nero2.png/800px-Nero2.png'),
	(422, 'BR8','openwheel1', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/a/ae/Openwheel1.png/800px-Openwheel1.png'),
	(423, 'DR1','openwheel2', 500000, 'supers', 'https://wiki.rage.mp/images/thumb/4/49/Openwheel2.png/800px-Openwheel2.png'),
	(424, 'Osiris', 'osiris', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/e/e3/Osiris.png/800px-Osiris.png'),
	(425, 'Penetrator', 'penetrator', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/d/d9/Penetrator.png/800px-Penetrator.png'),
	(426, 'Pfister 811', 'pfister811', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/8/8e/Pfister811.png/800px-Pfister811.png'),
	(427, 'X80 Proto', 'prototipo', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/f/fb/Prototipo.png/800px-Prototipo.png'),
	(428, 'Reaper', 'reaper', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/6/6a/Reaper.png/800px-Reaper.png'),
	(429, 'S80RR', 's80', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/a/a2/S80.png/756px-S80.png'),
	(430, 'SC1', 'sc1', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/5/59/Sc1.png/800px-Sc1.png'),
	(431, 'ETR1', 'sheava', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/0/06/Sheava.png/800px-Sheava.png'),
	(432, 'Sultan RS', 'sultanrs', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/8/88/Sultanrs.png/800px-Sultanrs.png'),
	(433, 'T20', 't20', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/7/7d/T20.png/800px-T20.png'),
	(434, 'Taipan', 'taipan', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/8/8a/Taipan.png/800px-Taipan.png'),
	(435, 'Tempesta', 'tempesta', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/8/8a/Tempesta.png/800px-Tempesta.png'),
	(436, 'Tezeract', 'tezeract', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/a/ab/Tezeract.png/800px-Tezeract.png'),
	(437, 'Tigon', 'tigon', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/f/f4/Tigon.png/800px-Tigon.png'),
	(438, 'Thrax', 'thrax', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/4/4f/Thrax.png/670px-Thrax.png'),
	(439, 'Turismo R', 'turismor', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/7/7f/Turismor.png/800px-Turismor.png'),
	(440, 'Tyrant', 'tyrant', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/0/0a/Tyrant.png/800px-Tyrant.png'),
	(441, 'Tyrus', 'tyrus', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/e/e4/Tyrus.png/800px-Tyrus.png'),
	(442, 'Vacca', 'vacca', 300000, 'supers', 'https://wiki.rage.mp/images/thumb/1/14/Vacca.png/800px-Vacca.png'),
	(443, 'Vagner', 'vagner', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/9/92/Vagner.png/800px-Vagner.png'),
	(444, 'Visione', 'visione', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/0/01/Visione.png/800px-Visione.png'),
	(445, 'Voltic', 'voltic', 250000, 'supers', 'https://wiki.rage.mp/images/thumb/e/ef/Voltic.png/800px-Voltic.png'),
	(446, 'XA-21', 'xa21', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/4/4d/Xa21.png/800px-Xa21.png'),
	(447, 'Zentorno', 'zentorno', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/2/2b/Zentorno.png/800px-Zentorno.png'),
	(448, 'Zorrusso', 'zorrusso', 375000, 'supers', 'https://wiki.rage.mp/images/thumb/7/79/Zorrusso.png/660px-Zorrusso.png'),
	(500, 'Akuma', 'akuma', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/16/Akuma.png/800px-Akuma.png'),
	(501, 'Avarus', 'avarus', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/13/Avarus.png/800px-Avarus.png'),
	(502, 'Bagger', 'bagger', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/6/64/Bagger.png/800px-Bagger.png'),
	(503, 'Bati 801', 'bati', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/ce/Bati.png/800px-Bati.png'),
	(504, 'Bati 801RR', 'bati2', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/6/60/Bati2.png/800px-Bati2.png'),
	(505, 'BF400', 'bf400', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3a/BF400.png/800px-BF400.png'),
	(506, 'Blazer', 'blazer', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3e/Blazer.png/800px-Blazer.png'),
	(507, 'Blazer Hot Rod', 'blazer3', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/d5/Blazer3.png/800px-Blazer3.png'),
	(508, 'Blazer Sport', 'blazer4', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/5/5f/Blazer4.png/800px-Blazer4.png'),
	(509, 'Caddy', 'caddy', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/9/94/Caddy.png/800px-Caddy.png'),
	(510, 'Caddy 2', 'caddy2', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/25/Caddy2.png/800px-Caddy2.png'),
	(511, 'Caddy 3', 'caddy3', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/8/8c/Caddy3.png/800px-Caddy3.png'),
	(512, 'Carbon RS', 'carbonrs', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/d3/CarbonRS.png/800px-CarbonRS.png'),
	(513, 'Chimera', 'chimera', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/36/Chimera.png/800px-Chimera.png'),
	(514, 'Cliffhanger', 'cliffhanger', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/12/Cliffhanger.png/800px-Cliffhanger.png'),
	(515, 'Daemon', 'daemon', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/27/Daemon.png/800px-Daemon.png'),
	(516, 'Daemon 2', 'daemon2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/8/86/Daemon2.png/800px-Daemon2.png'),
	(517, 'Defiler', 'defiler', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/41/Defiler.png/800px-Defiler.png'),
	(518, 'Diabolus', 'diablous', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/48/Diablous.png/800px-Diablous.png'),
	(519, 'Diabolus Custom', 'diablous2', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3e/Diablous2.png/800px-Diablous2.png'),
	(520, 'Double T', 'double', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/0/01/Double.png/800px-Double.png'),
	(521, 'Enduro', 'enduro', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/f/f3/Enduro.png/800px-Enduro.png'),
	(522, 'Esskey', 'esskey', 7500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/24/Esskey.png/800px-Esskey.png'),
	(523, 'Faggio Sport', 'faggio', 2500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/4d/Faggio.png/800px-Faggio.png'),
	(524, 'Faggio', 'faggio2', 2500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/25/Faggio2.png/800px-Faggio2.png'),
	(525, 'Faggio Mod', 'faggio3', 2500, 'motorcycles', 'https://wiki.rage.mp/images/thumb/a/a6/Faggio3.png/800px-Faggio3.png'),
	(526, 'FCR 1000', 'fcr', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/46/Fcr.png/800px-Fcr.png'),
	(527, 'FCR 1000 Custom', 'fcr2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/d5/Fcr2.png/800px-Fcr2.png'),
	(528, 'Gargoyle', 'gargoyle', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/44/Gargoyle.png/800px-Gargoyle.png'),
	(529, 'Hakuchou', 'hakuchou', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/23/Hakuchou.png/800px-Hakuchou.png'),
	(530, 'Hakuchou Sport', 'hakuchou2', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/8/87/Hakuchou2.png/800px-Hakuchou2.png'),
	(531, 'Hexer', 'hexer', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/5/56/Hexer.png/800px-Hexer.png'),
	(532, 'Innovation', 'innovation', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/42/Innovation.png/800px-Innovation.png'),
	(533, 'Lectro', 'lectro', 15000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/0/00/Lectro.png/800px-Lectro.png'),
	(534, 'Manchez', 'manchez', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/3/3c/Manchez.png/800px-Manchez.png'),
	(535, 'Manchez 2', 'manchez2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/a/a3/0x40C332A3.png/800px-0x40C332A3.png'),
	(536, 'Nemesis', 'nemesis', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/e/e3/Nemesis.png/800px-Nemesis.png'),
	(537, 'Nightblade', 'nightblade', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/c1/Nightblade.png/800px-Nightblade.png'),
	(538, 'PCJ 600', 'pcj', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/9/99/Pcj.png/800px-Pcj.png'),
	(539, 'Rat Bike', 'ratbike', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/4/49/Ratbike.png/800px-Ratbike.png'),
	(540, 'Ruffian', 'ruffian', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/f/f6/Ruffian.png/800px-Ruffian.png'),
	(541, 'Sanchez', 'sanchez', 10000, 'motorcycles', 'https://wiki.rage.mp/images/5/52/Sanchez.png'),
	(542, 'Sanchez Sport', 'sanchez2', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/6/6d/Sanchez2.png/800px-Sanchez2.png'),
	(543, 'Sanctus', 'sanctus', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/e/e2/Sanctus.png/800px-Sanctus.png'),
	(544, 'Stryder', 'stryder', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/c3/Stryder.png/800px-Stryder.png'),
	(545, 'Sovereign', 'sovereign', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/a/ae/Sovereign.png/800px-Sovereign.png'),
	(546, 'Thrust', 'thrust', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/9/90/Thrust.png/800px-Thrust.png'),
	(547, 'Vader', 'vader', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/d/dc/Vader.png/800px-Vader.png'),
	(548, 'Veto Classic', 'veto', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/1/11/0xCCE5C8FA.png/800px-0xCCE5C8FA.png'),
	(549, 'Veto Modern', 'veto2', 5000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/cc/0xA703E4A9.png/800px-0xA703E4A9.png'),
	(550, 'Vindicator', 'vindicator', 20000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/b/bb/Vindicator.png/800px-Vindicator.png'),
	(551, 'Vortex', 'vortex', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/5/52/Vortex.png/800px-Vortex.png'),
	(552, 'Woflsbane', 'wolfsbane', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/c/c6/Wolfsbane.png/800px-Wolfsbane.png'),
	(553, 'Zombie Bobber', 'zombiea', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/7/7f/Zombiea.png/800px-Zombiea.png'),
	(554, 'Zombie Chopper', 'zombieb', 10000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/2/2c/Zombieb.png/800px-Zombieb.png'),
	(555, 'Shotaro', 'shotaro', 30000, 'motorcycles', 'https://wiki.rage.mp/images/thumb/e/e3/Shotaro.png/800px-Shotaro.png'),
	(600, 'Bf Injection', 'bfinjection', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/3/3d/Bfinject.png/800px-Bfinject.png'),
	(601, 'Bifta', 'bifta', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/b/b7/Bifta.png/800px-Bifta.png'),
	(602, 'Bison', 'bison', 25000, 'offroads', 'https://wiki.rage.mp/images/f/f6/Bison.png'),
	(603, 'Bison 3', 'bison3', 25000, 'offroads', 'https://wiki.rage.mp/images/7/7f/Bison3.png'),
	(604, 'Bobcat XL', 'bobcatxl', 25000, 'offroads', 'https://wiki.rage.mp/images/d/d8/BobcatXL.png'),
	(605, 'Bodhi', 'bodhi2', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/c/ce/Bodhi2.png/800px-Bodhi2.png'),
	(606, 'Brawler', 'brawler', 45000, 'offroads', 'https://wiki.rage.mp/images/thumb/f/fa/Brawler.png/800px-Brawler.png'),
	(607, 'Caracara 4x4', 'caracara2', 50000, 'offroads', 'https://wiki.rage.mp/images/3/3b/Caracara2.png'),
	(608, 'Contender', 'contender', 45000, 'offroads', 'https://wiki.rage.mp/images/thumb/2/2e/Contender.png/800px-Contender.png'),
	(609, 'Duneloader', 'dloader', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/1a/Dloader.png/800px-Dloader.png'),
	(610, 'Dubsta 6x6', 'dubsta3', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d6/Dubsta3.png/800px-Dubsta3.png'),
	(611, 'Dune Buggy', 'dune', 10000, 'offroads', 'https://wiki.rage.mp/images/thumb/c/c6/Dune.png/800px-Dune.png'),
	(612, 'Space Docker', 'dune2', 10000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/10/Dune2.png/800px-Dune2.png'),
	(613, 'Everon', 'everon', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/83/Everon.png/800px-Everon.png'),
	(614, 'Freecrawler', 'freecrawler', 25000, 'offroads', 'https://wiki.rage.mp/images/5/56/Freecrawler.png'),
	(615, 'Guardian', 'guardian', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/f/fd/Guardian.png/800px-Guardian.png'),
	(616, 'Hellion', 'hellion', 25000, 'offroads', 'https://wiki.rage.mp/images/c/cf/Hellion.png'),
	(617, 'Insurgent', 'insurgent2', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/2/2c/Insurgent2.png/800px-Insurgent2.png'),
	(618, 'Kalahari', 'kalahari', 20000, 'offroads', 'https://wiki.rage.mp/images/thumb/5/55/Kalahari.png/800px-Kalahari.png'),
	(619, 'Kamacho', 'kamacho', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d0/Kamacho.png/800px-Kamacho.png'),
	(620, 'Marshall', 'marshall', 210000, 'offroads', 'https://wiki.rage.mp/images/thumb/7/71/Marshall.png/800px-Marshall.png'),
	(621, 'Mesa Trail', 'mesa3', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/c/c6/Mesa3.png/800px-Mesa3.png'),
	(622, 'Liberator', 'monster', 210000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/13/Monster.png/800px-Monster.png'),
	(623, 'Outlaw', 'outlaw', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/f/f0/Outlaw.png/800px-Outlaw.png'),
	(624, 'Rancher XL', 'rancherxl', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/e/ef/Rancherxl.png/800px-Rancherxl.png'),
	(625, 'Rusty Rebel', 'rebel', 15000, 'offroads', 'https://wiki.rage.mp/images/thumb/e/e3/Rebel.png/800px-Rebel.png'),
	(626, 'Rebel', 'rebel2', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/9/90/Rebel2.png/800px-Rebel2.png'),
	(627, 'Riata', 'riata', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/4/4d/Riata.png/800px-Riata.png'),
	(628, 'Sadler', 'sadler', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/3/37/Sadler.png/800px-Sadler.png'),
	(629, 'Sandking XL', 'sandking', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/6/64/Sandking.png/800px-Sandking.png'),
	(630, 'Sandking SWB', 'sandking2', 50000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d1/Sandking2.png/800px-Sandking2.png'),
	(631, 'Squaddie', 'squaddie', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/d/d6/0xF9E67C05.png/800px-0xF9E67C05.png'),
	(632, 'Trophy Truck', 'trophytruck', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/18/Trophytruck.png/800px-Trophytruck.png'),
	(633, 'Desert Raid', 'trophytruck2', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/85/Trophytruck2.png/800px-Trophytruck2.png'),
	(634, 'Vagrant', 'vagrant', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/87/Vagrant.png/800px-Vagrant.png'),
	(635, 'Verus', 'verus', 10000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/10/0x11CBC051.png/780px-0x11CBC051.png'),
	(636, 'Vetir', 'vetir', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/1/11/0x780FFBD2.png/800px-0x780FFBD2.png'),
	(637, 'Winky', 'winky', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/b/b2/0xF376F1E6.png/800px-0xF376F1E6.png'),
	(638, 'Yosemite Rancher', 'yosemite3', 25000, 'offroads', 'https://wiki.rage.mp/images/thumb/8/87/Yosemite3.png/800px-Yosemite3.png'),
	(639, 'Zhaba', 'zhaba', 75000, 'offroads', 'https://wiki.rage.mp/images/thumb/a/a2/Zhaba.png/738px-Zhaba.png'),
	(650, 'Burrito', 'burrito3', 20000, 'vans', 'https://wiki.rage.mp/images/8/89/Burrito3.png'),
	(651, 'Camper', 'camper', 25000, 'vans', 'https://wiki.rage.mp/images/b/bd/Camper.png'),
	(652, 'Gang Burrito', 'gburrito', 20000, 'vans', 'https://wiki.rage.mp/images/b/b0/GBurrito.png'),
	(653, 'Gang Burrito 2', 'gburrito2', 20000, 'vans', 'https://wiki.rage.mp/images/f/ff/GBurrito2.png'),
	(654, 'Journey', 'journey', 10000, 'vans', 'https://wiki.rage.mp/images/0/0c/Journey.png'),
	(655, 'Minivan', 'minivan', 15000, 'vans', 'https://wiki.rage.mp/images/1/12/Minivan.png'),
	(656, 'Minivan Custom', 'minivan2', 20000, 'vans', 'https://wiki.rage.mp/images/2/21/Minivan2.png'),
	(657, 'Paradise', 'paradise', 20000, 'vans', 'https://wiki.rage.mp/images/b/b3/Paradise.png'),
	(658, 'Rumpo Trail', 'rumpo3', 25000, 'vans', 'https://wiki.rage.mp/images/7/7a/Rumpo3.png'),
	(659, 'Speedo', 'speedo', 20000, 'vans', 'https://wiki.rage.mp/images/2/2b/Speedo.png'),
	(660, 'Surfer', 'surfer', 20000, 'vans', 'https://wiki.rage.mp/images/d/d7/Surfer.png'),
	(661, 'Surfer 2', 'surfer2', 10000, 'vans', 'https://wiki.rage.mp/images/d/d5/Surfer2.png'),
	(662, 'Youga', 'youga', 20000, 'vans', 'https://wiki.rage.mp/images/d/d5/Youga.png'),
	(663, 'Youga Classic', 'youga2', 20000, 'vans', 'https://wiki.rage.mp/images/thumb/e/e6/Youga2.png/800px-Youga2.png'),
	(664, 'Youga Classic 4x4', 'youga3', 25000, 'vans', 'https://wiki.rage.mp/images/thumb/0/00/Youga3.png/800px-Youga3.png'),
	(685, 'BMX', 'bmx', 150, 'cycles', 'https://wiki.rage.mp/images/thumb/4/40/Bmx.png/800px-Bmx.png'),
	(686, 'Cruiser', 'cruiser', 200, 'cycles', 'https://wiki.rage.mp/images/thumb/6/66/Cruiser.png/800px-Cruiser.png'),
	(687, 'Fixter', 'fixter', 200, 'cycles', 'https://wiki.rage.mp/images/thumb/2/29/Fixter.png/800px-Fixter.png'),
	(688, 'Scorcher', 'scorcher', 350, 'cycles', 'https://wiki.rage.mp/images/thumb/3/34/Scorcher.png/800px-Scorcher.png'),
	(689, 'Race bike Whippet', 'tribike', 500, 'cycles', 'https://wiki.rage.mp/images/thumb/f/fe/TriBike.png/800px-TriBike.png'),
	(690, 'Race bike Endurex', 'tribike2', 500, 'cycles', 'https://wiki.rage.mp/images/thumb/d/dc/TriBike2.png/800px-TriBike2.png'),
	(691, 'Race bike Tri-Cycles', 'tribike3', 500, 'cycles', 'https://wiki.rage.mp/images/thumb/5/5d/TriBike3.png/800px-TriBike3.png')
;

CREATE TABLE `vs_truck_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_truck_categories` (id, name, label) VALUES
	(1, 'haul', 'Haulers'),
	(2, 'box', 'Boxed Trucks'),
	(3, 'trans', 'Transport Trucks'),
	(4, 'other', 'Other Trucks')
;

CREATE TABLE `vs_trucks` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_trucks` (id, name, model, price, category, image) VALUES
	(1, 'Hauler', 'hauler', 100000, 'haul', 'https://wiki.rage.mp/images/thumb/8/83/Hauler.png/800px-Hauler.png'),
	(2, 'Packer', 'packer', 100000, 'haul', 'https://wiki.rage.mp/images/thumb/0/03/Packer.png/800px-Packer.png'),
	(3, 'Phantom', 'phantom', 105000, 'haul', 'https://wiki.rage.mp/images/thumb/e/ec/Phantom.png/800px-Phantom.png'),
	(4, 'Phantom Custom', 'phantom3', 110000, 'haul', 'https://wiki.rage.mp/images/thumb/8/81/Phantom3.png/800px-Phantom3.png'),
	(10, 'Benson', 'benson', 55000, 'box', 'https://wiki.rage.mp/images/thumb/b/bd/Benson.png/800px-Benson.png'),
	(11, 'Boxville 1', 'boxville', 45000, 'box', 'https://wiki.rage.mp/images/0/09/Boxville.png'),
	(12, 'Boxville 2', 'boxville2', 45000, 'box', 'https://wiki.rage.mp/images/f/fe/Boxville2.png'),
	(13, 'Boxville 3', 'boxville3', 45000, 'box', 'https://wiki.rage.mp/images/5/5c/Boxville3.png'),
	(14, 'Boxville 4', 'boxville4', 45000, 'box', 'https://wiki.rage.mp/images/2/29/Boxville4.png'),
	(15, 'Mule 1', 'mule', 40000, 'box', 'https://wiki.rage.mp/images/thumb/e/e7/Mule.png/800px-Mule.png'),
	(16, 'Mule 2', 'mule2', 40000, 'box', 'https://wiki.rage.mp/images/thumb/8/82/Mule2.png/800px-Mule2.png'),
	(17, 'Mule 3', 'mule3', 40000, 'box', 'https://wiki.rage.mp/images/thumb/6/6a/Mule3.png/800px-Mule3.png'),
	(18, 'Pounder', 'pounder', 55000, 'box', 'https://wiki.rage.mp/images/thumb/a/a6/Pounder.png/800px-Pounder.png'),
	(20, 'Airport Bus', 'airbus', 50000, 'trans', 'https://wiki.rage.mp/images/thumb/3/32/Airbus.png/800px-Airbus.png'),
	(21, 'Bus', 'bus', 50000, 'trans', 'https://wiki.rage.mp/images/thumb/4/43/Bus.png/800px-Bus.png'),
	(22, 'Dashound', 'coach', 50000, 'trans', 'https://wiki.rage.mp/images/thumb/9/9d/Coach.png/800px-Coach.png'),
	(23, 'Festival Bus', 'pbus2', 75000, 'trans', 'https://wiki.rage.mp/images/f/f4/Pbus2.png'),
	(24, 'Rental Bus', 'rentalbus', 35000, 'trans', 'https://wiki.rage.mp/images/thumb/4/48/Rentalbus.png/800px-Rentalbus.png'),
	(25, 'Tour Bus', 'tourbus', 35000, 'trans', 'https://wiki.rage.mp/images/thumb/a/ac/Tourbus.png/800px-Tourbus.png'),
	(30, 'Biff', 'biff', 30000, 'other', 'https://wiki.rage.mp/images/thumb/6/62/Biff.png/800px-Biff.png'),
	(31, 'Dozer', 'bulldozer', 20000, 'other', 'https://wiki.rage.mp/images/thumb/f/f5/Bulldozer.png/800px-Bulldozer.png'),
	(32, 'Forklift', 'forklift', 5000, 'other', 'https://wiki.rage.mp/images/thumb/a/ab/Forklift.png/800px-Forklift.png'),
	(33, 'Field Master', 'tractor2', 15000, 'other', 'https://wiki.rage.mp/images/thumb/c/c8/Tractor2.png/800px-Tractor2.png'),
	(34, 'Lawn Mower', 'mower', 1500, 'other', 'https://wiki.rage.mp/images/thumb/a/a5/Mower.png/800px-Mower.png'),
	(35, 'Mixer 1', 'mixer', 30000, 'other', 'https://wiki.rage.mp/images/thumb/4/4d/Mixer.png/800px-Mixer.png'),
	(36, 'Mixer 2', 'mixer2', 30000, 'other', 'https://wiki.rage.mp/images/thumb/e/e7/Mixer2.png/800px-Mixer2.png'),
	(37, 'Rubble', 'rubble', 30000, 'other', 'https://wiki.rage.mp/images/thumb/1/14/Rubble.png/800px-Rubble.png'),
	(38, 'Scrap Truck', 'scrap', 10000, 'other', 'https://wiki.rage.mp/images/thumb/b/b8/Scrap.png/800px-Scrap.png'),
	(39, 'Slamtruck', 'slamtruck', 20000, 'other', 'https://wiki.rage.mp/images/thumb/2/22/0xC1A8A914.png/800px-0xC1A8A914.png'),
	(40, 'Tipper 1', 'tiptruck', 30000, 'other', 'https://wiki.rage.mp/images/thumb/2/2e/TipTruck.png/800px-TipTruck.png'),
	(41, 'Tipper 2', 'tiptruck2', 30000, 'other', 'https://wiki.rage.mp/images/thumb/c/c9/TipTruck2.png/800px-TipTruck2.png')
;

CREATE TABLE `vs_vipaircraft_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_vipaircraft_categories` (id, name, label) VALUES
	(1, 'viphelis', 'Helicopters'),
	(2, 'vipplanes', 'Planes')
;

CREATE TABLE `vs_vipaircrafts` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_vipaircrafts` (id, name, model, price, category, image) VALUES
	(1, 'Buzzard', 'buzzard2', 500000, 'viphelis', 'https://wiki.rage.mp/images/thumb/6/6e/Buzzard2.png/800px-Buzzard2.png'),
	(2, 'Alpha Z1', 'alphaz1', 450000, 'vipplanes', 'https://wiki.rage.mp/images/thumb/4/46/Alphaz1.png/800px-Alphaz1.png')
;

CREATE TABLE `vs_vipboat_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_vipboat_categories` (id, name, label) VALUES
	(1, 'vipboats', 'Boats'),
	(2, 'vipsubs', 'Subs')
;

CREATE TABLE `vs_vipboats` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_vipboats` (id, name, model, price, category, image) VALUES
	(1, 'Tropic Yacht', 'tropic2', 27000, 'vipboats', 'https://wiki.rage.mp/images/thumb/a/a7/Tropic2.png/800px-Tropic2.png'),
	(2, 'Avisa', 'avisa', 35000, 'vipsubs', 'https://wiki.rage.mp/images/thumb/1/19/0x9A474B5E.png/800px-0x9A474B5E.png')
;

CREATE TABLE `vs_vipcar_categories` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_vipcar_categories` (id, name, label) VALUES
	(1, 'vipmotos', 'Motorcycles'),
	(2, 'vipmuscles', 'Muscles'),
	(3, 'vipoffroads', 'Off-Roads'),
	(4, 'vipsedans', 'Sedans'),
	(5, 'vipsports', 'Sports'),
	(6, 'vipsportscs', 'Sport Classics'),
	(7, 'vipsupers', 'Supers'),
	(8, 'vipsuvs', 'SUVs'),
	(9, 'viptrucks', 'Trucks')
;

CREATE TABLE `vs_vipcars` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	`image` text DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_vipcars` (id, name, model, price, category, image) VALUES
	(1, 'Shotaro', 'shotaro', 30000, 'vipmotos', 'https://wiki.rage.mp/images/thumb/e/e3/Shotaro.png/800px-Shotaro.png'),
	(2, 'Blade', 'blade', 15000, 'vipmuscles', 'https://wiki.rage.mp/images/thumb/a/ad/Blade.png/800px-Blade.png'),
	(3, 'Bf Injection', 'bfinjection', 15000, 'vipoffroads', 'https://wiki.rage.mp/images/thumb/3/3d/Bfinject.png/800px-Bfinject.png'),
	(4, 'Asea', 'asea', 15000, 'vipsedans', 'https://wiki.rage.mp/images/thumb/c/ce/Asea.png/800px-Asea.png'),
	(5, 'Alpha', 'alpha', 50000, 'vipsports', 'https://wiki.rage.mp/images/thumb/a/a8/Alpha.png/800px-Alpha.png'),
	(6, 'Roosevelt', 'btype', 40000, 'vipsportscs', 'https://wiki.rage.mp/images/thumb/6/64/Btype.png/800px-Btype.png'),
	(7, 'Adder', 'adder', 250000, 'vipsupers', 'https://wiki.rage.mp/images/thumb/c/c2/Adder.png/800px-Adder.png'),
	(8, 'Baller', 'baller', 22500, 'vipsuvs', 'https://wiki.rage.mp/images/thumb/7/79/Baller.png/800px-Baller.png'),
	(9, 'Hauler', 'hauler', 100000, 'viptrucks', 'https://wiki.rage.mp/images/thumb/8/83/Hauler.png/800px-Hauler.png'),
;
