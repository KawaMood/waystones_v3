#> pk_waystones:blocks/waystone/main/settings/display_nameplates/0
# @context current waystone's controller (tag=pk.current.controller) at @s

# Update tags
tag @s remove pk.waystones.settings.display_nameplates.1
tag @s add pk.waystones.settings.display_nameplates.0

# Remove visible name
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,tag=pk.waystones.waystone.name,predicate=pk_waystones:scores/custom_block/component_id/match_temp,distance=..1,limit=1]