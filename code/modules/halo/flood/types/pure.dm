
/mob/living/simple_animal/hostile/flood/combat_form/juggernaut
	name = "Flood Juggernanut"
	icon = 'code/modules/halo/flood/floodjuggernaut.dmi'
	icon_state = "movement state"
	icon_living = "movement state"
	icon_dead = "death state"
	move_to_delay = 15
	health = 500 //Combat forms need to be hardier.
	maxHealth = 500
	melee_damage_lower = 40
	melee_damage_upper = 55
	attacktext = "Whips"
	mob_size = MOB_LARGE
	resistance = 20
	bound_width = 64    //96 original value. Size causes it to get stuck easily
	bound_height = 64   //96

/mob/living/simple_animal/hostile/flood/combat_form/santa
	name = "A Christmas.. Abomination"
	desc = "A corruption of the christmas spirit, given human form. Dear God..."
	icon = 'code/modules/halo/flood/santaflood.dmi'
	icon_state = "normal"
	icon_living = "normal"
	icon_dead = "dead"
	bound_width = 32
	bound_height = 32
