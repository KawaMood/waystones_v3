# @requires
#   storage pk:common params.stop_at_first (boolean): if true, the process stops as soon as a block is found
#   storage pk:common params.distance (int): the distance the process should check blocks, drawing a volume of (d*2)*(d*2)*(d*2) blocks from the center
#   storage pk:common params.block (string): id or tag of the block to find
#   storage pk:common params.nbt (empty string or object): optinal nbt of the block entity to find
#   storage pk:common params.callback (string): run at the block location

# Example:
data modify storage pk:common params set value {distance:5,block:"#pk_waystones:player_heads",nbt:"",callback:"setblock ~ ~ ~ stone",stop_at_first:true}
function pk_namespace:packages/search_block/start with storage pk:common params
# Would search a block matching the tag #pk_waystones:player_heads in a 10x10x10 area where the current location is the center
# The first found block will be replaced with a stone