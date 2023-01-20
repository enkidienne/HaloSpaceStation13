/obj/effect/overmap/sector/glassed_planet
	name = "Unknown Glassed Planet"
	icon = 'sector_icon.dmi'
	icon_state = "ice"

	faction = "Human Civilian"
	base = 1
	block_slipspace = 1

	map_bounds = list(1,150,150,1) //Format: (TOP_LEFT_X,TOP_LEFT_Y,BOTTOM_RIGHT_X,BOTTOM_RIGHT_Y)

	overmap_spawn_near_me = list()
	overmap_spawn_in_me = list()

	parent_area_type = /area/glassed_planet

	occupy_range = 28

