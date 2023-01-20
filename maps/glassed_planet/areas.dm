
/obj/autolight_init/glassed_planet
	targ_area = /area/glassed_planet/exterior/autolight
	autolight_chance = 90
	weathers = list(/datum/weather/windy/p20,/datum/weather/ash/p60,/datum/weather/windy/heavy/p40)

/area/glassed_planet
	name = "Glassed Planet"
	base_turf = /turf/simulated/floor/exoplanet/snow
	has_gravity = 1
	dynamic_lighting = 0

/area/glassed_planet/interior
	name = "Glassed Planet - Interiors"
	requires_power = 0
	dynamic_lighting = 1
	sound_env = SMALL_ENCLOSED

/area/glassed_planet/exterior
	dynamic_lighting = 0
	sound_env = RURAL_OPEN

/area/glassed_planet/exterior/autolight
	icon_state = "yellow"

/area/glassed_planet/exterior/caves
	name = "Glassed Planet - Caves"
	sound_env = TUNNEL_ENCLOSED

/area/glassed_planet/exterior/caves/lower
	name = "Glassed Planet - Lower Caves"

/area/glassed_planet/interior/crashed_shuttle_seating
	name = "Glassed Planet - Crashed Shuttle Seating"
	sound_env = LARGE_ENCLOSED

/area/glassed_planet/interior/crashed_shuttle_room
	sound_env = SMALL_ENCLOSED

/area/glassed_planet/interior/crashed_shuttle_room/impacted_rock
	name = "Glassed Planet - Crashed Shuttle Breached Area"
	sound_env = TUNNEL_ENCLOSED

/area/glassed_planet/interior/crashed_shuttle_room/sec
	name = "Glassed Planet - Crashed Shuttle Security"

/area/glassed_planet/interior/crashed_shuttle_room/med
	name = "Glassed Planet - Crashed Shuttle Medical"

/area/glassed_planet/interior/crashed_shuttle_room/cargoS
	name = "Glassed Planet - Crashed Shuttle Starboard Cargo"

/area/glassed_planet/interior/crashed_shuttle_room/cockpit
	name = "Glassed Planet - Crashed Shuttle Cockpit"

/area/glassed_planet/interior/mining_shack
	name = "Glassed Planet - Mining Shack"
	sound_env = SMALL_SOFTFLOOR

/area/glassed_planet/interior/outpost_groundfloor
	name = "Glassed Planet - Outpost Ground Floor"

/area/glassed_planet/interior/outpost_groundfloor/hangar
	name = "Glassed Planet - Outpost Ground Floor Hangar"
	sound_env = LARGE_ENCLOSED

/area/glassed_planet/interior/outpost_lower
	name = "Glassed Planet - Outpost Lower Floor"

/area/glassed_planet/interior/outpost_lower/hangar
	name = "Glassed Planet - Outpost Lower Floor Hangar"
	sound_env = LARGE_ENCLOSED

/area/glassed_planet/interior/outpost_lower/storage
	name = "Glassed Planet - Outpost Lower Floor Storage"
	sound_env = LARGE_ENCLOSED

/area/glassed_planet/interior/facility
	name = "Glassed Planet - Unknown Facility"

/area/glassed_planet/interior/apartments
	name = "Glassed Planet - Glassed Apartments"

/area/glassed_planet/interior/mining_smelter
	name = "Glassed Planet - Mining Smelter"

/area/glassed_planet/interior/mining_smelter/storage
	name = "Glassed Planet - Mining Smelter Equipment Storage"

/area/glassed_planet/interior/cov_crashed
	name = "Glassed Planet - Crashed Covenant Vessel"