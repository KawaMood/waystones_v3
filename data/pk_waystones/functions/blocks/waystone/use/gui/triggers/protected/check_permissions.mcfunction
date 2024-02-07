#> pk_waystones:blocks/waystone/use/gui/triggers/protected/check_permissions
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.gui.clicked_item: clicked item from the GUI
#   pk:common temp.used_waystone: the currently used waystone

# If change is disallowed
execute if data storage pk:common temp.gui.clicked_item.tag.pk_data.trigger_params{allowed:0b} run function pk_waystones:blocks/waystone/use/gui/triggers/cancel {reason:"You aren't allowed to change the Protection attribute"}
execute if score $trigger.stop pk.temp matches 1 run return 0