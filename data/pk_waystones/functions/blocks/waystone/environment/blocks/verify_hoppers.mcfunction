#> pk_waystones:blocks/waystone/environment/blocks/verify_hoppers
# Prevent hoppers to face the container block or be set bellow it

# Change adjacent hoppers facing state
execute if block ~-1 ~ ~ hopper[facing=east] run setblock ~-1 ~ ~ hopper[facing=down]
execute if block ~1 ~ ~ hopper[facing=west] run setblock ~1 ~ ~ hopper[facing=down]
execute if block ~ ~ ~-1 hopper[facing=south] run setblock ~ ~ ~-1 hopper[facing=down]
execute if block ~ ~ ~1 hopper[facing=north] run setblock ~ ~ ~1 hopper[facing=down]
execute if block ~ ~1 ~ hopper[facing=down] run setblock ~ ~1 ~ hopper[facing=south]

# Remove hopper placed bellow the block
execute if block ~ ~-1 ~ hopper run setblock ~ ~-1 ~ air destroy