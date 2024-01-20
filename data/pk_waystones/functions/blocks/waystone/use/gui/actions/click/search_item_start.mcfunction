#> pk_waystones:blocks/waystone/use/gui/actions/click/search_item_start
# @context as the user (tag=pk.current.player) at the used waystone's controller

# Check what item has been removed or swaped from the container
data remove storage pk:common temp.gui.clicked_item
data modify storage pk:common temp.array_1 set from block ~ ~ ~ Items
data modify storage pk:common temp.array_2 set from storage pk:common temp.gui.prev_tick_items
function pk_waystones:blocks/waystone/use/gui/actions/click/search_item_recursive