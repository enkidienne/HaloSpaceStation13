


/* CAPACITORS */

/datum/research_design/basic_capacitor
	name = "basic capacitor"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5)
	product_type = /obj/item/weapon/stock_parts/capacitor

/datum/research_design/adv_capacitor
	name = "advanced capacitor"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5, "glass" = 5)
	product_type = /obj/item/weapon/stock_parts/capacitor/adv

/datum/research_design/super_capacitor
	name = "super capacitor"
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "glass" = 5)
	required_reagents = list(/datum/reagent/lithium = 10)
	product_type = /obj/item/weapon/stock_parts/capacitor/super



/* MANIPULATORS */

/datum/research_design/micro_mani
	name = "micro manipulator"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5)
	product_type = /obj/item/weapon/stock_parts/manipulator

/datum/research_design/nano_mani
	name = "nano manipulator"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5, "plasteel" = 5)
	product_type = /obj/item/weapon/stock_parts/manipulator/nano

/datum/research_design/pico_mani
	name = "pico manipulator"
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "diamond" = 5)
	product_type = /obj/item/weapon/stock_parts/manipulator/pico



/* MATTER BINS */

/datum/research_design/basic_matter_bin
	name = "basic matter bin"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5)
	product_type = /obj/item/weapon/stock_parts/matter_bin

/datum/research_design/adv_matter_bin
	name = "advanced matter bin"
	build_type = PROTOLATHE
	required_materials = list("plasteel" = 5, "steel" = 5)
	product_type = /obj/item/weapon/stock_parts/matter_bin/adv

/datum/research_design/super_matter_bin
	name = "super matter bin"
	build_type = PROTOLATHE
	required_materials = list("plasteel" = 5, "steel" = 10)
	required_reagents = list(/datum/reagent/mercury = 10)
	product_type = /obj/item/weapon/stock_parts/matter_bin/super



/* LASERS */

/datum/research_design/basic_micro_laser
	name = "basic micro laser"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5, "glass" = 5)
	product_type = /obj/item/weapon/stock_parts/micro_laser

/datum/research_design/high_micro_laser
	name = "high micro laser"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5, "glass" = 5)
	required_reagents = list(/datum/reagent/silicate = 10)
	product_type = /obj/item/weapon/stock_parts/micro_laser/high

/datum/research_design/ultra_micro_laser
	name = "ultra micro laser"
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "glass" = 5)
	required_reagents = list(/datum/reagent/silicate = 10)
	required_objs = list(/obj/item/crystal/pink)
	product_type = /obj/item/weapon/stock_parts/micro_laser/ultra



/* SENSORS */

/datum/research_design/basic_sensor
	name = "basic sensor"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5, "glass" = 5)
	product_type = /obj/item/weapon/stock_parts/scanning_module

/datum/research_design/adv_sensor
	name = "advanced sensor"
	build_type = PROTOLATHE
	required_materials = list("steel" = 5, "glass" = 5)
	required_reagents = list(/datum/reagent/radium = 10)
	product_type = /obj/item/weapon/stock_parts/scanning_module/adv

/datum/research_design/phasic_sensor
	name = "phasic sensor"
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "glass" = 5)
	required_reagents = list(/datum/reagent/radium = 10)
	required_objs = list(/obj/item/crystal/orange)
	product_type = /obj/item/weapon/stock_parts/scanning_module/phasic
