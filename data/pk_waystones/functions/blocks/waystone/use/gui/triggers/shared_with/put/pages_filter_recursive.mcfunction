#> pk_waystones:blocks/waystone/use/gui/triggers/shared_with/put/pages_filter_recursive

# Remove from the storage if empty string
data modify storage pk:common temp.current_string set from storage pk:common temp.array_1[0]
execute unless data storage pk:common temp{current_string:""} run function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/put/add_player

# Recursive call
data remove storage pk:common temp.array_1[0] 
execute if data storage pk:common temp.array_1[-1] run function pk_waystones:blocks/waystone/use/gui/triggers/shared_with/put/pages_filter_recursive