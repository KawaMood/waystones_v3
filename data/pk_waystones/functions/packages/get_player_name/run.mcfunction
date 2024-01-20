#> pk_waystones:packages/get_player_name/run
# Retrieve the name of the player
# @context a player
# @writes pk:common temp.packages.get_player_name.name

tag @s add pk.current.player
execute summon text_display run function pk_waystones:packages/get_player_name/prepare
tag @s remove pk.current.player