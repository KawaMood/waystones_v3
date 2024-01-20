#> pk_waystones:blocks/waystone/place/try/start
# Player try to place a waystone
# @context as the player that placed a waystone (tag=pk.current.player) at the found block

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Prepare scores and data
# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Store placed block data
data modify storage pk:common temp.block set from block ~ ~ ~

# Total amount of Waystones owned by the current player
scoreboard players set $waystones_of_player pk.temp 0
data modify storage pk:common temp.database.output set value []
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.database.output append from storage pk:waystones database.waystones[{owner:",p2:"}]"}
data modify storage pk:common params.v1 set from entity @s UUID
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params
execute store result score $waystones_of_player pk.temp run data get storage pk:common temp.database.output

# Total amount of Waystones in the world
scoreboard players set $waystones_of_server pk.temp 0
execute store result score $waystones_of_server pk.temp run data get storage pk:waystones database.waystones

# Score used to stop the process
scoreboard players set $place.stop pk.temp 0

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Start to check if the waystone can be placed at this location
# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Check if the current dimension isn't blacklisted (condition outpassed by managers)
data modify storage pk:common params.dimension set from entity @s Dimension
execute unless entity @s[tag=pk.waystones.manager] run function pk_waystones:blocks/waystone/place/try/dimension with storage pk:common params
execute unless score $place.stop pk.temp matches 0 run return 0

# Check if the player exceeded the Waystones limit per player (condition outpassed by managers)
execute if score $pk.waystones.settings.limit_per_player pk.value matches 0.. if score $waystones_of_player pk.temp >= $pk.waystones.settings.limit_per_player pk.value unless entity @s[tag=pk.waystones.manager] run function pk_waystones:blocks/waystone/place/try/cancel {reason:"You already placed too many waystones"}
execute unless score $place.stop pk.temp matches 0 run return 0

# Check if the Waystones limit of the server has been exceeded (condition outpassed by managers)
execute if score $pk.waystones.settings.limit_per_server pk.value matches 0.. if score $waystones_of_server pk.temp >= $pk.waystones.settings.limit_per_server pk.value unless entity @s[tag=pk.waystones.manager] run function pk_waystones:blocks/waystone/place/try/cancel {reason:"There are already too many waystones in this world"}
execute unless score $place.stop pk.temp matches 0 run return 0

# Check if the Waystone fits on the placed area
execute unless predicate pk_waystones:block_sets/waystone/fit run function pk_waystones:blocks/waystone/place/try/cancel {reason:"There is not enough space for a waystone to be placed here"}
execute unless score $place.stop pk.temp matches 0 run return 0

# If all checks passed
function pk_waystones:blocks/waystone/place/run