#> pk_waystones:blocks/waystone/use/data/assign_owner_if_unclaimed
# @context the player who opened the waystone container, at the waystone container

# Update database
data modify storage pk:common temp.used_waystone.owner set from entity @s UUID
function pk_waystones:blocks/waystone/use/data/used_waystone/update

# Warn player
tellraw @s {"text": "You're the new owner of this unclaimed waystone"}
playsound entity.player.levelup block @s ~ ~ ~ 1 1.1