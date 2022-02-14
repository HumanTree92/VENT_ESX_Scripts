fx_version 'adamant'

game 'gta5'

description 'ESX Advanced Vehicle Shop'

Author 'Human Tree92 | Velociti Entertainment'

version 'legacy'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua',
	--'server/migrate.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/utils.lua',
	'client/main.lua'
}

dependencies {
	'es_extended'
}

export 'GeneratePlate'
