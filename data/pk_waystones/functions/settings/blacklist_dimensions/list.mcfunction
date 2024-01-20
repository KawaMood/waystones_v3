#> pk_waystones:settings/blacklist_dimensions/list

# Store blacklisted dimensions array's length
execute store result score $length pk.temp run data get storage pk:waystones database.blacklist.dimensions

# If no dimension found
execute unless score $length pk.temp matches 1.. run tellraw @s {"text":"There is currently no blacklisted dimension","color":"gray"}

# If dimension found
execute if score $length pk.temp matches 1.. run data modify storage pk:common temp.array_1 set value []
execute if score $length pk.temp matches 1.. run data modify storage pk:common temp.array_1 append from storage pk:waystones database.blacklist.dimensions[].id
execute if score $length pk.temp matches 1.. run tellraw @s [{"score":{"name":"$length","objective":"pk.temp"},"color":"yellow"},{"text":" blacklisted dimension(s):\n","color":"gray"},{"nbt":"temp.array_1","storage":"pk:common","color":"gray"}]