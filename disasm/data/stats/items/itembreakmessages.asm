
; ASM FILE data\stats\items\itembreakmessages.asm :
; 0xBCF0..0xBD24 : Item break messages
table_ItemBreakMessages:
                
; Syntax        itemBreakMessage [ITEM_]enum, messageOffset
;
; Notes: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
;        messageOffset is added to base message index, refer to GetItemBreakMessage for implementation details.
                
                itemBreakMessage POWER_RING, PIECES
                itemBreakMessage PROTECT_RING, PIECES
                itemBreakMessage QUICK_RING, PIECES
                itemBreakMessage RUNNING_RING, PIECES
                itemBreakMessage WHITE_RING, PIECES
                itemBreakMessage BLACK_RING, PIECES
                itemBreakMessage EVIL_RING, PIECES
                itemBreakMessage MISTY_KNUCKLES, PIECES
                itemBreakMessage GIANT_KNUCKLES, PIECES
                itemBreakMessage HEAT_AXE, FLAMES
                itemBreakMessage ATLAS_AXE, FLAMES
                itemBreakMessage RUNE_AXE, RUSTED
                itemBreakMessage GRAND_CANNON, SPLIT
                itemBreakMessage LEVANTER, FLAMES
                itemBreakMessage DARK_SWORD, RUSTED
                itemBreakMessage VALKYRIE, SPLIT
                itemBreakMessage HOLY_LANCE, SPLIT
                itemBreakMessage HALBERD, SPLIT
                itemBreakMessage INDRA_STAFF, MANGLED
                itemBreakMessage MAGE_STAFF, FLAMES
                itemBreakMessage WISH_STAFF, MANGLED
                itemBreakMessage SUPPLY_STAFF, MANGLED
                itemBreakMessage FREEZE_STAFF, MANGLED
                itemBreakMessage GODDESS_STAFF, MANGLED
                itemBreakMessage DEMON_ROD, MANGLED
                
                tableEnd.w
