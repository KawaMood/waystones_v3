#> pk_waystones:blocks/waystone/use/gui/triggers/shared_with/put/add_player

# Prepare player data
data modify storage pk:common temp.player set value {}
data modify storage pk:common temp.player.name set from storage pk:common temp.current_string 

# Search player in database and if found, set its uuid
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.player.uuid set from storage pk:waystones database.players[{name:",p2:"}].uuid"}
data modify storage pk:common params.v1 set from storage pk:common temp.player.name
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params

# Append player to the new shared_with array
data modify storage pk:common temp.new.shared_with append from storage pk:common temp.player