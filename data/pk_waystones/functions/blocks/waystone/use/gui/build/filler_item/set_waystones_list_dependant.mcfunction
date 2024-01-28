#> pk_waystones:blocks/waystone/use/gui/build/filler_item/set_waystones_list_dependant
# @requires
#   $gui.page.waystones.amount pk.temp: amount of waystones on the GUI current page
#       Set during GUI build
#           @within function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/start
# @input
#   $slot (int): slot where the filler should be set

# Set the slot param
$data modify storage pk:common params.slot set value $(slot)

# Set the custom_model_data param
scoreboard players set $custom_model_data pk.temp 11130070
scoreboard players operation $custom_model_data pk.temp += $gui.page.waystones.amount pk.temp
execute store result storage pk:common params.custom_model_data int 1 run scoreboard players get $custom_model_data pk.temp

# Set filler
function pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular with storage pk:common params