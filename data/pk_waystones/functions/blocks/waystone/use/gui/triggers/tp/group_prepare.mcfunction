#> pk_waystones:blocks/waystone/use/gui/triggers/tp/group_prepare
# @context the user (tag=pk.current.player) at the used waystone's controller

# Mark current player for teleportation
tag @s add pk.waystones.tp

# Search leashed entity
scoreboard players set $has_companion pk.temp 0
data modify storage pk:common params set value {p1:"execute store result score $has_companion pk.temp run tag @e[type=!player,distance=..20,nbt={Leash:{UUID:",p2:"}}] add pk.waystones.tp"}
data modify storage pk:common params.v1 set from entity @s UUID
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params

# Search vehicle and its passengers
scoreboard players set $has_vehicle pk.temp 0
execute on vehicle store success score $has_vehicle pk.temp run tag @s add pk.waystones.tp
execute on vehicle on passengers run tag @s add pk.waystone.tp