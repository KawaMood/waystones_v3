#> pk_waystones:events/player/placed_block/waystone

# Revoke advancement
advancement revoke @s only pk_waystones:events/placed_block/waystone

# Mark the current player
tag @s add pk.current.player

# Store item data the player used to place the Waystone and tell the process it has been placed by a player
data modify storage pk:common temp.item set from entity @s SelectedItem
scoreboard players set $pk.custom_block.placed_by_player pk.temp 1

# Search the placed block
# @callback function pk_waystones:blocks/waystone/place/try/start
data modify storage pk:common params set value {distance:10,block:"#pk_waystones:player_heads",nbt:{SkullOwner:{Id:[I;16,11,3,2],Name:"%pk.custom_block.waystone"}},callback:"function pk_waystones:blocks/waystone/place/try/start",stop_at_first:true}
function pk_waystones:packages/search_block/start with storage pk:common params

# Unmark the current player
tag @s remove pk.current.player

# Reset the placing by player score
scoreboard players set $pk.custom_block.placed_by_player pk.temp 0