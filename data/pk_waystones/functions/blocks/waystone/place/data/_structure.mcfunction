# Data structure:
# id (int): The id of the Waystone
# variant (string): The variant of the Waystone (regular, sand, deepslate, nether...)
# name (text component): The name of the Waystone
# owner (4 int array): The UUID of the owner
# location (entry): Location of the Waystone
#   x (int): x coordinate
#   y (int): y coordinate
#   z (int): z coordinate
#   dimension (string): dimension id
# discovered_by (array): list of players having interacted with this Waystone
#   (entry)
#       uuid (4 int array): UUID of a player
# shared_with (list of entries): list of players that can use this Waystone if the visibility is on "private"
#   (entry)
#       uuid (4 int array): UUID of a player
#       name (string): If the player isn't in the database yet, store its name instead
# protected (boolean): Can be broken by any event if true, or removed only by the owner or a manager if false, false by default
# visibility (string): "public", "private" or "discover"
# render_item (entry):
#   id (string): id of item to render the Waystone in the Waystones list
#   tag (entry): optional tags of item
