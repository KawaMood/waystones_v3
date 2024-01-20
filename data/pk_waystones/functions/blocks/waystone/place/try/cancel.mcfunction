#> pk_waystones:blocks/waystone/place/try/cancel
# @input
#   $reason: reason

# Stop try
scoreboard players set $place.stop pk.temp 1

# Throw error
title @s clear
$title @s actionbar {"text": "$(reason)", "color": "red"}

# Give item back to the player
data modify storage pk:common params.id set from storage pk:common temp.item.id
data modify storage pk:common params.tag set from storage pk:common temp.item.tag
data modify storage pk:common params.count set value 1
function pk_waystones:packages/dynamic_item/give with storage pk:common params

# Set the current block as air
setblock ~ ~ ~ air