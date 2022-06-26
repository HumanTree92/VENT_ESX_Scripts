fx_version 'adamant'

game 'gta5'

author 'Velociti Entertainment aka Human Tree92'

description 'ESX Advanced Banking'

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

ui_page 'html/UI.html'

files {
	-- Advanced
	--'html/UI.html',
	--'html/style.css',
	--'html/media/font/*.otf',
	--'html/media/img/*.png',
	-- Basic
	--'html/UI.html',
	--'html/style.css',
	--'html/img/BG_White.png',
}

export 'openUI'

dependencies {
	'es_extended'
}
