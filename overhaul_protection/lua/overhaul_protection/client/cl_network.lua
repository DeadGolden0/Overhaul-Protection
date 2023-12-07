util.AddNetworkString("Protection:notifyPlayer")

net.Receive("Protection:notifyPlayer", function(len, ply)
	local type = net.ReadInt(32)
	local message = net.ReadString()
	local duration = net.ReadInt(32)
	GAMEMODE:AddNotify(message, type, duration)
end)