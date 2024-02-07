#> pk_waystones:blocks/waystone/use/gui/triggers/return_put_item
# @within function pk_waystones:blocks/waystone/use/gui/triggers/switch
# @context the user (tag=pk.current.player) at the used waystone's controller
# Storage:
#   pk:common temp.gui.accepted_item: accepted item from the put items list
#      @within pk_waystones:blocks/waystone/use/gui/actions/put/accepted/shared_with/run

# Return item to user if not allowed to put it
data modify storage pk:common params set value {tag:""}
data modify storage pk:common params.id set from storage pk:common temp.gui.accepted_item.id
data modify storage pk:common params.count set from storage pk:common temp.gui.accepted_item.Count
data modify storage pk:common params.tag set from storage pk:common temp.gui.accepted_item.tag
function pk_waystones:packages/dynamic_item/give with storage pk:common params