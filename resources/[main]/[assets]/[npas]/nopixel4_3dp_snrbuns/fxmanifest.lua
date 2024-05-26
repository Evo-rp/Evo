fx_version 'cerulean'
game 'gta5'

author 'Denis3D, Synced3D and sanhje'
description 'Snr.Buns & Food Plaza'
version '1.0.0'
lua54 'yes'
this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' '3dp_snrbuns_timecycles.xml'
data_file 'DLC_ITYP_REQUEST' 'stream/kitchen_props/3dp_kitchenprops.ytyp'

files {
    '3dp_snrbuns_timecycles.xml'
}

client_script {
    '3dp_snrbuns_entitysets.lua',
}

escrow_ignore {
    'stream/**/*.ytd',
    '3dp_snrbuns_entitysets.lua'
}
dependency '/assetpacks'