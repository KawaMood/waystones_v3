#> pk_waystones:base/debug/force_waystones_to_unlock

kill @e[type=interaction,tag=pk.waystones.waystone.lock]
tag @e[type=marker,tag=pk.waystones.waystone.controller,tag=pk.custom_block.locked.monsters_nearby] remove pk.custom_block.locked.monsters_nearby
execute as @e[type=marker,tag=pk.waystones.waystone.controller,tag=pk.custom_block.locked.in_use] at @s run function pk_waystones:blocks/waystone/use/stop