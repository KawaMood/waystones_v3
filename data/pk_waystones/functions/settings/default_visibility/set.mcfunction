#> pk_waystones:settings/default_visibility/set
# @input
#   $attempted_value (string): visibility
#      Can be: "discover", "private", "public"
# Example: 
#   function pk_waystones:settings/default_visibility/set {visibility:"discover"} 

$data modify storage pk:common temp.visibility set value $(visibility)

scoreboard players set $attempted_value pk.temp -1
execute if data storage pk:common temp{visibility:"discover"} run scoreboard players set $attempted_value pk.temp 0
execute if data storage pk:common temp{visibility:"private"} run scoreboard players set $attempted_value pk.temp 1
execute if data storage pk:common temp{visibility:"public"} run scoreboard players set $attempted_value pk.temp 2

execute if score $attempted_value pk.temp matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Default Visibility","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"Discover","color":"yellow"}]
execute if score $attempted_value pk.temp matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Default Visibility","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"Private","color":"yellow"}]
execute if score $attempted_value pk.temp matches 2 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Default Visibility","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"Public","color":"yellow"}]

execute if score $attempted_value pk.temp matches -1 run tellraw @s {"text":"The visibility input is incorrect. It can either be \"discover\", \"private\" or \"public\"","color":"red"}

execute unless score $attempted_value pk.temp matches -1 run scoreboard players operation $pk.waystones.settings.default_visibility pk.value = $attempted_value pk.temp