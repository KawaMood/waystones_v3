#> pk_waystones:blocks/waystone/use/gui/actions/watch
# @context the user (tag=pk.current.player) at the used waystone's controller

# Prepare scores
scoreboard players set $gui.action.drop pk.temp 0
scoreboard players set $gui.action.click pk.temp 0
scoreboard players set $gui.action.put pk.temp 0
scoreboard players set $gui.action.put.accepted_item pk.temp 0

# Check if any action occured
#   Put (or swapped)
data modify storage pk:common temp.gui.put_items set from block ~ ~ ~ Items
data remove storage pk:common temp.gui.put_items[{tag:{pk_data:{gui:1b,from:"waystones"}}}]
execute store result score $gui.action.put pk.temp run data get storage pk:common temp.gui.put_items
#   Click (or swapped)
execute store result score $gui.action.click pk.temp run clear @s #pk_waystones:all{pk_data:{gui:1b,from:"waystones"}}
#   Drop
execute at @s anchored eyes positioned ^ ^ ^ store result score $gui.action.drop pk.temp run kill @e[type=item,distance=..2,nbt={Item:{tag:{pk_data:{gui:1b,from:"waystones"}}}}]
 
# Stop the process if no action occured
execute unless score $gui.action.click pk.temp matches 1.. unless score $gui.action.put pk.temp matches 1.. unless score $gui.action.drop pk.temp matches 1.. run return 0

# Prepare necessary data from controller
data modify storage pk:common params.id set from entity @e[type=marker,tag=pk.waystones.waystone.controller,distance=..0.1,limit=1] data.waystone.id
function pk_waystones:blocks/waystone/use/data/used_waystone/get
data modify storage pk:common temp.gui.prev_tick_items set from entity @e[type=marker,tag=pk.waystones.waystone.controller,distance=..0.1,limit=1] data.waystone.gui.prev_tick_items

# Store clicked item in case of swap action (click a button while already holding an item in cursor)
execute if score $gui.action.click pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/actions/click/search_item_start

# Switch actions
execute if score $gui.action.put pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/actions/put/run
execute if score $gui.action.click pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/actions/click/run
execute if score $gui.action.drop pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/actions/drop/run

# Update the cached data of the controller
data modify entity @e[type=marker,tag=pk.waystones.waystone.controller,distance=..0.1,limit=1] data.waystone.gui.prev_tick_items set from block ~ ~ ~ Items