#> pk_waystones:blocks/waystone/use/components/lock/prepare

# Set interaction.id score
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Add tags
tag @s add pk.waystones.waystone.lock
tag @s add pk.custom_block.lock
tag @s add pk.custom_block.lock.in_use

# Set data
data merge entity @s {width:1.001f,height:1.001f,response:1b}