#> pk_waystones:blocks/waystone/use/gui/triggers/cancel
# @input
#   $reason: reason

# Stop the root process
scoreboard players set $trigger.stop pk.temp 1

# If there is a put item, return it
execute if data storage pk:common temp.gui.accepted_item run function pk_waystones:blocks/waystone/use/gui/triggers/return_put_item

# Warn player
$tellraw @s {"text":"$(reason)","color":"red"}

# Set GUI items from prev tick
data modify block ~ ~ ~ Items set from storage pk:common temp.gui.prev_tick_items

# Animations
playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 0.8 0.5