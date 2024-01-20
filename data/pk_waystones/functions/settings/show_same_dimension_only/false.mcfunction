#> pk_waystones:settings/show_same_dimension_only/false

# Cancel process if setting is already set on the attempted value
execute unless score $pk.waystones.settings.show_same_dimension_only pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"red"},{"text":"Show Same Dimension Only","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"false","color":"yellow"}]
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Show Same Dimension Only","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"false","color":"yellow"}]

# Update the setting's value
scoreboard players set $pk.waystones.settings.show_same_dimension_only pk.value 0