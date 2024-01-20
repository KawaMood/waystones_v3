#> pk_waystones:blocks/waystone/place/components/skins/parts/base/3

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $next pk.custom_block.component.id

# Set data
$data merge entity @s {Tags:["pk.custom_block","pk.waystones.waystone","pk.waystones.waystone.component","pk.part.base","pk.part.base.3"],item:{id:$(base3),Count:1b},transformation:{scale:[0.9375f,0.9375f,0.9375f],translation:[0.5f,1.235f,0.5f]}}