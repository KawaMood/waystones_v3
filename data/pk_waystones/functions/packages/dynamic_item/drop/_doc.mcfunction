# Data should be set in storage pk:common temp.packages.dynamic_item
#   entity_data: Data to set to the item entity
#   apply_random_motion: Should be 1b if you want to apply a random motion to the item entity (like when you mine a block)

# Example:
data modify storage pk:common temp.packages.dynamic_item set value {apply_random_motion:1b,entity_data:{Tags:["ns.foo"]}}
data modify storage pk:common temp.packages.dynamic_item.entity_data.Owner set from entity @s UUID
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item set from entity @s SelectedItem
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.Count set value 1b
function pk_waystones:packages/dynamic_item/drop/run
# Would drop an item matching @s selected item and apply a random motion to it