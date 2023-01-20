/decl/hierarchy/supply_pack/oni_special
	name = "ONI Restricted Goods"
	faction_lock = "ONI"
	containertype = /obj/structure/closet/crate/secure/weapon

/* FUN STUFF. Keep expensive as it can really change the game probably idk */

/decl/hierarchy/supply_pack/oni_special/floodtox
	name = "Contagious Biological Sample"
	contains = list(/obj/item/weapon/reagent_containers/glass/bottle/floodtox = 1)
	cost = 10000
	containername = "\improper Biological Sample crate"

/* MATERIALS - Expensive so that ONI hopefully doesn't powergame research. Not all items included, just in case they somehow do. */

/decl/hierarchy/supply_pack/oni_special/plasma_core
	name = "Plasma Core (1)"
	contains = list(/obj/item/plasma_core = 1)
	cost = 700
	containername = "\improper Plasma Core crate"

/decl/hierarchy/supply_pack/oni_special/nanolaminate
	name = "Nanolaminate (10 sheets)"
	contains = list(/obj/item/stack/material/nanolaminate/ten = 1)
	cost = 500
	containername = "\improper Plasma Core crate"

/decl/hierarchy/supply_pack/oni_special/pinkcrystal
	name = "Pink Crystal (1)"
	contains = list(/obj/item/crystal/pink = 1)
	cost = 550
	containername = "\improper Crystal crate"

/decl/hierarchy/supply_pack/oni_special/greencrystal
	name = "Green Crystal (1)"
	contains = list(/obj/item/crystal = 1)
	cost = 550
	containername = "\improper Crystal crate"

/decl/hierarchy/supply_pack/oni_special/orange
	name = "Orange Crystal (1)"
	contains = list(/obj/item/crystal/orange = 1)
	cost = 550
	containername = "\improper Crystal crate"

/* Expensive Covvie weapons. No ammo included besides whatever's in the magazine. */

/decl/hierarchy/supply_pack/oni_special/plasma_rifle
	name = "Type-25 Plasma Rifle (1)"
	contains = list(/obj/item/weapon/gun/energy/plasmarifle = 1)
	cost = 1500
	containername = "\improper Plasma Rifle crate"

/decl/hierarchy/supply_pack/oni_special/needler
	name = "Type-33 Needler (1)"
	contains = list(/obj/item/weapon/gun/projectile/needler = 1)
	cost = 1500
	containername = "\improper Needler crate"

/decl/hierarchy/supply_pack/oni_special/carbine
	name = "Type-51 Carbine (1)"
	contains = list(/obj/item/weapon/gun/projectile/type51carbine = 1)
	cost = 1500
	containername = "\improper Carbine crate"