#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/protected/1

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {Slot:22b,id:"minecraft:leather_chestplate",Count:1b,tag:{Trim:{material:"minecraft:emerald",pattern:"minecraft:sentry"},display:{Name:'[{"text":"Protection: ","italic":false},{"text":"Enabled","color":"green"}]',Lore:['{"text":"Click to disable protection","color":"gray","italic":false}'],color:8439583},HideFlags:255,CustomModelData:11130066,pk_data:{gui:1b,from:"waystones",trigger:"protected/change",trigger_params:{allowed:0b,protected:0b}}}}

# Check permissions
#   Disallow by default
scoreboard players set $allow pk.temp 0
#   "Protection Change" is enabled and player is the owner
execute unless score $pk.waystones.permissions.change.protection pk.value matches 0 if score $player_is_owner pk.temp matches 1 run scoreboard players set $allow pk.temp 1
#   Player is manager
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $allow pk.temp 1
#   Set items data depending on permissions
execute if score $allow pk.temp matches 0 run data remove storage pk:common temp.gui.item.tag.display.Lore
execute if score $allow pk.temp matches 1 run data modify storage pk:common temp.gui.item.tag.pk_data.trigger_params.allowed set value 1b

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item