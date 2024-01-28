#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/discover

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {Slot:21b,id:"minecraft:leather_helmet",Count:1b,tag:{Trim:{material:"minecraft:gold",pattern:"minecraft:sentry"},display:{Name:'[{"text":"Visibility: ","italic":false},{"text":"Discoverable","color":"yellow"}]',color:16701501},HideFlags:255,CustomModelData:11130064,pk_data:{gui:1b,from:"waystones",trigger:"visibility/change",trigger_params:{allowed:0b}}}}

# Check permissions to define the trigger
# - Score $next_visibility: Public: 1 | Private: 2 | Discover: 3
scoreboard players set $next_visibility pk.temp 0
# - (Public is allowed) & (Private is disallowed): Set to Public
execute unless score $pk.waystones.permissions.change.visiblity.public pk.value matches 0 if score $pk.waystones.permissions.change.visiblity.private pk.value matches 0 run scoreboard players set $next_visibility pk.temp 1
# - Private is allowed: Set to Private
execute unless score $pk.waystones.permissions.change.visiblity.private pk.value matches 0 run scoreboard players set $next_visibility pk.temp 2
# - Player is a manager: Set to Private
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $next_visibility pk.temp 2

# Set lore and trigger depending on permissions
function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/set_lore_and_trigger

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item