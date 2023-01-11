
#define SPOOF_DOOR "door spoof"
#define SPOOF_VENDOR "vendor eject"

//Spoof Datums.
/datum/spoof_function
	var/function_name = "placeholder"
	var/spoof_delay = 1 SECOND //How long does the player need to stand near the target.
	var/cooldown_at = 0
	var/cooldown_for = 1 SECOND //Once used, how long until we can use it again?
	var/spoof_fail_msg = "Function on Cooldown."
	var/spoof_success_msg = "Function executed successfully.."
	var/obj/item/device/ewar_spoofer/spoofer_device
	var/obj/item/spoof_cable
	var/sfx_file

/datum/spoof_function/New(var/parent_device)
	spoofer_device = parent_device

/datum/spoof_function/proc/get_user()
	var/mob/m = spoofer_device.loc
	if(istype(m))
		return m
	else
		//In pockets.
		m = spoofer_device.loc.loc.loc
		if(istype(m))
			return m
		else
			return null

/datum/spoof_function/proc/process_spoof_delay(var/obj/targ)
	spoofer_device.icon_state = spoofer_device.active_state
	. = do_after(get_user(), spoof_delay, spoofer_device, 0, 1,INCAPACITATION_NONE,0,0,0)
	spoofer_device.icon_state = initial(spoofer_device.icon_state)

//Returns a message if failed, null if successful.
/datum/spoof_function/proc/can_spoof(var/obj/targ)
	if(world.time < cooldown_at)
		return spoof_fail_msg
	if(!spoof_cable)
		return "Cable required for device connection"
	var/turf/cable_turf = get_turf(spoof_cable)
	if(!cable_turf.Adjacent(targ))
		return "Connection failed. Distance exceeds cable length."
	return null

/datum/spoof_function/proc/do_spoof(var/obj/targ)

//Displays to user, first. If no user, displays a generic beep.
/datum/spoof_function/proc/display_msg(var/msg)
	var/mob/user = get_user()
	if(user)
		to_chat(user,"<span class = 'notice'>\The [spoofer_device] displays: [msg]</span>")
	else
		spoofer_device.visible_message("<span class = 'notice'>[spoofer_device] beeps as it completes it's operation.</span>")

/datum/spoof_function/proc/process_spoof_request(var/obj/targ,var/obj/cable)
	. = 0
	spoof_cable = cable
	//Check before, and after we process the delay. Ugly, but needed.
	var/can_spoof_msg = can_spoof(targ)
	if(!isnull(can_spoof_msg))
		display_msg(can_spoof_msg)
		return
	if(process_spoof_delay(targ))
		can_spoof_msg = can_spoof(targ)
		if(!isnull(can_spoof_msg))
			display_msg(can_spoof_msg)
			return
		if(sfx_file)
			sound_to(get_user(),sfx_file)
		do_spoof(targ)
		. = 1
	cooldown_at = world.time + cooldown_for
	spoof_cable = null

//Spoof Functions//

//Doorhack
/datum/spoof_function/doorhack
	function_name = "Door ID Bypass"
	spoof_delay = 1 SECOND
	cooldown_for = 3 SECONDS
	sfx_file = 'sound/effects/sparks4.ogg'

/datum/spoof_function/doorhack/can_spoof(var/obj/machinery/door/airlock/door)
	. = ..()
	if(.)
		return
	if(!istype(door))
		return "Incorrect function target."

/datum/spoof_function/doorhack/do_spoof(var/obj/machinery/door/airlock/door)
	door.unlock()
	sleep(2)
	door.open()
	sleep(10)
	door.close()

//Vendor Bypass
/datum/spoof_function/vendorhack
	function_name = "Vendor Force-Vend"
	spoof_delay = 5 SECOND
	cooldown_for = 10 SECOND

	sfx_file = 'sound/effects/sparks2.ogg'

	var/list/hack_access_disallow = list() //What accesses should we disallow us from hacking with this program?
	var/num_products_vend = 8

/datum/spoof_function/vendorhack/can_spoof(var/obj/machinery/vend)
	. = ..()
	if(.)
		return
	if(!istype(vend,/obj/machinery/pointbased_vending) && !istype(vend,/obj/machinery/vending))
		return "Incorrect function target."
	for(var/access in hack_access_disallow)
		if(access in vend.req_access + vend.req_one_access)
			return "Software is configured to exclude this target."

/datum/spoof_function/vendorhack/do_spoof(var/obj/machinery/vend)
	vend.visible_message("<span class = 'warning'>[vend] begins to rapidly spit out products!</span>")
	var/obj/machinery/pointbased_vending/pbVend = vend

	if(istype(pbVend))
		var/list/prodList = pbVend.product_records.Copy()
		for(var/entry in prodList) //Filter out the category markers
			var/datum/stored_items/vending_products/I = entry
			if(!istype(I))
				prodList -= entry
		for(var/i = 1 to num_products_vend)
			var/datum/stored_items/vending_products/I = pick(prodList)
			pbVend.vend_item(I)
			sleep(pbVend.vend_delay + rand(1,3))

	var/obj/machinery/vending/sVend = vend

	if(istype(sVend))
		var/list/prodList = sVend.product_records.Copy()
		for(var/i = 1 to num_products_vend)
			var/datum/stored_items/vending_products/I = pick(prodList)
			var/cache_emag = sVend.emagged
			var/cache_showprd = sVend.show_product_desc_pre_purchase
			sVend.emagged = 1
			sVend.show_product_desc_pre_purchase = 0
			sVend.vend(I)
			sVend.emagged = cache_emag
			sVend.show_product_desc_pre_purchase = cache_showprd
			sleep(sVend.vend_delay + rand(1,3))

//UNSC Vendor Hack.
/datum/spoof_function/vendorhack/unsc
	hack_access_disallow = list(access_unsc,access_spartan,access_unsc_odst,access_unsc_oni,access_unsc_armoury) //What accesses should we disallow us from hacking with this program?

//Covvie Vendor Hack
/datum/spoof_function/vendorhack/cov/can_spoof(var/obj/machinery/pointbased_vending/armory/covenant/vend)
	. = ..()
	if(.)
		return
	if(istype(vend))
		return "Software is configured to exclude this target."

//Light Blackout
/datum/spoof_function/blackout
	function_name = "Light Network Override"
	spoof_delay = 6 SECOND
	cooldown_for = 20 SECOND
	sfx_file = 'sound/effects/EMPulse.ogg'

	var/disable_time = 2 MINUTES

/datum/spoof_function/blackout/can_spoof(var/obj/machinery/light/l)
	. = ..()
	if(.)
		return
	if(!istype(l))
		return "Incorrect function target."

/datum/spoof_function/blackout/do_spoof(var/obj/machinery/light/targL)
	var/area/a = get_area(targL)
	for(var/obj/machinery/light/l in a.contents)
		if(l.status != 0)
			continue//Don't bother with broken lights.
		if(prob(10))
			l.emp_act(2)
		else
			l.burn_out()//Temporary burn-out.
			spawn(disable_time)
				if(l.status == 3)
					l.fix()
		sleep(rand(2,5)) //Let's not do all the lights at once.

//Ewar Spoofer Devices.
/obj/item/device/ewar_spoofer
	name = "Mark-III-E Electronic Warfare Pulser"
	desc = "Utilises a range of electronic warfare techniques to bypass the identification mechanisms of doors."
	icon = 'code/modules/halo/misc/ewar_spoofer.dmi'
	icon_state = "spoofer_unsc_inactive"
	var/active_state = "spoofer_unsc_active"
	//I would like to expand this to more devices in the future. Maybe vendors?

	w_class = ITEM_SIZE_SMALL

	var/cable_type = /obj/item/spoof_cable
	var/obj/item/spoof_cable/stored_cable
	var/datum/spoof_function/active_function
	var/list/spoof_types = list() //types of available functions. Don't refer to this.
	var/list/spoof_functions = list() //Function Name - function datum. Refer to this.

/obj/item/device/ewar_spoofer/Initialize()
	. = ..()
	for(var/type in spoof_types)
		var/datum/spoof_function/f = new type (src)
		spoof_functions["[f.function_name]"] = f

/obj/item/device/ewar_spoofer/proc/get_cable()
	if(!stored_cable)
		stored_cable = new cable_type (null,src)
	return stored_cable

/obj/item/device/ewar_spoofer/proc/change_active_func(var/func_name)
	active_function = spoof_functions[func_name]

/obj/item/device/ewar_spoofer/verb/change_function_verb()
	set name = "Change Spoofer Function"
	set category = "Object"

	var/mob/user = usr
	if(!istype(user))
		return
	select_function(user)

/obj/item/device/ewar_spoofer/proc/select_function(var/mob/user)
	var/choice = input("Change function?","Function Selection") as null|anything in spoof_functions
	if(isnull(choice))
		return
	change_active_func(choice)
	to_chat(user,"<span class = 'notice'>You change the active program of [src] to [choice].</span>")

/obj/item/device/ewar_spoofer/attack_hand(var/mob/user)
	if(user.l_hand == src || user.r_hand == src || loc.loc.loc == user)//Directly, or in a clothes storage pocket.
		to_chat(user,"<span class = 'notice'>You spool out a wire from [src].</span>")
		user.put_in_active_hand(get_cable())
		src.add_fingerprint(user)
		return
	. = ..()

/obj/item/device/ewar_spoofer/attack_self(var/mob/user)
	select_function(user)

/obj/item/device/ewar_spoofer/MouseDrop(var/obj/over_object)
	if (!over_object || !(ishuman(usr) || issmall(usr)))
		return

	if (!(get_turf(src) == get_turf(usr)))
		return

	if (usr.incapacitated())
		return

	if (!usr.drop_from_inventory(src))
		return

	switch(over_object.name)
		if("r_hand")
			usr.put_in_r_hand(src)
		if("l_hand")
			usr.put_in_l_hand(src)
	src.add_fingerprint(usr)

//UNSC Spoofer Subtye
/obj/item/device/ewar_spoofer/unsc
	spoof_types = list(/datum/spoof_function/doorhack,/datum/spoof_function/vendorhack/unsc,/datum/spoof_function/blackout)

//Covvie Spoofer Subtype
/obj/item/device/ewar_spoofer/covenant
	name = "Type-13 Admittance Imparter"

	icon_state = "spoofer_cov_active"
	active_state = "spoofer_cov_active"

	cable_type = /obj/item/spoof_cable/cov

	spoof_types = list(/datum/spoof_function/doorhack,/datum/spoof_function/vendorhack/cov,/datum/spoof_function/blackout)

/obj/item/spoof_cable
	name = "Connector"

	icon = 'code/modules/halo/misc/ewar_spoofer.dmi'
	icon_state = "spoofer_wire_unsc"

	var/obj/item/device/ewar_spoofer/parent

	cloak_disrupt = 0

/obj/item/spoof_cable/New(var/locArg,var/parentArg)
	.=..()
	parent = parentArg
	name = "[parent.name] [name]"

/obj/item/spoof_cable/dropped()
	. = ..()
	loc = null

/obj/item/spoof_cable/resolve_attackby(atom/attacked, mob/user, var/click_params)
	if(parent.active_function)
		to_chat(user,"<span class = 'notice'>You connect [parent] to [attacked].</span>")
		if(parent.active_function.process_spoof_request(attacked,src))
			return
	. = ..()

/obj/item/spoof_cable/attack_self(var/mob/user)
	parent.attack_self(user)

/obj/item/spoof_cable/cov
	icon_state = "spoofer_wire_cov"