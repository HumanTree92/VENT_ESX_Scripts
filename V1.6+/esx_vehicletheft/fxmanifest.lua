fx_version 'adamant'

game 'gta5'

author 'Velociti Entertainment aka Human Tree92'

description 'ESX Vehicle Theft'

version '1.6+'

shared_script '@es_extended/imports.lua'

server_scripts {
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

dependencies {
	'es_extended'
}
