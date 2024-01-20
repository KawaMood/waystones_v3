#> pk_waystones:settings/show_same_dimension_only/get

# If false
execute unless score $pk.waystones.settings.show_same_dimension_only pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Show Same Dimension Only","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]
# If true
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Show Same Dimension Only","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]