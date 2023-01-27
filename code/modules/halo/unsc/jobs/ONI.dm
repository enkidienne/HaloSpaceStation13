
/datum/job/unsc/oni
	access = list(access_unsc,access_unsc_bridge,access_unsc_medical,access_unsc_armoury,access_unsc_supplies,access_unsc_oni,access_unsc_cargo)
	spawnpoint_override = null
	fallback_spawnpoint = "UNSC Base Fallback Spawns"

/datum/job/unsc/oni/research
	title = "ONI Researcher"
	supervisors = "the ONI Research Director"
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/unsc/oni/research
	alt_titles = list("ONI Doctor","ONI Physicist","ONI Botanist","ONI Chemist","ONI Weapons Researcher","ONI Surgeon","ONI Geneticist")
	access = list(access_unsc,access_unsc_bridge,access_unsc_medical,access_unsc_armoury,access_unsc_supplies,access_unsc_oni,access_unsc_cargo)

/datum/job/unsc/oni/research/director
	title = "ONI Research Director"
	supervisors = "the directors of ONI Section III"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/unsc/oni/research/director
	access = list(access_unsc,access_unsc_bridge,access_unsc_medical,access_unsc_armoury,access_unsc_odst,access_unsc_specialist,access_unsc_supplies,access_unsc_oni,access_unsc_cargo)

/datum/job/unsc/oni/guard
	title = "ONI Security Guard"
	supervisors = "the ONI Security Commander"
	outfit_type = /decl/hierarchy/outfit/job/unsc/oni/guard

/datum/job/unsc/oni/guard/commander
	title = "ONI Security Commander"
	supervisors = "the ONI Research Director"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/unsc/oni/guard/commander

/datum/job/unsc/oni/field_agent
	title = "ONI Field Agent"
	supervisors = "the ONI Research Director, Shadowy and unknowable forces."
	spawnpoint_override = "UNSC Base Spawns" //Resetting these back to the base spawnpoints, for compatability.
	fallback_spawnpoint = "UNSC Base Fallback Spawns"
	total_positions = 0
	spawn_positions = 0
	poplock_max = 2
	poplock_divisor = 5
	outfit_type = /decl/hierarchy/outfit/job/unsc/oni/field_agent
	access = list(access_unsc,access_unsc_bridge,access_unsc_medical,access_unsc_armoury,access_unsc_odst,access_unsc_specialist,access_unsc_supplies,access_unsc_oni,access_unsc_cargo)
	pop_balance_mult = 1.5
	faction_whitelist = "UNSC"