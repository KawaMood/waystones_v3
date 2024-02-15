#> pk_waystones:base/debug/recreate_all_waystones/1

data modify storage pk:waystones debug.recreate.waystone set from storage pk:waystones debug.recreate.waystones[-1]
function pk_waystones:base/debug/recreate_all_waystones/2 with storage pk:waystones debug.recreate.waystone.location