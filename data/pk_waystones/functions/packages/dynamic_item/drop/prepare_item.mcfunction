#> pk_waystones:packages/dynamic_item/drop/prepare_item

# Merge all data (including Tags) from the storage
data modify entity @s {} merge from storage pk:common temp.packages.dynamic_item.entity_data

# If no entity tag have been set from the storage, remove the current tag
tag @s remove pk.packages.dynamic_item.current

# Apply motion if needed
execute if data storage pk:common temp.packages.dynamic_item{apply_random_motion:1b} run function pk_waystones:packages/dynamic_item/drop/apply_random_motion