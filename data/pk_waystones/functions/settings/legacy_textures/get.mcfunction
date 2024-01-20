#> pk_waystones:settings/legacy_textures/get

# If false
execute unless score $pk.waystones.settings.legacy_textures pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Legacy Textures","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"false","color":"yellow"}]
# If true
execute if score $pk.waystones.settings.legacy_textures pk.value matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Legacy Textures","color":"yellow"},{"text":"\" is currently set to ","color":"gray"},{"text":"true","color":"yellow"}]