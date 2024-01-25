#> pk_waystones:blocks/waystone/use/gui/build/filler_item/set_regular
# @input
#   $slot (int): slot where the filler should be set
#   $custom_model_data (int): CustomModelData value 

$data modify storage pk:common temp.gui.items append value {id:"minecraft:black_stained_glass_pane",Count:1b,tag:{display:{Name:'{"text":""}'},pk_data:{gui:1b,from:"waystones",restore_gui_on_click:1b},CustomModelData:$(custom_model_data)},Slot:$(slot)b}