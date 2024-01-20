#> pk_waystones:blocks/waystone/use/gui/triggers/visibility/change
# @context the user (tag=pk.current.player) at the used waystone's controller
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch
# Storage:
#   pk:common temp.gui.clicked_item: clicked item from the GUI
#   pk:common temp.used_waystone: the currently used waystone

# Check if the player is allowed to change visibility
scoreboard players set $trigger.stop pk.temp 0
function pk_waystones:blocks/waystone/use/gui/triggers/visibility/check_permissions
execute if score $trigger.stop pk.temp matches 1 run return 0

# Update data
data modify storage pk:common temp.used_waystone.visibility set from storage pk:common temp.gui.clicked_item.tag.pk_data.trigger_params.visibility
function pk_waystones:blocks/waystone/use/data/used_waystone/update

# Update the GUI
execute align xyz run function pk_waystones:blocks/waystone/use/gui/build/run

# Animations
execute at @s run playsound block.conduit.activate block @s ~ ~ ~ 0.8 1.8