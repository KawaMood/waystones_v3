#> pk_waystones:settings/allow_visibility_change/get

# If true
execute unless score $pk.waystones.settings.allow_visibility_change pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Allow Visibility Change","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]
# If false
execute if score $pk.waystones.settings.allow_visibility_change pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Allow Visibility Change","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]