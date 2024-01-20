#> pk_waystones:blocks/waystone/environment/entities/monsters_nearby/check

# Check if there is at least a hostile mob nearby
execute store result score $monsters_nearby pk.temp align xyz positioned ~-8 ~-5 ~-8 if entity @e[type=#pk_waystones:boss_and_hostiles,dx=15,dy=9,dz=15,limit=1]

# If it is the case and if the current Waystone isn't in use, lock it
execute if score $monsters_nearby pk.temp matches 1.. if entity @s[tag=!pk.custom_block.locked.monsters_nearby] run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/start

# Otherwise and if the waystone is currently locked, unlock it
execute if score $monsters_nearby pk.temp matches 0 if entity @s[tag=pk.custom_block.locked.monsters_nearby] run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/stop