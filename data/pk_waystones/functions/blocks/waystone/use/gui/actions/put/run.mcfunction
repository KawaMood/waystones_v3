#> pk_waystones:blocks/waystone/use/gui/actions/put/run
# @context the user (tag=pk.current.player) at the used waystone's controller
# Put items have been stored in storage pk:common temp.gui.put_items
#   @within function pk_waystones:blocks/waystone/use/gui/actions/watch

# Check if the player put an acceptable item in a valid slot
# - "Shared with" item (writable book)
execute if data storage pk:common temp.gui.put_items[{Slot:23b,id:"minecraft:writable_book"}] run function pk_waystones:blocks/waystone/use/gui/actions/put/accepted/shared_with

# Remove the temp data
data remove storage pk:common temp.gui.accepted_item

# Return all unaccepted items
function pk_waystones:blocks/waystone/use/gui/actions/put/polluting/return_items_recursive