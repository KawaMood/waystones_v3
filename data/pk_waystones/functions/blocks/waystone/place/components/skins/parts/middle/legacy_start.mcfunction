#> pk_waystones:blocks/waystone/place/components/skins/parts/middle/legacy_start

# Prepare data depending on the Waystone variant
$function pk_waystones:blocks/waystone/place/components/skins/attributes/$(variant)
data modify storage pk:common params merge from storage pk:common temp.attributes

# Create the middle part
execute summon block_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/legacy_set with storage pk:common params