#> pk_waystones:blocks/waystone/place/components/skins/parts/middle/legacy_set

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Set data
$data merge entity @s {Tags:["pk.custom_block","pk.waystones.waystone","pk.waystones.waystone.component","pk.part.middle","pk.part.middle.legacy"],block_state:{Name:$(middle_legacy),Count:1b},transformation:{translation:[-0.001f,0.999f,-0.001f],scale:[1.002f,1.002f,1.002f]}}