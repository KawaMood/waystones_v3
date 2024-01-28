#> pk_waystones:base/uninstall/start

tag @s add pk.waystones.uninstaller
tellraw @s [{"text": "Starting ","color": "gray"},{"text": "KawaMood's Waystones","color": "aqua","bold": true},{"text": " uninstallation...","color": "gray"}]
execute store result score $wasytones.uninstall.waystones.length pk.value run data get storage pk:waystones database.waystones
data modify storage pk:waystones uninstall.waystones set from storage pk:waystones database.waystones
execute if score $wasytones.uninstall.waystones.length pk.value matches 1.. run function pk_waystones:base/uninstall/1
execute if score $wasytones.uninstall.waystones.length pk.value matches 0 run function pk_waystones:base/uninstall/stop