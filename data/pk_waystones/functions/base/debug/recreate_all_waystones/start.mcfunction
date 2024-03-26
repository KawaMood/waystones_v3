#> pk_waystones:base/debug/recreate_all_waystones/start

tag @s add pk.waystones.recreate
tellraw @s [{"text": "Starting to recreate all waystones from ","color": "gray"},{"text": "KawaMood's Waystones","color": "aqua","bold": true},{"text": "...","color": "gray"}]
scoreboard players set $pk.waystones.debug.recreate.waystones.length pk.value 0
execute store result score $pk.waystones.debug.recreate.waystones.length pk.value run data get storage pk:waystones database.waystones
data modify storage pk:waystones debug.recreate.waystones set from storage pk:waystones database.waystones
execute if score $pk.waystones.debug.recreate.waystones.length pk.value matches 0 run function pk_waystones:base/debug/recreate_all_waystones/stop
execute if score $pk.waystones.debug.recreate.waystones.length pk.value matches 1.. run function pk_waystones:base/debug/recreate_all_waystones/1