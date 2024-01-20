#> pk_waystones:packages/search_block/found
# Run at the found block

execute if score $packages.search_block.stop_at_first pk.temp matches 1 run scoreboard players set $packages.search_block.found pk.temp 1
$$(callback)