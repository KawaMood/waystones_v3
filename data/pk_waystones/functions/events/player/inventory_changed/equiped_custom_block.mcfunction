#> pk_waystones:events/player/inventory_changed/equiped_custom_block

# Give equiped head item back in inventory
data modify storage pk:common params.id set from entity @s Inventory[{Slot:103b}].id
data modify storage pk:common params.count set from entity @s Inventory[{Slot:103b}].Count
data modify storage pk:common params.tag set from entity @s Inventory[{Slot:103b}].tag
function pk_waystones:packages/dynamic_item/give with storage pk:common params
item replace entity @s armor.head with air

# Revoke advancement at the end so the function isn't indefinitively triggered by the inventory change above
advancement revoke @s only pk_waystones:events/inventory_changed/equiped_custom_block