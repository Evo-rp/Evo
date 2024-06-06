fx_version 'adamant'
game 'gta5'
description 'EvoRP - Weapon Files Pack'
version '1.0.1'

files {
    'weapons/*.meta',
	'**/weaponcomponents.meta',
	'**/weaponarchetypes.meta',
	'**/weaponanimations.meta',
	'**/pedpersonality.meta',
	'**/weapons.meta',
	'metas/weapons/*.meta',
}

data_file 'WEAPONINFO_FILE' 'weapons/weapons_tazer.meta'
data_file 'WEAPONCOMPONENTSINFO_FILE' '**/weaponcomponents.meta'
data_file 'WEAPON_METADATA_FILE' '**/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' '**/weaponanimations.meta'
data_file 'PED_PERSONALITY_FILE' '**/pedpersonality.meta'
data_file 'WEAPONINFO_FILE' '**/weapons.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'metas/weapons/*.meta'