#> pk_waystones:base/update/start
# Update the current data pack if needed

# (No change to show yet).

# Set the data pack current version score
scoreboard players set $pk.waystones.version pk.value 0
data modify storage pk:common installed_datapacks[{id:"waystones"}].version set value "3.0.0"