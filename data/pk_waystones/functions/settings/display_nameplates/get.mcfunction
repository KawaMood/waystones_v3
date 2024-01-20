#> pk_waystones:settings/display_nameplates/get

# If false
execute unless score $pk.waystones.settings.display_nameplates pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Name Above","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]
# If true
execute if score $pk.waystones.settings.display_nameplates pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Name Above","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]