#> pk_waystones:base/update/start
# Update the current data pack if needed

# V.3.1.0 (#2)
execute if score $pk.waystones.version pk.value matches ..1 run function pk_waystones:base/update/versions/3_1_0

# Set the data pack current version score
scoreboard players set $pk.waystones.version pk.value 5
data modify storage pk:common installed_datapacks[{id:"waystones"}].version set value "3.2.0"