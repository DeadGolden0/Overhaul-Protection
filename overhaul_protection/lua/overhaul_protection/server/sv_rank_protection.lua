local Config = OverhaulProtection.UserGroup

hook.Add("Initialize", "OverhaulProtection:Initialize", function()
	if Config.Enabled then
        Msg( "===============================\n" )
        Msg( "==    Overhaul Protection    ==\n" )
        Msg( "===============================\n" )
        Msg( "== WhiteList SteamID :       ==\n" )
        for SteamID, _ in ipairs(Config.SteamID) do
        Msg( "==  - " .. SteamID ..     "    ==\n" )
        end
        Msg( "===============================\n" )
    end
end)

local function ManagePlayer( pPlayer )
    local PlayerName = pPlayer:Nick() or ""
    local SteamID = pPlayer:SteamID()

    local commands = {
        ["ulx"] = { remove = {'ulx', 'removeuserid', SteamID}, ban = {'ulx', 'banid', SteamID, Config.BanTime or '0', Config.BanMessage or 'You are not in the whitelist.'}},
        ["xadmin"] = { remove = {'xadmin_setgroup', SteamID, "noaccess"}, ban = {'xadmin_ban', SteamID, Config.BanTime or '0', Config.BanMessage or 'You are not in the whitelist.'}},
        ["sam"] = { remove = {'sam', 'setrankid', SteamID, "noaccess"}, ban = {'sam', 'banid', SteamID, Config.BanTime or '0', Config.BanMessage or 'You are not in the whitelist.'}},
    }

    if IsValid(pPlayer) and SteamID and commands[Config.AdminSystem] then
        RunConsoleCommand(unpack(commands[Config.AdminSystem].remove))
        Msg("[Overhaul Protection] Privileges revoked for: " .. PlayerName .. " (".. SteamID .. ")\n")

        if Config.BanPlayer then
            RunConsoleCommand(unpack(commands[Config.AdminSystem].ban))
            Msg("[Overhaul Protection] Player banned : " .. PlayerName .. " (".. SteamID .. ")\n")
        end

        if Config.Announce then
	        for k,v in pairs(player.GetAll()) do 
                v:PrintMessage(HUD_PRINTTALK, "[Overhaul Protection] High-staff privileges of "..PlayerName.." have been revoked because their SteamID is not present in the whitelist.")
            end 
        end
    end
end

local function handleGroupChange(pPlayer, NewGroup, SteamID)
    if not Config.Enabled then return end

    if pPlayer and pPlayer:SteamID() == SteamID then
        Msg("[Overhaul Protection] Player " .. pPlayer:Nick() .. " (" .. SteamID .. ") now has the following user group: " .. NewGroup .. "\n")

        if Config.UserGroups[NewGroup:lower()] and not Config.SteamID[SteamID] then
            ManagePlayer(pPlayer)
        end
    end
end

local hooks = {
    ["ulx"] = {
        event = "ULibUserGroupChange",
        callback = function(SteamID, _, _, NewGroup, OldGroup)
            handleGroupChange(player.GetBySteamID(SteamID), NewGroup, SteamID)
        end
    },
    ["xadmin"] = {
        event = "xAdminUserGroupUpdated",
        callback = function(pPlayer, NewGroup)
            handleGroupChange(pPlayer, NewGroup, pPlayer:SteamID())
        end
    },
    ["sam"] = {
        event = "SAM.ChangedPlayerRank",
        callback = function(pPlayer, NewGroup, OldGroup)
            handleGroupChange(pPlayer, NewGroup, pPlayer:SteamID())
        end
    },
}

if hooks[Config.AdminSystem] then
    hook.Add(hooks[Config.AdminSystem].event, "OverhaulProtection:"..Config.AdminSystem..":UserGroupChange", hooks[Config.AdminSystem].callback)
else
    Msg("[Overhaul Protection] The administration system is not valid. Please choose between 'ulx', 'xadmin', or 'sam'.\n")
end

hook.Add("PlayerInitialSpawn", "OverhaulProtection:PlayerInitialSpawn", function(pPlayer)
    if not Config.Enabled then return end

    local SteamID = pPlayer:SteamID()
    local UserGroup = pPlayer:GetUserGroup()
    Msg("[Overhaul Protection] " .. pPlayer:Nick() .. " (" .. SteamID .. ") has just connected\n")

    if Config.UserGroups[UserGroup:lower()] and not Config.SteamID[SteamID] then
        ManagePlayer(pPlayer)
    end
end)