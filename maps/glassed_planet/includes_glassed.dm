
#include "overmap.dm"
#include "areas.dm"

#include "glassed_planet_1.dmm"
#include "glassed_planet_2.dmm"

#if !defined(using_map_DATUM)

	#define using_map_DATUM /datum/map/ks7_elmsville

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, Glassed KS7 Elmsville included as well

#endif
