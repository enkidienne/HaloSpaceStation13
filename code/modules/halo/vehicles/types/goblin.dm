
/obj/vehicles/goblin
	name = "Goblin"
	desc = "An advanced, bipedal walker, piloted by a single Unggoy. Carries heavy ordnance."

	icon = 'code/modules/halo/vehicles/types/goblin_vehicle.dmi'
	icon_state = "goblin"
	anchored = 1

	bound_height = 32
	bound_width = 32
	pixel_x = -16

	comp_prof = /datum/component_profile/goblin

	ammo_containers = newlist(/obj/item/ammo_magazine/goblin_mg,/obj/item/ammo_magazine/goblin_shotgun,/obj/item/ammo_magazine/goblin_bombs)
	melee_type = /obj/item/weapon/hrunting_melee/goblin

	occupants = list(0,0)
	exposed_positions = list()

	vehicle_size = ITEM_SIZE_VEHICLE
	capacity_flag = ITEM_SIZE_NORMAL

	move_sound = 'sound/mecha/mechmove01.ogg'

	light_color = "#E1FDFF"

	can_smoke = 1
	smoke_ammo = 2
	smoke_ammo_max = 2
	smoke_step_dist = 2

	acceleration = 2
	drag = 2
	min_speed = 8
	max_speed = 6

/obj/vehicles/goblin/on_death()
	. = ..()
	guns_disabled = 0

/obj/item/vehicle_component/health_manager/goblin
	integrity = 500
	resistances = list("bullet"=65,"energy"=65,"emp"=25,"bomb"=45)
	repair_materials = list("plasteel")

/datum/component_profile/goblin
	pos_to_check = "driver"
	gunner_weapons = list(/obj/item/weapon/gun/vehicle_turret/switchable/goblin_mg)
	vital_components = newlist(/obj/item/vehicle_component/health_manager/goblin)


/obj/item/weapon/gun/vehicle_turret/switchable/goblin_mg
	name = "Goblin Heavy Needler"
	desc = "A fast-firing, arm mounted gatling gun."

	fire_delay = 12
	fire_sound = 'code/modules/halo/sounds/goblin_cannon.ogg'

	burst = 10
	burst_delay = 1.5

	guns_switchto = newlist(/datum/vehicle_gun/goblin_machinegun,/datum/vehicle_gun/goblin_shotgun,/datum/vehicle_gun/goblin_bombs)
	magazine_type = /obj/item/ammo_magazine/goblin_mg

/datum/vehicle_gun/goblin_machinegun
	name = "Goblin Heavy Needler"
	desc = "A large-caliber needle-launcher with minimal tracking, and a medium rate of fire."
	burst_size = 10
	burst_delay = 1.5
	dispersion = list(0.4)
	fire_delay = 12
	fire_sound = 'code/modules/halo/sounds/goblin_cannon.ogg'
	mag_used = /obj/item/ammo_magazine/goblin_mg

/datum/vehicle_gun/goblin_shotgun
	name = "Goblin Shotgun"
	desc = "Fires a cloud of blamite shrapnel. Incredibly short ranged."
	burst_size = 3
	burst_delay = 1
	dispersion = list(0.4)
	fire_delay = 9
	fire_sound = 'code/modules/halo/sounds/goblin_shotgun.ogg'
	mag_used = /obj/item/ammo_magazine/goblin_shotgun

/datum/vehicle_gun/goblin_bombs
	name = "Goblin Plasma Bombs"
	desc = "A 20-round storage of plasma bombs."
	burst_size = 2
	burst_delay = 1
	dispersion = list(0)
	fire_delay = 25
	fire_sound = 'code/modules/halo/sounds/plasma_torpedoes_fire.ogg'
	mag_used = /obj/item/ammo_magazine/goblin_bombs

/obj/item/ammo_magazine/goblin_mg
	name = "Internal Needler Ammunition Storage"
	caliber = "needleheavy"
	max_ammo = 300
	ammo_type = /obj/item/ammo_casing/needles/heavy_goblin

/obj/item/ammo_casing/needles/heavy_goblin
	name = "Heavy needle"
	desc = "A large crystalline needle"
	caliber = "needleheavy"
	projectile_type = /obj/item/projectile/bullet/covenant/needles/heavy_goblin

/obj/item/projectile/bullet/covenant/needles/heavy_goblin
	name = "Heavy needle"
	damage = 35
	armor_penetration = 40
	shield_damage = 30
	max_track_steps = 1
	shards_to_explode = 12
	shrapnel_damage = 15

/obj/item/ammo_magazine/goblin_shotgun
	name = "Internal Needle Shard Storage"
	caliber = "needleshot"
	max_ammo = 100
	ammo_type = /obj/item/ammo_casing/shotgun/pellet/goblin

/obj/item/ammo_casing/shotgun/pellet/goblin
	desc = "A blamite shrapnel shot"
	caliber = "needleshot"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun/blamite

/obj/item/projectile/bullet/pellet/shotgun/blamite
	name = "blamite shrapnel"
	fire_sound = 'code/modules/halo/sounds/goblin_shotgun.ogg'

/obj/item/ammo_magazine/goblin_bombs
	name = "Internal Plasma Bomb Rack"
	caliber = "plasbomb"
	max_ammo = 20
	ammo_type = /obj/item/ammo_casing/spnkr

/obj/item/weapon/hrunting_melee/goblin
	name = "\the Goblin fist"
	desc = "punch"

/obj/item/weapon/hrunting_melee/goblin/resolve_attackby(atom/movable/a, mob/user, var/click_params)
	var/mob/living/m = a
	var/obj/vehicles/v = a
	var/do_knockback = 0
	if(istype(v))
		do_knockback = 3
	if(istype(m))
		do_knockback = 8
	if(do_knockback)
		var/turf/t = get_turf(user)
		var/throw_dir = get_dir(t, m)
		var/turf/targ = t
		for(var/i = 0 to do_knockback)
			var/turf/targ_temp = get_step(targ,throw_dir)
			if(targ_temp.density == 1)
				break
			targ = targ_temp
		a.throw_at(targ, do_knockback, 1, user)
	. = ..()