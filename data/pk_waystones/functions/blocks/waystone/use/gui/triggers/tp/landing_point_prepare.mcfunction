#> pk_waystones:blocks/waystone/use/gui/triggers/tp/landing_point_prepare
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.targeted_waystone: data of the waystone the player clicked from the GUI

# Store coordinates with a scale of 10
execute store result score $x pk.temp run data get storage pk:common temp.targeted_waystone.location.x 10
execute store result score $y pk.temp run data get storage pk:common temp.targeted_waystone.location.y 10
execute store result score $z pk.temp run data get storage pk:common temp.targeted_waystone.location.z 10

# Center coordinates
scoreboard players add $x pk.temp 5
scoreboard players add $y pk.temp 5
scoreboard players add $z pk.temp 5

# Prepare offset (on X or Z axis)
scoreboard players set $random pk.temp 0
#   If the player has at least a companion or a vehicle (2 blocks to avoid horse or larger entities to suffocate in waystone)
execute if predicate pk_waystones:gameplay/has_vehicle_or_companion store result score $random pk.temp run random value -4..-1
execute if score $random pk.temp matches -4 run scoreboard players add $x pk.temp 20
execute if score $random pk.temp matches -3 run scoreboard players remove $x pk.temp 20
execute if score $random pk.temp matches -2 run scoreboard players add $z pk.temp 20
execute if score $random pk.temp matches -1 run scoreboard players remove $z pk.temp 20
#   If the player is alone (1 block)
execute unless predicate pk_waystones:gameplay/has_vehicle_or_companion store result score $random pk.temp run random value 1..4
execute if score $random pk.temp matches 1 run scoreboard players add $x pk.temp 10
execute if score $random pk.temp matches 2 run scoreboard players remove $x pk.temp 10
execute if score $random pk.temp matches 3 run scoreboard players add $z pk.temp 10
execute if score $random pk.temp matches 4 run scoreboard players remove $z pk.temp 10

# Store the landing point coordinates and dimension in storage
data modify storage pk:common temp.landing_point.dimension set from storage pk:common temp.targeted_waystone.location.dimension
execute store result storage pk:common temp.landing_point.x double 0.1 run scoreboard players get $x pk.temp
execute store result storage pk:common temp.landing_point.y double 0.1 run scoreboard players get $y pk.temp
execute store result storage pk:common temp.landing_point.z double 0.1 run scoreboard players get $z pk.temp