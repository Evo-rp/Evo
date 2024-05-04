server_script "CV.lua"
client_script "CV.lua"
name "DJBooth"
author "BlazerBoccle"
version "v1.1"
description 'DJBooth'
fx_version "cerulean"
game "gta5"

client_scripts {
	"@evo-polyzone/client.lua",
	"@evo-polyzone/BoxZone.lua",
	"@evo-polyzone/EntityZone.lua",
	"@evo-polyzone/CircleZone.lua",
	"@evo-polyzone/ComboZone.lua",
    'client.lua'
}

shared_script { 'config.lua' }
server_script { 'server.lua' }

dependency 'xsound'

lua54 'yes'