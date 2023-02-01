fx_version 'adamant'

game 'gta5'

author 'Velociti Entertainment aka Human Tree92'

description 'ESX Advanced Vehicle Shop'

version '1.6+'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'locales/*.lua'
}

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
	--'server/migrate.lua'
}

client_scripts {
	'client/utils.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	--'esx_dmvschool',
	--'esx_licenseshop'
}

export 'GeneratePlate'
