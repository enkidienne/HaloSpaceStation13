
#define CLOAKING_COLOUR "#808080"
#define COLOUR_DARKEN_MOD 0.75

/datum/armourspecials/cloaking
	var/cloak_active = 0
	var/min_alpha = 45 //The minimum level of alpha to reach.
	var/cloak_recover_time = 1.5 //The time in seconds it takes to recover to full cloak after being hit.
	var/cloak_toggle_time = 2 //The time in seconds it takes to enable/disable the cloaking device.
	var/cloak_disrupted = 0 //Is the cloak currently disrupted?
	var/stored_blend_mode
	var/stored_colour
	var/stored_alpha

/datum/armourspecials/cloaking/proc/activate_cloak(var/voluntary = 1)
	stored_blend_mode = user.blend_mode
	stored_colour = user.color
	stored_alpha = user.alpha
	src.cloak_active = 1
	user.blend_mode = BLEND_ADD
	user.appearance_flags |= KEEP_TOGETHER
	if(user.mouse_opacity != 0)
		user.mouse_opacity = 0
	//let's get a colour similar to the terrain we're on, so we blend in a bit better.

	var/turf/userturf = get_turf(user)
	var/icon/i = icon(userturf.icon,userturf.icon_state)
	var/turf_colour = i.GetPixel(rand(1,i.Width()),rand(1,i.Height()))
	if(!turf_colour)
		turf_colour = CLOAKING_COLOUR
	else
		var/list/colour_list = rgb2num(turf_colour)
		//Make sure we're darkened.
		turf_colour = rgb(colour_list[1]*COLOUR_DARKEN_MOD,g=colour_list[2]*COLOUR_DARKEN_MOD,b=colour_list[3]*COLOUR_DARKEN_MOD)
	animate(user,alpha = min_alpha, color = turf_colour, time = (cloak_toggle_time SECONDS))
	if(cloak_disrupted)//This stops spam from cloak disruption, but still applies the affects.
		return
	if(voluntary)
		user.visible_message("<span class = 'warning'>[user] activates their active camoflage</span>")
	else
		to_chat(user,"<span class = 'danger'>Your active camoflage recovers!</span>")
		user.visible_message("<span class = 'warning'>[user]'s active camoflage lets out a soft ping and [user] starts to fade.</span>")

/datum/armourspecials/cloaking/proc/deactivate_cloak(var/voluntary = 1)
	src.cloak_active = 0
	user.blend_mode = stored_blend_mode
	user.appearance_flags &= KEEP_TOGETHER
	user.mouse_opacity = 1
	animate(user,color = stored_colour, alpha = stored_alpha, time = (cloak_toggle_time SECONDS))
	if(cloak_disrupted)//This stops spam from cloak disruption, but still applies the affects.
		return
	if(voluntary)
		user.visible_message("<span class = 'warning'>[user] deactivates their active camoflage</span>")
	else
		to_chat(user,"<span class = 'danger'>Your active camoflage fails!</span>")
		user.visible_message("<span class = 'warning'>[user]'s active camoflage sputters and fails!</span>")

/datum/armourspecials/cloaking/proc/disrupt_cloak(var/disrupt_time = cloak_recover_time)
	if(!src.cloak_active)
		return
	src.cloak_disrupted = 1
	deactivate_cloak(0)
	spawn(disrupt_time SECONDS)
		src.cloak_disrupted = 0
		activate_cloak(0)

/datum/armourspecials/cloaking/try_item_action()
	if(!cloak_active)
		if(cloak_disrupted)
			to_chat(user,"<span class = 'warning'>You can't re-enable your cloak whilst it's being disrupted.</span>")
			return
		activate_cloak()
	else
		deactivate_cloak()

/datum/armourspecials/cloaking/handle_shield(mob/m,damage,atom/damage_source)
	disrupt_cloak()
	return 0

/datum/armourspecials/cloaking/tryemp(severity)
	switch(severity)
		if(1)
			disrupt_cloak(cloak_recover_time*3)
		if(2)
			disrupt_cloak(cloak_recover_time*6)

/datum/armourspecials/cloaking/cov_specops
	min_alpha = 45
	cloak_recover_time = 1.5
	cloak_toggle_time = 2

//Overall, SPI is a little bit worse than covenant cloak, but the unsc can produce more through research
/datum/armourspecials/cloaking/human_spi
	min_alpha = 50
	cloak_recover_time = 5
	cloak_toggle_time = 3

/datum/armourspecials/cloaking/silentshadow
	min_alpha=1 ///These are meant to be 100% admin-spawn kill-squads, so... have fun
	cloak_recover_time = 2
	cloak_toggle_time = 0.5

#undef CLOAKING_COLOUR
#undef COLOUR_DARKEN_MOD