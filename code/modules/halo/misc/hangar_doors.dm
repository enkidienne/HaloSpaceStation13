

/turf/simulated/hangar_door
	name = "Hangar Door"
	desc = "Obstructs the way down."
	icon = 'code/modules/halo/misc/hangar_door.dmi'
	icon_state = "pdoor1"

/obj/structure/hangar_door
	name = "Hangar Door"
	desc = "Remotely controlled from elsewhere, when open this allows dropships to pass to drop-points below."
	icon = 'code/modules/halo/misc/hangar_door.dmi'
	icon_state = "pdoor0"
	invisibility = 101
	density = 0
	anchored = 1
	var/open_state = "pdoor1"
	var/opening_state = "pdoorc0"
	var/closed_state = "pdoor0"
	var/closing_state = "pdoorc1"
	var/turf_closed = /turf/simulated/hangar_door
	var/closed = 0 //This is immediately changed on init to be 1

/obj/structure/hangar_door/Initialize()
	. = ..()
	toggle_door()

/obj/structure/hangar_door/ex_act(var/severity)//Explosion immunity.
	return

/obj/structure/hangar_door/proc/door_animate(var/close = 0)
	invisibility = 0
	if(close)
		flick(closing_state,src)
	else
		flick(opening_state,src)
		sleep(10) //Let the animation play.
		invisibility = 101

/obj/structure/hangar_door/proc/toggle_door()
	var/turf/our_turf = loc
	spawn()
		if(closed)
			if(istype(our_turf))
				our_turf.ChangeTurf(/turf/simulated/open)
			door_animate(0)
			closed = 0
		else
			door_animate(1)
			if(istype(our_turf))
				our_turf.ChangeTurf(turf_closed)
			closed = 1

/obj/machinery/button/toggle/hangar_button
	name = "Hangar Toggle"
	desc = "Opens/closes the hangar doors."
	var/point_faction_to = "Civilian"
	var/targ_door_tag = "Tranq Hangar"
	var/targ_landpoint_tag = "Tranq Hangar Point"

/obj/machinery/button/toggle/hangar_button/proc/toggle_hangar_doors()
	for(var/obj/structure/hangar_door/d in world)
		if(d.tag == targ_door_tag)
			d.toggle_door()

/obj/machinery/button/toggle/hangar_button/proc/toggle_landing_points()
	for(var/obj/effect/landmark/dropship_land_point/point in world)
		if(point.tag == targ_landpoint_tag)
			if(point.faction == initial(point.faction))
				point.faction = point_faction_to
			else
				point.faction = initial(point.faction)

/obj/machinery/button/toggle/hangar_button/activate(mob/living/user)
	if(operating)
		return

	. = ..()
	toggle_hangar_doors()
	toggle_landing_points()
