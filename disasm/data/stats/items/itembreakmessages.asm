
; ASM FILE data\stats\items\itembreakmessages.asm :
; 0xBCF0..0xBD24 : Item break messages
ItemBreakMessages:
                ; Item ID, Message offset (add to base message ID)
                itemBreakMessage ITEM_POWER_RING, 1
                itemBreakMessage ITEM_PROTECT_RING, 1
                itemBreakMessage ITEM_QUICK_RING, 1
                itemBreakMessage ITEM_RUNNING_RING, 1
                itemBreakMessage ITEM_WHITE_RING, 1
                itemBreakMessage ITEM_BLACK_RING, 1
                itemBreakMessage ITEM_EVIL_RING, 1
                itemBreakMessage ITEM_MISTY_KNUCKLES, 1
                itemBreakMessage ITEM_GIANT_KNUCKLES, 1
                itemBreakMessage ITEM_HEAT_AXE, 0
                itemBreakMessage ITEM_ATLAS_AXE, 0
                itemBreakMessage ITEM_RUNE_AXE, 4
                itemBreakMessage ITEM_GRAND_CANNON, 2
                itemBreakMessage ITEM_LEVANTER, 0
                itemBreakMessage ITEM_DARK_SWORD, 4
                itemBreakMessage ITEM_VALKYRIE, 2
                itemBreakMessage ITEM_HOLY_LANCE, 2
                itemBreakMessage ITEM_HALBERD, 2
                itemBreakMessage ITEM_INDRA_STAFF, 3
                itemBreakMessage ITEM_MAGE_STAFF, 0
                itemBreakMessage ITEM_WISH_STAFF, 3
                itemBreakMessage ITEM_SUPPLY_STAFF, 3
                itemBreakMessage ITEM_FREEZE_STAFF, 3
                itemBreakMessage ITEM_GODDESS_STAFF, 3
                itemBreakMessage ITEM_DEMON_ROD, 3
                dc.w CODE_TERMINATOR_WORD
