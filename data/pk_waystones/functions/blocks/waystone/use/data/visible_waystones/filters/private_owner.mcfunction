#> pk_waystones:blocks/waystone/use/data/visible_waystones/filters/private_owner

data modify storage pk:common temp.filter.output set value []
data modify storage pk:common params set value {p1:'data modify storage pk:common temp.filter.output append from storage pk:common temp.visible_waystones[{visibility:"private",owner:',p2:"}]"}
data modify storage pk:common params.v1 set from entity @s UUID
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params