#define GARRISON_CROWN_COLOR "#E0E0E0"

/obj/item/clothing/head/roguetown/crown/silvercrown
	name = "Crown of the Silver Blood"
	article = "the"
	desc = "The Drachenfend ancestral crown was forged from molten silver fallen from the heavens, on the day the first Drachenfend stood upon the shore as the Allfather battled demons. Consecrated within the Monastery of Saint Elric, it is said their blood became silver, and the weight of their power is a sacred duty, bound by both heaven and destiny."
	icon = 'modular_azurepeak/icons/rake/clothing/silvercrown.dmi'
	mob_overlay_icon = 'modular_azurepeak/icons/rake/clothing/onmob/silvercrown.dmi'
	icon_state = "drachcrown"
	item_state = "drachcrown"
	dynamic_hair_suffix = null
	sellprice = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF
	is_silver = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	visual_replacement = /obj/item/clothing/head/roguetown/crown/fakecrown
	is_important = TRUE
	var/listening = TRUE
	var/speaking = TRUE
	var/loudmouth_listening = TRUE
	var/garrisonline = TRUE
	var/messagereceivedsound = 'sound/misc/scom.ogg'
	var/hearrange = 0
	var/next_check = 0

/obj/item/clothing/head/roguetown/crown/silvercrown/Initialize()
	. = ..()
	if(SSroguemachine.custom_crown)
		qdel(src)
		return
	
	if(SSroguemachine.crown && !ismob(SSroguemachine.crown.loc))
		qdel(SSroguemachine.crown)
	
	SSroguemachine.custom_crown = src
	SSroguemachine.scomm_machines += src
	playsound(src, 'sound/magic/holycharging.ogg', 60, TRUE)
	START_PROCESSING(SSobj, src)
	become_hearing_sensitive()

/obj/item/clothing/head/roguetown/crown/silvercrown/proc/anti_stall()
	src.visible_message(span_warning("The Crown of the Silver Blood rises from the ground, silver flowing into the air as a beam of light arcs gracefully toward the Keep."))
	SSroguemachine.scomm_machines -= src
	SSroguemachine.custom_crown = null
	qdel(src)

/obj/item/clothing/head/roguetown/crown/silvercrown/equipped(mob/user, slot)
	. = ..()
	if(slot == SLOT_HEAD)
		if(user.ckey != "greenrake")
			to_chat(user, span_userdanger("The Crown of the Silver Blood grows unbearably cold! It rejects you - you are not of Drachenfend blood!"))
			visible_message(span_warning("The Crown of the Silver Blood shimmers with an ethereal glow and slips from [user]'s head, refusing to be worn by the unworthy!"))
			addtimer(CALLBACK(user, TYPE_PROC_REF(/mob, dropItemToGround), src, TRUE), 1)
			return
		else
			to_chat(user, span_notice("The crown sits perfectly upon your head. The silver blood recognizes its rightful heir."))
			visible_message(span_notice("A faint silver glow emanates from [user] as the crown settles upon their head."))
			set_light(2, 1, "#E0E0E0")

/obj/item/clothing/head/roguetown/crown/silvercrown/dropped(mob/user)
	. = ..()
	set_light(0)

/obj/item/clothing/head/roguetown/crown/silvercrown/attack_right(mob/living/carbon/human/user)
	visible_message(span_notice ("[user] presses their hands against their crown."))
	var/input_text = input(user, "Enter your ducal message:", "Crown SCOM")
	if(!input_text)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	var/usedcolor = user.voice_color
	if(user.voicecolor_override)
		usedcolor = user.voicecolor_override
	user.whisper(input_text)
	if(length(input_text) > 100)
		input_text = "<small>[input_text]</small>"
	if(!garrisonline)
		for(var/obj/structure/roguemachine/scomm/S in SSroguemachine.scomm_machines)
			S.repeat_message(input_text, src, usedcolor)
		for(var/obj/item/scomstone/S in SSroguemachine.scomm_machines)
			S.repeat_message(input_text, src, usedcolor)
		for(var/obj/item/listenstone/S in SSroguemachine.scomm_machines)
			S.repeat_message(input_text, src, usedcolor)

		GLOB.broadcast_list += list(list(
		"message"   = input_text,
		"tag"		= "Crown of the Silver Blood",
		"timestamp" = station_time_timestamp("hh:mm:ss")
		))
	if(garrisonline)
		input_text = "<big><span style='color: [GARRISON_CROWN_COLOR]'>[input_text]</span></big>"
		for(var/obj/item/scomstone/bad/garrison/S in SSroguemachine.scomm_machines)
			S.repeat_message(input_text, src, usedcolor)
		for(var/obj/item/scomstone/garrison/S in SSroguemachine.scomm_machines)
			S.repeat_message(input_text, src, usedcolor)
		for(var/obj/structure/roguemachine/scomm/S in SSroguemachine.scomm_machines)
			if(S.garrisonline)
				S.repeat_message(input_text, src, usedcolor)

/obj/item/clothing/head/roguetown/crown/silvercrown/attack_self(mob/living/user)
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	garrisonline = !garrisonline
	to_chat(user, span_info("I [garrisonline ? "connect the crown to the garrison SCOMline" : "connect the crown to the general SCOMline"]"))

/obj/item/clothing/head/roguetown/crown/silvercrown/MiddleClick(mob/user)
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	if(loudmouth_listening)
		to_chat(user, span_info("I quell the Loudmouth's prattling on the scomstone. It may be muted entirely still."))
		loudmouth_listening = FALSE
	else
		listening = !listening
		speaking = !speaking
		to_chat(user, span_info("I [speaking ? "unmute" : "mute"] the crown's SCOM capabilities."))
		if(listening)
			loudmouth_listening = TRUE
	update_icon()

/obj/item/clothing/head/roguetown/crown/silvercrown/proc/repeat_message(message, atom/A, tcolor, message_language)
	if(A == src)
		return
	if(!ismob(loc))
		return
	if(tcolor)
		voicecolor_override = tcolor
	if(speaking && message)
		playsound(loc, messagereceivedsound, 100, TRUE, -1)
		say(message, language = message_language)
	voicecolor_override = null

/obj/item/clothing/head/roguetown/crown/silvercrown/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	if(!can_speak())
		return
	if(message == "" || !message)
		return
	spans |= speech_span
	if(!language)
		language = get_default_language()
	if(istype(loc, /obj/item))
		var/obj/item/I = loc
		I.send_speech(message, hearrange, I, , spans, message_language=language)
	else
		send_speech(message, hearrange, src, , spans, message_language=language)

/obj/item/clothing/head/roguetown/crown/silvercrown/process()
	if(world.time < next_check)
		return
	next_check = world.time + 600
	
	var/lord_found = FALSE
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.ckey == "greenrake" && (H.mind?.assigned_role == "Grand Duke" || H.mind?.assigned_role == "Lord"))
			lord_found = TRUE
			break
	
	if(!lord_found)
		visible_message(span_warning("The Crown of the Silver Blood shimmers and fades, following its rightful master..."))
		STOP_PROCESSING(SSobj, src)
		qdel(src)

/obj/item/clothing/head/roguetown/crown/silvercrown/Destroy()
	STOP_PROCESSING(SSobj, src)
	SSroguemachine.scomm_machines -= src
	SSroguemachine.custom_crown = null
	lose_hearing_sensitivity()
	
	if(!SSroguemachine.crown || QDELETED(SSroguemachine.crown))
		var/turf/spawn_loc = get_turf(src)
		if(spawn_loc)
			new /obj/item/clothing/head/roguetown/crown/serpcrown(spawn_loc)
	
	return ..()