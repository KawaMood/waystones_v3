#> pk_waystones:base/update/versions/3_1_0
# Version 3.1.0 (#2)

# Change permissions references from old settings references
# - Protection
execute if score $pk.waystones.settings.allow_protection_change pk.value matches 0.. run scoreboard players operation $pk.waystones.permissions.change.protection pk.value = $pk.waystones.settings.allow_protection_change pk.value
# - Visibility
execute if score $pk.waystones.settings.allow_visibility_change pk.value matches 0.. run scoreboard players operation $pk.waystones.permissions.change.visibility.private pk.value = $pk.waystones.settings.allow_visibility_change pk.value
execute if score $pk.waystones.settings.allow_visibility_change pk.value matches 0.. run scoreboard players operation $pk.waystones.permissions.change.visibility.discover pk.value = $pk.waystones.settings.allow_visibility_change pk.value
execute if score $pk.waystones.settings.allow_visibility_change pk.value matches 0.. run scoreboard players operation $pk.waystones.permissions.change.visibility.public pk.value = $pk.waystones.settings.allow_visibility_change pk.value
# - Tp in other dimensions
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 0 run scoreboard players set $pk.waystones.permissions.tp.in_other_dimensions pk.value 1
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1 run scoreboard players set $pk.waystones.permissions.tp.in_other_dimensions pk.value 0

# Remove old settings references
scoreboard players reset $pk.waystones.settings.show_same_dimension_only pk.value
scoreboard players reset $pk.waystones.settings.allow_visibility_change pk.value
scoreboard players reset $pk.waystones.settings.allow_protection_change pk.value