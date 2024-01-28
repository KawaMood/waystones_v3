#> pk_waystones:permissions/change/visibility/public/get

# If true
execute unless score $pk.waystones.permissions.change.visiblity.public pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Change Visibility To Public","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]
# If false
execute if score $pk.waystones.permissions.change.visiblity.public pk.value matches 0 run tellraw @s [{"text":"Permission \"","color":"gray"},{"text":"Change Visibility To Public","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]
