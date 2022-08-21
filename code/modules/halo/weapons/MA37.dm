
/obj/item/weapon/gun/projectile/ma37_ar
	name = "\improper MA37 Assault Rifle"
	desc = "Also formally known as the MA5. Takes 7.62mm ammo."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "MA37"
	item_state = "ma37"
	caliber = "7.62mm"
	fire_sound = 'code/modules/halo/sounds/MA37_Fire_New.wav'
	//fire_sound_burst = 'code/modules/halo/sounds/MA37_Fire_New.wav'
	reload_sound = 'code/modules/halo/sounds/MA37_Reload_New.wav'
	magazine_type = /obj/item/ammo_magazine/ma37/m118
	allowed_magazines = list(/obj/item/ammo_magazine/ma37/m118)
	load_method = MAGAZINE
	slot_flags = SLOT_BACK

	burst = 4
	burst_delay = 1.6
	one_hand_penalty = -1
	dispersion = list(0.0,0.1,0.2,0.2)
	hud_bullet_row_num = 20

	firemodes = list(\
	list(mode_name="short bursts",  burst=4, dispersion=list(0.0,0.1,0.2,0.2)),
	list(mode_name="extended bursts",  burst=8, dispersion=list(0.0,0.1,0.2,0.2, 0.3, 0.3, 0.4, 0.4))
	)

	ammo_icon_state = null
	attachment_slots = null
	attachments_on_spawn = null

/obj/item/weapon/gun/projectile/ma37_ar/can_use_when_prone()
	return 1

/obj/item/weapon/gun/projectile/ma37_ar/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = "MA37"
	else
		icon_state = "MA37_unloaded"

//Basic Magazine

/obj/item/ammo_magazine/ma37
	name = "MA37 magazine"
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "MA37_mag"
	mag_type = MAGAZINE
	caliber = "7.62mm"
	max_ammo = 32
	multiple_sprites = 1

//M118 Ammunition

/obj/item/ammo_magazine/ma37/m118
	name = "MA37 magazine (7.62mm) M118"
	desc = "7.62x51mm M118 Full Metal Jacket Armour Piercing (FMJ-AP) magazine for the MA37 containing 32 shots."
	ammo_type = /obj/item/ammo_casing/m118

/obj/item/weapon/storage/box/ma37_m118
	name = "box of MA37 7.62mm M118 magazines"
	startswith = list(/obj/item/ammo_magazine/ma37/m118 = 7)

