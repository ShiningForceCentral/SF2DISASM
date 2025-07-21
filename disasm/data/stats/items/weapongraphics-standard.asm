
; ASM FILE data\stats\items\weapongraphics-standard.asm :

; Weapon sprites that cause an alternate attack animation to be used for knight classes.
table_SpearWeaponSprites:
                
                dc.b WEAPONSPRITE_SPEAR
                dc.b WEAPONSPRITE_JAVELIN
                
                tableEnd.b


table_WeaponGraphics:
                
; Syntax        weaponGraphics [ITEM_]enum, [WEAPONSPRITE_]enum, [WEAPONPALETTE_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                weaponGraphics SHORT_AXE, SHORT_AXE, SHORT_AXE                  ; 33: Short Axe
                weaponGraphics HAND_AXE, SHORT_AXE, SHORT_AXE                   ; 34: Hand Axe
                weaponGraphics MIDDLE_AXE, MIDDLE_AXE, MIDDLE_AXE               ; 35: Middle Axe
                weaponGraphics POWER_AXE, MIDDLE_AXE, MIDDLE_AXE                ; 36: Power Axe
                weaponGraphics BATTLE_AXE, MIDDLE_AXE, MIDDLE_AXE               ; 37: Battle Axe
                weaponGraphics LARGE_AXE, LARGE_AXE, LARGE_AXE                  ; 38: Large Axe
                weaponGraphics GREAT_AXE, LARGE_AXE, LARGE_AXE                  ; 39: Great Axe
                weaponGraphics HEAT_AXE, LARGE_AXE, HEAT_AXE                    ; 40: Heat Axe
                weaponGraphics ATLAS_AXE, MITHRIL_AXE, ATLAS_AXE                ; 41: Atlas Axe
                weaponGraphics GROUND_AXE, MITHRIL_AXE, GROUND_AXE              ; 42: Ground Axe
                weaponGraphics RUNE_AXE, MITHRIL_AXE, RUNE_AXE                  ; 43: Rune Axe
                weaponGraphics EVIL_AXE, MITHRIL_AXE, EVIL_AXE                  ; 44: Evil Axe
                weaponGraphics WOODEN_STICK, BRONZE_LANCE, WOODEN_STICK         ; 56: Wooden Stick
                weaponGraphics SHORT_SWORD, SHORT_SWORD, SHORT_SWORD            ; 57: Short Sword
                weaponGraphics MIDDLE_SWORD, SHORT_SWORD, SHORT_SWORD           ; 58: Middle Sword
                weaponGraphics LONG_SWORD, LONG_SWORD, LONG_SWORD               ; 59: Long Sword
                weaponGraphics STEEL_SWORD, LONG_SWORD, LONG_SWORD              ; 60: Steel Sword
                weaponGraphics ACHILLES_SWORD, LONG_SWORD, ACHILLES_SWORD       ; 61: Achilles Sword
                weaponGraphics BROAD_SWORD, LONG_SWORD, LONG_SWORD              ; 62: Broad Sword
                weaponGraphics BUSTER_SWORD, GREAT_SWORD, GREAT_SWORD           ; 63: Buster Sword
                weaponGraphics GREAT_SWORD, GREAT_SWORD, GREAT_SWORD            ; 64: Great Sword
                weaponGraphics CRITICAL_SWORD, KATANA, CRITICAL_SWORD           ; 65: Critical Sword
                weaponGraphics BATTLE_SWORD, GREAT_SWORD, GREAT_SWORD           ; 66: Battle Sword
                weaponGraphics FORCE_SWORD, FORCE_SWORD, FORCE_SWORD            ; 67: Force Sword
                weaponGraphics COUNTER_SWORD, LONG_SWORD, COUNTER_SWORD         ; 68: Counter Sword
                weaponGraphics LEVANTER, GREAT_SWORD, LEVANTER                  ; 69: Levanter
                weaponGraphics DARK_SWORD, KATANA, DARK_SWORD                   ; 70: Dark Sword
                weaponGraphics WOODEN_SWORD, WOODEN_SWORD, WOODEN_SWORD         ; 71: Wooden Sword
                weaponGraphics SHORT_SPEAR, SPEAR, SPEAR                        ; 72: Short Spear
                weaponGraphics BRONZE_LANCE, BRONZE_LANCE, BRONZE_LANCE         ; 73: Bronze Lance
                weaponGraphics SPEAR, SPEAR, SPEAR                              ; 74: Spear
                weaponGraphics STEEL_LANCE, BRONZE_LANCE, STEEL_LANCE           ; 75: Steel Lance
                weaponGraphics POWER_SPEAR, SPEAR, SPEAR                        ; 76: Power Spear
                weaponGraphics HEAVY_LANCE, BRONZE_LANCE, HEAVY_LANCE           ; 77: Heavy Lance
                weaponGraphics JAVELIN, JAVELIN, JAVELIN                        ; 78: Javelin
                weaponGraphics CHROME_LANCE, CHROME_LANCE, CHROME_LANCE         ; 79: Chrome Lance
                weaponGraphics VALKYRIE, JAVELIN, VALKYRIE                      ; 80: Valkyrie
                weaponGraphics HOLY_LANCE, CHROME_LANCE, HOLY_LANCE             ; 81: Holy Lance
                weaponGraphics MIST_JAVELIN, JAVELIN, JAVELIN                   ; 82: Mist Javelin
                weaponGraphics HALBERD, HALBERD, HALBERD                        ; 83: Halberd
                weaponGraphics EVIL_LANCE, CHROME_LANCE, EVIL_LANCE             ; 84: Evil Lance
                weaponGraphics WOODEN_ROD, WOODEN_ROD, WOODEN_ROD               ; 85: Wooden Rod
                weaponGraphics SHORT_ROD, SHORT_ROD, SHORT_ROD                  ; 86: Short Rod
                weaponGraphics BRONZE_ROD, SHORT_ROD, SHORT_ROD                 ; 87: Bronze Rod
                weaponGraphics IRON_ROD, SHORT_ROD, SHORT_ROD                   ; 88: Iron Rod
                weaponGraphics POWER_STICK, POWER_STICK, POWER_STICK            ; 89: Power Stick
                weaponGraphics FLAIL, POWER_STICK, POWER_STICK                  ; 90: Flail
                weaponGraphics GUARDIAN_STAFF, GUARDIAN_STAFF, GUARDIAN_STAFF   ; 91: Guardian Staff
                weaponGraphics INDRA_STAFF, GUARDIAN_STAFF, GUARDIAN_STAFF      ; 92: Indra Staff
                weaponGraphics MAGE_STAFF, GUARDIAN_STAFF, GUARDIAN_STAFF       ; 93: Mage Staff
                weaponGraphics WISH_STAFF, GUARDIAN_STAFF, GUARDIAN_STAFF       ; 94: Wish Staff
                weaponGraphics GREAT_ROD, GREAT_ROD, GREAT_ROD                  ; 95: Great Rod
                weaponGraphics SUPPLY_STAFF, HOLY_STAFF, SUPPLY_STAFF           ; 96: Supply Staff
                weaponGraphics HOLY_STAFF, HOLY_STAFF, HOLY_STAFF               ; 97: Holy Staff
                weaponGraphics FREEZE_STAFF, HOLY_STAFF, FREEZE_STAFF           ; 98: Freeze Staff
                weaponGraphics GODDESS_STAFF, HOLY_STAFF, GODDESS_STAFF         ; 99: Goddess Staff
                weaponGraphics MYSTERY_STAFF, HOLY_STAFF, MYSTERY_STAFF         ; 100: Mystery Staff
                weaponGraphics DEMON_ROD, GREAT_ROD, GREAT_ROD                  ; 101: Demon Rod
                weaponGraphics IRON_BALL, GREAT_ROD, GREAT_ROD                  ; 102: Iron Ball
                weaponGraphics SHORT_KNIFE, KNIFE, KNIFE                        ; 103: Short Knife
                weaponGraphics DAGGER, DAGGER, DAGGER                           ; 104: Dagger
                weaponGraphics KNIFE, KNIFE, KNIFE                              ; 105: Knife
                weaponGraphics THIEVES_DAGGER, DAGGER, DAGGER                   ; 106: Thieve's Dagger
                weaponGraphics KATANA, KATANA, KATANA                           ; 107: Katana
                weaponGraphics NINJA_KATANA, KATANA, KATANA                     ; 108: Ninja Katana
                weaponGraphics GISARME, KATANA, KATANA                          ; 109: Gisarme
                
                tableEnd.b

