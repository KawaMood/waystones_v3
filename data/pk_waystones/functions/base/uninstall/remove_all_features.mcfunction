#> pk_waystones:base/uninstall/remove_all_features

# Clear scores
scoreboard objectives remove pk.value
scoreboard objectives remove pk.temp
scoreboard objectives remove pk.custom_block.component.id
scoreboard objectives remove pk.custom_block.interaction.id
scoreboard objectives remove pk.custom_block.facing
scoreboard objectives remove pk.custom_block.move.timer
scoreboard objectives remove pk.crafted.knowledge_book

# Clear storage
data remove storage pk:common temp
data remove storage pk:common installed_datapack