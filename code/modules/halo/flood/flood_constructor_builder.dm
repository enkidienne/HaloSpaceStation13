

/mob/living/simple_animal/hostile/builder_mob/flood
	name = "Flood Constructor Form"
	desc = "Converts the surroundings into flood-infested terrain."
	icon = 'code/modules/halo/flood/flood_constructor_builder.dmi'
	icon_state = "constructor"
	icon_living = "constructor"
	icon_dead = "constructor_dead"

	attack_sfx = list(\
		'sound/flood/melee.melee1.ogg','sound/flood/melee.melee10.ogg',\
		'sound/flood/melee.melee11.ogg','sound/flood/melee.melee15.ogg',\
		'sound/flood/melee.melee2.ogg','sound/flood/melee.melee20.ogg',\
		'sound/flood/melee.melee5.ogg','sound/flood/melee.melee6.ogg',\
		'sound/flood/melee.melee7.ogg','sound/flood/melee.melee8.ogg',\
		)

	break_stuff_probability = 0
	stop_automated_movement = 0
	wander = 1
	melee_damage_lower = 5
	melee_damage_upper = 10
	min_gas = list()
	max_gas = list()
	death_sounds = list('sound/flood/death.death10.ogg','sound/flood/death.death15.ogg',\
						'sound/flood/death.death2.ogg','sound/flood/death.death20.ogg',\
						'sound/flood/death.death3.ogg','sound/flood/death.death4.ogg',\
						'sound/flood/death.death5.ogg','sound/flood/death.ogg')
	pain_scream_sounds = list('sound/flood/pain.pain1.ogg','sound/flood/pain.pain15.ogg',\
							'sound/flood/pain.pain2.ogg','sound/flood/pain.pain3.ogg',\
							'sound/flood/pain.pain5.ogg','sound/flood/pain.pain6.ogg')
	assault_target_type = /obj/effect/landmark/assault_target/flood
	see_in_dark = 5

	faction = "Flood"

	wall_type_build = /turf/simulated/wall/flood_biomass
	floor_type_build = /turf/simulated/floor/flood_biomass
	door_type_build = /obj/machinery/door/unpowered/simple/flood
	window_type_build = /obj/structure/grille/flood_window


/mob/living/simple_animal/hostile/converter_mob/flood
	name = "Flood Overseer Form"
	desc = "It wanders around, staring intently at the surrounding environment."
	icon = 'code/modules/halo/flood/flood_constructor_builder.dmi'
	icon_state = "designator"
	icon_living = "designator"
	icon_dead = "designator_dead"

	attack_sfx = list(\
		'sound/flood/melee.melee1.ogg','sound/flood/melee.melee10.ogg',\
		'sound/flood/melee.melee11.ogg','sound/flood/melee.melee15.ogg',\
		'sound/flood/melee.melee2.ogg','sound/flood/melee.melee20.ogg',\
		'sound/flood/melee.melee5.ogg','sound/flood/melee.melee6.ogg',\
		'sound/flood/melee.melee7.ogg','sound/flood/melee.melee8.ogg',\
		)

	break_stuff_probability = 0
	stop_automated_movement = 0
	wander = 1
	melee_damage_lower = 5
	melee_damage_upper = 10
	min_gas = list()
	max_gas = list()
	death_sounds = list('sound/flood/death.death10.ogg','sound/flood/death.death15.ogg',\
						'sound/flood/death.death2.ogg','sound/flood/death.death20.ogg',\
						'sound/flood/death.death3.ogg','sound/flood/death.death4.ogg',\
						'sound/flood/death.death5.ogg','sound/flood/death.ogg')
	pain_scream_sounds = list('sound/flood/pain.pain1.ogg','sound/flood/pain.pain15.ogg',\
							'sound/flood/pain.pain2.ogg','sound/flood/pain.pain3.ogg',\
							'sound/flood/pain.pain5.ogg','sound/flood/pain.pain6.ogg')
	assault_target_type = /obj/effect/landmark/assault_target/flood
	see_in_dark = 5

	faction = "Flood"

	ignore_types = list(/turf/simulated/wall/flood_biomass,/turf/simulated/floor/flood_biomass,/obj/machinery/door/unpowered/simple/flood)