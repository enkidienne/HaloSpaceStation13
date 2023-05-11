/decl/hierarchy/supply_pack/covenant_holy_weapons
	name = "Covenant Holy Weapons"
	faction_lock = "Covenant"
	containertype = /obj/structure/closet/crate/covenant

/* FIREARMS */

/decl/hierarchy/supply_pack/covenant_holy_weapons/boltshot
	name = "Holy Boltshot"
	contains = list(/obj/item/weapon/gun/projectile/boltshot = 1,
					/obj/item/ammo_magazine/boltshot = 3)
	cost = 500
	containername = "\improper Holy Boltshot crate"

/decl/hierarchy/supply_pack/covenant_holy_weapons/suppressor
	name = "Blessed Suppressor"
	contains = list(/obj/item/weapon/gun/projectile/suppressor = 1,
					/obj/item/ammo_magazine/suppressor = 3)
	cost = 700
	containername = "\improper Blessed Suppressor crate"

/decl/hierarchy/supply_pack/covenant_holy_weapons/binaryrifle
	name = "Sanctified Binary Rifle"
	contains = list(/obj/item/weapon/gun/projectile/binary_rifle = 1,
					/obj/item/ammo_magazine/binaryrifle = 3)
	cost = 800
	containername = "\improper Sanctified Binary Rifle crate"

/* AMMO */

/decl/hierarchy/supply_pack/covenant_holy_weapons/boltshotammo
	name = "Holy Boltshot Ammo"
	contains = list(/obj/item/ammo_magazine/boltshot = 3)
	cost = 100
	containername = "\improper Holy Boltshot Ammo crate"

/decl/hierarchy/supply_pack/covenant_holy_weapons/suppressorammo
	name = "Blessed Suppressor Ammo"
	contains = list(/obj/item/ammo_magazine/suppressor = 3)
	cost = 100
	containername = "\improper Blessed Suppressor Ammo crate"

/decl/hierarchy/supply_pack/covenant_holy_weapons/binaryrifleammo
	name = "Sanctified Binary Rifle Ammo"
	contains = list(/obj/item/ammo_magazine/binaryrifle = 3)
	cost = 100
	containername = "\improper Sanctified Binary Rifle Ammo crate"