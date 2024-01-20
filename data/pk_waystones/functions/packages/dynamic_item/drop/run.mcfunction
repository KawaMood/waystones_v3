#> pk_waystones:packages/dynamic_item/drop/run
# Summon item

summon item ~ ~ ~ {Tags:["pk.packages.dynamic_item.current"],Item:{id:"minecraft:stick",Count:1b}}
execute as @e[type=item,tag=pk.packages.dynamic_item.current,distance=..0.1,limit=1] run function pk_waystones:packages/dynamic_item/drop/prepare_item