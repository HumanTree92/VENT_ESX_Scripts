fx_version 'adamant'

game 'gta5'

author 'Velociti Entertainment aka Human Tree92'

description 'ESX Advanced Vehicle Shop'

version '1.6+'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
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
	'es_extended',
	--'esx_dmvschool',
	--'esx_licenseshop'
}

export 'GeneratePlate'
