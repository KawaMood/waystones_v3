#> pk_waystones:base/debug/recreate_all_waystones/4

# Check if the chunk of the waystone to recreate is loaded
scoreboard players set $is_loaded pk.temp 0
$execute in $(dimension) if loaded $(x) $(y) $(z) run scoreboard players set $is_loaded pk.temp 1

# If yes, recreate current waystone
$execute unless score $is_loaded pk.temp matches 0 in $(dimension) positioned $(x).0 $(y).0 $(z).0 run function pk_waystones:base/debug/recreate_all_waystones/5

# If not, wait 1 second and retry
execute if score $is_loaded pk.temp matches 0 run schedule function pk_waystones:base/debug/recreate_all_waystones/3 1s