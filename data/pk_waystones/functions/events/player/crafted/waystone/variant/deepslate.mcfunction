#> pk_waystones:events/player/crafted/waystone/variant/deepslate

# Give waystones if this specific advancement hasn't been granted with a command
data modify storage pk:common params.variant set value "deepslate"
function pk_waystones:events/player/crafted/waystone/run with storage pk:common params