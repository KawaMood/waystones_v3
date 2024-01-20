#> pk_waystones:blocks/waystone/remove/drop_item

$function pk_waystones:items/waystone/attributes/$(variant)
data modify storage pk:common temp.packages.dynamic_item set value {apply_random_motion:1b}
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item set from storage pk:common temp.attributes
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.tag.display.Name set from storage pk:common temp.waystone.name
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.Count set value 1b
function pk_waystones:packages/dynamic_item/drop/run