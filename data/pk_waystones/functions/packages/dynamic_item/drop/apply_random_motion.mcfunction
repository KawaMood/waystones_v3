#> pk_waystones:packages/dynamic_item/drop/apply_random_motion

# Prepare a default motion
data modify storage pk:common temp.packages.dynamic_item.entity_data.Motion set value [0.0d,0.1d,0.0d]

# Set a random motion from -0.1d to 0.1d for X and Z axis Motion
execute store result storage pk:common temp.packages.dynamic_item.Motion[0] double 0.01 run random value -10..10
execute store result storage pk:common temp.packages.dynamic_item.Motion[2] double 0.01 run random value -10..10
data modify entity @s Motion set from storage pk:common temp.packages.dynamic_item.entity_data.Motion

# Air toggling
function pk_waystones:packages/air_toggling/start