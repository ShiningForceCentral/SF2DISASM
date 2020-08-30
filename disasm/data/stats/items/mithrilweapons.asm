
; ASM FILE data\stats\items\mithrilweapons.asm :
; 0x21F92..0x21FD2 : Mithril weapon lists
tbl_MithrilWeapons:
                
; 4 entries per weapon class, 2 bytes each :
;       0: chance to pick = 1/parameter
;       1: item index
;
; Syntax        mithrilWeapons &
;                   parameter, [ITEM_]index, &
;                   parameter, [ITEM_]index, &
;                   parameter, [ITEM_]index, &
;                   parameter, [ITEM_]index, &
                
                mithrilWeapons &
                    16, LEVANTER, &
                    8, COUNTER_SWORD, &
                    4, BATTLE_SWORD, &
                    1, CRITICAL_SWORD
                    
                mithrilWeapons &
                    16, HOLY_LANCE, &
                    8, HALBERD, &
                    4, MIST_JAVELIN, &
                    1, VALKYRIE
                    
                mithrilWeapons &
                    16, RUNE_AXE, &
                    8, GROUND_AXE, &
                    4, ATLAS_AXE, &
                    1, HEAT_AXE
                    
                mithrilWeapons &
                    16, MYSTERY_STAFF, &
                    8, FREEZE_STAFF, &
                    4, GREAT_ROD, &
                    1, SUPPLY_STAFF
                    
                mithrilWeapons &
                    16, MYSTERY_STAFF, &
                    8, GODDESS_STAFF, &
                    4, GREAT_ROD, &
                    1, HOLY_STAFF
                    
                mithrilWeapons &
                    16, GRAND_CANNON, &
                    8, GRAND_CANNON, &
                    4, HYPER_CANNON, &
                    1, BUSTER_SHOT
                    
                mithrilWeapons &
                    16, GISARME, &
                    8, NINJA_KATANA, &
                    4, KATANA, &
                    1, CRITICAL_SWORD
                    
                mithrilWeapons &
                    16, GIANT_KNUCKLES, &
                    8, GIANT_KNUCKLES, &
                    4, MISTY_KNUCKLES, &
                    1, MISTY_KNUCKLES
                    
