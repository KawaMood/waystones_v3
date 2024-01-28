#> pk_waystones:permissions/change/shared_with/false

# Logs
execute if score $pk.waystones.permissions.change.shared_with pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"red"},{"text":"Change Shared With","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"false","color":"yellow"}]
execute unless score $pk.waystones.permissions.change.shared_with pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Change Shared With","color":"yellow"},{"text":"\" has been set to false","color":"gray"}]

# Update setting's value
scoreboard players set $pk.waystones.permissions.change.shared_with pk.value 0