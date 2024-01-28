#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/settings/xp_consumption/item_set_data
# @context user at the waystone container location (aligned xyz)
# Storage:
#   pk:common temp.visible_waystone: the current visible waystone of the loop
#   pk:common temp.used_waystone: the currently used waystone
#   pk:common temp.gui.item: the current button item in creation to append to the waystone list
# Scores:
#   $waystone_user.level pk.temp: current user's levels
#       @within pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/prepare_data

# If the waystone is free to use, cancel.
scoreboard players set $ignore pk.temp 0
execute if data storage pk:common temp.visible_waystone.ignore.settings{xp_consumption:1b} run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/settings/xp_consumption/item_ignore
execute if score $ignore pk.temp matches 1 run return 0

# Get distance between the used waystone and the visible waystone
# - Prepare params
#   storage pk:common temp.used_waystone.pos is an int array containing coordinates of the used waystone
#       @within pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/prepare_data
data modify storage pk:common params.pos1 set from storage pk:common temp.used_waystone.pos
data modify storage pk:common params.pos2 set value []
data modify storage pk:common params.pos2 append from storage pk:common temp.visible_waystone.location.x
data modify storage pk:common params.pos2 append from storage pk:common temp.visible_waystone.location.y
data modify storage pk:common params.pos2 append from storage pk:common temp.visible_waystone.location.z
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 0 run data modify storage pk:common params.mode set value "euclidian"
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 1 run data modify storage pk:common params.mode set value "manhattan"
# - Get distance
#   @writes $distance pk.temp
function pk_waystones:packages/get_distance/run

# Get the required levels
scoreboard players operation $xp_consumption.levels pk.temp = $distance pk.temp
scoreboard players operation $xp_consumption.levels pk.temp /= $pk.waystones.settings.xp_consumption.blocks pk.value

# Set required levels to item's data
execute store result storage pk:common temp.gui.item.tag.pk_data.required_levels int 1 run scoreboard players get $xp_consumption.levels pk.temp

# Set required levels in lore
execute if score $xp_consumption.levels pk.temp <= $player.level pk.temp run data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"Requires ","color":"green","italic":false},{"score":{"name":"$xp_consumption.levels","objective":"pk.temp"}},{"text":" level(s) for teleportation"}]'
execute if score $xp_consumption.levels pk.temp > $player.level pk.temp run data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"Requires ","color":"red","italic":false},{"score":{"name":"$xp_consumption.levels","objective":"pk.temp"}},{"text":" level(s) for teleportation"}]'
data modify storage pk:common temp.gui.item.tag.display.Lore append from block ~ ~-1 ~ front_text.messages[0]