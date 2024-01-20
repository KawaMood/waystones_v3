#> pk_waystones:blocks/waystone/use/components/controller/update_on_stop

# Unmark in_use custom_block controller
tag @s remove pk.custom_block.in_use
tag @s remove pk.custom_block.locked.in_use

# Clear the cached GUI
data remove entity @s data.waystone.gui
