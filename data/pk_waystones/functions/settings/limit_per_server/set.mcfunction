#> pk_waystones:settings/limit_per_server/set
# @input
#   count: count
# Example: 
#   function pk_waystones:settings/limit_per_server/set {count:1}

$scoreboard players set $pk.waystones.settings.limit_per_server pk.value $(count)

# Limited
execute if score $pk.waystones.settings.limit_per_server pk.value matches 0.. run tellraw @s [{"text":"Server is now limited to ","color":"gray"},{"score":{"name":"$pk.waystones.settings.limit_per_server","objective":"pk.value"},"color":"yellow"},{"text":" waystones","color":"gray"}]
# Unlimited
execute unless score $pk.waystones.settings.limit_per_server pk.value matches 0.. run tellraw @s [{"text":"Server is now not limited in the number of waystones it can get","color":"gray"}]