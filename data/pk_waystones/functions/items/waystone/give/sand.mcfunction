#> pk_waystones:items/waystone/give/sand

function pk_waystones:items/waystone/attributes/sand
data modify storage pk:common params set value {count:1}
execute if score $count pk.temp matches 1.. store result storage pk:common params.count int 1 run scoreboard players get $count pk.temp
data modify storage pk:common params merge from storage pk:common temp.attributes
function pk_waystones:packages/dynamic_item/give with storage pk:common params