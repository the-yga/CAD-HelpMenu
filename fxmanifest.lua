fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'YGA'
description 'Help Menu using ox_lib and custom NUI'
version '1.0.0'
shared_script '@ox_lib/init.lua'

client_scripts {
    'config.lua',
    'client.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependencies {
    'CAD-PictureLoader',
}