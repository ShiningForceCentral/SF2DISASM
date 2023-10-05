
; ASM FILE data\stats\items\shopinventories.asm :
; 0x20878..0x20981 : Shop inventories
list_ShopInventories:
                
; Syntax        shopInventory [ITEM_]enum,..[ITEM_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                ; Weapon shop 1
                shopInventory SHORT_SWORD, &
                              SHORT_SPEAR, &
                              SHORT_AXE, &
                              WOODEN_ROD, &
                              SHORT_KNIFE
                
                ; Weapon shop 2
                shopInventory SHORT_SWORD, &
                              SHORT_SPEAR, &
                              BRONZE_LANCE, &
                              SHORT_AXE, &
                              WOODEN_ROD, &
                              SHORT_ROD, &
                              SHORT_KNIFE
                
                ; Weapon shop 3
                shopInventory SHORT_SWORD, &
                              MIDDLE_SWORD, &
                              BRONZE_LANCE, &
                              SPEAR, &
                              SHORT_AXE, &
                              HAND_AXE, &
                              WOODEN_ROD, &
                              SHORT_ROD, &
                              SHORT_KNIFE
                
                ; Weapon shop 4
                shopInventory SHORT_SWORD, &
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
                
                ; Weapon shop 5
                shopInventory MIDDLE_SWORD, &
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
                
                ; Weapon shop 6
                shopInventory MIDDLE_SWORD, &
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
                
                ; Weapon shop 7
                shopInventory LONG_SWORD, &
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
                
                ; Weapon shop 8
                shopInventory BROAD_SWORD, &
                              BATTLE_AXE, &
                              POWER_SPEAR, &
                              ROBIN_ARROW, &
                              FLAIL, &
                              LEATHER_GLOVE
                
                ; Weapon shop 9
                shopInventory BROAD_SWORD, &
                              BUSTER_SWORD, &
                              HEAVY_LANCE, &
                              LARGE_AXE, &
                              ROBIN_ARROW, &
                              ASSAULT_SHELL, &
                              FLAIL, &
                              GUARDIAN_STAFF, &
                              LEATHER_GLOVE, &
                              POWER_GLOVE
                
                ; Weapon shop 10
                shopInventory BROAD_SWORD, &
                              BUSTER_SWORD, &
                              HEAVY_LANCE, &
                              JAVELIN, &
                              LARGE_AXE, &
                              ROBIN_ARROW, &
                              ASSAULT_SHELL, &
                              GUARDIAN_STAFF, &
                              INDRA_STAFF, &
                              POWER_GLOVE
                
                ; Weapon shop 11
                shopInventory BUSTER_SWORD, &
                              GREAT_SWORD, &
                              HEAVY_LANCE, &
                              JAVELIN, &
                              LARGE_AXE, &
                              ASSAULT_SHELL, &
                              GREAT_SHOT, &
                              GUARDIAN_STAFF, &
                              INDRA_STAFF, &
                              POWER_GLOVE
                
                ; Weapon shop 12
                shopInventory BUSTER_SWORD, &
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
                
                ; Weapon shop 13
                shopInventory BUSTER_SWORD, &
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
                
                ; Weapon shop 14
                shopInventory BUSTER_SWORD, &
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
                
                ; Weapon shop 15
                shopInventory BUSTER_SWORD, &
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
                
                ; Item shop 1
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              ANTIDOTE, &
                              ANGEL_WING
                
                ; Item shop 2
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              ANTIDOTE, &
                              ANGEL_WING
                
                ; Item shop 3
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              ANTIDOTE, &
                              ANGEL_WING
                
                ; Item shop 4
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 5
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 6
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 7
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 8
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 9
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 10
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 11
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 12
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 13
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 14
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
                
                ; Item shop 15
                shopInventory MEDICAL_HERB, &
                              HEALING_SEED, &
                              HEALING_DROP, &
                              ANTIDOTE, &
                              FAIRY_POWDER, &
                              ANGEL_WING
