
/obj/autolight_init/vt9
	targ_area = /area/exo_research_facility/exterior/autolight
	autolight_chance = 90 //It's mostly day, here.
	weathers = list(/datum/weather/windy/p20,/datum/weather/sandstorm/p25_night_p10,/datum/weather/sandstorm/heavy/day_p40)

/area/exo_research_facility
	name = "Research Facility"
	dynamic_lighting = 0
	has_gravity = 1
	base_turf = /turf/simulated/floor/asteroid/planet

/area/exo_research_facility/exterior
	dynamic_lighting = 0
	requires_power= 0
	luminosity = 1
	sound_env = RURAL_OPEN

/area/exo_research_facility/exterior/autolight
	icon_state = "yellow"

/area/exo_research_facility/exterior/umbilical
	name = "VT9-042 - Umbilical"
	sound_env = SMALL_ENCLOSED

/area/exo_research_facility/exterior/Caves
	name = "VT9-042 - Caves"
	dynamic_lighting = 1
	luminosity = 0
	sound_env = TUNNEL_ENCLOSED

/area/exo_research_facility/exterior/Caves/riverrock
	name = "VT9-042 - River Rock"

/area/exo_research_facility/exterior/Caves/upper
	name = "VT9-042 - Upper Caves"

/area/exo_research_facility/interior
	name = "VT9-042 - Ground Level"
	dynamic_lighting = 1
	luminosity = 0
	requires_power= 0
	sound_env = SMALL_ENCLOSED

/area/exo_research_facility/interior/airstrip_upper
	name = "VT9-042 - Airstrip Upper"

/area/exo_research_facility/interior/airstrip_lower
	name = "VT9-042 - Airstrip Lower"

/area/exo_research_facility/interior/barracks
	name = "VT9-042 - Crescent Base Barracks"

/area/exo_research_facility/interior/hangar
	name = "VT9-042 - Crescent Base Hangar Bay"
	sound_env = LARGE_ENCLOSED

/area/exo_research_facility/interior/medicalb
	name = "VT9-042 - Crescent Base Medical Bay"

/area/exo_research_facility/interior/sciencecrew
	name = "VT9-042 - Crescent Base Main Compound Entrance"

/area/exo_research_facility/interior/sciencelabs
	name = "VT9-042 - Crescent Base Science Labs"

/area/exo_research_facility/interior/northeastg
	name = "VT9-042 - Crescent Base Northeast Tower Ground"

/area/exo_research_facility/interior/northwestg
	name = "VT9-042 - Crescent Base Northwest Tower Ground"

/area/exo_research_facility/interior/southeastg
	name = "VT9-042 - Crescent Base Southeast Tower Ground"

/area/exo_research_facility/interior/southwestg
	name = "VT9-042 - Crescent Base Southwest Tower Ground"

/area/exo_research_facility/interior/centralg
	name = "VT9-042 - Crescent Base Gate Tower Ground"

/area/exo_research_facility/interior/commsg
	name = "VT9-042 - Crescent Base Communications Station"

/area/exo_research_facility/interior/mining
	name = "VT9-042 - Crescent Base Mining Outpost"

/area/exo_research_facility/interior/Lunchhall
	name = "VT9-042 - Crescent Base Lunch Hall"

/area/exo_research_facility/interior/Livingquar
	name = "VT9-042 - Crescent Base Living Quarters"

/area/exo_research_facility/interior/hangar_upper
	name = "VT9-042 - Crescent Base Hangar Rooftop"

/area/exo_research_facility/interior/external_wall_upper
	name = "VT9-042 - Crescent Base External Upper Wall"
	sound_env = RURAL_OPEN

/area/exo_research_facility/exterior/Caves/lower
	name = "VT9-042 - Lower Caves"

/area/exo_research_facility/interior/xenoresearch
	name = "VT9-042 - Crescent Base Xeno-Research"

/area/exo_research_facility/interior/virology
	name = "VT9-042 - Crescent Base Virology"

/area/exo_research_facility/interior/orionsector
	name = "VT9-042 - Crescent Base Orion-Sector"

/area/exo_research_facility/interior/slipspacelab
	name = "VT9-042 - Crescent Base Slipspace Lab"

/area/exo_research_facility/interior/xenoarchaeology
	name = "VT9-042 - Crescent Base Xeno-Archaeo"

/area/exo_research_facility/interior/botany
	name = "VT9-042 - Crescent Base Botany"

/area/exo_research_facility/interior/comms
	name = "VT9-042 - Crescent Base Comms"

/area/exo_research_facility/interior/Hallway
	name = "VT9-042 - Crescent Base Hallway"

/area/exo_research_facility/interior/entrance
	name = "VT9-042 - Crescent Base Sublevel Entrance"

/area/exo_research_facility/interior/mech
	name = "VT9-042 - Crescent Base Mechbay"

/area/exo_research_facility/interior/mechtest
	name = "VT9-042 - Crescent Base Mechtest Bay"

/area/exo_research_facility/interior/destruct
	name = "VT9-042 - Emergency Sanitation Storage"

/*
/area/exo_research_facility/sublevel1/interior
	name = "Crescent Base sublevel 1 interior"
	dynamic_lighting = 0
	requires_power= 0
	has_gravity = 1
	luminosity = 1

/area/exo_research_facility/sublevel1/interior/Hallways
	name = "Crescent Base Sublevel 1 Hallways"

/area/exo_research_facility/sublevel1/interior/security
	name = "Crescent Base Security Checkpoint"

/area/exo_research_facility/sublevel1/interior/mech
	name = "Crescent Base Mech Lab"

/area/exo_research_facility/sublevel1/interior/mechtest
	name = "Crescent Base Mech Testing Range"

/area/exo_research_facility/sublevel1/interior/weapons
	name = "Crescent Base Weapons Lab"

/area/exo_research_facility/sublevel1/interior/storage
	name = "Crescent Base Sublevel 1 Storage bay"

/area/exo_research_facility/sublevel1/interior/destruct
	name = "Crescent Base Selfdestruct"

/area/exo_research_facility/sublevel1/interior/holdingpen
	name = "Crescent Base Holding Pen"

/area/exo_research_facility/sublevel1/interior/Offices
	name = "Crescent Base Administrative Offices"

/area/exo_research_facility/sublevel1/interior/cryodorm
	name = "Crescent Base Cryodorms"

/area/exo_research_facility/sublevel1/interior/breakr
	name = "Crescent Base Sublevel 1 Break Room"

/area/exo_research_facility/sublevel1/interior/autopsy
	name = "Crescent Base Autopsy Lab"

/area/exo_research_facility/sublevel1/interior/Hangarb
	name = "Crescent Base Hangar Basement"

/area/exo_research_facility/sublevel1/interior/southwestb
	name = "Crescent Base Southwest Tower Basement"

/area/exo_research_facility/sublevel1/interior/southeastb
	name = "Crescent Base Southeast Tower Basement"

/area/exo_research_facility/sublevel1/interior/comms
	name = "Crescent Base Communications Station Basement"

/area/exo_research_facility/sublevel1/exterior/Caves
	name = "VT9-042 Lower Caves"
	dynamic_lighting = 1
	requires_power= 0
	has_gravity = 1
	luminosity = 0

/area/exo_research_facility/sublevel2/interior
	name = "Crescent Base sublevel 2 interior"
	dynamic_lighting = 0
	requires_power= 0
	has_gravity = 1
	luminosity = 1

/area/exo_research_facility/sublevel2/interior/Hallways
	name = "Crescent Base Sublevel 2 Hallways"


/area/exo_research_facility/sublevel2/interior/Breakr
	name = "Crescent Base Sublevel 2 Break Room"

/area/exo_research_facility/sublevel2/interior/adminoffice
	name = "Crescent Base Administrative Office"

/area/exo_research_facility/sublevel2/interior/weaponsdev
	name = "Crescent Base Sublevel 2 Weapons Development"

/area/exo_research_facility/sublevel2/interior/Recovery
	name = "Crescent Base Sublevel 2 Recover Ward"

/area/exo_research_facility/sublevel2/interior/Surgery
	name = "Crescent Base Sublevel 2 Surgery Ward"

/area/exo_research_facility/sublevel2/interior/Chemistry
	name = "Crescent Base Sublevel 2 Chemistry Lab"

/area/exo_research_facility/sublevel2/interior/testingr
	name = "Crescent Base Sublevel 2 Testing Range"

/area/exo_research_facility/sublevel2/interior/cryodormr
	name = "Crescent Base Sublevel 2 Cryodorms"

/area/exo_research_facility/sublevel2/exterior/Caves
	name = "VT9-042 Extremely Deep Caves"
	dynamic_lighting = 1
	requires_power= 0
	has_gravity = 1
	luminosity = 0
*/
