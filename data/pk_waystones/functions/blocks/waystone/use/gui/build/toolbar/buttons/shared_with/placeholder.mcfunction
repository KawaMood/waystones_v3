#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/shared_with/placeholder

data modify storage pk:common temp.gui.items append value {Slot:23b,id:"minecraft:light_gray_stained_glass_pane",Count:1b,tag:{display:{Name:'[{"text":"Not Shared","italic":false}]',Lore:['{"text":"Place a writable book containing","color":"gray","italic":false}','{"text":"a list of nicknames here.","color":"gray","italic":false}','{"text":"Write one nickname per page!","color":"gray","italic":false}']},HideFlags:255,CustomModelData:11130067,pk_data:{gui:1b,from:"waystones",restore_gui_on_click:1b,in_accepted_item_slot:1b}}}

# Set click action depending on permissions
# - SharedWith Change is disallowed and the player is not manager
scoreboard players set $allow pk.temp 0
execute unless score $pk.waystones.permissions.change.shared_with pk.value matches 0 run scoreboard players set $allow pk.temp 1
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $allow pk.temp 1
execute if score $allow pk.temp matches 0 run data remove storage pk:common temp.gui.item.tag.display.Lore
execute if score $allow pk.temp matches 0 run data modify storage pk:common temp.gui.item.tag.pk_data.trigger_params set value {allowed:0b}

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item