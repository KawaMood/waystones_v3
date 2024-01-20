#> pk_waystones:blocks/waystone/use/gui/build/run
# @context any at the waystone container location (aligned xyz)
# @requires
#   storage pk:common temp.used_waystone: the current used waystone data

# Prepare scores
scoreboard players operation $gui.page pk.temp = @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] pk.waystones.page
execute store result score $gui.last_page pk.temp run data get entity @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] data.waystone.gui.last_page

# Store the list of visible waystones from the controller
data modify storage pk:common temp.visible_waystones set from entity @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] data.waystone.gui.visible_waystones

# If the xp_consumption setting is enabled, prepare data
execute if score $pk.waystones.settings.xp_consumption.blocks pk.value matches 1.. run function pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/prepare_data

# Build both GUI components
data modify storage pk:common temp.gui.items set value []
function pk_waystones:blocks/waystone/use/gui/build/waystones_list/run
function pk_waystones:blocks/waystone/use/gui/build/toolbar/run

# Update container and controller cached GUI items
data modify block ~ ~ ~ Items set from storage pk:common temp.gui.items
data modify entity @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] data.waystone.gui.prev_tick_items set from block ~ ~ ~ Items