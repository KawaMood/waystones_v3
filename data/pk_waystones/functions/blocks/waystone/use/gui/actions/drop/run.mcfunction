#> pk_waystones:blocks/waystone/use/gui/actions/drop/run
# @context as the user (tag=pk.current.player) at the used waystone's controller

# Restore GUI items from stored previous tick GUI items
data modify block ~ ~ ~ Items set from storage pk:common temp.gui.prev_tick_items