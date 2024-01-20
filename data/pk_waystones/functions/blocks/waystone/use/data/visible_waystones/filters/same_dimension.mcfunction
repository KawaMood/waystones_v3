#> pk_waystones:blocks/waystone/use/data/visible_waystones/filters/same_dimension

data modify storage pk:common temp.filter.output set value []
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.filter.output append from storage pk:common temp.visible_waystones[{location:{dimension:\"",p2:"\"}}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.used_waystone.location.dimension
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params