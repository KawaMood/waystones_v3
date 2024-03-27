# **Waystones V.3.2.0**

**Avoid unnecessary long journeys!**

Craft and place Waystones on your points of interest.  
A survival-friendly and multiplayer-friendly way to quickly travel in your world!

# ⚠️ Important - If you were using V.2

> As for the transition from V.1 to V.2, this new V.3 upgrade is another fresh rework from scratch, meaning waystones from V.2 won't be compatible with V.3.
>
> If you want to upgrade to V.3, you will first need to remove all waystones of your world, uninstall V.2, then install Waystones V.3 and unfortunately, ask your players to place their waystones back.
>
> I wish I could add a way to port these versions, but the way owners were managed until here didn't allow me to do so. V.3 introduces new standards and the flexible and maintainable structure I wanted it to have. Now every entities links are stored in a database (storage), and there is a way to track all waystones to update in live. So there would be no problem for the future.

# 🪄Introduction

## What is Waystones?

Waystones is a data pack inspired by [BlayTheNinth's famous Waystones mod](https://www.curseforge.com/minecraft/mc-mods/waystones).
Waystones allow you to travel quickly from one point to another in your world, and within any dimension (including custom ones). Unlike the mod, waystones do not appear naturally within the world, they require to be crafted.

## How to craft and use a waystone?

Waystones can be crafted using:

-   1x **Lodestone**
-   2x **Amethyst Shards**
-   1x **Eye of Ender**
-   and 3x base blocks

Base blocks to use depend on the desired look. You can use **Polished Andesite**, **Cut Sandstones**, **Deepslate Bricks**, **Nether Bricks**, or **Mossy Stone Bricks**. The recipe is the following:

![waystone recipes](https://cdn.modrinth.com/data/cached_images/c561e483a634094f322fbbdf1523f87579c072e5.gif)

Before placing your waystone, it is recommended to rename it within an **Anvil**. This will allow you to retrieve your points correspondance more easily within the waystones list.
Waystones icons in the list depends on the block they have been placed on, so you can also chose identifiable ones. These icons also handle NBT (meaning you can place a waystone on a custom player head to have custom icons).

Right-clicking the top part of a waystone will open it. The GUI shows you the list of other waystones that are visible to you on the two first lines, and a toolbar to edit the waystones attributes or navigate within pages in the bottom line.

By left-clicking on a waystone from the list, you will be teleported to it. Note that you will also take with you your vehicle (horse, boat...) and the mobs you currently have on leash. So wasytones also allow you to transport mobs within several locations more fastly.

I recommend you to [watch the featured video](https://youtu.be/QDvdj5lfnIY) for better explanations and examples.

# 🔖Attributes

In the toolbar of the waystones GUI, you can see three buttons in the middle. If you're a waystone manager or the owner of the current waystone, these buttons will allow you to edit their attributes. Other players won't of course be able to edit its attributes.

Other buttons may appear on the bottom-left and bottom-right corners if you have placed many waystones in your world. They are the pagination buttons.

![waystone gui](https://cdn.modrinth.com/data/cached_images/72f81dd3a15b06e2730298b66dce4004636aeb06.jpeg)

You can discover below the influence of each attributes.

## Visibility

The first button concerns the waystone's visibility. There are three available values:

-   If set on **discoverable**, other players won't see it until they interact with it at least once, meaning they need to discover the waystone's location first.
-   If set on **private**, other player won't be able to see this waystone from the list. Only you (the owner), waystones managers, and players you share this waystones with (see "Shared With" below) will be able to see it.
    If set on **public**, every players will be able to see it from the list.

## Protection

The second button concerns the waystone's protection. There are two available values:

-   By default, the **protection** is **disabled**. In this mode, the waystone can be destroyed by anyone, including natural events, like explosions from creepers or TNT.
-   If **enabled**, only the owner of the waystone and waystones managers will be able to remove it.

## Shared With

Finally, the third button concerns the waystone's "**Shared With**" list.
It allows you to set a list of players with whom to share this waystone if its visibility is set on **private**.

To do this, you need to place in the slot a **Writable Book** containing your friends' nicknames. Unfortunately, due to technical constraints from the game, you will need to write a single nickname per page in the book. But you can add as many players as you want.

Be careful, too, with case. For example, "kawamood" does not equal "KawaMood". Be also sure to not inadvertently add extra spaces or line break at the end or the beggining of the page.

Once you've made your list, you can place it in the slot, and the waystone will save it
You can remove or edit it at any time by clicking on it!

# 💼 Manager Role

The **manager** role allows you to bypass most of restrictive rules introduced by waystones mechanics or settings.
It also allows you to see and edit every waystones, even private ones that you don't own.

The role can **be given** or **removed** from any player using these commands respectively:

```
/tag <nickname> add pk.waystones.manager
/tag <nickname> remove pk.waystones.manager
```

Example - Granting the manager role to the player named "Bob"

```
/tag Bob add pk.waystones.manager
```

# ⚙️Settings & Permissions

<details>
<summary>XP Consumption</summary>

If enabled, players will need to consume levels to travel from waystone to waystone. The cost is calculated according to the distance between the used and target waystones. The setting can be enabled using the following command:

```
/function pk_waystones:settings/xp_consumption/set {blocks:<amount>, mode:<mode>}
```

This command use two parameters:

-   **blocks** waits as value the count of blocks you want the player to consume a level for in order to teleport. Meaning for example, if two waystones are separated by 5000 blocks, and I set a value of 1000, it will require 5 levels to teleport to it.
    If this value is set to 0 or a negative value, it will disable the setting.
-   **mode** waits for either "manhattan" or "euclidian". It is the method used to calculate the distance between waystones.
    -   ["manhattan"](https://en.wikipedia.org/wiki/Taxicab_geometry) relies on the game's grid, meaning if a waystone is located at 0, 64, 0 and the other at 1000, 64, 1000, the setting will consider both waystone are separated by 2000 blocks.
    -   ["euclidian"](https://en.wikipedia.org/wiki/Euclidean_distance) refers to the distance in flight. Meaning if we took this same example above, the process will draw a vector between both waystones and calculate its length. The distance will then be around 1414 blocks.

_Example - Consume 1 level for 1000 blocks, with the euclidian calculation method:_

```
/function pk_waystones:settings/xp_consumption/set {blocks:1000, mode:"euclidian"}
```

_Example - Disable the setting completely:_

```
/function pk_waystones:settings/xp_consumption/set {blocks:0, mode:"euclidian"}
```

If needed, you can also be informed of the current amount of blocks per level and method using the following command:

```
/function pk_waystones:settings/xp_consumption/get
```

</details>
<details>
<summary>Blacklisted Dimensions</summary>

This setting lets you manage **dimensions** from the **blacklist**. The blacklist handles vanilla dimensions, but it also works with custom dimensions from data packs or [Multiverse](https://dev.bukkit.org/projects/multiverse-core) worlds.  
In a blacklisted dimension, only managers will be able to place waystones, regular players will not be able to.
You can **add**, **remove** dimensions to the blacklist or get the **list** of currently blacklisted dimensions using the following commands respectively:

```
/function pk_waystones:settings/blacklist_dimensions/add {dimension:<dimension_id>}
/function pk_waystones:settings/blacklist_dimensions/remove {dimension:<dimension_id>}
/function pk_waystones:settings/blacklist_dimensions/list
```

Example - Disallow waystones placement in the Nether

```
/function pk_waystones:settings/blacklist_dimensions/add {dimension:"minecraft:the_nether"}
```

📜 Note: in order to see the dimension id you're currently in, you can open the [debug screen (F3)](https://minecraft.wiki/w/Debug_screen), the dimension id is shown below the coordinates on the left side.

</details>
<details>
<summary>Display Waystones Nameplates</summary>

If enabled, floating nameplates will appear above waystones, allowing you to identify them more easily. You can **enable**, **disable** or **get** the current state of the setting using these following commands respectively:

```
/function pk_waystones:settings/display_nameplates/true
/function pk_waystones:settings/display_nameplates/false
/function pk_waystones:settings/display_nameplates/get
```

Render of nameplates in game:  
![display nameplates](https://cdn.modrinth.com/data/cached_images/62d1f3bda0c3bc53160355a13827f14e29ec31a5.jpeg)

</details>
<details>
<summary>Ignore Monsters Nearby</summary>

If enabled, it **ignores** monsters being around the waystones. If disabled, it prevents players to use a waystone if there are monsters nearby. It is the same principle as the beds use-prevention system. Note that this setting is **enabled** by default (monsters are ignored).
You can **enable**, **disable** or **get** the current state of the setting using these following commands respectively:

```
/function pk_waystones:settings/ignore_monsters/true
/function pk_waystones:settings/ignore_monsters/false
/function pk_waystones:settings/ignore_monsters/get
```

</details>
<details>
<summary>Legacy Textures</summary>

If enabled, the data pack will use regular **blocks textures** for waystones instead of the custom ones.
It can be useful if you're using high-resolution resources packs. You can **enable**, **disable** or **get** the current state of the setting using these following commands respectively:

```
/function pk_waystones:settings/legacy_textures/true
/function pk_waystones:settings/legacy_textures/false
/function pk_waystones:settings/legacy_textures/get
```

Render of textures in game:  
![legacy textures](https://cdn.modrinth.com/data/cached_images/048e648a435ebf225ce36d2fb7c4f5db24530456.jpeg)

</details>
<details>
<summary>Default visibility</summary>

This setting lets you change the default visibility of a waystone on placement.
Initially, the default visibility mode is "discoverable". You can set another visibility using the following command, where visibility can be either "discoverable", "private" or "public":

```
/function pk_waystones:settings/default_visibility/set {visibility:<visibility>}
```

Example - Set the default waystones visibility on "private"

```
/function pk_waystones:settings/default_visibility/set {visibility:"private"}
```

If needed, you can also be informed of the current default visibility using the following command:

```
/pk_waystones:settings/default_visibility/get
```

</details>
<details>
<summary>Limit Waystones Per Player/Server</summary>

You can chose how many waystones **players** can own at most. This amount is relative to each player, meaning if you set it to 5, every players will be able to place 5 waystones each. It can be done using the following command, where "**count**" waits for the desired amount of waystones:

```
/function pk_waystones:settings/limit_per_player/set {count:<count>}
```

_Example - Allow players to own a maximal amount of 5 waystones each_

```
/function pk_waystones:settings/limit_per_player/set {count:5}
```

You can also **disable** this setting using a **count** of -1 or less, meaning players will be able to place as many waystones as they want:

```
/function pk_waystones:settings/limit_per_player/set {count:-1}
```

Or **get** the current limit using the following command:

```
/function pk_waystones:settings/limit_per_player/get
```

Additionnally, you can also limit the amount of waystone your **server** can contain. This is the exact same principle as above, but instead of being a limit per player, it is a global limit. The commands follow the same scheme to **set**, **disable** or **get** this amount respectively:

```
/function pk_waystones:settings/limit_per_server/set {count:<count>}
/function pk_waystones:settings/limit_per_server/set -1
/function pk_waystones:settings/limit_per_server/get
```

You can also combine both settings if you want to set a limit per player but also a global limit on the server.

</details>
<details>
<summary>Hide coordinates in the waystones GUI</summary>

If enabled, no player will be able to see waystones location from the GUI, unless they have the manager role. You can **enable**, **disable** or **get** the current state of the setting using these following commands respectively:

```
/function pk_waystones:settings/hide_coordinates/true
/function pk_waystones:settings/hide_coordinates/false
/function pk_waystones:settings/hide_coordinates/get
```

Note that another command is usable by non-op players and allow them to hide coordinates of waystones for their own character only. _Refer to the "Other commands" section below._

</details>
<details>
<summary>Permission: Change "Visibility" Attribute</summary>

These permissions allows you to restrict players from using specific visibility values. Note that managers are immune to this effect and will always be able to change any attributes from any waystone. By default, players are allowed to set any visibility to their waystone.

In order to **allow**, **disallow** players to set the **public visibility** on their waystones, or if you want to **get** the current state of this permission, you can use the following commands respectively:

```
/function pk_waystones:permissions/change/visibility/public/true
/function pk_waystones:permissions/change/visibility/public/false
/function pk_waystones:permissions/change/visibility/public/get
```

Same as above but for the **private visibility**:

```
/function pk_waystones:permissions/change/visibility/private/true
/function pk_waystones:permissions/change/visibility/private/false
/function pk_waystones:permissions/change/visibility/private/get
```

Same as above again, but for the **discover visibility**:

```
/function pk_waystones:permissions/change/visibility/private/true
/function pk_waystones:permissions/change/visibility/private/false
/function pk_waystones:permissions/change/visibility/private/get
```

Finally you can also directly toggle or get all visibilily-based permissions at once:

```
/function pk_waystones:permissions/change/visibility/all/true
/function pk_waystones:permissions/change/visibility/all/false
/function pk_waystones:permissions/change/visibility/all/get
```

</details>
<details>
<summary>Permission: Change "Protection" Attribute</summary>

This permission allows you to restrict players from changing the **protection** attribute of their own waystones. Note that managers are immune to this effect and will always be able to change any attributes from any waystone. By default, players are allowed to change the protection of their waystone.

In order to **allow**, **disallow** players to change their waystones **protection** attribute, or if you want to **get** the current state of this permission, you can use the following commands respectively:

```
/function pk_waystones:permissions/change/protection/true
/function pk_waystones:permissions/change/protection/false
/function pk_waystones:permissions/change/protection/get
```

</details>
<details>
<summary>Permission: Change "Shared With" Attribute</summary>

This permission allows you to restrict players from changing the **shared with** attribute of their own waystones. Note that managers are immune to this effect and will always be able to change any attributes from any waystone. By default, players are allowed to change the "shared with" list of their waystones.

In order to **allow**, **disallow** players to change their waystones **shared with** attribute, or if you want to **get** the current state of this permission, you can use the following commands respectively:

```
/function pk_waystones:permissions/change/shared_with/true
/function pk_waystones:permissions/change/shared_with/false
/function pk_waystones:permissions/change/shared_with/get
```

</details>
<details>
<summary>Permission: Tp In Other Dimensions</summary>

If disabled, this permission force players to only see waystones being in the same dimension as themselves from a waystone's GUI. It can be useful if you don't want players to be able to teleport between different [Multiverse](https://dev.bukkit.org/projects/multiverse-core) worlds.
This permission is enabled by default, meaning players can teleport in any dimensions.

You can **enable**, **disable** or **get** the current state of the permission using these following commands respectively:

```
/function pk_waystones:permissions/tp/in_other_dimensions/true
/function pk_waystones:permissions/tp/in_other_dimensions/false
/function pk_waystones:permissions/tp/in_other_dimensions/get
```

</details>
<details>
<summary>Permission: Tp In Fight</summary>

If disabled, this permission prevents players to teleport if they took a damage from a living entity (as source) in the last 15 seconds. It can be useful if you don't want players to escape a fight by using a waystone on PvP servers.
This permission is enabled by default, meaning players can teleport at any moment.

You can **enable**, **disable** or **get** the current state of the permission using these following commands respectively:

```
/function pk_waystones:permissions/tp/in_fight/true
/function pk_waystones:permissions/tp/in_fight/false
/function pk_waystones:permissions/tp/in_fight/get
```

</details>

# 🧰 Other Commands

The data pack also provides some handy commands. Some of them are usable by both operators and regular players.

<details>
<summary>Give yourself a waystone</summary>
  
If you are an operator of your server or if cheats are enabled in your single-player world, you can give yourself a waystone of any variant using these following commands:
```
/function pk_waystones:commands/give/waystone/regular
/function pk_waystones:commands/give/waystone/sand
/function pk_waystones:commands/give/waystone/deepslate
/function pk_waystones:commands/give/waystone/nether
/function pk_waystones:commands/give/waystone/mossy_stone
```
</details>
<details>
<summary>Place a waystone</summary>

This command allows you to directly place a waystone with a specific set of attributes.  
Placing a waystone directly can be useful for data packs developers who want for example to implement natural waystones generation within their own structures.

The function waits for a `waystone` entry containing the waystone's data.
All properties can be omitted, as they would simply get their default values if they are missing. But there are two particular contexts you need to know:

-   If you don't specify an `owner`, it will be considered as "unclaimed". Unclaimed waystones will automatically be owned by the first player who uses it.
-   If you don't specify `location` > `x`, `y` and `z`, these three coordinates will be defined from the context of location of the command. **However**: if you don't specify a `location` > `dimension`, the waystone will be registered in the overworld. This is due to the fact we unfortunately can't dynamically detect in what potential custom dimension a command is ran if the executor isn't a player.

Here are several examples of commands:

Set a waystone with all default properties values:

```
/function pk_waystones:commands/setblock/waystone {waystone:{}}
```

Set a deepslate unclaimed waystone:

```
/function pk_waystones:commands/setblock/waystone {waystone:{variant:"deepslate"}}
```

Set an unclaimed, protected and public waystone at 0 80 0 in the End:

```
/function pk_waystones:commands/setblock/waystone {waystone:{location:{x:0,y:80,z:0,dimension:"minecraft:the_end"},protected:true,visibility:"public"}}
```

And here is the data structure for the `waystone` parameter:

```
waystone (entry)
├─ id (int): The id of the Waystone
├─ variant (string): The variant of the Waystone (regular, sand, deepslate, nether...)
├─ name (text component): The name of the Waystone
├─ owner (4 int array): The UUID of the owner
├─ location (entry): Location of the Waystone
│  ├─ x (int): x coordinate
│  ├─ y (int): y coordinate
│  ├─ z (int): z coordinate
│  └─ dimension (string): dimension id
├─ discovered_by (array): list of players having interacted with this Waystone
│  └─ (entry)
│     └─ uuid (4 int array): UUID of a player
├─ shared_with (array): list of players the waystone is shared with
│  └─ (entry)
│     ├─ uuid (4 int array): UUID of a player
│     └─ name (string): If the player isn't in the database yet, store its name instead
├─ protected (boolean): Weather the waystone is protected (true) or not (false)
├─ visibility (string): Can be "public", "private" or "discover"
└─ render_item (entry):
   └─ id (string): id of item to render the Waystone in the Waystones list
   └─ tag (entry): optional tags of the item
```

</details>
<details>
<summary>(For non-op players) Hide locations from the waystones list</summary>

This command can be used even by players who aren't operators on the server. It allows you to hide coordinates of waystones from waystones' GUI. It can be useful if you're a video maker who plays on a PvP server, and don't want to leak your waystones' location.  
Of course, this setting is player-specific. Meaning by changing it, it will only apply for yourself (not for other players).  
Using these following commands, if the value is set on **1**, waystones' location will be hidden, if set on **0**, waystones' location will show:

```
/trigger pk.waystones.hide_coordinates set 1
/trigger pk.waystones.hide_coordinates set 0
```

</details>
 
## Troubleshooting

### Recreate all waystones from the database

If ever waystones have been broken accidentally (using a `kill @e` command for example) you can run the following command to recreate all waystones from the database

```
/function pk_waystones:commands/debug/recreate_all_waystones
```

The process will automatically remove all remaining entities and blocks of broken waystones before placing fresh ones. All data (id, owner, type, attributes...) will be preserved.
It may take some time for it to complete, so be sure to get the message telling the process ended successfully before interacting with or placing a waystone.

### Force waystones to unlock

On server that use external tools like Paper, Spigot... some desynch can happen, and block may not update their blockstates correctly. If ever you get the message "This waystone is currently used by someone else" when no-body is actually using it, you can force the waystones to unlock using the follow troubleshooting command:

```
/function pk_waystones:commands/debug/force_waystones_to_unlock
```

# 💄 Optional Resources Pack

In order to embellish your experience, a **resources pack** providing models for Waystones items and GUI has been made by our graphist-artist contributor, **Lordphiphi**. You can download it from here: [Waystones Resources Pack V.2.5 (for Waystones V.3) - by Lordphiphi](https://mc.kawamood.com/resourcespacks/Waystones_Resources_Pack_V.2.5_for_Waystones_V.3.zip).

<details>
<summary>See render</summary>

![Waystones Resources Pack Render](https://cdn.modrinth.com/data/cached_images/c920a7ebae704526da95deff72bd4100755394dd.jpeg)

</details>

# 🧹 Uninstall

Waystones comes with an automatic uninstallation process. Running it will:

-   Remove all waystones that have been placed in your world, in every dimensions
-   Remove all scores and storage specific to the Waystones data pack
-   If there is no more KawaMood data packs installed, also remove all common scores and storages

The uninstalling process may take some seconds to complete. Be sure to wait for the message telling you that you can safely remove the data pack from your world's folder before doing it.

The command to start the uninstalling process is the following one:

```
/function pk_waystones:base/uninstall/start
```

# ❓ F.A.Q

<details>
<summary>Do I need to install a resources pack?</summary>

No, this data pack doesn't strictly require a resources pack. It provides a rather-intuitive GUI by itself, and use players heads to render custom textures.

However, a **resources pack** providing models for Waystones items and a better GUI has been made by our graphist-artist contributor, **Lordphiphi**. You can download it from here: [Waystones Resources Pack V.2.5 (for Waystones V.3) - by Lordphiphi](https://mc.kawamood.com/resourcespacks/Waystones_Resources_Pack_V.2.5_for_Waystones_V.3.zip).

</details>

<details>
<summary>The texture of the block shows regular player heads, how can I fix that?</summary>

You need to be connected to the internet the first time you use a new type of waystone. The textures of the player heads that are used to create their looks are indeed loaded and cached on the client-side, from (old or current) players skins that are stored on a Mojang server.

If you accidentally used a content that required to be online the first time you use it, and now see regular players heads instead of the expected texture, you can still go in the ".minecraft/assets/skins/" folder, then sort the sub-folders by date, and delete some recent folders. Once that is done, if your game was already started, you will need to restart it to update the cached content.

⚠️ **Exceptional issue on 1.20.2**: Players heads can sometimes show default player skins (Steve & co.) rather than its actual texture although the whole cache folder are cleared. This is actually an [known issue](https://bugs.mojang.com/browse/MC-264966) from the game itself that struggle to load a texture depending on the signature's value. This issue has been fixed on 1.20.3.

</details>

<details>
<summary>Waystones said they are already used, how to fix it?</summary>

Waystones can stay locked if their block container didn't update their blockstate correctly when players closed them. Such issues can happen sometimes, especially on modified versions such as Paper or Spigot. In order to force waystones to unlock, there is a debug command:

```
/function pk_waystones:base/debug/force_waystones_to_unlock
```

</details>

# 🪠 Report an issue

If you encountered an issue with this data pack, preferably join the [Discord server](https://discord.com/invite/w8s9XWgN6v), and open a post in the dedicated **#data-pack-issues** channel to describe your problem. Please, don't forget to provide all necessary informations including:

-   The Minecraft version you're using.
-   The version of the concerned data pack you're using.
-   If you're using any modified version like Forge, Paper or Spigot.
-   If you do, the plugins or mods you're using that may alter the functioning of data packs.
-   The list of other data packs you're using, if you have others.
-   A clear description of your issue, and a way to reproduce it.
-   If necessary, a video or a screenshot of the issue in game.

Before doing that, please read the F.A.Q. section just above. The issue you're facing may be a common one, and a way to fix it may already have been provided in it.

# 📌 Other links

Thank you for using Waystones! It makes me happy to know people are enjoying it.
If you want to support its development and the development of other data packs, you can support me on my other social networks:

-   [Youtube](https://www.youtube.com/@KawaMood/)
-   [Planet Minecraft](https://www.planetminecraft.com/member/kawamood/)
-   Or if you're in a generous mood, I accept donation on [paypal](https://paypal.me/KawaMood) or [buy me a kawa](https://www.buymeacoffee.com/kawamood) (slang term for "coffee")!
