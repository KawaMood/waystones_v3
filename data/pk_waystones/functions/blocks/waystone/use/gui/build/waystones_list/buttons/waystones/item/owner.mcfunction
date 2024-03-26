#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/item/owner
# Set owner in lore

data modify storage pk:common params set value {p1:"data modify storage pk:common temp.database.output set from storage pk:waystones database.players[{uuid:",p2:"}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.visible_waystone.owner
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params
data modify block ~ ~-1 ~ front_text.messages[0] set value '[{"text":"Owner: ","color":"gray","italic":false},{"nbt":"temp.database.output.name","storage":"pk:common"}]'
data modify storage pk:common temp.gui.item.tag.display.Lore append from block ~ ~-1 ~ front_text.messages[0]