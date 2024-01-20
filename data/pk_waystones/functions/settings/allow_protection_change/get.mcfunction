#> pk_waystones:settings/allow_protection_change/get

# If true
execute unless score $pk.waystones.settings.allow_protection_change pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Allow Protection Change","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]
# If false
execute if score $pk.waystones.settings.allow_protection_change pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Allow Protection Change","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]