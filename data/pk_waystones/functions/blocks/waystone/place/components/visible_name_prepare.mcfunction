#> pk_waystones:blocks/waystone/place/components/visible_name_prepare

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Add tags
data modify entity @s Tags set value ["pk.custom_block","pk.waystones.waystone","pk.waystones.waystone.component","pk.waystones.waystone.name"]

# Set data
data modify entity @s text set from storage pk:common temp.waystone.name
data modify entity @s billboard set value "center"