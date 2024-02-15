#> pk_waystones:blocks/waystone/place/components/skins/parts/top/1

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Set data
$data merge entity @s {Tags:["pk.custom_block","pk.waystones.waystone","pk.waystones.waystone.component","pk.part.top","pk.part.top.1)"],item:{id:$(top1),Count:1b},transformation:{scale:[0.9375f,0.9375f,0.9375f],translation:[0.5f,0.1770f,0.5f]}}