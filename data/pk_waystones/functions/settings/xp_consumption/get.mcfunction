#> pk_waystones:settings/xp_consumption/get

# Get used distance mode
execute unless score $pk.waystones.settings.xp_consumption.mode pk.value matches 1 run data modify storage pk:common temp.mode set value "euclidian"
execute if score $pk.waystones.settings.xp_consumption.mode pk.value matches 1 run data modify storage pk:common temp.mode set value "manhattan"

# Logs
execute if score $pk.waystones.settings.xp_consumption.blocks pk.value matches 1.. run tellraw @s [{"text":"Teleportation currently requires 1 level per ","color":"gray"},{"score":{"name":"$pk.waystones.settings.xp_consumption.blocks","objective":"pk.value"},"color":"yellow"},{"text":" blocks, distance between two waystones being calculated with the \"","color":"gray"},{"nbt":"temp.mode","storage":"pk:common","color":"yellow"},{"text":"\" method","color":"gray"}]
execute unless score $pk.waystones.settings.xp_consumption.blocks pk.value matches 1.. run tellraw @s [{"text":"Level Consumption","color":"yellow"},{"text":" on teleportation is currently disabled","color":"gray"}]