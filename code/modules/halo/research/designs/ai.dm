
/datum/research_design/paicard
	name = "'pAI', personal artificial intelligence device"
	required_materials = list("glass" = 5, "steel" = 5)
	build_type = PROTOLATHE
	product_type = /obj/item/device/paicard

/datum/research_design/dumb_ai
	name = "Dumb AI Chip"
	product_type = /obj/item/dumb_ai_chip
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "glass" = 5, "gold" = 5)
	required_reagents = list(/datum/reagent/mercury = 10)
	complexity = 15

/datum/research_design/intelicard
	name = "intelicard"
	product_type = /obj/item/weapon/aicard
	build_type = PROTOLATHE
	required_materials = list("steel" = 10, "glass" = 5, "gold" = 5)
	required_reagents = list(/datum/reagent/mercury = 10, /datum/reagent/acid/hydrochloric = 15)
	complexity = 30
/*
/datum/research_design/ai_core
	name = "Smart AI Core"
	//product_type = /obj/item/dumb_ai_chip
	build_type = PROTOLATHE
	required_materials = list("osmium-carbide plasteel" = 10, "phglass" = 50, "duridium" = 5, "diamond" = 1)
	required_reagents = list(/datum/reagent/mercury = 10, /datum/reagent/acid/polyacid = 15)
	complexity = 100
*/