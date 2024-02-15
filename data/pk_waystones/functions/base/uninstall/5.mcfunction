#> pk_waystones:base/uninstall/5
# @context any at the waystone to remove (chunk loaded)

# Logs
tellraw @a[tag=pk.waystones.uninstaller] [{"text": "Removed Waystone at [","color": "gray"},{"nbt":"uninstall.waystone.location.x","storage":"pk:waystones"},{"text": ","},{"nbt":"uninstall.waystone.location.y","storage":"pk:waystones"},{"text": ","},{"nbt":"uninstall.waystone.location.z","storage":"pk:waystones"},{"text": "] in "},{"nbt":"uninstall.waystone.location.dimension","storage":"pk:waystones"}]

# Remove waystones blocks and entities
execute at @e[type=marker,tag=pk.waystones.waystone.controller] run fill ~ ~-1 ~ ~ ~ ~ air
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component]

# Unload the chunk if needed
execute if score $pk.waystones.uninstall.chunk.already_forceload pk.value matches 0 run forceload remove ~ ~

# Continue process with next waystone to remove, or stop it if there are no waystones anymore
data remove storage pk:waystones uninstall.waystones[-1]
scoreboard players remove $pk.waystones.uninstall.waystones.length pk.value 1
execute unless score $pk.waystones.uninstall.waystones.length pk.value matches 0 run function pk_waystones:base/uninstall/1
execute if score $pk.waystones.uninstall.waystones.length pk.value matches 0 as @a[tag=pk.waystones.uninstaller] run function pk_waystones:base/uninstall/stop