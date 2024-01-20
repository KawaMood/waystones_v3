#> pk_waystones:blocks/waystone/environment/entities/monsters_nearby/stop
# @context the current waystone controller, at @s

# Store component-id score from controller
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Unmark controller
tag @s remove pk.custom_block.locked.monsters_nearby

# Remove the lock interaction
execute align xyz run kill @e[type=interaction,tag=pk.custom_block.lock.monsters_nearby,dx=0,predicate=pk_waystones:scores/custom_block/component_id/match_temp,limit=1]

say Stop Monster Nearby