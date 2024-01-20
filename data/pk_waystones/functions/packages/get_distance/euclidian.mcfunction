#> pk_waystones:packages/get_distance/euclidian
# @context a block_display entity at 0 0 0
# @input
#   $x (number): x coordinate of the target
#   $y (number): y coordinate of the target
#   $z (number): z coordinate of the target

$data modify entity @s transformation set value [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]
execute store result score $distance pk.temp run data get entity @s transformation.scale[0]
kill @s