#> pk_waystones:blocks/waystone/place/components/skins/parts/base/1

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Set data
$data merge entity @s {Tags:["pk.custom_block","pk.waystones.waystone","pk.waystones.waystone.component","pk.part.base","pk.part.base.1"],item:{id:$(base1),Count:1b},transformation:{scale:[0.6875f,0.6875f,0.6875f],translation:[0.5f,0.755f,0.5f]}}