
/obj/effect/landmark/innie_bomb
	name = "innie bomb spawn"

/obj/payload/innie
	anchored = 0
	seconds_to_disarm = 30

/obj/payload/innie/proc/lockdown_bomb()
	anchored = 1
	new /obj/effect/bomblocation (loc)

/obj/payload/innie/verb/anchor_bomb()
	set name = "Anchor Bomb (unreversible)"
	set src in oview(1)

	if(!anchored && do_after(usr,8 SECONDS,src,1,1,,1))
		visible_message("<span class = 'danger'>[usr] engages the anchoring bolts on the [name]</span>")
		lockdown_bomb()


/obj/payload/innie/set_anchor()
	return

/obj/structure/payload/inactive
	name = "Inactive Nuclear Warhead"
	desc = "A dust covered nuclear warhead. Banging this thing around might be the last thing you do."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "MFDD"
	anchored = 0
	density = 1

/obj/machinery/button/toggle/hangar_button/tranq_hangar
	targ_door_tag = "Tranq Hangar"
	targ_landpoint_tag = "Tranq Hangar Point"

/obj/structure/hangar_door/tranq_hangar/New()
	. = ..()
	tag = "Tranq Hangar"

/obj/effect/landmark/dropship_land_point/insurrection_hangar
	name = "Antarctica Hangar"
	faction = "innie"

/obj/effect/landmark/dropship_land_point/insurrection_hangar/New()
	. = ..()
	tag = "Tranq Hangar Point"