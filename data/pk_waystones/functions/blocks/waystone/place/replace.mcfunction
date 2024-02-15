#> pk_waystones:blocks/waystone/place/replace
# @context any at the waystone to replace
# @requires
#   storage pk:common temp.waystone
#       data of waystone to replace

# Scores
execute store result score $temp pk.custom_block.component.id run data get storage pk:common temp.waystone.id

# Remove waystone's blocks and entities
setblock ~ ~ ~ air
setblock ~ ~1 ~ air
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,predicate=pk_waystones:scores/custom_block/component_id/match_temp,distance=..20]
kill @e[type=interaction,tag=pk.waystones.waystone.lock,predicate=pk_waystones:scores/custom_block/component_id/match_temp,distance=..20]

# Create controller
execute positioned ~0.5 ~1.5 ~0.5 summon marker run function pk_waystones:blocks/waystone/place/components/controller_prepare

# Create skin parts that don't depends on settings
# Other skins part are set from settings
#   @within function pk_waystones:blocks/waystone/main/settings/watch
function pk_waystones:blocks/waystone/place/components/skins/parts/common with storage pk:common temp.waystone

# Place blocks
setblock ~ ~ ~ barrier
execute positioned ~ ~1 ~ run function pk_waystones:blocks/waystone/place/available_container