#> pk_waystones:blocks/waystone/use/gui/actions/put/polluting/return_items_recursive
# @context the user (tag=pk.current.player) at the used waystone's controller
# Put items have been stored in storage pk:common temp.gui.put_items
#   @within function pk_waystones:blocks/waystone/use/gui/actions/watch

# Return item to user
data modify storage pk:common params set value {tag:""}
data modify storage pk:common params.id set from storage pk:common temp.gui.put_items[-1].id
data modify storage pk:common params.count set from storage pk:common temp.gui.put_items[-1].Count
data modify storage pk:common params.tag set from storage pk:common temp.gui.put_items[-1].tag
function pk_waystones:packages/dynamic_item/give with storage pk:common params

# Remove item from GUI
data modify storage pk:common params set value {p1:"data remove block ~ ~ ~ Items[{Slot:",p2:"b}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.gui.put_items[-1].Slot
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params

# Recursive call
data remove storage pk:common temp.gui.put_items[-1]
execute if data storage pk:common temp.gui.put_items[-1] run function pk_waystones:blocks/waystone/use/gui/actions/put/polluting/return_items_recursive