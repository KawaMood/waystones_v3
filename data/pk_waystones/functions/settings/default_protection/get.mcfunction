#> pk_waystones:settings/default_protection/get

execute unless score $pk.waystones.settings.default_protection pk.temp matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Default Protection","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"Disabled","color":"yellow"}]
execute if score $pk.waystones.settings.default_protection pk.temp matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Default Protection","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"Enabled","color":"yellow"}]