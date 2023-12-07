OverhaulProtection = OverhaulProtection or {}
OverhaulProtection.UserGroup = OverhaulProtection.UserGroup or {}
OverhaulProtection.AntiSpawn = OverhaulProtection.AntiSpawn or {}
OverhaulProtection.Menu = OverhaulProtection.Menu or {}

-- Make loading functions
local function Inclu(f) return include("overhaul_protection/"..f) end
local function AddCS(f) return AddCSLuaFile("overhaul_protection/"..f) end
local function IncAdd(f) return Inclu(f), AddCS(f) end

-- Load addon files
IncAdd("sh_config.lua")

if SERVER then
	-- Incluse Server and Client files
	Inclu("server/sv_rank_protection.lua")
	Inclu("server/sv_spawn_protection.lua")

	AddCS("client/cl_menu_protection.lua")
	AddCS("client/cl_network.lua")

else
	-- Incluse Client files
	Inclu("client/cl_menu_protection.lua")
	Inclu("client/cl_network.lua")

end
