
#include "areas.dm"
#include "ai_items.dm"
#include "presets.dm"
#include "cassius_base.dmm"

/obj/effect/overmap/ship/faction_base/unsc/unsc_base_cassius
	name = "Cassius Base"
	desc = "A decommissioned Mocton-Class Orbital Defense Platform converted for use as a staging point"
	faction = "UNSC"
	block_slipspace = 1
	fore_dir = WEST

	parent_area_type = /area/faction_base/unsc/cassius_base

	map_bounds = list(32,150,170,57) //Format: (TOP_LEFT_X,TOP_LEFT_Y,BOTTOM_RIGHT_X,BOTTOM_RIGHT_Y)
