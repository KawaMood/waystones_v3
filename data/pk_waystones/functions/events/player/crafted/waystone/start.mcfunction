#> pk_waystones:events/player/crafted/waystone/start

# Remove advancement and recipe
$advancement revoke @s only pk_waystones:events/crafted/waystone/$(variant)
$recipe take @s pk_waystones:waystone/$(variant)

# Check if the player crafted a knowledge book
scoreboard players set $count pk.temp 0
execute if entity @s[scores={pk.crafted.knowledge_book=1..}] store result score $count pk.temp run clear @s knowledge_book
scoreboard players set @s pk.crafted.knowledge_book 0
$execute if score $count pk.temp matches 1.. run function pk_waystones:items/waystone/give/$(variant) with storage pk:common params