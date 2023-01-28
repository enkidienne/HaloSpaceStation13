/datum/grab/normal/neck
	state_name = NORM_NECK

	upgrab_name = NORM_KILL
	downgrab_name = NORM_AGGRESSIVE

	drop_headbutt = 0

	shift = -10


	stop_move = 1
	reverse_facing = 1
	can_absorb = 1
	shield_assailant = 1
	point_blank_mult = 1
	same_tile = 1
	can_throw = 1
	force_danger = 1

	icon_state = "kill"

	break_chance_table = list(3, 18, 45, 100)

/datum/grab/normal/aggressive/process_effect(var/obj/item/grab/G)
	var/mob/living/carbon/human/affecting = G.affecting

	//Drop two-handed guns, or items bigger than large.
	var/obj/item/i = affecting.l_hand
	var/obj/item/weapon/gun/g = affecting.l_hand

	if((istype(g) && g.one_hand_penalty == -1) || (istype(i) && i.w_class >= ITEM_SIZE_LARGE ))
		affecting.drop_l_hand()
	i = affecting.r_hand
	g = affecting.r_hand
	if((istype(g) && g.one_hand_penalty == -1) || (istype(i) && i.w_class >= ITEM_SIZE_LARGE ))
		affecting.drop_r_hand()

	if(affecting.lying)
		affecting.Weaken(4)

	affecting.adjustOxyLoss(1)
