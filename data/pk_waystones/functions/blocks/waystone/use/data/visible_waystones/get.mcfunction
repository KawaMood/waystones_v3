#> pk_waystones:blocks/waystone/use/data/visible_waystones/get
# @context the player who opened the waystone container (tag=pk.current.player), at the waystone container (aligned xyz)
# @requires
#   storage pk:common temp.used_waystone: the current used waystone data
# @writes 
#   storage pk:common temp.visible_waystones: list of waystones that the current user can see

# All Waystones: If the player is a manager, let all waystones but the current one and skip all further filters
data modify storage pk:common temp.visible_waystones set from storage pk:waystones database.waystones
data modify storage pk:common params set value {p1:"data remove storage pk:common temp.visible_waystones[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.used_waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params
execute if entity @s[tag=pk.waystones.manager] run return 1

# Keep all waystones or only waystones from the same dimension
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1 run function pk_waystones:blocks/waystone/use/data/visible_waystones/filters/same_dimension
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1 run data modify storage pk:common temp.visible_waystones set from storage pk:common temp.filter.output

# Create another temp array
data modify storage pk:common temp.array_1 set value []

# Visibility private and the user is the owner
function pk_waystones:blocks/waystone/use/data/visible_waystones/filters/private_owner
data modify storage pk:common temp.array_1 append from storage pk:common temp.filter.output[]

# Visibility private and shared with the user
function pk_waystones:blocks/waystone/use/data/visible_waystones/filters/private_shared_with
data modify storage pk:common temp.array_1 append from storage pk:common temp.filter.output[]

# Visibility discover and discovered by user
function pk_waystones:blocks/waystone/use/data/visible_waystones/filters/discovered
data modify storage pk:common temp.array_1 append from storage pk:common temp.filter.output[]

# Visibility public
data modify storage pk:common temp.array_1 append from storage pk:common temp.visible_waystones[{visibility:"public"}]

# Set visible waystones list from the temp array
data modify storage pk:common temp.visible_waystones set from storage pk:common temp.array_1