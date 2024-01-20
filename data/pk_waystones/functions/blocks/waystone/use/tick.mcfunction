#> pk_waystones:blocks/waystone/use/tick
# @context as the used waystone's controller at @s

# Prepare scores
scoreboard players operation $temp pk.custom_block.interaction.id = @s pk.custom_block.interaction.id
scoreboard players set $use.stop pk.temp 0

# Mark the current player
tag @a[predicate=pk_waystones:scores/custom_block/interaction_id/match_temp,limit=1,distance=..20] add pk.current.player

# Stop ticking if the barrel is closed or if the user is too far or logged out
execute if block ~ ~ ~ barrel[open=false] run function pk_waystones:blocks/waystone/use/stop
execute if score $use.stop pk.temp matches 0 unless entity @a[tag=pk.current.player,limit=1,distance=..20] run function pk_waystones:blocks/waystone/use/stop

# Watch actions in GUI
execute if score $use.stop pk.temp matches 0 as @a[tag=pk.current.player,limit=1,distance=..20] run function pk_waystones:blocks/waystone/use/gui/actions/watch

# Unmark the current player
tag @a[tag=pk.current.player,limit=1] remove pk.current.player