fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Legacy_DMC'
description 'Discord: https://discord.gg/KsvJWyvpZU'
version '1.0'

shared_script 'engine/exports.lua'
shared_script 'config/vehdata.lua'
shared_script 'config/tiredata.lua'
shared_script 'config/enginedata.lua'
shared_script 'config/globalvehdata.lua'
shared_script 'config/blocklist.lua'

server_script 'engine/debug/debugconfig.lua'
server_script 'engine/server.lua'

client_script 'config/chaserconfig.lua'
client_script 'engine/varinit.lua'
client_script 'engine/debug/menuapi.lua'
client_script 'engine/debug/debug.lua'
client_script 'engine/functions.lua'
client_script 'engine/binds.lua'
client_script 'engine/events.lua'
client_script 'engine/main.lua'
client_script 'engine/cbe.lua'
client_script 'engine/sync.lua'
client_script 'ui/scripts/hud.lua'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/styles/style.css',
    'ui/scripts/script.js',
    "audio/chaser_sfx/*.awc",
    "audio/chaser_sfx.dat54.rel",
}

escrow_ignore {
    'config/*.lua'
}

data_file 'AUDIO_WAVEPACK' 'audio/chaser_sfx'
data_file 'AUDIO_SOUNDDATA' 'audio/chaser_sfx.dat'

dependency '/assetpacks'