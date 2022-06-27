fx_version 'adamant'

game 'gta5'

author 'Velociti Entertainment aka Human Tree92'

description 'ESX License Shop'

version '1.6+'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

exports {
	'openESXLicenseShop'
}

dependencies {
	'es_extended'
}
