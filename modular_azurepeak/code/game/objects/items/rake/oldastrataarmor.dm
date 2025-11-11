/obj/item/clothing/head/roguetown/helmet/blacksteel/modern/conquerorhelmet
	name = "the conqueror's helmet"
	desc = "This is one of the elements of the armor of Ellian the Eternal, the conqueror of Zizo's servants, the champion of Psydon, and the founder of the Golden Empire. The face of the mask immortalizes his cold rage and determination to defeat his enemies."
	body_parts_covered = FULL_HEAD
	icon = 'modular_azurepeak/icons/rake/clothing/elliotarmor.dmi'
	mob_overlay_icon = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	icon_state = "elliotblesshelmet"
	item_state = "elliotblesshelmet"
	flags_inv = HIDEEARS|HIDEFACE|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = ARMOR_PLATE_BSTEEL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	block2add = FOV_BEHIND
	max_integrity = ARMOR_INT_HELMET_BLACKSTEEL
	smeltresult = /obj/item/ingot/blacksteel
	smelt_bar_num = 2

/obj/item/clothing/suit/roguetown/armor/plate/modern/conquerorarmor
	name = "the conqueror's armor"
	desc = "A suit of Full Plate smithed from durable blacksteel. Using a modern design, the piercing and blunt protection still remain unmatched among its heavy-plated peers."
	body_parts_covered = COVERAGE_FULL
	icon = 'modular_azurepeak/icons/rake/clothing/elliotarmor.dmi'
	mob_overlay_icon = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	sleeved = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	icon_state = "elliotblesschest"
	item_state = "elliotblesschest"
	armor = ARMOR_PLATE_BSTEEL
	allowed_race = CLOTHED_RACES_TYPES
	blocking_behavior = null
	max_integrity = ARMOR_INT_CHEST_PLATE_BLACKSTEEL
	smeltresult = /obj/item/ingot/blacksteel
	equip_delay_self = 12 SECONDS
	unequip_delay_self = 12 SECONDS
	equip_delay_other = 3 SECONDS
	strip_delay = 6 SECONDS
	smelt_bar_num = 4 

/obj/item/clothing/gloves/roguetown/blacksteel/modern/conquerorgloves
	name = "the conqueror's gauntlets"
	desc = "Ellian's first work, when he was told the secret of black steel. Despite his first attempt with the new material, Ellian made them incredibly close to the gloves worn by the Architect of the Universe himself."
	icon = 'modular_azurepeak/icons/rake/clothing/elliotarmor.dmi'
	mob_overlay_icon = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	sleeved = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	icon_state = "elliotblessgauntlet"
	item_state = "elliotblessgauntlet"
	armor = ARMOR_PLATE_BSTEEL
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	max_integrity = ARMOR_INT_SIDE_BLACKSTEEL
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel

/obj/item/clothing/under/roguetown/platelegs/blacksteel/conquerorchausses
	name = "the conqueror's chausses"
	desc = "In the old days, people wore much less protection and instead wore large shields. But if you look closely, you will notice that they were reinforced and engraved with the last words of God."
	gender = PLURAL
	icon = 'modular_azurepeak/icons/rake/clothing/elliotarmor.dmi'
	mob_overlay_icon = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	sleeved = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	icon_state = "elliotblesschausses"
	item_state = "elliotblesschausses"
	sewrepair = FALSE
	armor = ARMOR_PLATE_BSTEEL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT
	max_integrity = ARMOR_INT_LEG_BLACKSTEEL
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel
	smelt_bar_num = 2

/obj/item/clothing/shoes/roguetown/boots/blacksteel/modern/conquerorboots
	name = "the conqueror's boots"
	desc = "Tasteless and crude. This is exactly what Ellian planned to do, showing everyone that even the chosen one must remain connected to the world without being drawn to wealth."
	body_parts_covered = FEET
	icon = 'modular_azurepeak/icons/rake/clothing/elliotarmor.dmi'
	mob_overlay_icon = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	sleeved = 'modular_azurepeak/icons/rake/clothing/onmob/elliotarmor.dmi'
	icon_state = "elliotblessboot"
	item_state = "elliotblessboot"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	max_integrity = ARMOR_INT_SIDE_BLACKSTEEL
	armor = ARMOR_PLATE_BSTEEL
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel
	resistance_flags = FIRE_PROOF