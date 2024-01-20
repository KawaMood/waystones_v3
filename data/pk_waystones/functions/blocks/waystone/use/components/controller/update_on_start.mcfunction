#> pk_waystones:blocks/waystone/use/components/controller/update_on_start

# Prepare scores
scoreboard players operation @s pk.custom_block.interaction.id = $next pk.custom_block.interaction.id
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
scoreboard players set @s pk.waystones.page 1

# Mark in_use custom_block controller
tag @s add pk.custom_block.in_use
tag @s add pk.custom_block.locked.in_use