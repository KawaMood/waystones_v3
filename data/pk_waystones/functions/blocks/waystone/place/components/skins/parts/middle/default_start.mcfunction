#> pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_start

# Prepare data depending on the Waystone variant
$function pk_waystones:blocks/waystone/place/components/skins/attributes/$(variant)
data modify storage pk:common params merge from storage pk:common temp.attributes

# Parts 1-8
data modify storage pk:common params.value set from storage pk:common params.middle_s1
data modify storage pk:common params merge value {i:1,translation:[0.7505f,2.0005f,0.2495f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params
data modify storage pk:common params merge value {i:8,translation:[0.2495f,1.4995f,0.7505f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params

# Parts 2-7
data modify storage pk:common params.value set from storage pk:common params.middle_s2
data modify storage pk:common params merge value {i:2,translation:[0.2495f,2.0005f,0.2495f],left_rotation:[0f,0f,0f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params
data modify storage pk:common params merge value {i:7,translation:[0.7505f,1.4995f,0.7505f],left_rotation:[0f,0f,0f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params

# Parts 3-6
data modify storage pk:common params.value set from storage pk:common params.middle_s3
data modify storage pk:common params merge value {i:3,translation:[0.7505f,2.0005f,0.7505f],left_rotation:[0f,0f,0f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params
data modify storage pk:common params merge value {i:6,translation:[0.2495f,1.4995f,0.2495f],left_rotation:[0f,0f,0f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params

# Parts 4-5
data modify storage pk:common params.value set from storage pk:common params.middle_s4
data modify storage pk:common params merge value {i:4,translation:[0.2495f,2.0005f,0.7505f],left_rotation:[0f,0f,0f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params
data modify storage pk:common params merge value {i:5,translation:[0.7505f,1.4995f,0.2495f],left_rotation:[0f,0f,0f]}
execute summon item_display run function pk_waystones:blocks/waystone/place/components/skins/parts/middle/default_set with storage pk:common params