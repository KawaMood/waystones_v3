#> pk_waystones:permissions/tp/in_other_dimensions/get

# If true
execute unless score $pk.waystones.permissions.tp.in_other_dimensions pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Tp In Other Dimensions","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]
# If false
execute if score $pk.waystones.permissions.tp.in_other_dimensions pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Tp In Other Dimensions","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]
