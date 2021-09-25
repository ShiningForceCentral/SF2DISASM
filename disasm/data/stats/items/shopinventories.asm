
; ASM FILE data\stats\items\shopinventories.asm :
; 0x20878..0x20A02 : Shop inventories
tbl_ShopInventories:
                
; Syntax        shopInventory [ITEM_]enum,..[ITEM_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                shopInventory &         ; Weapon shop 1
                    SHORT_SWORD, &
                    SHORT_SPEAR, &
                    SHORT_AXE, &
                    WOODEN_ROD, &
                    SHORT_KNIFE
                    
                shopInventory &         ; Weapon shop 2
                    SHORT_SWORD, &
                    SHORT_SPEAR, &
                    BRONZE_LANCE, &
                    SHORT_AXE, &
                    WOODEN_ROD, &
                    SHORT_ROD, &
                    SHORT_KNIFE
                    
                shopInventory &         ; Weapon shop 3
                    SHORT_SWORD, &
                    MIDDLE_SWORD, &
                    BRONZE_LANCE, &
                    SPEAR, &
                    SHORT_AXE, &
                    HAND_AXE, &
                    WOODEN_ROD, &
                    SHORT_ROD, &
                    SHORT_KNIFE
                    
                shopInventory &         ; Weapon shop 4
                    SHORT_SWORD, &
                    MIDDLE_SWORD, &
                    BRONZE_LANCE, &
                    SPEAR, &
                    SHORT_AXE, &
                    HAND_AXE, &
                    WOODEN_ROD, &
                    SHORT_ROD, &
                    SHORT_KNIFE, &
                    DAGGER, &
                    WOODEN_ARROW
                    
                shopInventory &         ; Weapon shop 5
                    MIDDLE_SWORD, &
                    LONG_SWORD, &
                    BRONZE_LANCE, &
                    SPEAR, &
                    SHORT_AXE, &
                    HAND_AXE, &
                    SHORT_ROD, &
                    BRONZE_ROD, &
                    SHORT_KNIFE, &
                    DAGGER, &
                    WOODEN_ARROW
                    
                shopInventory &         ; Weapon shop 6
                    MIDDLE_SWORD, &
                    LONG_SWORD, &
                    SPEAR, &
                    STEEL_LANCE, &
                    HAND_AXE, &
                    MIDDLE_AXE, &
                    SHORT_ROD, &
                    BRONZE_ROD, &
                    DAGGER, &
                    KNIFE, &
                    WOODEN_ARROW, &
                    IRON_ARROW
                    
                shopInventory &         ; Weapon shop 7
                    LONG_SWORD, &
                    STEEL_SWORD, &
                    SPEAR, &
                    STEEL_LANCE, &
                    MIDDLE_AXE, &
                    POWER_AXE, &
                    IRON_ROD, &
                    POWER_STICK, &
                    KNIFE, &
                    THIEVES_DAGGER, &
                    IRON_ARROW, &
                    STEEL_ARROW
                    
                shopInventory &         ; Weapon shop 8
                    BROAD_SWORD, &
                    BATTLE_AXE, &
                    POWER_SPEAR, &
                    ROBIN_ARROW, &
                    FLAIL, &
                    LEATHER_GLOVE
                    
                shopInventory &         ; Weapon shop 9
                    BROAD_SWORD, &
                    BUSTER_SWORD, &
                    HEAVY_LANCE, &
                    LARGE_AXE, &
                    ROBIN_ARROW, &
                    ASSAULT_SHELL, &
                    FLAIL, &
                    GUARDIAN_STAFF, &
                    LEATHER_GLOVE, &
                    POWER_GLOVE
                    
                shopInventory &         ; Weapon shop 10
                    BROAD_SWORD, &
                    BUSTER_SWORD, &
                    HEAVY_LANCE, &
                    JAVELIN, &
                    LARGE_AXE, &
                    ROBIN_ARROW, &
                    ASSAULT_SHELL, &
                    GUARDIAN_STAFF, &
                    INDRA_STAFF, &
                    POWER_GLOVE
                    
                shopInventory &         ; Weapon shop 11
                    BUSTER_SWORD, &
                    GREAT_SWORD, &
                    HEAVY_LANCE, &
                    JAVELIN, &
                    LARGE_AXE, &
                    ASSAULT_SHELL, &
                    GREAT_SHOT, &
                    GUARDIAN_STAFF, &
                    INDRA_STAFF, &
                    POWER_GLOVE
                    
                shopInventory &         ; Weapon shop 12
                    BUSTER_SWORD, &
                    GREAT_SWORD, &
                    JAVELIN, &
                    CHROME_LANCE, &
                    LARGE_AXE, &
                    GREAT_AXE, &
                    ASSAULT_SHELL, &
                    GREAT_SHOT, &
                    GUARDIAN_STAFF, &
                    INDRA_STAFF, &
                    POWER_GLOVE, &
                    BRASS_KNUCKLES
                    
                shopInventory &         ; Weapon shop 13
                    BUSTER_SWORD, &
                    GREAT_SWORD, &
                    JAVELIN, &
                    CHROME_LANCE, &
                    LARGE_AXE, &
                    GREAT_AXE, &
                    ASSAULT_SHELL, &
                    GREAT_SHOT, &
                    GUARDIAN_STAFF, &
                    INDRA_STAFF, &
                    BRASS_KNUCKLES, &
                    IRON_KNUCKLES
                    
                shopInventory &         ; Weapon shop 14
                    BUSTER_SWORD, &
                    GREAT_SWORD, &
                    JAVELIN, &
                    CHROME_LANCE, &
                    LARGE_AXE, &
                    GREAT_AXE, &
                    ASSAULT_SHELL, &
                    GREAT_SHOT, &
                    GUARDIAN_STAFF, &
                    INDRA_STAFF, &
                    BRASS_KNUCKLES, &
                    IRON_KNUCKLES
                    
                shopInventory &         ; Weapon shop 15
                    BUSTER_SWORD, &
                    GREAT_SWORD, &
                    JAVELIN, &
                    CHROME_LANCE, &
                    LARGE_AXE, &
                    GREAT_AXE, &
                    ASSAULT_SHELL, &
                    GREAT_SHOT, &
                    GUARDIAN_STAFF, &
                    INDRA_STAFF, &
                    BRASS_KNUCKLES, &
                    IRON_KNUCKLES
                    
                shopInventory &         ; Item shop 1
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    ANTIDOTE, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 2
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    ANTIDOTE, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 3
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    ANTIDOTE, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 4
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 5
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 6
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 7
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 8
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 9
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 10
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 11
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 12
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 13
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 14
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
                shopInventory &         ; Item shop 15
                    MEDICAL_HERB, &
                    HEALING_SEED, &
                    HEALING_DROP, &
                    ANTIDOTE, &
                    FAIRY_POWDER, &
                    ANGEL_WING
                    
DebugShop:      incbin "data/stats/items/debugshop.bin"
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    include "data\stats\items\debugshop-expanded.asm"
                endif

