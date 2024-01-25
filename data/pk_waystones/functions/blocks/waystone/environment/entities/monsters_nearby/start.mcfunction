#> pk_waystones:blocks/waystone/environment/entities/monsters_nearby/start
# @context the current waystone controller, at @s

# Store component-id score from controller
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Mark as currently locked
tag @s add pk.custom_block.locked.monsters_nearby

# Summon lock interaction entity
execute align xyz positioned ~0.4995 ~-0.0005 ~0.4995 summon interaction run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/lock_interaction_prepare