# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Scores :
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Common to all PK data packs:
# - Informations
# - $gametime pk.value | used to store the current gametime
# - Logs
# - $logs.load pk.value | default: (undefined) | <=0 = mask load logs | (undefined) or >=1 = show load logs
# - $logs.tick pk.value | default: (undefined) | (undefined) or <=0 = mask tick logs | >=1 = show tick logs
#
# Concerning this specific datapack:
# - Logs (allow you to mask/show logs specific to this data pack
# - $logs.datapack.waystones pk.value | default: (undefined) | (undefined) or <=0 = masks | >=1 = show Waystones logs
# - Settings:
# - $pk.waystones.settings.limit_per_player pk.value | default: (undefined) | if set, defines the maximal amount of waystones a player can place
# - $pk.waystones.settings.limit_per_server pk.value | default: (undefined) | if set, defines the maximal amount of waystones the server can contain
# - $pk.waystones.settings.ignore_monsters pk.value | default: (undefined) | <=0 = disallow Waystones use if a monster is nearby | (undefined) or >=1 = ignore
# - $pk.waystones.settings.legacy_textures pk.value | default: (undefined) | (undefined) or <=0 = disable | >=1 = use legacy waystone textures
# - $pk.waystones.settings.display_nameplates pk.value | default: (undefined) | (undefined) or <=0 = hide | >=1 = show waystones names above themselves
# - $pk.waystones.settings.show_same_dimension_only pk.value | default: (undefined) | >=1 show only Waystones of same the dimension in a Waystone's menu
# - $pk.waystones.settings.allow_visibility_change pk.value | default: (undefined) | (undefined) or >=1 = allow | <=0 = disallow visibility changes for regular players
# - $pk.waystones.settings.allow_protection_change pk.value | default: (undefined) | (undefined) or >=1 = allow | <=0 = disallow Protection changes for regular players
# - $pk.waystones.settings.default_visibility pk.value | default: (undefined) | (undefined) or 0 : discover | 1 : private | 2 : public
# - $pk.waystones.settings.xp_consumption.blocks pk.value | default: (undefined) | (undefined) or <=0 = disable | >=1 = blocks distance for consumption of a level
# - $pk.waystones.settings.xp_consumption.mode pk.value: distance calculation method between two waystones | 0: "euclidian" | 1: "manhattan"
#
# Players settings:
# - pk.waystones.hide_coordinates : (undefined) or 0 = show | 1 = hide coordinates from the Waystones GUI (safety for video makers):

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Tags:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# pk.dev: Allow player to see data packs specific logs
tag @s add pk.dev
# pk.waystones.manager Allow player to bypass restrictions and manage other players Waystones
tag @s add pk.waystones.manager