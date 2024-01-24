#> pk_waystones:packages/get_distance/euclidian
# @context a block_display entity at 0 0 0
# @input
#   $x (number): x coordinate of the target
#   $y (number): y coordinate of the target
#   $z (number): z coordinate of the target
# @writes
#   score $distance pk.temp: the truncated distance (int) in blocks
#   storage pk:common temp.packages.get_distance.output: the actual distance (float) in blocks

$data modify entity @s transformation set value [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]
execute store result score $distance pk.temp run data get entity @s transformation.scale[0]
data modify storage pk:common temp.packages.get_distance.output set from entity @s transformation.scale[0]
kill @s