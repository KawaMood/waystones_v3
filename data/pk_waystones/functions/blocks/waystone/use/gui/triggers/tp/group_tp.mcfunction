#> pk_waystones:blocks/waystone/use/gui/triggers/tp/group_tp
# @context all entities from the group that have been teleported at the current player

# Unmark the current entity
tag @s remove pk.waystones.tp

# Mark entities for air toggling
execute as @s[type=!player] run function pk_waystones:packages/air_toggling/start

# Give short nausea effect
effect give @s nausea 4 0
effect give @s blindness 1 0 true

# Tp
$execute in $(dimension) run tp @s $(x) $(y) $(z)

# After teleportation
execute at @s run particle portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50 force
execute at @s[type=player,tag=pk.current.player] run playsound block.portal.travel player @a[distance=..30] ~ ~ ~ 0.1 1.8