#> pk_waystones:packages/get_distance/manhattan

scoreboard players set $packages.get_distance.stop pk.temp 1
scoreboard players operation $distance pk.temp = $dx pk.temp
scoreboard players operation $distance pk.temp += $dy pk.temp
scoreboard players operation $distance pk.temp += $dz pk.temp