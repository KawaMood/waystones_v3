#> pk_waystones:base/uninstall/4

# Check if the chunk of the waystone to remove is loaded
scoreboard players set $is_loaded pk.temp 0
$execute in $(dimension) if loaded $(x) $(y) $(z) run scoreboard players set $is_loaded pk.temp 1

# If yes, remove all waystones entities and blocks from the chunk
execute unless score $is_loaded pk.temp matches 0 run function pk_waystones:base/uninstall/5 with storage pk:waystones uninstall.waystone.location

# If not, wait 1 second and retry
execute if score $is_loaded pk.temp matches 0 run schedule function pk_waystones:base/uninstall/3 1s