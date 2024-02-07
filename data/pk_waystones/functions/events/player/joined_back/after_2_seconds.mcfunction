#> pk_waystones:events/player/joined_back/after_2_seconds
# @context player who joined back at @s

# Unmark entity
tag @s remove pk.waystones.wait.event.joined_back

# Prepare data from player
data remove storage pk:common temp.player
data modify storage pk:common temp.player.uuid set from entity @s UUID

# Check if the player is still in database
scoreboard players set $in_database pk.temp 0
data modify storage pk:common params set value {p1:"execute store result score $in_database pk.temp if data storage pk:waystones database.players[{uuid:",p2:"}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.player.uuid
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params

# Get player's name
function pk_waystones:packages/get_player_name/run
data modify storage pk:common temp.player.name set from storage pk:common temp.packages.get_player_name.name

# Store player in database
#   If not in data base yet, add it
execute if score $in_database pk.temp matches 0 run data modify storage pk:waystones database.players append from storage pk:common temp.player
execute if score $in_database pk.temp matches 0 run return 1
#   If already in database, update name
data modify storage pk:common params set value {p1:"data modify storage pk:waystones database.players[{uuid:",p2:"}] set from storage pk:common temp.player"}
data modify storage pk:common params.v1 set from storage pk:common temp.player.uuid
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params