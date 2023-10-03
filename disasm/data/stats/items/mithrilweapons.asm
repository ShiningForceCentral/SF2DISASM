
; ASM FILE data\stats\items\mithrilweapons.asm :
; 0x21F62..0x21FD2 : Mithril weapons data
list_MithrilWeaponClasses:
                
; Syntax        mithrilWeaponClass [CLASS_]enum,..[CLASS_]enum
                
                classes HERO, BDBT
                classes PLDN, PGNT
                classes GLDT
                classes WIZ, SORC
                classes VICR
                classes SNIP, BRGN, BWNT
                classes NINJ
                classes MMNK
                classes BRN, RDBN
table_MithrilWeapons:
                
; Syntax        mithrilWeapons parameter, [ITEM_]enum, &
;                              parameter, [ITEM_]enum, &
;                              parameter, [ITEM_]enum, &
;                              parameter, [ITEM_]enum
;
; Notes: 4 entries per weapon class, 2 bytes each.
;        Chance to be picked = 1/parameter
                
                ; 0: HERO, BDBT / 8: BRN, RDBN
                mithrilWeapons 16, LEVANTER, &
                               8, COUNTER_SWORD, &
                               4, BATTLE_SWORD, &
                               1, CRITICAL_SWORD
                
                ; 1: PLDN, PGNT
                mithrilWeapons 16, HOLY_LANCE, &
                               8, HALBERD, &
                               4, MIST_JAVELIN, &
                               1, VALKYRIE
                
                ; 2: GLDT / 8: BRN, RDBN
                mithrilWeapons 16, RUNE_AXE, &
                               8, GROUND_AXE, &
                               4, ATLAS_AXE, &
                               1, HEAT_AXE
                
                ; 3: WIZ, SORC
                mithrilWeapons 16, MYSTERY_STAFF, &
                               8, FREEZE_STAFF, &
                               4, GREAT_ROD, &
                               1, SUPPLY_STAFF
                
                ; 4: VICR
                mithrilWeapons 16, MYSTERY_STAFF, &
                               8, GODDESS_STAFF, &
                               4, GREAT_ROD, &
                               1, HOLY_STAFF
                
                ; 5: SNIP, BRGN, BWNT
                mithrilWeapons 16, GRAND_CANNON, &
                               8, GRAND_CANNON, &
                               4, HYPER_CANNON, &
                               1, BUSTER_SHOT
                
                ; 6: NINJ
                mithrilWeapons 16, GISARME, &
                               8, NINJA_KATANA, &
                               4, KATANA, &
                               1, CRITICAL_SWORD
                
                ; 7: MMNK
                mithrilWeapons 16, GIANT_KNUCKLES, &
                               8, GIANT_KNUCKLES, &
                               4, MISTY_KNUCKLES, &
                               1, MISTY_KNUCKLES
                
