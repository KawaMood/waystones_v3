#> pk_waystones:settings/ignore_monsters/false

# Logs
execute if score $pk.waystones.settings.ignore_monsters pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"red"},{"text":"Ignore Monsters","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"false","color":"yellow"}]
execute unless score $pk.waystones.settings.ignore_monsters pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Ignore Monsters","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"false","color":"yellow"}]

# Update the setting's value
scoreboard players set $pk.waystones.settings.ignore_monsters pk.value 0