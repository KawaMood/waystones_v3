#> pk_waystones:base/uninstall/remove_all_features

# Clear scores
scoreboard objectives remove pk.value
scoreboard objectives remove pk.temp

# Clear storage
data remove storage pk:common temp
data remove storage pk:common installed_datapack