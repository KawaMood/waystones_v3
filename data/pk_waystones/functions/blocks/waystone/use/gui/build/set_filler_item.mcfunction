#> pk_waystones:blocks/waystone/use/gui/build/set_filler_item
# @input
#   $slot (int): slot where the filler should be set

$data modify storage pk:common temp.gui.items append value {id:"minecraft:black_stained_glass_pane",Count:1b,tag:{display:{Name:'{"text":""}'},pk_data:{gui:1b,from:"waystones",restore_gui_on_click:1b},CustomModelData:16110069},Slot:$(slot)b}