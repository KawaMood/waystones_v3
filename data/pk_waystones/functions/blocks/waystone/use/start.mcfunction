#> pk_waystones:blocks/waystone/use/start
# Trigger once when the player opens a waystone
# @context the player who opened the waystone container (tag=pk.current.player), at the waystone container (aligned xyz)
# @within function pk_waystones:events/player/item_used_on_block/any_on_waystone_container

# Update controller
execute as @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] run function pk_waystones:blocks/waystone/use/components/controller/update_on_start

# Summon lock interaction entity
execute align xyz positioned ~0.4995 ~-0.0005 ~0.4995 summon interaction run function pk_waystones:blocks/waystone/use/components/lock/prepare

# Store the currently used waystone data and prepare the page score
function pk_waystones:blocks/waystone/use/data/used_waystone/get

# Try to update the waystone's discovered_by list in database
function pk_waystones:blocks/waystone/use/data/discovered_by/try_append_player

# Create the list of waystones that the current user can see, in storage pk:common temp.visible_waystones
function pk_waystones:blocks/waystone/use/data/visible_waystones/get
#   Cache it into the data of the controller (to not recreate the list when the GUI is updated)
execute as @e[type=marker,tag=pk.waystones.waystone.controller,dx=0,limit=1] run function pk_waystones:blocks/waystone/use/components/controller/set_visible_waystones_data

# Build the GUI
function pk_waystones:blocks/waystone/use/gui/build/run

# Animations
stopsound @a[distance=..30] block block.barrel.open
playsound block.grindstone.use block @a[distance=..30] ~ ~ ~ 0.5 1.1

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.current.player,limit=1]","color": "gray"},{"text": " started to use waystone at ["},{"nbt":"x","block":"~ ~ ~"},{"text": ","},{"nbt":"y","block":"~ ~ ~"},{"text": ","},{"nbt":"z","block":"~ ~ ~"},{"text": "]"}]