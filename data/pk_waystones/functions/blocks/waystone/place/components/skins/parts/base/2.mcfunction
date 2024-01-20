#> pk_waystones:blocks/waystone/place/components/skins/parts/base/2

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $next pk.custom_block.component.id

# Set data
$data merge entity @s {Tags:["pk.custom_block","pk.waystones.waystone","pk.waystones.waystone.component","pk.part.base","pk.part.base.2"],item:{id:$(base2),Count:1b},transformation:{translation:[0.5f,0.5f,0.5f]}}