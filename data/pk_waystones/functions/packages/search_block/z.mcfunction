#> pk_waystones:packages/search_block/z
# Recursively search on the Z axis

$execute if block ~ ~ ~ $(block)$(nbt) run function pk_waystones:packages/search_block/found with storage pk:common params
scoreboard players remove $z pk.temp 1
execute if score $packages.search_block.found pk.temp matches 0 if score $z pk.temp matches 1.. positioned ~ ~ ~1 run function pk_waystones:packages/search_block/z with storage pk:common params