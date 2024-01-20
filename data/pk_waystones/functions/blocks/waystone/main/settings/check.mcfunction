#> pk_waystones:blocks/waystone/main/settings/check
# Trigger once when the waystone is placed and every time it is loaded from an unloaded area
# Update the waystone if any setting have been changed in the meantime
# @context current waystone's controller (tag=pk.current.controller) at @s

# - Name Above
execute unless score $pk.waystones.settings.display_nameplates pk.value matches 1 unless entity @s[tag=pk.waystones.settings.display_nameplates.0] run function pk_waystones:blocks/waystone/main/settings/display_nameplates/0
execute if score $pk.waystones.settings.display_nameplates pk.value matches 1 unless entity @s[tag=pk.waystones.settings.display_nameplates.1] run function pk_waystones:blocks/waystone/main/settings/display_nameplates/1

# - Legacy Textures
execute unless score $pk.waystones.settings.legacy_textures pk.value matches 1 unless entity @s[tag=pk.waystones.settings.legacy_textures.0] run function pk_waystones:blocks/waystone/main/settings/legacy_textures/0
execute if score $pk.waystones.settings.legacy_textures pk.value matches 1 unless entity @s[tag=pk.waystones.settings.legacy_textures.1] run function pk_waystones:blocks/waystone/main/settings/legacy_textures/1

# - Monster Nearby
execute if score $pk.waystones.settings.ignore_monsters pk.value matches ..0 run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/stop