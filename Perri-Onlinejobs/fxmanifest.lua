fx_version 'adamant'
game 'gta5'


version '0.1.0'

shared_scripts {
	'config/*.lua',
	'@es_extended/imports.lua'
}
 
server_script 'server/*.lua'

client_script 'client/*.lua'

ui_page 'html/ui.html'

files {
	'html/*.html',
	'html/*.css',
	'html/*.js',
	'html/fonts/*.ttf'
}