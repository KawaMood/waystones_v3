#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item
# @context user at the waystone container location (aligned xyz)
# Storage:
#   pk:common temp.visible_waystone: the current visible waystone of the loop
# Score:
#   $hide_coordinates pk.temp: 0 if it can see coordinates, 1 if it can't
#       @within function pk_waystones:blocks/waystone/use/gui/build/run

# Set id, tag, Count and Slot
data modify storage pk:common temp.gui.item set value {Count:1b,HideFlags:255}
execute store result storage pk:common temp.gui.item.Slot byte 1 run scoreboard players get $slot pk.temp
data modify storage pk:common temp.gui.item merge from storage pk:common temp.visible_waystone.render_item

# Set attributes
data modify storage pk:common temp.gui.item.tag.pk_data set value {gui:1b,from:"waystones",trigger:"tp/run"}

# Store waystone id
data modify storage pk:common temp.gui.item.tag.pk_data.waystone.id set from storage pk:common temp.visible_waystone.id

# Set name
data modify block ~ ~-1 ~ front_text.messages[0] set value '{"nbt":"temp.visible_waystone.name","storage":"pk:common","color":"yellow","italic":false,"interpret":true}'
data modify storage pk:common temp.gui.item.tag.display.Name set from block ~ ~-1 ~ front_text.messages[0]

# Set location in lore
data modify storage pk:common temp.gui.item.tag.display.Lore set value []
data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"At [","color":"gray","italic":false},{"nbt":"temp.visible_waystone.location.x","storage":"pk:common"},{"text":", "},{"nbt":"temp.visible_waystone.location.y","storage":"pk:common"},{"text":", "},{"nbt":"temp.visible_waystone.location.z","storage":"pk:common"},{"text":"] in "},{"nbt":"temp.visible_waystone.location.dimension","storage":"pk:common"}]'
execute if score $hide_coordinates pk.temp matches 0 run data modify storage pk:common temp.gui.item.tag.display.Lore append from block ~ ~-1 ~ front_text.messages[0]

# Set visibility in lore
execute if data storage pk:common temp.visible_waystone{visibility:"private"} run data modify storage pk:common temp.gui.item.tag.display.Lore append value '{"text":"Private Waystone","color":"red","italic":false}' 
execute if data storage pk:common temp.visible_waystone{visibility:"discover"} run data modify storage pk:common temp.gui.item.tag.display.Lore append value '{"text":"Discovered Waystone","color":"yellow","italic":false}' 
execute if data storage pk:common temp.visible_waystone{visibility:"public"} run data modify storage pk:common temp.gui.item.tag.display.Lore append value '{"text":"Public Waystone","color":"green","italic":false}' 

# Set required level if the "consumption_level" setting is enabled
execute if score $pk.waystones.settings.xp_consumption.blocks pk.value matches 1.. run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/settings/xp_consumption/item_set_data

# Set owner in lore
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.database.output set from storage pk:waystones database.players[{uuid:",p2:"}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.visible_waystone.owner
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params
data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"Owner: ","color":"gray","italic":false},{"nbt":"temp.database.output.name","storage":"pk:common"}]'
data modify storage pk:common temp.gui.item.tag.display.Lore append from block ~ ~-1 ~ front_text.messages[0]

# Set id in lore (manager only)
execute if entity @s[tag=pk.waystones.manager] run data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"id: ","color":"gray","italic":false},{"nbt":"temp.visible_waystone.id","storage":"pk:common"}]'
execute if entity @s[tag=pk.waystones.manager] run data modify storage pk:common temp.gui.item.tag.display.Lore append from block ~ ~-1 ~ front_text.messages[0]

# Append to GUI items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item