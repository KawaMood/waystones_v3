#> pk_waystones:commands/setblock/waystone
# Place waystone manually
# @params
#   $waystone: all data to store
# Example:
#   function pk_waystones:commands/setblock/waystone {waystone:{variant:"deepslate"}}

# Set the placing mode as "by command"
scoreboard players set $pk.custom_block.placed_by_command pk.temp 1

# Try to set data
$data modify storage pk:common temp.command.params.waystone set value $(waystone)
execute unless data storage pk:common temp.waystone{} run return run tellraw @s {"text": "Wrong data format for \"waystone\"","color": "red"}

# Place
execute align xyz run function pk_waystones:blocks/waystone/place/run

# Reset the placing mode
scoreboard players set $pk.custom_block.placed_by_command pk.temp 0