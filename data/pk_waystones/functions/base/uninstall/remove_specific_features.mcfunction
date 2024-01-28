#> pk_waystones:base/uninstall/remove_specific_features

# Clear scores
scoreboard objectives remove pk.waystones.mined.barrel
scoreboard objectives remove pk.waystones.leave_game
scoreboard objectives remove pk.waystones.in_fight
scoreboard objectives remove pk.waystones.page
scoreboard objectives remove pk.waystones.animations.timer
scoreboard objectives remove pk.waystones.group.id
scoreboard objectives remove pk.waystones.hide_coordinates
scoreboard objectives remove pk.waystones.gametime

# Clear storage
data remove storage pk:waystones database
data remove storage pk:waystones uninstall
data remove storage pk:common installed_datapack[{id:"waystones"}]