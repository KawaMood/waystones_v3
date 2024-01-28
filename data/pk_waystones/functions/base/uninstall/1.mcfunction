#> pk_waystones:base/uninstall/1

data modify storage pk:waystones uninstall.waystone set from storage pk:waystones uninstall.waystones[-1]
function pk_waystones:base/uninstall/2 with storage pk:waystones uninstall.waystone.location