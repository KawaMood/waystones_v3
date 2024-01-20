#> pk_waystones:events/player/item_used_on_block/any_on_waystone_lock/run
# @within advancement pk_waystones:events/item_used_on_block/any_on_waystone_lock

advancement revoke @s only pk_waystones:events/item_used_on_block/any_on_waystone_lock

tag @s add pk.current.player
execute as @e[type=interaction,tag=pk.custom_block.lock,distance=..20] if data entity @s interaction run function pk_waystones:events/player/item_used_on_block/any_on_waystone_lock/from_interaction
tag @s remove pk.current.player