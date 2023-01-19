/obj/machinery/door/unpowered/simple/flood
	name = "door"
	icon = 'code/modules/halo/flood/flood_door.dmi'
	icon_state = "flood"
	autoclose = 1

	hitsound = 'code/modules/halo/sounds/airlock_sounds/flood_hit_sfx.ogg'

/obj/machinery/door/unpowered/simple/flood/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "flood biomass", complexity)
