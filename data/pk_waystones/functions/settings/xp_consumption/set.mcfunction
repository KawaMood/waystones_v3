#> pk_waystones:settings/xp_consumption/set
# @input
#   $mode (string): The distance calculation mode. Can be either "manhattan" (following grid) or "euclidian" (straight-line)
#   $blocks (int): distance in blocks per level consumption. 
#      If set to 0 or less, disable the level consumption
#      For example, if set to 1000 and the current distance that separates both waystones is between 2000 and 2999, it would requires 2 levels.
# Example: 
#   function pk_waystones:settings/xp_consumption/set {blocks:100,mode:"euclidian"} 

# Store parameters
$data modify storage pk:common temp.mode set value $(mode)
$data modify storage pk:common temp.blocks set value $(blocks)

# Set default mode to euclidian (0)
scoreboard players set $pk.waystones.settings.xp_consumption.mode pk.value 0
# Set manatthan mode (1)
execute if data storage pk:common temp{mode:"manhattan"} run scoreboard players set $pk.waystones.settings.xp_consumption.mode pk.value 1

# Set blocks_per_level
$scoreboard players set $pk.waystones.settings.xp_consumption.blocks pk.value $(blocks)

# Warn player
execute if score $pk.waystones.settings.xp_consumption.blocks pk.value matches 1.. run tellraw @s [{"text":"Teleporting now requires 1 level per ","color":"gray"},{"nbt":"temp.blocks","storage":"pk:common","color":"yellow"},{"text":" blocks, distance between two waystones being calculated with the \"","color":"gray"},{"nbt":"temp.mode","storage":"pk:common","color":"yellow"},{"text":"\" method","color":"gray"}]
execute unless score $pk.waystones.settings.xp_consumption.blocks pk.value matches 1.. run tellraw @s [{"text":"Level Consumption","color":"yellow"},{"text":" on teleportation has been disabled","color":"gray"}]