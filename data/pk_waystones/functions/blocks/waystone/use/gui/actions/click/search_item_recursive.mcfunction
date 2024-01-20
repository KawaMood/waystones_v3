#> pk_waystones:blocks/waystone/use/gui/actions/click/search_item_recursive
# @context as the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.array_1: current tick GUI items list
#   pk:common temp.array_2: previous tick GUI items list
# @writes pk:common temp.gui.clicked_item: clicked item

# Compare item
data modify storage pk:common temp.compare.source set value {}
data modify storage pk:common temp.compare.source set from storage pk:common temp.array_1[-1]
execute store success score $item.found pk.temp run data modify storage pk:common temp.compare.source set from storage pk:common temp.array_2[-1]
execute if score $item.found pk.temp matches 1 run data modify storage pk:common temp.gui.clicked_item set from storage pk:common temp.array_2[-1]
execute if score $item.found pk.temp matches 1 run return 1

# Recursive call
data remove storage pk:common temp.array_1[-1]
data remove storage pk:common temp.array_2[-1]
execute if data storage pk:common temp.array_2[{}] run function pk_waystones:blocks/waystone/use/gui/actions/click/search_item_recursive