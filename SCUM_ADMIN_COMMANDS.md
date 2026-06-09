# SCUM 1.0 Cheats and Admin Commands Guide

This document is an organized reference of SCUM 1.0 cheats/admin commands extracted from the referenced docs and corrected with additional review. It is intended for server administration, testing, automation scripts, and GitHub documentation.

> **Note:** Most commands require administrator permissions, single-player admin mode, or a test/server admin environment.
>
> **How to use:** Open the in-game chat with `T`, type the command starting with `#`, and use `Tab` whenever possible to autocomplete command names, item IDs, NPC IDs, vehicle IDs, skills, and other internal identifiers.

## Reliability Notes

This version includes corrections and additions compared with the first draft:

- `#Teleport` and `#MapTeleport` are separate commands.
- `#Teleport` requires coordinate parameters: `X Y Z`.
- `#MapTeleport` is used for map-based teleportation.
- `#SetTeleportOnMapClick` is also included as a separate map-click teleport toggle.
- Missing server-wide/admin commands were added, including:
  - `#SetFamePointsAll`
  - `#SetCurrencyBalanceAll`
  - `#DestroyEncounterAtPlayerLocation`
  - `#Location`
  - `#ScheduleWorldEvent`
  - `#SetTime`
  - `#ShowFlagLocations`
  - `#ShowVehicleLocations`
  - `#ShowOtherPlayerLocations`
  - `#ReloadCustomizationsAndResetSpawns`

For maximum accuracy, validate commands in your current SCUM version using the in-game autocomplete feature.

## Quick Command Table

| Timestamp | Command | Parameters | Description | Example |
|---|---|---|---|---|
| `00:08` | `#SetSuperJump` | `true/false` | Enables or disables super jump. | `#SetSuperJump true` |
| `00:25` | `#SetImmortality` | `true/false` | Makes the character immortal. | `#SetImmortality true` |
| `00:41` | `#SetInfiniteStamina` | `true/false` | Enables infinite stamina. | `#SetInfiniteStamina true` |
| `00:54` | `#SetTeleportOnMapClick` | `true/false` | Enables teleporting by clicking on the map. | `#SetTeleportOnMapClick true` |
| Correction | `#MapTeleport` | none | Enables/uses map-based teleportation. | `#MapTeleport` |
| Correction | `#Teleport` | `X Y Z` | Teleports the player to specific coordinates. | `#Teleport 123456 654321 25000` |
| `01:06` | `#SetInfiniteOxygen` | `true/false` | Enables infinite oxygen. | `#SetInfiniteOxygen true` |
| `01:21` | `#SetMetabolismSimulationSpeed` | `value` | Controls metabolism simulation speed. | `#SetMetabolismSimulationSpeed 0` |
| `01:38` | `#SetAttributes` | `STR CON DEX INT` | Sets character attributes. | `#SetAttributes 5 5 5 5` |
| `01:58` | `#SetSkillLevel` | `SkillName Value` | Sets the level of a specific skill. | `#SetSkillLevel Handgun 10000` |
| `02:29` | `#SetGender` | `male/female` | Changes the character gender. | `#SetGender female` |
| `02:41` | `#SetFamePoints` | `value` | Sets fame points for the current player. | `#SetFamePoints 100` |
| `02:49` | `#SetFamePointsAll` | `value` | Sets fame points for all players on the server. | `#SetFamePointsAll 100` |
| `02:57` | `#SetCurrencyBalance` | `normal/gold value` | Sets money or gold balance for the current player. | `#SetCurrencyBalance gold 1000` |
| `03:07` | `#SetCurrencyBalanceAll` | `normal/gold value` | Sets money or gold balance for all players. | `#SetCurrencyBalanceAll normal 10000` |
| `03:15` | `#SpawnItem` | `ItemID` | Spawns a specific item. | `#SpawnItem Weapon_RPG7` |
| `03:30` | `#SetInfiniteAmmo` | `true/false` | Enables infinite ammunition. | `#SetInfiniteAmmo true` |
| `03:52` | `#SpawnNPC` | `NPCID quantity` | Spawns NPCs, such as drifters or guards. | `#SpawnNPC BP_Drifter_Lvl5 1` |
| `04:20` | `#ShowNPCLocation` | `true/false` | Shows NPC locations. | `#ShowNPCLocation true` |
| `04:42` | `#SpawnAnimal` | `AnimalID quantity` | Spawns animals. | `#SpawnAnimal BP_Bear 1` |
| `04:51` | `#DestroyAllActorsWithinRadius` | `radius` | Destroys/removes nearby actors within a radius. | `#DestroyAllActorsWithinRadius 10` |
| `04:59` | `#SpawnZombie` | `ZombieID quantity` | Spawns zombies/puppets. | `#SpawnZombie BP_Zombie 5` |
| `05:37` | `#DrawSentryHealthBar` | `true/false` | Displays sentry health bars. | `#DrawSentryHealthBar true` |
| `05:54` | `#ForceEncounter` | none | Forces an encounter/event, such as a cargo drop or sentry drop. | `#ForceEncounter` |
| `06:13` | `#DestroyEncounterAtPlayerLocation` | none | Removes the encounter/event at the player location. | `#DestroyEncounterAtPlayerLocation` |
| `06:26` | `#SpawnVehicle` | `VehicleID quantity` | Spawns vehicles. | `#SpawnVehicle BPC_WolfWagen 1` |
| `06:59` | `#SetFarmingSimulationSpeed` | `value` | Controls farming/growth simulation speed. | `#SetFarmingSimulationSpeed 1000` |
| `07:13` | `#Location` | none | Prints the current player coordinates: `X Y Z`. | `#Location` |
| `07:22` | `#ScheduleWorldEvent` | `EventID coordinates` | Schedules a world event at specific coordinates. | `#ScheduleWorldEvent CargoDrop X Y Z` |
| `07:55` | `#SetTime` | `0-23` | Sets the in-game time. | `#SetTime 12` |
| `08:03` | `#ShowFlagLocations` | `true/false` | Shows flag locations on the map. | `#ShowFlagLocations true` |
| `08:16` | `#ShowVehicleLocations` | `true/false` | Shows vehicle locations on the map. | `#ShowVehicleLocations true` |
| `08:26` | `#ListPlayers` | none | Lists connected players. | `#ListPlayers` |
| `08:33` | `#ShowOtherPlayerLocations` | `true/false` | Shows other player locations. | `#ShowOtherPlayerLocations true` |
| `08:41` | `#TeleportToMe` | `PlayerName` | Teleports a specific player to your location. | `#TeleportToMe Player123` |
| `09:07` | `#ReloadCustomizationsAndResetSpawns` | none | Reloads customizations and resets spawns/containers/items. | `#ReloadCustomizationsAndResetSpawns` |

## Detailed Command Reference

### Character and Survival Commands

#### `#SetSuperJump`

Enables or disables super jump.

```text
#SetSuperJump true
#SetSuperJump false
```

Useful for moving over obstacles, testing terrain, reaching rooftops, and exploring areas quickly.

#### `#SetImmortality`

Makes the character immortal.

```text
#SetImmortality true
#SetImmortality false
```

Useful for testing combat, NPCs, explosives, falls, high-risk areas, and server events without dying.

#### `#SetInfiniteStamina`

Enables infinite stamina.

```text
#SetInfiniteStamina true
#SetInfiniteStamina false
```

Useful for running, swimming, testing movement, and traveling long distances without exhaustion.

#### `#SetInfiniteOxygen`

Enables infinite oxygen.

```text
#SetInfiniteOxygen true
#SetInfiniteOxygen false
```

Useful for diving, underwater exploration, and testing water-based areas.

#### `#SetMetabolismSimulationSpeed`

Controls the speed of the metabolism simulation.

```text
#SetMetabolismSimulationSpeed 0
```

A value of `0` can be used to pause or heavily reduce the simulation. Higher values speed it up. Use this for testing hunger, thirst, digestion, body stats, and medical/metabolism systems.

#### `#SetAttributes`

Sets the main character attributes.

```text
#SetAttributes 5 5 5 5
```

Parameter order:

1. Strength / `STR`
2. Constitution / `CON`
3. Dexterity / `DEX`
4. Intelligence / `INT`

Useful for testing character builds and how attributes affect gameplay.

#### `#SetSkillLevel`

Sets the level of a specific skill.

```text
#SetSkillLevel Handgun 10000
```

Use `Tab` autocomplete to confirm the correct skill names in your game/server version.

#### `#SetGender`

Changes the character gender.

```text
#SetGender male
#SetGender female
```

Useful for testing appearance, clothing, animations, and character customization.

> Changing gender may affect or reset parts of the character appearance/customization.

## Teleport and Location Commands

### `#Teleport`

Teleports the player to specific coordinates.

```text
#Teleport X Y Z
```

Example:

```text
#Teleport 123456 654321 25000
```

Parameters:

- `X`: horizontal map coordinate
- `Y`: vertical map coordinate
- `Z`: height/elevation coordinate

Useful when you already have exact coordinates for a base, bunker, city, trader, bugged location, event location, or test point.

### `#MapTeleport`

Map-based teleport command.

```text
#MapTeleport
```

Useful for teleporting through the map interface instead of manually entering coordinates.

### `#SetTeleportOnMapClick`

Enables or disables teleporting by clicking on the map.

```text
#SetTeleportOnMapClick true
#SetTeleportOnMapClick false
```

This is useful for fast travel, admin work, testing, and quickly reaching event locations.

### `#Location`

Prints the current player coordinates.

```text
#Location
```

Use this command to capture exact `X Y Z` coordinates for scripts, automation, event scheduling, or later use with `#Teleport`.

## Economy and Fame Commands

### `#SetFamePoints`

Sets fame points for the current player.

```text
#SetFamePoints 100
```

Useful for testing respawn costs, trader restrictions, server rules, and progression systems.

### `#SetFamePointsAll`

Sets fame points for all players on the server.

```text
#SetFamePointsAll 100
```

Useful for server-wide events, testing, resets, or progression adjustments.

### `#SetCurrencyBalance`

Sets currency balance for the current player.

```text
#SetCurrencyBalance normal 10000
#SetCurrencyBalance gold 1000
```

Possible currency types shown:

- `normal`
- `gold`

Useful for testing traders, economy, purchases, and banking.

### `#SetCurrencyBalanceAll`

Sets currency balance for all players.

```text
#SetCurrencyBalanceAll normal 10000
#SetCurrencyBalanceAll gold 1000
```

Useful for server-wide economy changes or event rewards.

## Items, Weapons, Ammo, NPCs, and Creatures

### `#SpawnItem`

Spawns a specific item.

```text
#SpawnItem ItemID
```

Example:

```text
#SpawnItem Weapon_RPG7
```

Use `Tab` autocomplete to find exact item IDs.

### `#SetInfiniteAmmo`

Enables infinite ammunition.

```text
#SetInfiniteAmmo true
#SetInfiniteAmmo false
```

Useful for testing weapons, recoil, damage, explosives, sentries, NPCs, and events.

### `#SpawnNPC`

Spawns NPCs such as drifters or guards.

```text
#SpawnNPC NPCID quantity
```

Example:

```text
#SpawnNPC BP_Drifter_Lvl5 1
```

Use autocomplete to confirm exact NPC IDs.

### `#ShowNPCLocation`

Shows NPC locations.

```text
#ShowNPCLocation true
#ShowNPCLocation false
```

Useful as a debugging/admin radar for finding living or dead NPCs.

### `#SpawnAnimal`

Spawns animals.

```text
#SpawnAnimal AnimalID quantity
```

Example:

```text
#SpawnAnimal BP_Bear 1
```

Use autocomplete to confirm animal IDs.

### `#SpawnZombie`

Spawns zombies/puppets.

```text
#SpawnZombie ZombieID quantity
```

Example:

```text
#SpawnZombie BP_Zombie 5
```

Use autocomplete to confirm zombie/puppet IDs.

### `#DestroyAllActorsWithinRadius`

Destroys/removes actors within a given radius.

```text
#DestroyAllActorsWithinRadius 10
```

Useful for cleaning up nearby NPCs, zombies, guards, bugged actors, or test entities.

> Use this carefully on live servers, because it may remove entities you did not intend to delete.

## Events, World, Vehicles, and Farming

### `#DrawSentryHealthBar`

Displays sentry health bars.

```text
#DrawSentryHealthBar true
#DrawSentryHealthBar false
```

Useful for testing weapon damage and sentry balance.

### `#ForceEncounter`

Forces an encounter/event.

```text
#ForceEncounter
```

Can be used to trigger events such as cargo drops or sentry-related encounters.

### `#DestroyEncounterAtPlayerLocation`

Removes the encounter/event at the player's current location.

```text
#DestroyEncounterAtPlayerLocation
```

Useful for cleaning up forced/test encounters.

### `#SpawnVehicle`

Spawns vehicles.

```text
#SpawnVehicle VehicleID quantity
```

Example:

```text
#SpawnVehicle BPC_WolfWagen 1
```

Use autocomplete to confirm vehicle IDs.

### `#SetFarmingSimulationSpeed`

Controls farming and plant growth simulation speed.

```text
#SetFarmingSimulationSpeed 1000
```

Useful for testing farming systems, plant growth, and crop mechanics.

### `#ScheduleWorldEvent`

Schedules a world event at specified coordinates.

```text
#ScheduleWorldEvent EventID X Y Z
```

Example:

```text
#ScheduleWorldEvent CargoDrop X Y Z
```

Use with `#Location` to capture coordinates first.

### `#SetTime`

Sets the in-game time.

```text
#SetTime 12
```

Parameter range shown:

```text
0-23
```

Useful for testing day/night gameplay, lighting, events, and server scenarios.

## Server Administration Commands

### `#ShowFlagLocations`

Shows flag locations on the map.

```text
#ShowFlagLocations true
#ShowFlagLocations false
```

Useful for base/admin monitoring and teleporting to flag-related locations.

### `#ShowVehicleLocations`

Shows vehicle locations on the map.

```text
#ShowVehicleLocations true
#ShowVehicleLocations false
```

Useful for finding vehicles, checking spawns, and server administration.

### `#ListPlayers`

Lists connected players.

```text
#ListPlayers
```

Useful for administration, player lookup, moderation, and using player-targeted commands.

### `#ShowOtherPlayerLocations`

Shows other player locations.

```text
#ShowOtherPlayerLocations true
#ShowOtherPlayerLocations false
```

Useful for admins monitoring the server, investigating issues, hosting events, or helping players.

### `#TeleportToMe`

Teleports a player to your location.

```text
#TeleportToMe PlayerName
```

Example:

```text
#TeleportToMe Player123
```

Useful for support, stuck players, events, moderation, and admin troubleshooting.

### `#ReloadCustomizationsAndResetSpawns`

Reloads customizations and resets spawns.

```text
#ReloadCustomizationsAndResetSpawns
```

Can affect containers, map items, vehicles, and other spawn-related systems.

> Use this carefully on active servers.

## Copy/Paste Quick Reference

```text
#SetSuperJump true
#SetImmortality true
#SetInfiniteStamina true
#SetTeleportOnMapClick true
#MapTeleport
#Teleport X Y Z
#SetInfiniteOxygen true
#SetMetabolismSimulationSpeed 0
#SetAttributes 5 5 5 5
#SetSkillLevel SkillName Value
#SetGender male
#SetFamePoints 100
#SetFamePointsAll 100
#SetCurrencyBalance normal 10000
#SetCurrencyBalance gold 1000
#SetCurrencyBalanceAll normal 10000
#SetCurrencyBalanceAll gold 1000
#SpawnItem ItemID
#SetInfiniteAmmo true
#SpawnNPC NPCID quantity
#ShowNPCLocation true
#SpawnAnimal AnimalID quantity
#DestroyAllActorsWithinRadius radius
#SpawnZombie ZombieID quantity
#DrawSentryHealthBar true
#ForceEncounter
#DestroyEncounterAtPlayerLocation
#SpawnVehicle VehicleID quantity
#SetFarmingSimulationSpeed 1000
#Location
#ScheduleWorldEvent EventID X Y Z
#SetTime 12
#ShowFlagLocations true
#ShowVehicleLocations true
#ListPlayers
#ShowOtherPlayerLocations true
#TeleportToMe PlayerName
#ReloadCustomizationsAndResetSpawns
```

## Recommended Validation Workflow for GitHub/Server Automation

Before using these commands in scripts or documentation:

1. **Validate command spelling in-game**
   - Open chat with `T`.
   - Type the first part of the command.
   - Press `Tab` to confirm autocomplete.

2. **Check the target SCUM version**
   - Commands may change between patches.
   - Keep a version note in your repository.

3. **Test in a non-production environment**
   - Use single player or a test server first.
   - Avoid testing destructive commands on a live server.

4. **Log coordinates with `#Location`**
   - Use `#Location` to collect exact coordinates.
   - Store them in config files or documentation.

5. **Be careful with global commands**
   - Commands ending in `All` affect every player.
   - Commands that reset spawns or destroy actors can impact active gameplay.

## Disclaimer

This document is intended for administration, testing, private servers, and automation documentation. Command availability and behavior may depend on the SCUM version, server configuration, and admin permissions.
