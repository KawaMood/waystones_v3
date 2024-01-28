#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/shared_with/item

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {Slot:23b,id:"minecraft:writable_book",Count:1b,tag:{display:{Name:'[{"text":"Shared List","italic":false}]',Lore:['{"text":"Click to get the Writable Book","color":"gray","italic":false}']},HideFlags:255,CustomModelData:11130068,pk_data:{gui:1b,from:"waystones",trigger:"shared_with/taken",in_accepted_item_slot:1b}}}

# Set click action depending on permissions
# - SharedWith Change is disallowed and the player is not manager
scoreboard players set $allow pk.temp 0
execute unless score $pk.waystones.permissions.change.shared_with pk.value matches 0 run scoreboard players set $allow pk.temp 1
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $allow pk.temp 1
execute if score $allow pk.temp matches 0 run data remove storage pk:common temp.gui.item.tag.display.Lore
execute if score $allow pk.temp matches 0 run data modify storage pk:common temp.gui.item.tag.pk_data.trigger_params set value {allowed:0b}

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item