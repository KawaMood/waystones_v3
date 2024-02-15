#> pk_waystones:base/debug/recreate_all_waystones/2

# Check if the chunk is already forceloaded and forceload it if needed
$execute in $(dimension) store result score $pk.waystones.debug.recreate.chunk.already_forceload pk.value run forceload query $(x) $(z)
$execute in $(dimension) if score $pk.waystones.debug.recreate.chunk.already_forceload pk.value matches 0 run forceload add $(x) $(z)

# Wait one second and check if the chunk is fully loaded
schedule function pk_waystones:base/debug/recreate_all_waystones/3 1s