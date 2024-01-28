#> pk_waystones:permissions/change/shared_with/true

# Logs
execute if score $pk.waystones.permissions.change.shared_with pk.value matches 1 run tellraw @s [{"text":"Permission \"","color":"red"},{"text":"Change Shared With","color":"yellow"},{"text":"\" is already set to ","color":"red"},{"text":"true","color":"yellow"}]
execute unless score $pk.waystones.permissions.change.shared_with pk.value matches 1 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Change Shared With","color":"yellow"},{"text":"\" has been set to true","color":"gray"}]

# Update setting's value
scoreboard players set $pk.waystones.permissions.change.shared_with pk.value 1