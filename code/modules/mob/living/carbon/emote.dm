/datum/emote/living/carbon
	mob_type_allowed_typecache = list(/mob/living/carbon)

/datum/emote/living/carbon/deathgurgle
	key = "deathgurgle"
	key_third_person = ""
	emote_type = EMOTE_AUDIBLE
	only_forced_audio = TRUE
	vary = TRUE
	message = "gasps out their last breath."
	message_simple =  "falls limp."
	stat_allowed = UNCONSCIOUS
	mob_type_ignore_stat_typecache = list(/mob/living/carbon/human)

/datum/emote/living/carbon/airguitar
	key = "airguitar"
	message = "strums an invisible lute."
	hands_use_check = TRUE

/datum/emote/living/carbon/blink
	key = "blink"
	key_third_person = "blinks"
	message = "blinks."

/datum/emote/living/carbon/blink_r
	key = "blink_r"
	message = "blinks rapidly."

/datum/emote/living/carbon/clap
	key = "clap"
	key_third_person = "claps"
	message = "claps."
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/clap/get_sound(mob/living/user)
	if(ishuman(user))
		if(!user.get_bodypart(BODY_ZONE_L_ARM) || !user.get_bodypart(BODY_ZONE_R_ARM))
			return
		else
			return ..()

/datum/emote/living/carbon/gnarl
	key = "gnarl"
	key_third_person = "gnarls"
	message = "gnarls and shows its teeth..."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey)

/datum/emote/living/carbon/roll
	key = "roll"
	key_third_person = "rolls"
	message = "rolls."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey)
	hands_use_check = TRUE

/datum/emote/living/carbon/scratch
	key = "scratch"
	key_third_person = "scratches"
	message = "scratches."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey)
	hands_use_check = TRUE

/datum/emote/living/carbon/screech
	key = "screech"
	key_third_person = "screeches"
	message = "screeches."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey)

/datum/emote/living/carbon/sign
	key = "sign"
	key_third_person = "signs"
	message_param = "signs the number %t."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey)
	hands_use_check = TRUE

/datum/emote/living/carbon/sign/select_param(mob/user, params)
	. = ..()
	if(!isnum(text2num(params)))
		return message

/datum/emote/living/carbon/sign/signal
	key = "signal"
	key_third_person = "signals"
	message_param = "raises %t fingers."
	mob_type_allowed_typecache = list(/mob/living/carbon/human)
	hands_use_check = TRUE

/datum/emote/living/carbon/tail
	key = "tail"
	message = "waves their tail."
	mob_type_allowed_typecache = list(/mob/living/carbon/monkey)

/datum/emote/living/carbon/wink
	key = "wink"
	key_third_person = "winks"
	message = "winks."
