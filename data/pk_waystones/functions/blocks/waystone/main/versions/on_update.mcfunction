#> pk_waystones:blocks/waystone/main/versions/on_update
# @context current waystone's controller (tag=pk.current.controller) at @s

# Update waystone version
execute store result entity @s data.waystone.version int 1 run scoreboard players get $pk.waystones.version pk.value

# Switch
#   (No update yet)