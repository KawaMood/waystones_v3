#> pk_waystones:settings/default_protection/set
# @input
#   $attempted_value (string): protection
#      Can be: "disabled", "enabled"
# Example: 
#   function pk_waystones:settings/default_protection/set {protection:"disabled"} 

$data modify storage pk:common temp.protection set value $(protection)

scoreboard players set $attempted_value pk.temp -1
execute if data storage pk:common temp{protection:"disabled"} run scoreboard players set $attempted_value pk.temp 0
execute if data storage pk:common temp{protection:"enabled"} run scoreboard players set $attempted_value pk.temp 1

execute if score $attempted_value pk.temp matches 0 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Default Protection","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"Disabled","color":"yellow"}]
execute if score $attempted_value pk.temp matches 1 run tellraw @s [{"text":"Setting \"","color":"gray"},{"text":"Default Protection","color":"yellow"},{"text":"\" has been set to ","color":"gray"},{"text":"Enabled","color":"yellow"}]

execute if score $attempted_value pk.temp matches -1 run tellraw @s {"text":"The visibility input is incorrect. It can either be \"disabled\" or \"enabled\"","color":"red"}

execute unless score $attempted_value pk.temp matches -1 run scoreboard players operation $pk.waystones.settings.default_protection pk.value = $attempted_value pk.temp