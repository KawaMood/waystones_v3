#> pk_waystones:base/debug/recreate_all_waystones/5
# @context any at the waystone to recreate (chunk loaded)

# Logs
tellraw @a[tag=pk.waystones.recreate] [{"text": "Recreated Waystone at [","color": "gray"},{"nbt":"debug.recreate.waystone.location.x","storage":"pk:waystones"},{"text": ","},{"nbt":"debug.recreate.waystone.location.y","storage":"pk:waystones"},{"text": ","},{"nbt":"debug.recreate.waystone.location.z","storage":"pk:waystones"},{"text": "] in "},{"nbt":"debug.recreate.waystone.location.dimension","storage":"pk:waystones"}]

# Replace waystone
data modify storage pk:common temp.waystone set from storage pk:waystones debug.recreate.waystone
function pk_waystones:blocks/waystone/place/replace

# Unload the chunk if needed
execute if score $pk.waystones.debug.recreate.chunk.already_forceload pk.value matches 0 run forceload remove ~ ~

# Continue process with next waystone to recreate, or stop it if there are no waystones anymore
data remove storage pk:waystones debug.recreate.waystones[-1]
scoreboard players remove $pk.waystones.debug.recreate.waystones.length pk.value 1
execute if score $pk.waystones.debug.recreate.waystones.length pk.value matches 0 as @a[tag=pk.waystones.recreate] run function pk_waystones:base/debug/recreate_all_waystones/stop
execute unless score $pk.waystones.debug.recreate.waystones.length pk.value matches 0 run function pk_waystones:base/debug/recreate_all_waystones/1