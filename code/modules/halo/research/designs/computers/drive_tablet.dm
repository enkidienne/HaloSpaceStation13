
/datum/research_design/drive_micro
	name = "micro hard drive"
	product_type = /obj/item/weapon/computer_hardware/hard_drive/micro
	build_type = IMPRINTER
	required_materials = list("plasteel" = 1, "rglass" = 1, "plastic" = 5)
	required_reagents = list(/datum/reagent/acid/hydrochloric = 10)
	complexity = 15

/datum/research_design/drive_small
	name = "small hard drive"
	product_type = /obj/item/weapon/computer_hardware/hard_drive/small
	build_type = IMPRINTER
	required_materials = list("osmium-carbide plasteel" = 1, "phglass" = 1, "plastic" = 5)
	required_objs = list(/obj/item/crystal)
	required_reagents = list(/datum/reagent/nitric_acid = 10)
	complexity = 25
