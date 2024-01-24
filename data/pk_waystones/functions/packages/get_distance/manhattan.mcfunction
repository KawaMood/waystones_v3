#> pk_waystones:packages/get_distance/manhattan

scoreboard players set $packages.get_distance.stop pk.temp 1
execute store result score $distance pk.temp run data get storage pk:common params.x
execute store result score $dy pk.temp run data get storage pk:common params.y
scoreboard players operation $distance pk.temp += $dy pk.temp
execute store result score $dz pk.temp run data get storage pk:common params.z
scoreboard players operation $distance pk.temp += $dz pk.temp