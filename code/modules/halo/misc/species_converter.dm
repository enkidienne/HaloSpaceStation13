
/obj/item/species_convert
	name = "Species Converter"

	icon = 'icons/obj/syringe.dmi'
	icon_state = "10"

	var/convert_to = "Human"

/obj/item/species_convert/proc/can_convert(var/mob/living/carbon/human/h)
	return 1

/obj/item/species_convert/proc/do_convert(var/mob/living/carbon/human/h)
	if(!istype(h))
		return
	h.set_species(convert_to)

/obj/item/species_convert/resolve_attackby(atom/A, mob/user, var/click_params)
	if(istype(A,/mob/living/carbon/human/) && can_convert(A))
		to_chat(user,"<span class = 'notice'>You apply [src] to [A].</span>")
		do_convert(A)
		qdel(src)
	else
		. = ..()
