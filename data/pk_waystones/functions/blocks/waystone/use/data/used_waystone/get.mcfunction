#> pk_waystones:blocks/waystone/use/data/used_waystone/get
# @context should be set as (any) at the waystone container location
# @writes storage pk:common temp.used_waystone: the currently used waystone's data

data modify storage pk:common params set value {p1:"data modify storage pk:common temp.used_waystone set from storage pk:waystones database.waystones[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from entity @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] data.waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params