
/decl/emote/audible/species_sound/wort
	key = "wort"
	emote_message_3p = "USER worts, three times!"
	species_sounds = list(/datum/species/sangheili = 'code/modules/halo/sounds/worting.ogg')

/decl/emote/audible/species_sound/wort/do_extra(var/atom/user, var/atom/target)
	var/oldref = species_sounds[/datum/species/sangheili]
	if(prob(33))
		species_sounds[/datum/species/sangheili] = 'code/modules/halo/sounds/wohrby.ogg'
	. = ..()
	species_sounds[/datum/species/sangheili] = oldref

/decl/emote/audible/species_sound/aim
	key = "aim"
	emote_message_3p = "USER taunts their opponent's skill!"
	species_sounds = list(/datum/species/sangheili = 'code/modules/halo/sounds/licensed/cannot_aim.ogg')

/decl/emote/audible/species_sound/nipple
	key = "nipple"
	emote_message_3p = "USER exclaims their thirst!"
	species_sounds = list(/datum/species/unggoy = 'code/modules/halo/sounds/licensed/nipple.ogg')

/decl/emote/audible/species_sound/need_weapon
	key = "weapon"
	emote_message_3p = "USER exclaims their need for a weapon!"
	species_sounds = list(/datum/species/spartan = 'code/modules/halo/sounds/need_weapon.ogg')

/decl/emote/audible/species_sound/boo
	key = "boo"
	emote_message_3p = "USER attempts to terrify the enemy!"
	species_sounds = list(/datum/species/spartan = 'code/modules/halo/sounds/licensed/boo.ogg')

/decl/emote/audible/species_sound/berserk
	key = "berserk"
	emote_message_3p = "USER erupts into a rage!"
	species_sounds = list(
		/datum/species/sangheili = 'code/modules/halo/sounds/licensed/berserk/elite_berserk1.ogg',
		/datum/species/brutes = 'code/modules/halo/sounds/licensed/berserk/brute_berserk1.ogg')

/decl/emote/audible/species_sound/forerunner
	key = "forerunner"
	emote_message_3p = "USER raises their arms in reverence!"
	species_sounds = list(
		/datum/species/brutes = 'code/modules/halo/sounds/licensed/forerunner/brute_forerunner.ogg',
		/datum/species/sangheili = 'code/modules/halo/sounds/licensed/forerunner/elite_forerunner.ogg',
		/datum/species/unggoy =	'code/modules/halo/sounds/licensed/forerunner/grunt_forerunner.ogg',
		/datum/species/kig_yar = 'code/modules/halo/sounds/licensed/forerunner/jackal_forerunner.ogg',
		/datum/species/kig_yar_skirmisher = 'code/modules/halo/sounds/licensed/forerunner/skirmisher_forerunner.ogg',
		/datum/species/yanmee = 'code/modules/halo/sounds/licensed/forerunner/bugger_forerunner.ogg',
		/datum/species/sanshyuum = 'code/modules/halo/sounds/licensed/forerunner/prophet_forerunner.ogg')

/decl/emote/audible/species_sound/covenant
	key = "covenant"
	emote_message_3p = "USER proudly raises their fist!"
	species_sounds = list(
		/datum/species/brutes = 'code/modules/halo/sounds/licensed/covenant/brute_covenant.ogg',
		/datum/species/sangheili = 'code/modules/halo/sounds/licensed/covenant/elite_covenant.ogg',
		/datum/species/unggoy = 'code/modules/halo/sounds/licensed/covenant/grunt_covenant.ogg',
		/datum/species/kig_yar = 'code/modules/halo/sounds/licensed/covenant/jackal_covenant.ogg',
		/datum/species/kig_yar_skirmisher = 'code/modules/halo/sounds/licensed/covenant/skirmisher_covenant.ogg',
		/datum/species/yanmee = 'code/modules/halo/sounds/licensed/covenant/bugger_covenant.ogg',
		/datum/species/sanshyuum = 'code/modules/halo/sounds/licensed/covenant/prophet_covenant.ogg')

/decl/emote/audible/species_sound/taunt
	key = "taunt"
	emote_message_3p = "USER taunts their opponent!"
	species_sounds = list(
		/datum/species/brutes = 'code/modules/halo/sounds/licensed/taunt/brute_taunt1.ogg',
		/datum/species/sangheili = 'code/modules/halo/sounds/licensed/taunt/elite_taunt1.ogg',
		/datum/species/unggoy = 'code/modules/halo/sounds/licensed/taunt/grunt_taunt1.ogg',
		/datum/species/kig_yar = 'code/modules/halo/sounds/licensed/taunt/jackal_taunt1.ogg',
		/datum/species/kig_yar_skirmisher = 'code/modules/halo/sounds/licensed/taunt/skirmisher_taunt1.ogg',
		/datum/species/yanmee = 'code/modules/halo/sounds/licensed/taunt/bugger_taunt1.ogg',
		/datum/species/sanshyuum = 'code/modules/halo/sounds/licensed/taunt/prophet_taunt1.ogg')

/decl/emote/audible/species_sound/warcry
	key = "warcry"
	emote_message_3p = "USER emits a bellowing roar"
	species_sounds = list(
		/datum/species/brutes = 'code/modules/halo/sounds/licensed/warcry/brute_warcry.ogg')

/decl/emote/audible/species_sound/panic
	key = "panic"
	emote_message_3p = "USER fails its arms around in panic!"
	species_sounds = list(
		/datum/species/unggoy = 'code/modules/halo/sounds/licensed/panic/grunt_panic.ogg')

decl/emote/audible/species_sound/chitter
	key = "chitter"
	emote_message_3p = "USER reverberates a sound through its exoskeleton"
	species_sounds = list(
		/datum/species/yanmee = 'code/modules/halo/sounds/licensed/chitter/bugger_chitter.ogg')

/decl/emote/audible/synth/chirrup1
	key = "chirrup1"
	emote_message_3p = "USER emits a gaseous chirrup."
	emote_sound = 'code/modules/halo/sounds/licensed/chirrup/engineer_chirrup1.ogg'

/decl/emote/audible/synth/chirrup2
	key = "chirrup2"
	emote_message_3p = "USER emits a gaseous chirrup."
	emote_sound = 'code/modules/halo/sounds/licensed/chirrup/engineer_chirrup2.ogg'

/decl/emote/audible/synth/chirrup3
	key = "chirrup3"
	emote_message_3p = "USER emits a gaseous chirrup."
	emote_sound = 'code/modules/halo/sounds/licensed/chirrup/engineer_chirrup3.ogg'

/decl/emote/audible/synth/chirrup4
	key = "chirrup4"
	emote_message_3p = "USER emits a gaseous chirrup."
	emote_sound = 'code/modules/halo/sounds/licensed/chirrup/engineer_chirrup4.ogg'


/decl/emote/audible/painscream
	key = "painscream"
	emote_message_3p = "USER screams in pain!"

/decl/emote/audible/painscream/do_extra(var/atom/user, var/atom/target)
	var/mob/living/carbon/human/h = user
	if(!istype(h))
		return
	if(h.stat != CONSCIOUS)
		return
	if(world.time < h.next_scream_at)
		return
	var/datum/species/s = h.species
	if(isnull(s) || s.pain_scream_sounds.len == 0)
		return
	var/scream_sound
	if(s.scream_sounds_female.len > 0 && h.gender == FEMALE)
		scream_sound = pick(s.scream_sounds_female)
	else
		scream_sound = pick(s.pain_scream_sounds)

	playsound(user.loc, scream_sound,50,0,7)
	h.next_scream_at = world.time + SCREAM_COOLDOWN
	return

/decl/emote/audible/painscream/do_emote(var/mob/living/user, var/extra_params)
	if(istype(user))
		if(world.time < user.next_scream_at)
			return
	return ..()

/decl/emote/audible/gasp/do_emote(var/mob/living/user, var/extra_params)
	if(istype(user))
		if(world.time < user.next_scream_at)
			return
	return ..()