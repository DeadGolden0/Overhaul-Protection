--// Rank Protection Settings \\--

OverhaulProtection.UserGroup.Enabled = true -- Enable or disable the usergroup protection

OverhaulProtection.UserGroup.AdminSystem = "ulx" -- Admin system used | Choose between "ulx", "xadmin", or "sam"

OverhaulProtection.UserGroup.BanPlayer = true -- Ban the player if they are not in the whitelist

OverhaulProtection.UserGroup.BanTime = 0 -- Ban time in minutes | 0 = Permanent ban / 1440 = 1 day ban / 10080 = 1 week ban / 43200 = 1 month ban

OverhaulProtection.UserGroup.BanMessage = 'You are not in the whitelist.' -- Custom Ban reason

OverhaulProtection.UserGroup.Announce = true -- Announce the ban in chat for all players

OverhaulProtection.UserGroup.SteamID = { -- Add the SteamIDs of whitelisted High-Staff members
    -- Example:
    --['STEAM_0:0:00000000'] = true,
    --['STEAM_0:0:00000000'] = true,
}

OverhaulProtection.UserGroup.UserGroups = { -- Add the list of groups to protect
    ['superadmin'] = true,
    ['admin'] = true,
}


--// Anti-Spawn Protection Settings \\--

OverhaulProtection.AntiSpawn.Enabled = true -- Enable or disable the anti-spawn protection

OverhaulProtection.AntiSpawn.PlayerSpawnEntity = { -- List of groups that can spawn entities
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
} 

OverhaulProtection.AntiSpawn.PlayerSpawnVehicle = { -- List of groups that can spawn vehicles
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}

OverhaulProtection.AntiSpawn.PlayerSpawnSWEP = { -- List of groups that can spawn weapons
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}

OverhaulProtection.AntiSpawn.PlayerGiveSWEP = { -- List of groups that can take weapons
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}

OverhaulProtection.AntiSpawn.PlayerSpawnNPC = { -- List of groups that can spawn NPC
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}

OverhaulProtection.AntiSpawn.PlayerSpawnRagdoll = { -- List of groups that can spawn ragdoll
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}

OverhaulProtection.AntiSpawn.PlayerSpawnProp = { -- List of groups that can spawn props
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}


--// Menu Protection Settings \\--

OverhaulProtection.Menu.SpawnMenuEnabled = true -- Enable or disable the Spawn Menu protection

OverhaulProtection.Menu.ContextMenuEnabled = true -- Enable or disable the Context Menu protection

OverhaulProtection.Menu.Notification = true -- Enable or disable the notification when a player tries to open the menu

OverhaulProtection.Menu.NotificationText = "You are not allowed to open this menu." -- Notification text when a player tries to open the menu

OverhaulProtection.Menu.SpawnMenu = { -- Set Usergroups that can open the spawn menu 
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}

OverhaulProtection.Menu.ContextMenu = { -- Set Usergroups that can open the context menu
    ['superadmin'] = true,
    ['admin'] = true,
    ['moderator'] = true,
}