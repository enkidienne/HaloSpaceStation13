
#define AUTOLIGHT_LIGHTINIT_CAP 500
#define AUTOLIGHT_LIGHTINIT_SLEEPTIME 10

//Area Overrides//
/area
	var/forced_ambience_vol = 25

//Weather Datums//
/datum/weather
	var/list/weather_icons = list() //Format icon = icon state. We pick one of these on init.
	var/list/weather_sfx = list() //For the main targeted area.
	var/list/weather_sfx_adjacent //List. For areas adjacent to the main targeted area. If not supplied, uses base weather sfx but with lowered volume.
	var/sfx_vol = 100
	var/apply_sfx_adjacent = 0
	var/weather_env = null //What sort of environment should we force usage of on the area? If null, leaves the same.
	var/weather_chance = 100
	var/required_autolight_fail_status = -1 //What does autolight_fail need to be set to for this to be used? -1 means we don't care..
	var/post_status_check_chance = 100 //The weather chance used after we succeed the autolight fail status check.

/datum/weather/proc/picked_effects(var/area/a)


/datum/weather/rain
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "rain1",'code/modules/halo/misc/weather_overlays.dmi' = "rain1_splashlight",'code/modules/halo/misc/weather_overlays.dmi' = "rain2",'code/modules/halo/misc/weather_overlays.dmi' = "rain2_splashlight")
	weather_sfx = list('code/modules/halo/sounds/weather/rain_light.ogg')
	apply_sfx_adjacent = 1

/datum/weather/rain/p25
	weather_chance = 25

/datum/weather/rain/heavy
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "rain1_splash",'code/modules/halo/misc/weather_overlays.dmi' = "rain2_splash")
	weather_sfx = list('code/modules/halo/sounds/weather/rain_heavy.ogg')
	apply_sfx_adjacent = 1

/datum/weather/rain/heavy/p20_night_p40
	weather_chance = 20
	required_autolight_fail_status = 1 //Needs night.
	post_status_check_chance = 40

/datum/weather/windy //Sound Only.
	weather_sfx = list('code/modules/halo/sounds/weather/wind_low.ogg')
	apply_sfx_adjacent = 1

/datum/weather/windy/p20
	weather_chance = 20

/datum/weather/windy/p10
	weather_chance = 10

/datum/weather/windy/heavy
	weather_sfx = list('code/modules/halo/sounds/weather/wind_high.ogg')

/datum/weather/windy/heavy/p40
	weather_chance = 40

/datum/weather/snow
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "snow1",'code/modules/halo/misc/weather_overlays.dmi' = "snow2")
	weather_sfx = list('code/modules/halo/sounds/weather/wind_low.ogg')
	apply_sfx_adjacent = 1

/datum/weather/snow/p45
	weather_chance = 45

/datum/weather/snow/blizzard
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "snow2_obscuring",'code/modules/halo/misc/weather_overlays.dmi' = "snow3_obscuring")
	weather_sfx = list('code/modules/halo/sounds/weather/wind_high.ogg')
	apply_sfx_adjacent = 1

/datum/weather/snow/blizzard/p20
	weather_chance = 20

/datum/weather/sandstorm
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "sandstorm_light")
	weather_sfx = list('code/modules/halo/sounds/weather/wind_low.ogg')
	apply_sfx_adjacent = 1

/datum/weather/sandstorm/p25_night_p10
	weather_chance = 25
	required_autolight_fail_status = 1
	post_status_check_chance = 10

/datum/weather/sandstorm/heavy
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "sandstorm_heavy")
	weather_sfx = list('code/modules/halo/sounds/weather/wind_high.ogg')
	apply_sfx_adjacent = 1

/datum/weather/sandstorm/heavy/day_p40
	weather_chance = 40
	required_autolight_fail_status = 0

/datum/weather/ash
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "light_ash_obscuring")
	weather_sfx = list('code/modules/halo/sounds/weather/wind_low.ogg')
	apply_sfx_adjacent = 1

/datum/weather/ash/p20
	weather_chance = 20

/datum/weather/ash/p60
	weather_chance = 60

//Mostly Adminspawn. Look kinda awful too; codersprites.//
/datum/weather/flood
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "flood_obscuring")
	weather_sfx = list('code/modules/halo/sounds/weather/flood_ambience.ogg')
	weather_chance = 100
	apply_sfx_adjacent = 1

/datum/weather/glassed
	weather_icons = list('code/modules/halo/misc/weather_overlays.dmi' = "light_ash_glassed")
	weather_chance = 100

//Autolight Stuff//
/obj/daylight_mark
	opacity = 0
	mouse_opacity = 0
	invisibility = 61

/obj/daylight_mark/New()
	. = ..()
	set_light(8,8)

/obj/autolight_init
	name = "autolight init"
	desc = "ADMINS: To apply the effects; force-proccall initialise_on_targ . Argument 1 should be an item inside the area you want to apply the effects to. Set the init recursive variable to 1 before doing so to include all child-areas as well."
	var/targ_area = null
	var/init_recursive = 0 //Should we search children of the provided area too?
	var/light_type = /obj/daylight_mark
	var/autolight_chance = 100 //The chance that this autolight actually initialises their lights. For rng night-time.
	var/autolight_fail = 0 //Have we failed autolights?
	var/weathers = list() //Format: weather datums. Order matters, generally try to put low %s first.

/obj/autolight_init/Initialize()
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/autolight_init/proc/init_autolight(var/list/area_search)
	if(autolight_chance == null)//Don't even bother rolling if it's exactly null.
		return
	if(!prob(autolight_chance))
		autolight_fail = 1
	for(var/area/found in area_search)
		if(autolight_fail)
			found.luminosity = 0
			found.dynamic_lighting = 1
		var/ctr = 0
		for(var/turf/create_at in found.contents)
			if(autolight_fail)
				create_at.lighting_build_overlay()
			else
				var/create_light = 0
				for(var/t in trange(1,create_at))
					var/turf/adj_turf = t
					var/area/adj_turf_area = adj_turf.loc
					if(!istype(adj_turf_area,targ_area) && adj_turf_area.dynamic_lighting != 0)
						create_light = 1
					if(locate(light_type) in adj_turf.contents)
						create_light = 0
						break
				if(create_light)
					new light_type (create_at)
					ctr++
					if(ctr >= AUTOLIGHT_LIGHTINIT_CAP)
						ctr = 0
						sleep(AUTOLIGHT_LIGHTINIT_SLEEPTIME)

/obj/autolight_init/proc/init_weather(var/list/area_search)
	var/datum/weather/w_picked
	var/w_icon
	var/w_icon_state
	var/w_sfx
	var/w_sfx_adj
	for(var/type in weathers)
		var/datum/weather/w = new type ()
		var/w_chance = w.weather_chance
		if(w.required_autolight_fail_status != -1)
			if(autolight_fail != w.required_autolight_fail_status)
				if(w.weather_chance == 0) // We failed, AND we don't have a default weather chance. Skip this weather.
					continue
			else
				w_chance = w.post_status_check_chance
		if(prob(w_chance))
			w_picked = w
			if(w.weather_sfx)
				w_sfx = w.weather_sfx
			if(w.weather_sfx_adjacent)
				w_sfx_adj = w.weather_sfx_adjacent
			if(w.weather_icons.len)
				w_icon = pick(w.weather_icons)
				w_icon_state = w.weather_icons[w_icon]
			break
	if(w_picked)
		var/list/contentslist = list()
		for(var/area/found in area_search)
			contentslist += found.contents
			if(w_sfx)
				found.forced_ambience = w_sfx//Fully replace their ambience with ours.
				found.forced_ambience_vol = w_picked.sfx_vol
			if(w_icon && w_icon_state)
				var/image/I = image(icon = w_icon, icon_state = w_icon_state)
				I.layer = ABOVE_PROJECTILE_LAYER
				I.plane = EFFECTS_BELOW_LIGHTING_PLANE
				found.overlays = list(I)
			w_picked.picked_effects(found)

		if(w_picked.apply_sfx_adjacent)
			var/w_sfx_adj_vol = w_picked.sfx_vol
			if(!w_sfx_adj)
				w_sfx_adj = w_sfx
				w_sfx_adj_vol = w_sfx_adj_vol/3
			for(var/turf/t in contentslist)
				for(var/t_2 in trange(1,t))
					var/area/a = get_area(t_2)
					if(!(a in area_search))//If it's not an original area, we'll be applying the lowered volume.
						a.forced_ambience = w_sfx_adj
						a.forced_ambience_vol = w_sfx_adj_vol

/obj/autolight_init/proc/finalise_initialise(var/area/found)
	qdel(src)

/obj/autolight_init/proc/initialise_on_targ(var/atom/targ)
	var/area/a = get_area(targ)
	if(a)
		do_initialise(a)

/obj/autolight_init/proc/do_initialise(var/area/targ)//Added so other things can do all the init stuff via code.
	var/list/area_search = list(targ)
	if(init_recursive)
		var/list/types = typesof(targ.type) - targ.type
		for(var/t in types)
			area_search += locate(t) in world
	init_autolight(area_search)
	init_weather(area_search)
	finalise_initialise(targ)

/obj/autolight_init/LateInitialize()
	if(targ_area)
		var/area/f = locate(targ_area)
		do_initialise(f)

//Some Presets, for admin weather-changing use.//

/obj/autolight_init/dbg_weather
	autolight_chance = null

/obj/autolight_init/dbg_weather/rain
	weathers = list(/datum/weather/rain)

/obj/autolight_init/dbg_weather/rain_heavy
	weathers = list(/datum/weather/rain/heavy)

/obj/autolight_init/dbg_weather/windy
	weathers = list(/datum/weather/windy)

/obj/autolight_init/dbg_weather/snow
	weathers = list(/datum/weather/snow)

/obj/autolight_init/dbg_weather/blizzard
	weathers = list(/datum/weather/snow/blizzard)

/obj/autolight_init/dbg_weather/sandstorm
	weathers = list(/datum/weather/sandstorm)

/obj/autolight_init/dbg_weather/sandstorm_heavy
	weathers = list(/datum/weather/sandstorm/heavy)

/obj/autolight_init/dbg_weather/ash
	weathers = list(/datum/weather/ash)

/obj/autolight_init/dbg_weather/flood
	weathers = list(/datum/weather/flood)

/obj/autolight_init/dbg_weather/glassed
	weathers = list(/datum/weather/glassed)

#undef AUTOLIGHT_LIGHTINIT_CAP
#undef AUTOLIGHT_LIGHTINIT_SLEEPTIME