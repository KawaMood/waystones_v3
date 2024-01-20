#> pk_waystones:blocks/waystone/main/tick
# Ticking waystones
# @context marker with the tag "pk.waystones.waystone.controller" at @s

# Mark the current controller
tag @s add pk.current.controller

# Each time the entity is loaded
scoreboard players add @s pk.waystones.gametime 1
execute unless score $gametime pk.value = @s pk.waystones.gametime run function pk_waystones:blocks/waystone/main/on_entity_load

# When being used by a player
execute if entity @s[tag=pk.custom_block.in_use] run function pk_waystones:blocks/waystone/use/tick

# Watch environnement (blocks, entities and light)
function pk_waystones:blocks/waystone/environment/tick

# Animations
scoreboard players add @s pk.waystones.animations.timer 1
execute if entity @s[scores={pk.waystones.animations.timer=5}] run particle enchant ~ ~1 ~ 0.5 0.5 0.5 0.001 1 
scoreboard players set @s[scores={pk.waystones.animations.timer=5}] pk.waystones.animations.timer 0

# Unmark the current controller
tag @s remove pk.current.controller