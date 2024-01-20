#> pk_waystones:blocks/waystone/use/gui/triggers/tp/run
# @context the user (tag=pk.current.player) at the used waystone's controller
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch
# Storage:
#   pk:common temp.gui.clicked_item: clicked item from the GUI
#   pk:common temp.used_waystone: the currently used waystone

# Prepare scores
scoreboard players set $trigger.stop pk.temp 0

# Set GUI items from prev tick
data modify block ~ ~ ~ Items set from storage pk:common temp.gui.prev_tick_items

# Store data of the targeted waystone
data remove storage pk:common temp.targeted_waystone
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.targeted_waystone set from storage pk:waystones database.waystones[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.gui.clicked_item.tag.pk_data.waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params

# Stop if targeted waystone is not found
execute unless data storage pk:common temp.targeted_waystone run function pk_waystones:blocks/waystone/use/gui/triggers/cancel {reason:"This waystone cannot be found"}
execute if score $trigger.stop pk.temp matches 1 run return 0

# If the the setting "xp_consumption" is enabled, check if the player is able to tp to the targeted waystone
execute if score $pk.waystones.settings.xp_consumption.blocks pk.value matches 1.. run function pk_waystones:blocks/waystone/use/gui/triggers/tp/settings/xp_consumption/check_if_player_can_tp
execute if score $trigger.stop pk.temp matches 1 run return 0

# Link all entities to tp
execute at @s run function pk_waystones:blocks/waystone/use/gui/triggers/tp/group_prepare

# Center the landing point's coordinates and also set a random offset
function pk_waystones:blocks/waystone/use/gui/triggers/tp/landing_point_prepare

# Animations
execute at @s run playsound block.portal.travel player @a[distance=..30,tag=!pk.temp.current] ~ ~ ~ 0.1 1.8
execute at @s run particle reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50

# Tp
data modify storage pk:common params set from storage pk:common temp.landing_point
execute at @s as @e[tag=pk.waystones.tp,distance=..20] run function pk_waystones:blocks/waystone/use/gui/triggers/tp/group_tp with storage pk:common params