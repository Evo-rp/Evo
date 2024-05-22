fx_version 'bodacious'
games { 'gta5' }

author 'Isigar <info@rcore.cz>'
description 'Tennis Game - RCore Tennis'
version '1.0.0'
lua54 "yes"

client_scripts {
	--'@rcore_utils/common/utils.lua',
    'config.lua',
    'client/*.lua'
}

server_scripts {
	--'@rcore_utils/common/utils.lua',
    'config.lua',
    'server/*.lua',
}
