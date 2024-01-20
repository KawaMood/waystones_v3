#> pk_waystones:packages/get_player_name/parse
# @context a text display entity

$data modify storage pk:common temp.parsed_text_component set value $(text_component)
data modify storage pk:common temp.packages.get_player_name.name set from storage pk:common temp.parsed_text_component.insertion