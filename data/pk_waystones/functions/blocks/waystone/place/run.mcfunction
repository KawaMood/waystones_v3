#> pk_waystones:blocks/waystone/place/run
# Place a Waystone and store its relative information in the database
# @context any at the block location
# Features like skins and visible names are placed further in the current tick
#   @within function pk_waystones:blocks/waystone/main/on_entity_load/run

# Scores
scoreboard players add $next pk.custom_block.component.id 1
scoreboard players operation $temp pk.custom_block.component.id = $next pk.custom_block.component.id

# Prepare data and store them to database
execute if score $pk.custom_block.placed_by_player pk.temp matches 1 run function pk_waystones:blocks/waystone/place/data/store_from_player_placement
execute if score $pk.custom_block.placed_by_command pk.temp matches 1 run function pk_waystones:blocks/waystone/place/data/store_from_command_placement/run

# Create controller
execute positioned ~0.5 ~1.5 ~0.5 summon marker run function pk_waystones:blocks/waystone/place/components/controller_prepare

# Create skin parts that don't depends on settings
# Other skins part are set from settings
#   @within function pk_waystones:blocks/waystone/main/settings/watch
function pk_waystones:blocks/waystone/place/components/skins/parts/common with storage pk:common temp.waystone

# Place blocks
setblock ~ ~ ~ barrier
execute positioned ~ ~1 ~ run function pk_waystones:blocks/waystone/place/available_container

# Animations
playsound block.beacon.ambient ambient @a[distance=..30] ~ ~ ~ 1 1.75

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.current.player,limit=1]","color": "gray"},{"text": " placed Waystone at ["},{"nbt":"temp.waystone.location.x","storage":"pk:common"},{"text": ","},{"nbt":"temp.waystone.location.y","storage":"pk:common"},{"text": ","},{"nbt":"temp.waystone.location.z","storage":"pk:common"},{"text": "] in "},{"nbt":"temp.waystone.location.dimension","storage":"pk:common"}]