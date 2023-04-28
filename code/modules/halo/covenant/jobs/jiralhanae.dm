
/datum/job/covenant/brute_chieftain
	title = "Jiralhanae Chieftain"
	department_flag = COM
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/jiralhanae/covenant/chieftain
	faction_whitelist = "Covenant"
	whitelisted_species = list(/datum/species/brutes)
	access = list(access_covenant, access_covenant_command, access_covenant_slipspace, access_covenant_cargo)
	pop_balance_mult = 2.5

	radio_speech_size = RADIO_SPEECH_COMMANDER

/datum/job/covenant/brute_captain
	title = "Jiralhanae Captain"
	department_flag = COM
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/jiralhanae/covenant/captain
	faction_whitelist = "Covenant"
	whitelisted_species = list(/datum/species/brutes)
	access = list(access_covenant, access_covenant_command, access_covenant_slipspace, access_covenant_cargo)
	pop_balance_mult = 2

	radio_speech_size = RADIO_SPEECH_LEADER

/datum/job/covenant/brute_major
	title = "Jiralhanae Major"
	total_positions = 2
	spawn_positions = 2
	open_slot_on_death = 1
	outfit_type = /decl/hierarchy/outfit/jiralhanae/covenant/major
	faction_whitelist = "Covenant"
	whitelisted_species = list(/datum/species/brutes)
	access = list(access_covenant, access_covenant_command, access_covenant_slipspace, access_covenant_cargo)
	pop_balance_mult = 2

	radio_speech_size = RADIO_SPEECH_LEADER

/datum/job/covenant/brute_minor
	title = "Jiralhanae Minor"
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/jiralhanae/covenant/minor
	faction_whitelist = null //Let's see how it goes with these open.
	whitelisted_species = list(/datum/species/brutes)
	open_slot_on_death = 1 //Lowest rank of a leader caste can respawn indefinitely although still capped low
	pop_balance_mult = 2
	access = list(access_covenant, access_covenant_cargo)

	radio_speech_size = RADIO_SPEECH_SPECIALIST