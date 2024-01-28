#> pk_waystones:base/uninstall/stop
# @context the player who had run the uninstallation

# Unmark uninstaller
tag @s remove pk.wasytones.uninstaller

# Clear the current data pack's specific scores and storage
function pk_waystones:base/uninstall/remove_specific_features

# Clear all KawaMood's data packs scores and storage if no more KawaMood's data packs are installed
execute unless data storage pk:common installed_datapack[{}] unless data storage pk.common:data Datapacks[{}] run function pk_waystones:base/uninstall/remove_all_features

# Logs
tellraw @a[tag=pk.waystones.uninstaller] [{"text": "Uninstalled ","color": "yellow"},{"text": "KawaMood's Waystones ","color": "aqua","bold": true},{"text": " successfully"},{"text": "\nYou can now safely remove this data pack from the folder of your world","color": "yellow"}]