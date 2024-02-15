#> pk_waystones:base/debug/recreate_all_waystones/stop
# @context the player who had run the recreate process

# Unmark recreater
tag @s remove pk.waystones.recreate

# Logs
tellraw @s [{"text": "Recreated all waystones from ","color": "yellow"},{"text": "KawaMood's Waystones ","color": "aqua","bold": true},{"text": " successfully"}]