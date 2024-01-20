#> pk_waystones:blocks/waystone/use/gui/actions/put/accepted/shared_with

# Set accepted item score (using in click action to detect a valid swap)
scoreboard players set $gui.action.put.accepted_item pk.temp 1

# Store item and remove it from pk:common temp.gui.put_items storage
data modify storage pk:common temp.gui.accepted_item set from storage pk:common temp.gui.put_items[{Slot:23b}]
data remove storage pk:common temp.gui.put_items[{Slot:23b}]

# Run the trigger function
function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/put/run