#> pk_waystones:blocks/waystone/use/data/used_waystone/update
# Update the used waystone in the database

data modify storage pk:common params set value {p1:"data modify storage pk:waystones database.waystones[{id:",p2:"}] set from storage pk:common temp.used_waystone"}
data modify storage pk:common params.v1 set from storage pk:common temp.used_waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params