#> pk_waystones:packages/search_block/start
# Start to search the block recursively in a 10x10x10 area around the current location
# @requires
#   storage pk:common params.stop_at_first (boolean): if true, the process stops as soon as a block is found
#   storage pk:common params.distance (int): the distance the process should check blocks, drawing a volume of (d*2)*(d*2)*(d*2) blocks from the center
#   storage pk:common params.block (string): id or tag of the block to find
#   storage pk:common params.nbt (empty string or object): optinal nbt of the block entity to find
#   storage pk:common params.callback (string): run at the block location

# Prepare scores
execute store result score $distance pk.temp run data get storage pk:common params.distance
scoreboard players operation $distance*2+1 pk.temp = $distance pk.temp
scoreboard players operation $distance*2+1 pk.temp += $distance pk.temp
scoreboard players add $distance*2+1 pk.temp 1
scoreboard players operation $x pk.temp = $distance*2+1 pk.temp

execute store result score $packages.search_block.stop_at_first pk.temp run data get storage pk:common params.stop_at_first
scoreboard players set $packages.search_block.found pk.temp 0

$execute align xyz positioned ~-$(distance) ~-$(distance) ~-$(distance) run function pk_waystones:packages/search_block/x