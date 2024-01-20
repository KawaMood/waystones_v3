#> pk_waystones:settings/limit_per_player/get

# Limited
execute if score $pk.waystones.settings.limit_per_player pk.value matches 0.. run tellraw @s [{"text":"Players are currently limited to ","color":"gray"},{"score":{"name":"$pk.waystones.settings.limit_per_player","objective":"pk.value"},"color":"yellow"},{"text":" waystones","color":"gray"}]
# Unlimited
execute unless score $pk.waystones.settings.limit_per_player pk.value matches 0.. run tellraw @s [{"text":"Players are currently not limited in the number of waystones they can own","color":"gray"}]