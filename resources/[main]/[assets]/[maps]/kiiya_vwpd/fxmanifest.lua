fx_version 'bodacious'
game 'gta5'
description 'Vinewood Police dept. v1.'

this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'kiiya_timecycle.xml'

files {
    'vwpd_doors_game.dat151.rel',
    'kiiya_timecycle.xml',
}

data_file 'AUDIO_GAMEDATA' 'vwpd_doors_game.dat'

escrow_ignore {
  'stream/ydr/hw1_09_policestation.ydr',  -- Only ignore one file
  'stream/ydr/hw1_09_glue_02.ydr',  -- Only ignore one file
  'stream/ydr/hw1_09_emtst_.ydr',  -- Only ignore one file
  'stream/ydr/hw1_09_ground.ydr',  -- Only ignore one file    
}





dependency '/assetpacks'