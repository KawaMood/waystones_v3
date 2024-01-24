#> pk_waystones:packages/get_distance/run
# @requires
#   storage pk:common params.mode (string): Can be either "manhattan" (grid plan) or "euclidian" (straight-line)
#   storage pk:common params.pos1 (array of numbers): Coordinates set of the first point
#   storage pk:common params.pos2 (array of numbers): Coordinates set of the second point
# @writes
#   score $distance pk.temp

# Store coordinates with 4 decimals precision
execute store result score $x1 pk.temp run data get storage pk:common params.pos1[0] 10000
execute store result score $y1 pk.temp run data get storage pk:common params.pos1[1] 10000
execute store result score $z1 pk.temp run data get storage pk:common params.pos1[2] 10000
execute store result score $x2 pk.temp run data get storage pk:common params.pos2[0] 10000
execute store result score $y2 pk.temp run data get storage pk:common params.pos2[1] 10000
execute store result score $z2 pk.temp run data get storage pk:common params.pos2[2] 10000

# Calculate the absolute differences
# - dx
scoreboard players operation $dx pk.temp = $x1 pk.temp
scoreboard players operation $dx pk.temp -= $x2 pk.temp
execute if score $dx pk.temp matches ..-1 run scoreboard players operation $dx pk.temp *= $-1 pk.value
# - dy
scoreboard players operation $dy pk.temp = $y1 pk.temp
scoreboard players operation $dy pk.temp -= $y2 pk.temp
execute if score $dy pk.temp matches ..-1 run scoreboard players operation $dy pk.temp *= $-1 pk.value
# - dz
scoreboard players operation $dz pk.temp = $z1 pk.temp
scoreboard players operation $dz pk.temp -= $z2 pk.temp
execute if score $dz pk.temp matches ..-1 run scoreboard players operation $dz pk.temp *= $-1 pk.value

# Clear scale and store as float values
execute store result storage pk:common params.x float 0.0001 run scoreboard players get $dx pk.temp
execute store result storage pk:common params.y float 0.0001 run scoreboard players get $dy pk.temp
execute store result storage pk:common params.z float 0.0001 run scoreboard players get $dz pk.temp

# If Manhattan, get distance using this method
scoreboard players set $packages.get_distance.stop pk.temp 0
execute if data storage pk:common params{mode:"manhattan"} run function pk_waystones:packages/get_distance/manhattan
execute if score $packages.get_distance.stop pk.temp matches 1 run return 1

# Otherwise, get Euclidian distance
execute positioned 0 0 0 summon block_display run function pk_waystones:packages/get_distance/euclidian with storage pk:common params