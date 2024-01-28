#> pk_waystones:permissions/change/shared_with/get

# If true
execute unless score $pk.waystones.permissions.change.shared_with pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Change Shared With","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]
# If false
execute if score $pk.waystones.permissions.change.shared_with pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Change Shared With","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]
