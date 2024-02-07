#> pk_waystones:blocks/waystone/use/gui/actions/click/run
# @context as the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.gui.clicked_item: clicked item
#      @within pk_waystones:blocks/waystone/use/gui/actions/click/search_item_start

# Switch trigger
execute if data storage pk:common temp.gui.clicked_item.tag.pk_data.trigger run function pk_waystones:blocks/waystone/use/gui/triggers/switch with storage pk:common temp.gui.clicked_item.tag.pk_data

# Restore items from previous tick GUI items
scoreboard players set $gui.restore_from_prev_tick_items pk.temp 0
#   If the clicked item has the restore_gui_on_click:1b data
execute if data storage pk:common temp.gui.clicked_item.tag.pk_data{restore_gui_on_click:1b} run scoreboard players set $gui.restore_from_prev_tick_items pk.temp 1
#   Exceptions:
#       Players swapped the item with an accepted item
execute if score $gui.action.put.accepted_item pk.temp matches 1 if data storage pk:common temp.gui.clicked_item.tag.pk_data{in_accepted_item_slot:1b} run scoreboard players set $gui.restore_from_prev_tick_items pk.temp 0
#       Try to restore
execute if score $gui.restore_from_prev_tick_items pk.temp matches 1 run data modify block ~ ~ ~ Items set from storage pk:common temp.gui.prev_tick_items