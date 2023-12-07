local Config = OverhaulProtection.Menu

local function CheckAccess(enabled, userGroup, table)
    if not enabled then return end

    if not table[userGroup] then
        if Config.Notification then
            notification.AddLegacy(Config.NotificationText or "Access denied.", NOTIFY_ERROR, 5)
        end
        return false
    end
end

hook.Add("ContextMenuOpen", "OverhaulProtection:ContextMenu", function()
    local userGroup = LocalPlayer():GetUserGroup()
    return CheckAccess(Config.ContextMenuEnabled, userGroup, Config.ContextMenu)
end)

hook.Add("SpawnMenuOpen", "OverhaulProtection:SpawnMenu", function()
    local userGroup = LocalPlayer():GetUserGroup()
    return CheckAccess(Config.SpawnMenuEnabled, userGroup, Config.SpawnMenu)
end)