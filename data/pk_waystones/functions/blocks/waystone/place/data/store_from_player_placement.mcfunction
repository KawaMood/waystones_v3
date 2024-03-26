#> pk_waystones:blocks/waystone/place/data/store_from_player_placement

# Data with default values: visibility, discovered_by, shared_with, protected, render_item
data modify storage pk:common temp.waystone set value {visibility:"discover",discovered_by:[],shared_with:[],protected:0b,render_item:{id:"minecraft:grass_block"}} 
# Id
execute store result storage pk:common temp.waystone.id int 1 run scoreboard players get $temp pk.custom_block.component.id
# Variant
data modify storage pk:common temp.waystone.variant set from storage pk:common temp.item.tag.SkullOwner.Properties.textures[0].Signature
# Name
data modify storage pk:common temp.waystone.name set from storage pk:common temp.item.tag.display.Name
# Protection
execute if score $pk.waystones.settings.default_protection pk.value matches 1 run data modify storage pk:common temp.waystone.protected set value 1b
# Visibility
execute if score $pk.waystones.settings.default_visibility pk.value matches 1 run data modify storage pk:common temp.waystone.visibility set value "private"
execute if score $pk.waystones.settings.default_visibility pk.value matches 2 run data modify storage pk:common temp.waystone.visibility set value "public"
# Owner
data modify storage pk:common temp.waystone.owner set from entity @s UUID
# Location
data modify storage pk:common temp.waystone.location.dimension set from entity @s Dimension
data modify storage pk:common temp.waystone.location.x set from storage pk:common temp.block.x
data modify storage pk:common temp.waystone.location.y set from storage pk:common temp.block.y
data modify storage pk:common temp.waystone.location.z set from storage pk:common temp.block.z
# Discovered by
data remove storage pk:common temp.entry
data modify storage pk:common temp.entry.uuid set from entity @s UUID
data modify storage pk:common temp.waystone.discovered_by append from storage pk:common temp.entry
# Render item
execute summon armor_stand run function pk_waystones:blocks/waystone/place/data/render_item

# Add to database
data modify storage pk:waystones database.waystones append from storage pk:common temp.waystone