//Handles donator modkit code - basically akin to old Citadel/F13 modkit donator system.
//Tl;dr - Click the assigned modkit to the object type's parent, it'll change it into the child. Modkits, aka enchanting kits, are what you get.
/obj/item/enchantingkit
	name = "morphing elixir"
	desc = "A small container of special morphing dust, perfect to make a specifc item."
	icon = 'modular_azurepeak/icons/obj/items/donor_objects.dmi'	//We default to here just to avoid tons of uneeded sprites.
	icon_state = "enchanting_kit"
	w_class = WEIGHT_CLASS_SMALL	//So can fit in a bag, we don't need these large. They're just used to apply to items.
	var/list/target_items = list()
	var/result_item = null

/obj/item/enchantingkit/pre_attack(obj/item/I, mob/user)
	if(is_type_in_list(I, target_items))
		var/obj/item/R = new result_item(get_turf(user))
		to_chat(user, span_notice("You apply the [src] to [I], using the enchanting dust and tools to turn it into [R]."))
		R.name += " <font size = 1>([I.name])</font>"
		remove_item_from_storage(I)
		qdel(I)
		user.put_in_hands(R)
		qdel(src)
		return TRUE
	else
		return ..()

/////////////////////////////
// ! Player / Donor Kits ! //
/////////////////////////////

//Plexiant - Custom rapier type
/obj/item/enchantingkit/plexiant
	name = "'Rapier di Aliseo' morphing elixir"
	target_items = list(/obj/item/rogueweapon/sword/rapier)		//Takes any subpated rapier and turns it into unique one.
	result_item = /obj/item/rogueweapon/sword/rapier/aliseo

//Ryebread - Custom estoc type
/obj/item/enchantingkit/ryebread
	name = "'Worttrager' morphing elixir"
	target_items = list(/obj/item/rogueweapon/estoc)		//Takes any subpated rapier and turns it into unique one.
	result_item = /obj/item/rogueweapon/estoc/worttrager

//Srusu - Custom dress type
/obj/item/enchantingkit/srusu
	name = "'Emerald Dress' morphing elixir"
	target_items = list(/obj/item/clothing/suit/roguetown/shirt/dress)	//Literally any type of dress
	result_item = /obj/item/clothing/suit/roguetown/shirt/dress/emerald

//Strudle - Custom leather vest type
/obj/item/enchantingkit/strudle
	name = "'Grenzelhoft Mage Vest' morphing elixir"
	target_items = list(/obj/item/clothing/suit/roguetown/shirt/robe)
	result_item = /obj/item/clothing/suit/roguetown/shirt/robe/sofiavest

//Bat - Custom harp type
/obj/item/enchantingkit/bat
	name = "'Handcrafted Harp' morphing elixir"
	target_items = list(/obj/item/rogue/instrument/harp)
	result_item = /obj/item/rogue/instrument/harp/handcarved

//Rebel - Custom visored sallet type
/obj/item/enchantingkit/rebel
	name = "'Gilded Sallet' morphing elixir"
	target_items = list(/obj/item/clothing/head/roguetown/helmet/sallet/visored)
	result_item = /obj/item/clothing/head/roguetown/helmet/sallet/visored/gilded

//Zydras donator item - bathmatron padded dress
/obj/item/enchantingkit/zydras
	name = "'Gold-Black silky dress morphing elixir"
	target_items = list(/obj/item/clothing/suit/roguetown/shirt/dress/silkydress)
	result_item = /obj/item/clothing/suit/roguetown/shirt/dress/silkydress/zydrasdress

//Eiren - Custom zweihander type
/obj/item/enchantingkit/eiren
	name = "'Regret' morphing elixir"
	target_items = list(/obj/item/rogueweapon/greatsword/zwei)		//now only takes the zwei and nothing else
	result_item = /obj/item/rogueweapon/greatsword/zwei/eiren

//pretzel - custom steel greatsword. PSYDON LYVES. PSYDON ENDVRES.
/obj/item/enchantingkit/waff
	name = "'Weeper's Lathe' morphing elixir"
	target_items = list(/obj/item/rogueweapon/greatsword)		// i, uh. i really do promise i'm only gonna use it on steel greatswords.
	result_item = /obj/item/rogueweapon/greatsword/weeperslathe

// Conqueror's Armor Set - greenrake
/obj/item/enchantingkit/conqueror_helmet
	name = "'Conqueror's Helmet' morphing elixir"
	target_items = list(/obj/item/clothing/head/roguetown/helmet/blacksteel/modern/armet)
	result_item = /obj/item/clothing/head/roguetown/helmet/blacksteel/modern/conquerorhelmet

/obj/item/enchantingkit/conqueror_armor
	name = "'Conqueror's Armor' morphing elixir"
	target_items = list(/obj/item/clothing/suit/roguetown/armor/plate/modern/blacksteel_full_plate)
	result_item = /obj/item/clothing/suit/roguetown/armor/plate/modern/conquerorarmor

/obj/item/enchantingkit/conqueror_gloves
	name = "'Conqueror's Gauntlets' morphing elixir"
	target_items = list(/obj/item/clothing/gloves/roguetown/blacksteel/modern/plategloves)
	result_item = /obj/item/clothing/gloves/roguetown/blacksteel/modern/conquerorgloves

/obj/item/enchantingkit/conqueror_chausses
	name = "'Conqueror's Chausses' morphing elixir"
	target_items = list(/obj/item/clothing/under/roguetown/platelegs/blacksteel/modern)
	result_item = /obj/item/clothing/under/roguetown/platelegs/blacksteel/conquerorchausses

/obj/item/enchantingkit/conqueror_boots
	name = "'Conqueror's Boots' morphing elixir"
	target_items = list(/obj/item/clothing/shoes/roguetown/boots/blacksteel/modern/plateboots)
	result_item = /obj/item/clothing/shoes/roguetown/boots/blacksteel/modern/conquerorboots
