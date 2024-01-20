#> pk_waystones:settings/legacy_textures/true

# Cancel process if setting is already set on the attempted value
execute if score $pk.waystones.settings.legacy_textures pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"red"},{"text":"Legacy Textures","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"true","color":"yellow"}]
execute unless score $pk.waystones.settings.legacy_textures pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Legacy Textures","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"true","color":"yellow"}]

# Update the setting's value
scoreboard players set $pk.waystones.settings.legacy_textures pk.value 1

# Force currently loaded waystones to update
execute as @e[type=marker,tag=pk.waystones.waystone.controller] at @s run function pk_waystones:blocks/waystone/main/on_entity_load