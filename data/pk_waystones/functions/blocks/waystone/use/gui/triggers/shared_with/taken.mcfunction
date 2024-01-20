#> pk_waystones:blocks/waystone/use/gui/triggers/shared_with/taken
# @context the user (tag=pk.current.player) at the used waystone's controller
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch
# Storage:
#   pk:common temp.used_waystone: the currently used waystone

# Cancel if the player isn't the owner or a manager
scoreboard players set $trigger.stop pk.temp 0
function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/check_permissions
execute if score $trigger.stop pk.temp matches 1 run return 0

# Give item to user
data modify storage pk:common params set value {tag:{pages:[]},id:"minecraft:writable_book"}
data modify storage pk:common params.count set value 1
data modify storage pk:common params.tag.pages append from storage pk:common temp.used_waystone.shared_with[].name
function pk_waystones:packages/dynamic_item/give with storage pk:common params

# Update data unless it has been swapped with another accepted item
execute if score $gui.action.put.accepted_item pk.temp matches 0 run data modify storage pk:common temp.used_waystone.shared_with set value []
execute if score $gui.action.put.accepted_item pk.temp matches 0 run function pk_waystones:blocks/waystone/use/data/used_waystone/update

# Update the GUI unless it has been swapped with another accepted item
execute if score $gui.action.put.accepted_item pk.temp matches 0 align xyz run function pk_waystones:blocks/waystone/use/gui/build/run