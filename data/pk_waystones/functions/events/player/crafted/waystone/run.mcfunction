#> pk_waystones:events/player/crafted/waystone/run

# Remove advancement and recipe
$advancement revoke @s only pk_waystones:events/crafted/waystone/$(variant)

# Kill potential knowledge book items (drop output)
schedule function pk_waystones:events/player/crafted/waystone/kill_dropped_output_item 1t

# Clear knowledge books from player
clear @s knowledge_book

# Give the relative waystone
scoreboard players set $count pk.temp 1
$function pk_waystones:items/waystone/give/$(variant) with storage pk:common params