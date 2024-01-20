#> pk_waystones:blocks/waystone/use/gui/triggers/tp/settings/xp_consumption/check_if_player_can_tp
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.gui.clicked_item: the clicked item from the GUI
#   pk:common temp.targeted_waystone: the targeted waystone data

# If the waystone ignore xp consumption, stop the current process
execute if data storage pk:common temp.targeted_waystone.ignore.settings{xp_consumption:1b} run return 1

# Prepare scores
scoreboard players set $xp_consumption.levels pk.temp 0
execute store result score $xp_consumption.levels pk.temp run data get storage pk:common temp.gui.clicked_item.tag.pk_data.required_levels
execute store result score $player.level pk.temp run xp query @s levels

# Stop if the player doesn't have enough xp unless it is a manager or in creative mode
execute if score $player.level pk.temp < $xp_consumption.levels pk.temp if entity @s[tag=!pk.waystones.manager,gamemode=!creative] run function pk_waystones:blocks/waystone/use/gui/triggers/cancel {reason:"You don't have enough levels to reach this waystone"}
execute if score $trigger.stop pk.temp matches 1 run return 0

# Consume levels
execute store result storage pk:common params.levels int 1 run scoreboard players get $xp_consumption.levels pk.temp
function pk_waystones:blocks/waystone/use/gui/triggers/tp/settings/xp_consumption/consume with storage pk:common params