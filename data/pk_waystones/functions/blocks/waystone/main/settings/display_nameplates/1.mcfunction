#> pk_waystones:blocks/waystone/main/settings/display_nameplates/1
# @context current waystone's controller (tag=pk.current.controller) at @s

# Update tags
tag @s remove pk.waystones.settings.display_nameplates.0
tag @s add pk.waystones.settings.display_nameplates.1

# Place visible name
execute store result score $has_default_name pk.temp if data storage pk:common temp.waystone{name:'{"text":"Waystone","italic": false,"color": "yellow"}'}
execute if score $has_default_name pk.temp matches 0 positioned ~ ~0.8 ~ summon text_display run function pk_waystones:blocks/waystone/place/components/visible_name_prepare