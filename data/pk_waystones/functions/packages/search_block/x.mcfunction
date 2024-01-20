#> pk_waystones:packages/search_block/x
# Recursively search on the X axis

scoreboard players operation $y pk.temp = $distance*2+1 pk.temp
function pk_waystones:packages/search_block/y

scoreboard players remove $x pk.temp 1
execute if score $packages.search_block.found pk.temp matches 0 if score $x pk.temp matches 1.. positioned ~1 ~ ~ run function pk_waystones:packages/search_block/x