#> pk_waystones:events/player/placed_block/hopper

# Revoke advancement
advancement revoke @s only pk_waystones:events/placed_block/hopper

# Check if player placed hopper next to a Waystone (middle part)
execute as @e[type=marker,tag=pk.waystones.waystone.controller,distance=..100] at @s run function pk_waystones:blocks/waystone/environment/blocks/verify_hoppers