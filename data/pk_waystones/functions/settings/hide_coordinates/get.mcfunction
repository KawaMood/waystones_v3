#> pk_waystones:settings/hide_coordinates/get

# If true
execute unless score $pk.waystones.settings.hide_coordinates pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Hide Coordinates","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]
# If false
execute if score $pk.waystones.settings.hide_coordinates pk.value matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Hide Coordinates","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]