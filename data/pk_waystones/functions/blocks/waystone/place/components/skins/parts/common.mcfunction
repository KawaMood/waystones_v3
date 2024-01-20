#> pk_waystones:blocks/waystone/place/components/skins/parts/common
# Create skin parts that don't depends on settings
# Other skins part are set from settings
#   @within function pk_waystones:blocks/waystone/main/settings/watch

# Prepare data depending on the Waystone variant
$function pk_waystones:blocks/waystone/place/components/skins/attributes/$(variant)
data modify storage pk:common params merge from storage pk:common temp.attributes

# Base parts
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/base/1 with storage pk:common params
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/base/2 with storage pk:common params
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/base/3 with storage pk:common params

# Top parts
execute positioned ~ ~2 ~ summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/top/1 with storage pk:common params