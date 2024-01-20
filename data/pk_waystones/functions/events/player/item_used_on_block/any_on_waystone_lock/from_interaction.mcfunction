#> pk_waystones:events/player/item_used_on_block/any_on_waystone_lock/from_interaction

data remove entity @s interaction

execute if entity @s[tag=pk.custom_block.lock.in_use] run title @a[tag=pk.current.player,distance=..20,limit=1] actionbar {"text": "This waystone is currently used by someone else","color": "red"}
execute if entity @s[tag=pk.custom_block.lock.monsters_nearby] run title @a[tag=pk.current.player,distance=..20,limit=1] actionbar {"text": "You can't use waystones when there are monsters nearby","color": "red"}