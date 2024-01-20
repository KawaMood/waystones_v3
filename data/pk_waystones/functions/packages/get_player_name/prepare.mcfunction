#> pk_waystones:packages/get_player_name/prepare
# @context a text display entity

data modify entity @s text set value '{"selector":"@p[tag=pk.current.player]"}'
data modify storage pk:common params.text_component set from entity @s text
function pk_waystones:packages/get_player_name/parse with storage pk:common params
kill @s