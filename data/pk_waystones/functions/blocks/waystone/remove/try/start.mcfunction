#> pk_waystones:blocks/waystone/remove/try/start

# Reset score that checks if the process should be canceled
scoreboard players set $remove.stop pk.temp 0

# Load Waystone data and prepare component-id score
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.waystone set from storage pk:waystones database.waystones[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from entity @s data.waystone.id
function pk_waystones:packages/dynamic_command/1_var with storage pk:common params

# If the Waystone is protected, check if it was removed by either its owner or a manager
data modify storage pk:common params.uuid set from storage pk:common temp.waystone.owner
execute if data storage pk:common temp.waystone{protected:1b} run function pk_waystones:blocks/waystone/remove/try/check_source with storage pk:common params

# Remove or cancel depending on the $remove.stop pk.temp score's value
execute if score $remove.stop pk.temp matches 1 run function pk_waystones:blocks/waystone/remove/try/cancel
execute if score $remove.stop pk.temp matches 0 run function pk_waystones:blocks/waystone/remove/run