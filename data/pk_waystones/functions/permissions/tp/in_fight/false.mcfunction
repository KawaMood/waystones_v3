#> pk_waystones:permissions/tp/in_fight/false

# Logs
execute if score $pk.waystones.permissions.tp.in_fight pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"red"},{"text":"Tp In Fight","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"false","color":"yellow"}]
execute unless score $pk.waystones.permissions.tp.in_fight pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Tp In Fight","color":"yellow"},{"text":"\" has been set to false","color":"gray"}]

# Update setting's value
scoreboard players set $pk.waystones.permissions.tp.in_fight pk.value 0