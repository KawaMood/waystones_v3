#> pk_waystones:blocks/waystone/place/components/controller_prepare

# Prepare scores
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Initialize animations delay score
scoreboard players set @s pk.waystones.waystone.animations.delay 0

# Set tags
data modify entity @s Tags set value ["pk.custom_block","pk.custom_block.container","pk.waystones.waystone","pk.waystones.waystone.component","pk.waystones.waystone.controller"]

# Store version
execute store result storage pk:common temp.waystone.version int 1 run scoreboard players get $pk.waystones.version pk.value

# Store information to the controller
data modify entity @s data.waystone.id set from storage pk:common temp.waystone.id