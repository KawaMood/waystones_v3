#> pk_waystones:settings/blacklist_dimensions/remove
# @input
#   $dimension (string): dimension
# Example: 
#   function pk_waystones:settings/blacklist_dimensions/remove {dimension:"minecraft:the_end"}

# Prepare data and score
data remove storage pk:common temp.dimension
$data modify storage pk:common temp.dimension.id set value "$(dimension)"
$execute store result score $packages.search_block.found pk.temp run data remove storage pk:waystones database.blacklist.dimensions[{id:"$(dimension)"}]

# If found
execute if score $packages.search_block.found pk.temp matches 1.. run tellraw @s [{"text":"Removed \"","color":"gray"},{"nbt":"temp.dimension.id","storage":"pk:common","color":"yellow"},{"text":"\" from the blacklisted dimensions","color":"gray"}]

# If not found
execute unless score $packages.search_block.found pk.temp matches 1.. run tellraw @s {"text":"There is no dimension matching this id in the list of blacklisted dimensions","color":"red"}