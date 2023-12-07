local Config = OverhaulProtection.AntiSpawn

local events = {
	PlayerSpawnSENT = {configKey = "PlayerSpawnEntity", action = "spawn an entity"},
	PlayerSpawnVehicle = {configKey = "PlayerSpawnVehicle", action = "spawn a vehicle"},
	PlayerSpawnSWEP = {configKey = "PlayerSpawnSWEP", action = "spawn a weapon"},
	PlayerGiveSWEP = {configKey = "PlayerGiveSWEP", action = "give a weapon"},
	PlayerSpawnNPC = {configKey = "PlayerSpawnNPC", action = "spawn an NPC"},
	PlayerSpawnRagdoll = {configKey = "PlayerSpawnRagdoll", action = "spawn a ragdoll"},
	PlayerSpawnProp = {configKey = "PlayerSpawnProp", action = "spawn a prop"}
}

local function spawnPermissionCheck(ply, configKey, action)
	if not Config.Enabled then return end

	if (not Config[configKey][ply:GetUserGroup()]) then
		Msg("[Overhaul Protection] " .. ply:Name() .. " attempted to " .. action .. " but does not have the necessary permissions!\n")
		
		net.Start("Protection:notifyPlayer")
			net.WriteInt(NOTIFY_ERROR, 32)
			net.WriteString('You do not have permission to perform this action!')
			net.WriteInt(5, 32)
		net.Send(ply)
		
		return false
	else
		Msg("[Overhaul Protection]" .. ply:Name() .. " " .. action .. ".\n")
	end
end

for event, info in ipairs(events) do
	hook.Add(event, "AllowPly" .. event, function(ply)
		return spawnPermissionCheck(ply, info.configKey, info.action)
	end)
end