#> pk_waystones:blocks/waystone/main/on_entity_load
# Trigger once when the waystone is placed and every time it is loaded from an unloaded area
# @context current waystone's controller (tag=pk.current.controller) at @s

# Prepare score
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
scoreboard players operation @s pk.waystones.gametime = $gametime pk.value

# Store the current waystone's data in pk:common temp.waystone
data remove storage pk:common temp.waystone
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.waystone set from storage pk:waystones database.waystones[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from entity @s data.waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params

# Check if the data pack's version updated
scoreboard players set $controller.version pk.temp 0
execute store result score $controller.version pk.temp run data get entity @s data.waystone.version
execute if score $controller.version pk.temp < $pk.waystones.version pk.value run function pk_waystones:blocks/waystone/main/versions/on_update

# Check if settings have been updated
function pk_waystones:blocks/waystone/main/settings/check

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text": "Waystone loaded at [","color": "gray"},{"nbt":"temp.waystone.location.x","storage":"pk:common"},{"text": ","},{"nbt":"temp.waystone.location.y","storage":"pk:common"},{"text": ","},{"nbt":"temp.waystone.location.z","storage":"pk:common"},{"text": "] in "},{"nbt":"temp.waystone.location.dimension","storage":"pk:common"}]