#> pk_waystones:blocks/waystone/use/gui/build/toolbar/buttons/visibility/set_lore_and_trigger

# If Public
execute if score $next_visibility pk.temp matches 1 run data modify storage pk:common temp.gui.item.tag.display.Lore set value ['{"text":"Click to change to \\"Public\\"","color":"gray","italic":false}']
execute if score $next_visibility pk.temp matches 1 run data modify storage pk:common temp.gui.item.tag.pk_data.trigger_params set value {visibility:"public"}
# If Private
execute if score $next_visibility pk.temp matches 2 run data modify storage pk:common temp.gui.item.tag.display.Lore set value ['{"text":"Click to change to \\"Private\\"","color":"gray","italic":false}']
execute if score $next_visibility pk.temp matches 2 run data modify storage pk:common temp.gui.item.tag.pk_data.trigger_params set value {visibility:"private"}
# If Discover
execute if score $next_visibility pk.temp matches 3 run data modify storage pk:common temp.gui.item.tag.display.Lore set value ['{"text":"Click to change to \\"Discover\\"","color":"gray","italic":false}']
execute if score $next_visibility pk.temp matches 3 run data modify storage pk:common temp.gui.item.tag.pk_data.trigger_params set value {visibility:"discover"}