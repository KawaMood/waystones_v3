#> pk_waystones:blocks/waystone/use/components/controller/set_visible_waystones_data

# Cache the list of visible waystones for the GUI
data modify entity @s data.waystone.gui.visible_waystones set from storage pk:common temp.visible_waystones

# Calculate and cache the last page value for the GUI
execute store result score $length pk.temp run data get storage pk:common temp.visible_waystones
scoreboard players operation $gui.last_page pk.temp = $length pk.temp
scoreboard players operation $gui.last_page pk.temp /= $18 pk.value
scoreboard players operation $rest pk.temp = $length pk.temp
scoreboard players operation $rest pk.temp %= $18 pk.value
execute unless score $rest pk.temp matches 0 run scoreboard players add $gui.last_page pk.temp 1
execute store result entity @s data.waystone.gui.last_page int 1 run scoreboard players get $gui.last_page pk.temp