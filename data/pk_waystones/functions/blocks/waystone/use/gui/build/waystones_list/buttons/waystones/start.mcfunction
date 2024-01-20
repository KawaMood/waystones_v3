#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/start
# @context any at the waystone container location (aligned xyz)
# @requires
#   storage pk:common temp.visible_waystones: a list of all waystones that can be seen by the player

# Prepare item slot
scoreboard players set $slot pk.temp 0

# Prepare "for" loop starting and ending index
execute store result score $length pk.temp run data get storage pk:common temp.visible_waystones
scoreboard players operation $i pk.temp = $gui.page pk.temp
scoreboard players operation $i pk.temp *= $18 pk.value
scoreboard players operation $i_max pk.temp = $i pk.temp
scoreboard players remove $i pk.temp 18
execute if score $i_max pk.temp > $length pk.temp run scoreboard players operation $i_max pk.temp = $length pk.temp
scoreboard players remove $i_max pk.temp 1

# Recursively set waystone item
setblock ~ ~-1 ~ oak_sign
execute store result storage pk:common params.i int 1 run scoreboard players get $i pk.temp
function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/recursive with storage pk:common params
setblock ~ ~-1 ~ barrier