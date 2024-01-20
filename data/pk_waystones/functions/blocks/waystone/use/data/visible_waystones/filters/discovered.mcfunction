#> pk_waystones:blocks/waystone/use/data/visible_waystones/filters/discovered

data modify storage pk:common temp.filter.output set value []
data modify storage pk:common params set value {p1:'data modify storage pk:common temp.filter.output append from storage pk:common temp.visible_waystones[{visibility:"discover",discovered_by:[{uuid:',p2:"}]}]"}
data modify storage pk:common params.v1 set from entity @s UUID
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params
data modify storage pk:common temp.n1.list append from storage pk:common temp.filter.output[]