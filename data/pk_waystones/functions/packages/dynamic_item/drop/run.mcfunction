#> pk_waystones:packages/dynamic_item/drop/run

# Set Motion if needed
execute unless data storage pk:common temp.packages.dynamic_item.entity_data.Motion run data modify storage pk:common temp.packages.dynamic_item.entity_data.Motion set value [0d,0d,0d]
execute if data storage pk:common temp.packages.dynamic_item{apply_random_motion:1b} run function pk_waystones:packages/dynamic_item/drop/apply_random_motion

# Set default Count and id
execute unless data storage pk:common temp.packages.dynamic_item.entity_data.Item.Count run data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.Count set value 1b
execute unless data storage pk:common temp.packages.dynamic_item.entity_data.Item.id run data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.id set value "minecraft:air"

# Summon item
function pk_waystones:packages/dynamic_item/drop/summon_item with storage pk:common temp.packages.dynamic_item

# Clear data
# data remove storage pk:common temp.packages.dynamic_item