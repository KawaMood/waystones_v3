#> pk_waystones:blocks/waystone/place/try/dimension

$execute if data storage pk:waystones database.blacklist.dimensions[{id:"$(dimension)"}] run function pk_waystones:blocks/waystone/place/try/cancel {reason:"You can't put a Waystone in this dimension"}