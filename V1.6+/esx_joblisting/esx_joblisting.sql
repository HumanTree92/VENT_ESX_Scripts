USE `es_extended`;

ALTER TABLE jobs add whitelisted BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE `users`
	ADD `leo_rank` int(11) NULL DEFAULT '-1',
	ADD `ems_rank` int(11) NULL DEFAULT '-1',
	ADD `tow_rank` int(11) NULL DEFAULT '-1',
	ADD `fish_rank` int(11) NULL DEFAULT '0',
	ADD `fuel_rank` int(11) NULL DEFAULT '0',
	ADD `lumb_rank` int(11) NULL DEFAULT '0',
	ADD `mine_rank` int(11) NULL DEFAULT '0',
	ADD `butch_rank` int(11) NULL DEFAULT '0',
	ADD `tail_rank` int(11) NULL DEFAULT '0',
	ADD `taxi_rank` int(11) NULL DEFAULT '0'
;