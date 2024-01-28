#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/protected/0

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {Slot:22b,id:"minecraft:leather_chestplate",Count:1b,tag:{display:{Name:'[{"text":"Protection: ","italic":false},{"text":"Disabled","color":"gray"}]',Lore:['{"text":"Click to enable protection","color":"gray","italic":false}'],color:6120292},HideFlags:255,CustomModelData:11130065,pk_data:{gui:1b,from:"waystones",trigger:"protected/change",trigger_params:{protected:1b}}}}

# Set click action depending on permissions
# - Protection Change is disallowed and the player is not manager
scoreboard players set $allow pk.temp 0
execute unless score $pk.waystones.permissions.change.protection pk.value matches 0 run scoreboard players set $allow pk.temp 1
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $allow pk.temp 1
execute if score $allow pk.temp matches 0 run data remove storage pk:common temp.gui.item.tag.display.Lore
execute if score $allow pk.temp matches 0 run data modify storage pk:common temp.gui.item.tag.pk_data.trigger_params set value {allowed:0b}

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item