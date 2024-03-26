#> pk_waystones:blocks/waystone/place/data/store_from_command_placement/set_location

execute store result storage pk:common temp.waystone.location.x int 1 run data get entity @s Pos[0]
execute store result storage pk:common temp.waystone.location.y int 1 run data get entity @s Pos[1]
execute store result storage pk:common temp.waystone.location.z int 1 run data get entity @s Pos[2]
kill @s