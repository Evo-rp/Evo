fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Aspect'
description 'Crafting system for Evo RP back off!.'

ui_page 'dist/web/index.html'

files {
    'dist/web/index.html',
    'dist/web/**/*'
}

client_scripts {
    'resource/Client/**.lua',
}

server_scripts {
    'resource/Server/**.lua'
}

escrow_ignore {
    'resource/Server/BlueprintConfig.lua'
}
dependency '/assetpacks'