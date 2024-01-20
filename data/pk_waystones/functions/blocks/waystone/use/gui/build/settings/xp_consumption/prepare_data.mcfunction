#> pk_waystones:blocks/waystone/use/gui/build/settings/xp_consumption/prepare_data
# @context any at the waystone container location (aligned xyz)
# The player who opened the waystone container is marked with "pk.current.player"
# Storage:
#   pk:common temp.used_waystone: the current used waystone data

# Prepare an array of coordinates of the used waystone
data modify storage pk:common temp.used_waystone.pos set value []
data modify storage pk:common temp.used_waystone.pos append from storage pk:common temp.used_waystone.location.x
data modify storage pk:common temp.used_waystone.pos append from storage pk:common temp.used_waystone.location.y
data modify storage pk:common temp.used_waystone.pos append from storage pk:common temp.used_waystone.location.z

# Store the current user level
execute store result score $player.level pk.temp run xp query @a[tag=pk.current.player,distance=..20,limit=1] levels