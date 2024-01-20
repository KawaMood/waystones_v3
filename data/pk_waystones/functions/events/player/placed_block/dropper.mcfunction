#> pk_waystones:events/player/placed_block/dropper

# Revoke advancement
advancement revoke @s only pk_waystones:events/placed_block/dropper

# Check if player placed dropper next to a Waystone (middle part)
execute as @e[type=marker,tag=pk.waystones.waystone.controller,distance=..20] at @s run function pk_waystones:blocks/waystone/environment/blocks/verify_droppers