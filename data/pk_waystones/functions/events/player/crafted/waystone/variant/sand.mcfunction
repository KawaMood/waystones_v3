#> pk_waystones:events/player/crafted/waystone/variant/sand

# Give waystones if this specific advancement hasn't been granted with a command
data modify storage pk:common params.variant set value "sand"
function pk_waystones:events/player/crafted/waystone/start with storage pk:common params