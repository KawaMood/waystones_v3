#> pk_waystones:blocks/waystone/environment/tick
# Monitor adjacent/current block(s) and near entities
# Adjacent hoppers and droppers are checked when a player place one within advancements
# @context the waystone controller at @s

# Set scores
scoreboard players set $env.stop pk.temp 0

# Check if a block of the Waystone has been destroyed
execute unless predicate pk_waystones:block_sets/waystone/is_complete run function pk_waystones:blocks/waystone/remove/try/start
execute if score $env.stop pk.temp matches 1 run return 1

# Remove hopper minecarts being at range to draw items from the container block
execute positioned ~-0.5 ~-2.01 ~-0.5 as @e[type=hopper_minecart,dy=1.01] at @s run function pk_waystones:blocks/waystone/environment/entities/hopper_minecart_remove

# Check if there are hostile mobs nearby
execute if score $pk.waystones.settings.ignore_monsters pk.value matches ..0 run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/check