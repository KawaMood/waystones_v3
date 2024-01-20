#> pk_waystones:events/player/crafted/waystone/variant/regular

# Give waystones if this specific advancement hasn't been granted with a command
data modify storage pk:common params.variant set value "regular"
function pk_waystones:events/player/crafted/waystone/start with storage pk:common params