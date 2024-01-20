#> pk_waystones:blocks/waystone/use/gui/build/waystones_list/run
# @context any at the waystone container location (aligned xyz)

# Set waystones items
execute if data storage pk:common temp.visible_waystones[{}] run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/waystones/start

# Set page items
execute if score $gui.page pk.temp matches 2.. run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/page/prev
execute if score $gui.page pk.temp < $gui.last_page pk.temp run function pk_waystones:blocks/waystone/use/gui/build/waystones_list/buttons/page/next
execute if score $gui.page pk.temp matches ..1 run function pk_waystones:blocks/waystone/use/gui/build/set_filler_item {slot:18}
execute if score $gui.page pk.temp >= $gui.last_page pk.temp run function pk_waystones:blocks/waystone/use/gui/build/set_filler_item {slot:26}