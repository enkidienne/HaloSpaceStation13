//These are for admin use//

/obj/item/lace_injector
	name = "Lace Injector"
	desc = "Injects accesses into a neural lace. To use, hold it against the back of your head and press down gently. Self-administration recommended."
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "mmi_empty"
	var/list/access_add = list()

/obj/item/lace_injector/attack(mob/living/M, mob/living/carbon/human/h, var/target_zone)
	if(!istype(h))
		return

	h.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	h.do_attack_animation(M)

	var/obj/item/organ/internal/stack/lace = h.GetLace()

	if(!lace)
		lace = h.create_stack(access_add)
	else
		lace.access |= access_add
	h.drop_from_inventory(src)
	qdel(src)

/obj/item/lace_injector/marine
	name = "Lace Injector (MARINE)"
	access_add = list(access_unsc,access_unsc_armoury,access_unsc_marine,access_unsc_cargo,access_unsc_specialist)

/obj/item/lace_injector/marine_spec
	name = "Lace Injector (ODST)"
	access_add = list(access_unsc,access_unsc_armoury,access_unsc_marine,access_unsc_odst,access_unsc_specialist,access_unsc_cargo)

/obj/item/lace_injector/odst
	name = "Lace Injector (OFFICER)"
	access_add = list(access_unsc,access_unsc_armoury,access_unsc_marine,access_unsc_odst,access_unsc_specialist,access_unsc_cargo,access_unsc_supplies,access_unsc_officers,access_unsc_bridge,access_unsc_oni)

/obj/item/lace_injector/allaccess //For adminuse and debug purposes.
	name = "Lace Injector (ALL-ACCESS)"
	access_add = list(access_unsc,access_unsc_bridge,access_unsc_tech,access_unsc_crew,access_unsc_navsec,access_unsc_ops,access_unsc_fighters,access_unsc_shuttles,access_unsc_medical,access_unsc_armoury,access_unsc_supplies,access_unsc_officers,access_unsc_marine,access_unsc_gunnery,access_unsc_ids,access_unsc_odst,access_unsc_specialist,access_unsc_cargo,access_unsc_oni)