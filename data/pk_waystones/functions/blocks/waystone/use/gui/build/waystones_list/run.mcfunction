#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/run
# @context user at the waystone container location (aligned xyz)

# Prepare displayed amount of waystones (for toolbar's dynamical custom_model_data filler)
scoreboard players set $gui.page.waystones.amount pk.temp 0

# Set waystones items
execute if data storage pk:common temp.visible_waystones[{}] run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/start

# Set page items
execute if score $gui.page pk.temp matches 2.. run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/page/prev
execute if score $gui.page pk.temp < $gui.last_page pk.temp run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/page/next
execute if score $gui.page pk.temp matches ..1 run function pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular {slot:18,custom_model_data:11130069}
execute if score $gui.page pk.temp >= $gui.last_page pk.temp run function pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular {slot:26,custom_model_data:11130069}