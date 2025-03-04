
/obj/item/ammo_holder
	desc = ""
	icon = 'icons/roguetown/weapons/ammo.dmi'
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = NONE
	max_integrity = 0
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	alternate_worn_layer = UNDER_CLOAK_LAYER
	strip_delay = 20
	var/max_storage
	var/list/ammo_list = list()
	sewrepair = TRUE
	var/list/ammo_type

/obj/item/ammo_holder/attackby(obj/A, loc, params)
	for(var/i in ammo_type)
		if(istype(A, i))
			if(ammo_list.len < max_storage)
				if(ismob(loc))
					var/mob/mob = loc
					mob.transferItemToLoc(A, src)
				else
					A.forceMove(src)
				ammo_list += A
				update_icon()
			else
				to_chat(loc, span_warning("Full!"))
			return
	if(istype(A, /obj/item/gun/ballistic/revolver/grenadelauncher))
		var/obj/item/gun/ballistic/revolver/grenadelauncher/B = A
		var/obj/item/ammo_box/gun_magazine = B.mag_type
		var/obj/item/ammo_casing/caseless/rogue/gun_ammo = initial(gun_magazine?.ammo_type)
		if(ammo_list.len && gun_ammo && !B.chambered)
			for(var/AR in reverseList(ammo_list))
				if(istype(AR, gun_ammo))
					ammo_list -= AR
					B.attackby(AR, loc, params)
					break
		update_icon()
		return
	..()

/obj/item/ammo_holder/attack_right(mob/user)
	if(ammo_list.len)
		var/obj/O = ammo_list[ammo_list.len]
		ammo_list -= O
		O.forceMove(user.loc)
		user.put_in_hands(O)
		update_icon()
		return TRUE

/obj/item/ammo_holder/examine(mob/user)
	. = ..()
	if(ammo_list.len)
		var/list/unique_ammos = list()
		for(var/obj/item/ammo_casing/ammo in ammo_list)
			unique_ammos[ammo.name] += 1
		for(var/ammo_name in unique_ammos)
			. += span_info("[unique_ammos[ammo_name]] [ammo_name][unique_ammos[ammo_name] > 1 ? "s" : ""].")

/obj/item/ammo_holder/update_icon()
	if(ammo_list.len)
		icon_state = "[item_state]1"
	else
		icon_state = "[item_state]0"

/obj/item/ammo_holder/quiver
	name = "quiver"
	icon_state = "quiver0"
	item_state = "quiver"
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	max_storage = 20
	ammo_type = list (/obj/item/ammo_casing/caseless/rogue/arrow, /obj/item/ammo_casing/caseless/rogue/bolt)

/obj/item/ammo_holder/quiver/arrows/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/arrow/A = new()
		ammo_list += A
	update_icon()

/obj/item/ammo_holder/quiver/bolts/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bolt/A = new()
		ammo_list += A
	update_icon()

/obj/item/ammo_holder/bullet
	name = "bullet pouch"
	icon_state = "pouch0"
	item_state = "pouch"
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	max_storage = 10
	ammo_type = list(/obj/item/ammo_casing/caseless/rogue/bullet)
