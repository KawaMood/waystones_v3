#> pk_waystones:blocks/waystone/main/settings/legacy_textures/0
# @context current waystone's controller (tag=pk.current.controller) at @s

# Update tags
tag @s remove pk.waystones.settings.legacy_textures.1
tag @s add pk.waystones.settings.legacy_textures.0

# Remove middle part skin if needed
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,tag=pk.part.middle,predicate=pk_waystones:scores/custom_block/component_id/match_temp,distance=..2]

# Place middle part
data modify storage pk:common params.variant set from storage pk:common temp.waystone.variant
execute align xyz positioned ~ ~-1 ~ run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_start with storage pk:common params