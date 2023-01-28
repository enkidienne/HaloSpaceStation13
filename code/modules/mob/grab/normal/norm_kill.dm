/datum/grab/normal/kill
	state_name = NORM_KILL

	downgrab_name = NORM_NECK

	shift = 0

	stop_move = 1
	reverse_facing = 1
	can_absorb = 1
	shield_assailant = 0
	point_blank_mult = 1
	same_tile = 1
	force_danger = 1

	downgrade_on_action = 1
	downgrade_on_move = 1

	icon_state = "kill1"

	break_chance_table = list(5, 20, 40, 80, 100)

/datum/grab/normal/kill/process_effect(var/obj/item/grab/G)
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

	affecting.apply_effect(STUTTER, 5) //It will hamper your voice, being choked and all.
	affecting.Weaken(5)	//Should keep you down unless you get help.
	affecting.losebreath = max(affecting.losebreath + 2, 3)
