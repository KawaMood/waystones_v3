#> pk_waystones:events/player/joined_back/run
# @context player who joined back at @s

# Reset the leave_game score
scoreboard players set @s pk.waystones.leave_game 0

# Mark player with the waiting tag
tag @s add pk.waystones.wait.event.joined_back

# Wait 2 seconds
schedule function pk_waystones:events/player/joined_back/after_2_seconds_set_context 2s replace