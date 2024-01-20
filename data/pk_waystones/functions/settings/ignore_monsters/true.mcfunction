#> pk_waystones:settings/ignore_monsters/true

# Cancel process if setting is already set on the attempted value
execute unless score $pk.waystones.settings.ignore_monsters pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"red"},{"text":"Ignore Monsters","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"true","color":"yellow"}]
execute if score $pk.waystones.settings.ignore_monsters pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Ignore Monsters","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"true","color":"yellow"}]

# Update the setting's value
scoreboard players set $pk.waystones.settings.ignore_monsters pk.value 1

# Force currently loaded waystones to update
execute as @e[type=marker,tag=pk.waystones.waystone.controller] at @s run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/stop