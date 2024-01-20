#> pk_waystones:blocks/waystone/remove/try/check_source
# Try to check (with provided features reliabilities) if the Waystone has been broken by its owner or a manager
# /!\ Note that this method is still unsafe, we don't have any way to check it safely for the moment

scoreboard players set $packages.search_block.found pk.temp 0
$execute if entity @a[scores={pk.waystones.mined.barrel=1..},nbt={UUID:$(uuid)},distance=..20] run scoreboard players set $packages.search_block.found pk.temp 1
execute if entity @a[scores={pk.waystones.mined.barrel=1..},tag=pk.waystones.manager,distance=..20] run scoreboard players set $packages.search_block.found pk.temp 1
execute if score $packages.search_block.found pk.temp matches 0 run scoreboard players set $remove.stop pk.temp 1