fx_version 'cerulean'

games { 'gta5' }
lua54 'yes'

name "Orbit Performance"
author "Havocx"
version "v1.0.0"

shared_scripts {
    'config.lua',
}

client_scripts{
    'client/*.lua',
}

server_scripts{
    'server/*.lua',
}

dependency{
    'oxmysql',
}

exports {
    'getVehicleInfo'
}