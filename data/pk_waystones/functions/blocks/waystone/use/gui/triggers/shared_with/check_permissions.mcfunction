#> pk_waystones:blocks/waystone/use/gui/triggers/shared_with/check_permissions
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.gui.clicked_item: clicked item from the GUI
#   pk:common temp.used_waystone: the currently used waystone

# If the player is manager, stop the current process
execute if entity @s[tag=pk.waystones.manager] run return 1

# If the player is not the owner, stop the root process
data modify storage pk:common params set value {p1:"execute store success score $player_is_owner pk.temp if data storage pk:common temp.used_waystone{owner:",p2:"}"}
data modify storage pk:common params.v1 set from entity @s UUID
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params
execute if score $player_is_owner pk.temp matches 0 run function pk_waystones:blocks/waystone/use/gui/triggers/cancel {reason:"You are not allowed to change this setting"}