fx_version 'cerulean'

games { 'gta5' }
lua54 'yes'

name "RDH_imports_optimized"
author "RDHUB"
version "v1.0.0"
description "20 Optimized Vehicle Addon Pack By RDHUB"

files {
  'data/**/carcols.meta',
  'data/**/carvariations.meta',
  'data/**/handling.meta',
  'data/**/vehiclelayouts.meta',
  'data/**/vehicles.meta',


}

data_file 'HANDLING_FILE'            'data/**/handling*.meta'
data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/vehiclelayouts*.meta'
data_file 'VEHICLE_METADATA_FILE'    'data/**/vehicles*.meta'
data_file 'CARCOLS_FILE'            'data/**/carcols*.meta'
data_file 'VEHICLE_VARIATION_FILE'    'data/**/carvariations*.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/*unlocks.meta'
data_file 'PTFXASSETINFO_FILE' 'data/**/ptfxassetinfo.meta'


client_scripts {
    'vehicle_names.lua',
}
dependency '/assetpacks'