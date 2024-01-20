#> pk_waystones:blocks/waystone/environment/entities/monsters_nearby/lock_interaction_prepare
# Prepare the lock interaction

scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id
tag @s add pk.waystones.waystone.lock
tag @s add pk.custom_block.lock
tag @s add pk.custom_block.lock.monsters_nearby
data merge entity @s {width:1.001f,height:1.001f,response:1b}