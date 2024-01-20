#> pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Set data
$data merge entity @s {Tags:["pk.custom_block","pk.waystones.waystone","pk.waystones.waystone.component","pk.part.middle","pk.part.middle.$(i)"],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;16,11,1,0],Properties:{textures:[{Value:"$(value)"}]}}}},transformation:{translation:$(translation),scale:[1.002f,1.002f,1.002f]}}