#> pk_waystones:settings/allow_protection_change/true

# Logs
execute if score $pk.waystones.settings.allow_protection_change pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"red"},{"text":"Allow Protection Change","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"true","color":"yellow"}]
execute unless score $pk.waystones.settings.allow_protection_change pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Allow Protection Change","color":"yellow"},{"text":"\" has been set to true","color":"gray"}]

# Update setting's value
scoreboard players set $pk.waystones.settings.allow_protection_change pk.value 1