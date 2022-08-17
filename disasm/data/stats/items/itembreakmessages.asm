
; ASM FILE data\stats\items\itembreakmessages.asm :
; 0xBCF0..0xBD24 : Item break messages
tbl_ItemBreakMessages:
                
; Syntax        itemBreakMessage [ITEM_]enum, messageOffset
;
; Notes: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
;        messageOffset is added to base message index, refer to GetItemBreakMessage for implementation details.
                
                itemBreakMessage POWER_RING, 1
                itemBreakMessage PROTECT_RING, 1
                itemBreakMessage QUICK_RING, 1
                itemBreakMessage RUNNING_RING, 1
                itemBreakMessage WHITE_RING, 1
                itemBreakMessage BLACK_RING, 1
                itemBreakMessage EVIL_RING, 1
                itemBreakMessage MISTY_KNUCKLES, 1
                itemBreakMessage GIANT_KNUCKLES, 1
                itemBreakMessage HEAT_AXE, 0
                itemBreakMessage ATLAS_AXE, 0
                itemBreakMessage RUNE_AXE, 4
                itemBreakMessage GRAND_CANNON, 2
                itemBreakMessage LEVANTER, 0
                itemBreakMessage DARK_SWORD, 4
                itemBreakMessage VALKYRIE, 2
                itemBreakMessage HOLY_LANCE, 2
                itemBreakMessage HALBERD, 2
                itemBreakMessage INDRA_STAFF, 3
                itemBreakMessage MAGE_STAFF, 0
                itemBreakMessage WISH_STAFF, 3
                itemBreakMessage SUPPLY_STAFF, 3
                itemBreakMessage FREEZE_STAFF, 3
                itemBreakMessage GODDESS_STAFF, 3
                itemBreakMessage DEMON_ROD, 3
                
                tableEnd
