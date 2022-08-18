
PLUGIN.name = "Simple Combat System"
PLUGIN.author = "-Spac3"
PLUGIN.description = "Adds simple combat system."

WEAPON_STATS = WEAPON_STATS or {} -- add you're weapons here
WEAPON_STATS["tfa_rtbr_smg1"] = {
	["damage"] = 15,
	["attrib"] = 10,
	["range"] = 40
}
WEAPON_STATS["tfa_rtbr_pistol"] = {
	["damage"] = 11,
	["attrib"] = 50,
	["range"] = 30
}
WEAPON_STATS["tfa_rtbr_akm"] = {
	["damage"] = 20,
	["attrib"] = 15,
	["range"] = 50
}
WEAPON_STATS["tfa_rtbr_oicw"] = {
	["damage"] = 19,
	["attrib"] = 100,
	["range"] = 1
}
WEAPON_STATS["tfa_rtbr_shotgun"] = {
	["damage"] = 10,
	["attrib"] = 10,
	["range"] = 15
}
WEAPON_STATS["tfa_rtbr_357"] = {
	["damage"] = 25,
	["attrib"] = 10,
	["range"] = 80
}
WEAPON_STATS["tfa_rtbr_sniperrifle"] = {
	["damage"] = 60,
	["attrib"] = 15,
	["range"] = 100
}
WEAPON_STATS["tfa_rtbr_alyxgun"] = {
	["damage"] = 10,
	["attrib"] = 10,
	["range"] = 15
}


ix.util.Include("sv_plugin.lua")
ix.util.Include("cl_plugin.lua")
