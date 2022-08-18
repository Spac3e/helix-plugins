PLUGIN.name = "Shield Breaker"
PLUGIN.author = "-Spac3"
PLUGIN.description = "Clockwork port to helix"

ix.config.Add("forcefieldBrakeStrip", 5, "Get the forcefield braker after use", nil, {
	data = {min = 0, max = 60},
	category = PLUGIN.name
})

ix.config.Add("forcefieldBrakeTime", 5, "How long does it take to break the forcefield", nil, {
	data = {min = 0, max = 60},
	category = PLUGIN.name
})