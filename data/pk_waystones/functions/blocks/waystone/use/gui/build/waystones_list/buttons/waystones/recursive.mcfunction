#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/recursive
# @context any at the waystone container location (aligned xyz)
# @requires
#   storage pk:common temp.visible_waystones: a list of all waystones that can be seen by the player

# Create item and append it to pk:common temp.gui.waystones_list
$data modify storage pk:common temp.visible_waystone set from storage pk:common temp.visible_waystones[$(i)]
function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item

# Recursive call
scoreboard players add $i pk.temp 1
scoreboard players add $slot pk.temp 1
execute store result storage pk:common params.i int 1 run scoreboard players get $i pk.temp
execute if score $i pk.temp <= $i_max pk.temp run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/recursive with storage pk:common params