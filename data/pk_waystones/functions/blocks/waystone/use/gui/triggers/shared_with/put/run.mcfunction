#> pk_waystones:blocks/waystone/use/gui/triggers/shared_with/put/run
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.gui.accepted_item: accepted item from the put items list
#       @within pk_waystones:blocks/waystone/use/gui/actions/put/accepted/shared_with

# Cancel if the player is allowed to change shared_with
scoreboard players set $trigger.stop pk.temp 0
function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/check_permissions
execute if score $trigger.stop pk.temp matches 1 run return 0

# Cancel if accepted item doesn't contain the excpected data
execute unless data storage pk:common temp.gui.accepted_item.tag.pages[0] run function pk_waystones:blocks/waystone/use/gui/triggers/cancel {reason:"There's nothing written in this book"}
execute if score $trigger.stop pk.temp matches 1 run return 0

# Prepare new shared_with array
data modify storage pk:common temp.new.shared_with set value []
data modify storage pk:common temp.array_1 set value []
data modify storage pk:common temp.array_1 append from storage pk:common temp.gui.accepted_item.tag.pages[]
execute if data storage pk:common temp.array_1[-1] run function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/put/pages_filter_recursive

# Update data
data modify storage pk:common temp.used_waystone.shared_with set from storage pk:common temp.new.shared_with
function pk_waystones:blocks/waystone/use/data/used_waystone/update

# Update the GUI
execute align xyz run function pk_waystones:blocks/waystone/use/gui/build/run

# Animations
execute at @s run playsound entity.villager.work_librarian block @s ~ ~ ~ 0.8 1.2