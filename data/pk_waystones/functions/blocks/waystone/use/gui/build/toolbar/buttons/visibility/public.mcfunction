#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/public

# Prepare item's default data
data modify storage pk:common temp.gui.item set value {Slot:21b,id:"minecraft:leather_helmet",Count:1b,tag:{Trim:{material:"minecraft:emerald",pattern:"minecraft:sentry"},display:{Name:'[{"text":"Visibility: ","italic":false},{"text":"Public","color":"green","italic":false}]',color:8439583},HideFlags:255,CustomModelData:11130062,pk_data:{gui:1b,from:"waystones",trigger:"visibility/change",trigger_params:{allowed:1b}}}}

# Check permissions to define the trigger
#   Score $next_visibility: Public: 1 | Private: 2 | Discover: 3
scoreboard players set $next_visibility pk.temp 0
#   (Player is the owner) & (Private is allowed) & (Discover is disallowed): Set to Private
execute if score $player_is_owner pk.temp matches 1 unless score $pk.waystones.permissions.change.visiblity.private pk.value matches 0 if score $pk.waystones.permissions.change.visiblity.discover pk.value matches 0 run scoreboard players set $next_visibility pk.temp 2
#   (Player is the owner) & (Discover is allowed): Set to Discover
execute if score $player_is_owner pk.temp matches 1 unless score $pk.waystones.permissions.change.visiblity.discover pk.value matches 0 run scoreboard players set $next_visibility pk.temp 3
#   Player is a manager: Set to Discover
execute if entity @s[tag=pk.waystones.manager] run scoreboard players set $next_visibility pk.temp 3

# Set lore and trigger depending on permissions
function pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/set_lore_and_trigger

# Append item to the gui items
data modify storage pk:common temp.gui.items append from storage pk:common temp.gui.item