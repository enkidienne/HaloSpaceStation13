
//Biomass wall//
/turf/simulated/wall/flood_biomass
	name = "biomass covered wall"
	desc = "A wall covered in pulsating biomass."
	icon_state = "flood"
	floor_type = /turf/simulated/floor/flood_biomass

/turf/simulated/wall/flood_biomass/New(var/newloc)
	. = ..(newloc,"flood biomass")

//Biomass Floor//

/decl/flooring/flood
	name = "pulsating biomass"
	desc = "It writhes beneath your feet.."
	icon = 'code/modules/halo/flood/flood_floor.dmi'
	icon_base = "floor"
	flags = TURF_ACID_IMMUNE | TURF_REMOVE_SHOVEL

/turf/simulated/floor/flood_biomass
	name = "biomass"
	desc = "Covered in pulsating biomass."
	icon = 'code/modules/halo/flood/flood_floor.dmi'
	icon_state = "floor"
	initial_flooring = /decl/flooring/flood