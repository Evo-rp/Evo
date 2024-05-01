name 'Evo RP Ped'
author '[Alzar]'
version 'v1.0.0'
url 'https://www.quadrantrp.com'
lua54 'yes'
fx_version "cerulean"
game "gta5"
client_script "@evo-base/components/cl_error.lua"
client_script "@evo-pwnzor/client/check.lua"

ui_page 'ui/dist/index.html'

files {
    'ui/dist/*.*',
}

client_scripts {
    'storeData.lua',
    'config.lua',
    'utils/*.lua',
    'client/**/*.lua'
}

server_scripts {
    'config.lua',
    'utils/*.lua',
    'server/**/*.lua',
}