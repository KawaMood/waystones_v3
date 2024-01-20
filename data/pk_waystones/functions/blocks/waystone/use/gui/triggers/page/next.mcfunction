#> pk_waystones:blocks/waystone/use/gui/triggers/page/next
# @context the user (tag=pk.current.player) at the used waystone's controller
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch

# Animations
playsound item.book.page_turn block @s ~ ~ ~ 1 1

# Update pk.waystones.page score of the controller
scoreboard players add @e[type=marker,tag=pk.waystones.waystone.controller,distance=..0.1,limit=1] pk.waystones.page 1

# Update the GUI
execute align xyz run function pk_waystones:blocks/waystone/use/gui/build/run