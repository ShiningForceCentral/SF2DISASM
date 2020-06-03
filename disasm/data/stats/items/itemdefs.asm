
; ASM FILE data\stats\items\itemdefs.asm :
; 0x16EA6..0x176A6 : Item definitions
ItemDefs:       
; Syntax        equipFlags   equip_flags_bitfield
;               range        min_range_value, max_range_value (0..3)
;               price        price_value (0..65535)
;               itemType     item_type_bitfield
;               useSpell     spell_index
;               equipEffects equip_effect_index, value (value range depends on effect)
                
                equipFlags NONE         ; Medical Herb
                range 0, 1
                price 10
                itemType CONSUMABLE
                useSpell HEALIN
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Healing Seed
                range 0, 1
                price 200
                itemType CONSUMABLE
                useSpell HEALIN|LV2
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Healing Drop
                range 0, 1
                price 300
                itemType CONSUMABLE
                useSpell HEALIN|LV3
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Antidote
                range 0, 1
                price 20
                itemType CONSUMABLE
                useSpell DETOX
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Angel Wing
                range 0, 0
                price 40
                itemType CONSUMABLE
                useSpell EGRESS
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Fairy Powder
                range 0, 1
                price 100
                itemType CONSUMABLE
                useSpell POWDER
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Healing Water
                range 0, 1
                price 400
                itemType CONSUMABLE
                useSpell HEAL|LV4
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Fairy Tear
                range 0, 1
                price 300
                itemType CONSUMABLE
                useSpell G_TEAR|LV2
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Healing Rain
                range 0, 0
                price 10000
                itemType RARE|CONSUMABLE
                useSpell AURA|LV4
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Power Water
                range 0, 0
                price 500
                itemType CONSUMABLE
                useSpell POWER
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Protect Milk
                range 0, 0
                price 500
                itemType CONSUMABLE
                useSpell GUARD
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Quick Chicken
                range 0, 0
                price 500
                itemType CONSUMABLE
                useSpell SPEED
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Running Pimento
                range 0, 0
                price 1500
                itemType CONSUMABLE
                useSpell IDATEN
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Cheerful Bread
                range 0, 0
                price 500
                itemType CONSUMABLE
                useSpell HEALTH
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Bright Honey
                range 0, 0
                price 500
                itemType CONSUMABLE
                useSpell HANNY
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Brave Apple
                range 0, 0
                price 500
                itemType CONSUMABLE
                useSpell BRAVE
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Shining Ball
                range 0, 1
                price 1000
                itemType RARE|CONSUMABLE
                useSpell FBALL
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Blizzard
                range 0, 1
                price 1200
                itemType RARE|CONSUMABLE
                useSpell BREZAD
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Holy Thunder
                range 0, 1
                price 1500
                itemType RARE|CONSUMABLE
                useSpell THUNDR
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; Power Ring
                range 0, 0
                price 3000
                itemType RING|RARE|BREAKABLE
                useSpell ATTACK
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; Protect Ring
                range 0, 0
                price 3000
                itemType RING|RARE|BREAKABLE
                useSpell BOOST
                equipEffects &
                    INCREASE_DEF, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; Quick Ring
                range 0, 0
                price 3000
                itemType RING|RARE|BREAKABLE
                useSpell NOTHING
                equipEffects &
                    INCREASE_AGI, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; Running Ring
                range 0, 0
                price 3000
                itemType RING|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_MOV, 2, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; White Ring
                    HERO|VICR
                range 0, 0
                price 5000
                itemType RING|RARE|BREAKABLE
                useSpell AURA|LV2
                equipEffects &
                    INCREASE_DEF, 10, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Black Ring
                    WIZ|SORC
                range 0, 0
                price 5000
                itemType RING|RARE|CURSED|BREAKABLE
                useSpell BLAZE|LV2
                equipEffects &
                    INCREASE_ATT, 10, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Evil Ring
                    WIZ|SORC|VICR
                range 0, 0
                price 5000
                itemType RING|RARE|CURSED|BREAKABLE
                useSpell BOLT|LV2
                equipEffects &
                    INCREASE_ATT, 15, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Leather Glove
                    MMNK
                range 1, 1
                price 1300
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Power Glove
                    MMNK
                range 1, 1
                price 1800
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 33, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Brass Knuckles
                    MMNK
                range 1, 1
                price 2900
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Iron Knuckles
                    MMNK
                range 1, 1
                price 4800
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 43, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Misty Knuckles
                    MMNK
                range 1, 1
                price 5500
                itemType WEAPON|RARE|BREAKABLE
                useSpell SPOIT
                equipEffects &
                    INCREASE_ATT, 48, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Giant Knuckles
                    MMNK
                range 1, 1
                price 7500
                itemType WEAPON|RARE|BREAKABLE
                useSpell MUDDLE
                equipEffects &
                    INCREASE_ATT, 55, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Evil Knuckles
                    MMNK
                range 1, 1
                price 9500
                itemType WEAPON|RARE|CURSED
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 63, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Short Axe
                    WARR|GLDT|BRN|RDBN
                range 1, 1
                price 120
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Hand Axe
                    WARR|GLDT|BRN|RDBN
                range 1, 1
                price 340
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 9, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Middle Axe
                    WARR|GLDT|BRN|RDBN
                range 1, 1
                price 610
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 13, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Power Axe
                    WARR|GLDT|BRN|RDBN
                range 1, 1
                price 1100
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 17, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Battle Axe
                    WARR|GLDT|BRN|RDBN
                range 1, 1
                price 1370
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 21, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Large Axe
                    GLDT|BRN|RDBN
                range 1, 1
                price 2250
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 25, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Great Axe
                    GLDT|BRN|RDBN
                range 1, 1
                price 4600
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 28, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Heat Axe
                    GLDT|BRN|RDBN
                range 1, 1
                price 7200
                itemType WEAPON|RARE|BREAKABLE
                useSpell BLAZE|LV2
                equipEffects &
                    INCREASE_ATT, 32, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Atlas Axe
                    GLDT|BRN|RDBN
                range 1, 1
                price 9600
                itemType WEAPON|RARE|BREAKABLE
                useSpell BLAZE|LV3
                equipEffects &
                    INCREASE_ATT, 35, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Ground Axe
                    GLDT|BRN|RDBN
                range 1, 1
                price 10000
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_MOV, 1, &
                    NONE, 0
                    
                equipFlags &            ; Rune Axe
                    GLDT|BRN|RDBN
                range 1, 1
                price 10000
                itemType WEAPON|RARE|BREAKABLE
                useSpell DETOX|LV2
                equipEffects &
                    INCREASE_ATT, 42, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; Evil Axe
                    GLDT|BRN|RDBN
                range 1, 1
                price 15000
                itemType WEAPON|RARE|CURSED
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 50, &
                    DECREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; Wooden Arrow
                    ACHR|RNGR|SNIP|BRGN|BWNT
                range 2, 2
                price 250
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 7, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Iron Arrow
                    ACHR|RNGR|SNIP|BRGN|BWNT
                range 2, 2
                price 600
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Steel Arrow
                    ACHR|RNGR|SNIP|BRGN|BWNT
                range 2, 2
                price 1270
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 17, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Robin Arrow
                    SNIP|BRGN|BWNT
                range 2, 3
                price 1480
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 21, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; Assault Shell
                    SNIP|BRGN|BWNT
                range 2, 3
                price 2500
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 25, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Great Shot
                    SNIP|BRGN|BWNT
                range 2, 3
                price 5000
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 29, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Nazca Cannon
                    SNIP|BRGN|BWNT
                range 2, 3
                price 3000
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 33, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; Buster Shot
                    SNIP|BRGN|BWNT
                range 2, 3
                price 6800
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 37, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Hyper Cannon
                    SNIP|BRGN|BWNT
                range 2, 3
                price 8700
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 40, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Grand Cannon
                    SNIP|BRGN|BWNT
                range 2, 3
                price 9800
                itemType WEAPON|RARE|BREAKABLE
                useSpell DISPEL
                equipEffects &
                    INCREASE_ATT, 43, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Evil Shot
                    SNIP|BRGN|BWNT
                range 2, 3
                price 13000
                itemType WEAPON|RARE|CURSED
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 51, &
                    DECREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; Wooden Stick
                    KNTE|PLDN|PGNT
                range 1, 1
                price 70
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 3, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Short Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 140
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Middle Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 340
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 8, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Long Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 620
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Steel Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 1120
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 16, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Achilles Sword
                    SDMN|HERO
                range 1, 1
                price 1350
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 19, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Broad Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 1600
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 22, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Buster Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 2600
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Great Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 5100
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 29, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Critical Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 7200
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 32, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; Battle Sword
                    HERO|BRN|BDBT|RDBN
                range 1, 1
                price 9200
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 35, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Force Sword
                    HERO
                range 1, 1
                price 10000
                itemType WEAPON|RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 46, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Counter Sword
                    HERO|BRN|BDBT|RDBN
                range 1, 1
                price 13000
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_COUNTER, 1, &
                    NONE, 0
                    
                equipFlags &            ; Levanter
                    HERO
                range 1, 1
                price 14000
                itemType WEAPON|RARE|BREAKABLE
                useSpell BLAZE|LV3
                equipEffects &
                    INCREASE_ATT, 42, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Dark Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 17000
                itemType WEAPON|RARE|CURSED|BREAKABLE
                useSpell DESOUL
                equipEffects &
                    INCREASE_ATT, 50, &
                    DECREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; Wooden Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range 1, 1
                price 60
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 3, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Short Spear
                    KNTE|PLDN|PGNT
                range 1, 2
                price 120
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 6, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Bronze Lance
                    KNTE|PLDN|PGNT
                range 1, 1
                price 260
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 9, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Spear
                    KNTE|PLDN|PGNT
                range 1, 2
                price 460
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Steel Lance
                    KNTE|PLDN|PGNT
                range 1, 1
                price 810
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 16, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Power Spear
                    KNTE|PLDN|PGNT
                range 1, 2
                price 1270
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 20, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Heavy Lance
                    PLDN|PGNT
                range 1, 1
                price 1600
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 23, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Javelin
                    PLDN|PGNT
                range 1, 2
                price 3400
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Chrome Lance
                    PLDN|PGNT
                range 1, 1
                price 6900
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 31, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Valkyrie
                    PLDN|PGNT
                range 1, 2
                price 7700
                itemType WEAPON|RARE|BREAKABLE
                useSpell ATTACK
                equipEffects &
                    INCREASE_ATT, 33, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Holy Lance
                    PLDN|PGNT
                range 1, 1
                price 9300
                itemType WEAPON|RARE|BREAKABLE
                useSpell HEALIN
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; Mist Javelin
                    PLDN|PGNT
                range 1, 2
                price 9900
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 42, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Halberd
                    PLDN|PGNT
                range 1, 1
                price 7300
                itemType WEAPON|RARE|BREAKABLE
                useSpell BOLT
                equipEffects &
                    INCREASE_ATT, 37, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Evil Lance
                    PLDN|PGNT
                range 1, 1
                price 11000
                itemType WEAPON|RARE|CURSED
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 48, &
                    DECREASE_MOV, 2, &
                    NONE, 0
                    
                equipFlags &            ; Wooden Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range 1, 1
                price 60
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 3, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Short Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range 1, 1
                price 130
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Bronze Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range 1, 1
                price 360
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 8, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Iron Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range 1, 1
                price 560
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Power Stick
                    MAGE|PRST|WIZ|SORC|VICR
                range 1, 1
                price 1050
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 15, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Flail
                    WIZ|SORC|VICR
                range 1, 1
                price 1490
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 19, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Guardian Staff
                    WIZ|SORC|VICR
                range 1, 1
                price 2380
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 22, &
                    INCREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; Indra Staff
                    WIZ|SORC|VICR
                range 1, 1
                price 3200
                itemType WEAPON|BREAKABLE
                useSpell SPOIT
                equipEffects &
                    INCREASE_ATT, 25, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Mage Staff
                    WIZ|SORC
                range 1, 1
                price 6300
                itemType WEAPON|RARE|BREAKABLE
                useSpell BLAZE|LV2
                equipEffects &
                    INCREASE_ATT, 27, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Wish Staff
                    VICR
                range 1, 1
                price 6100
                itemType WEAPON|RARE|BREAKABLE
                useSpell ATTACK
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Great Rod
                    WIZ|SORC|VICR
                range 1, 1
                price 7900
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 28, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Supply Staff
                    WIZ|SORC
                range 1, 1
                price 8500
                itemType WEAPON|RARE|BREAKABLE
                useSpell SPOIT
                equipEffects &
                    INCREASE_ATT, 32, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Holy Staff
                    VICR
                range 1, 1
                price 9000
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 29, &
                    UNDEFINED1, 3, &
                    NONE, 0
                    
                equipFlags &            ; Freeze Staff
                    WIZ|SORC
                range 1, 1
                price 9500
                itemType WEAPON|RARE|BREAKABLE
                useSpell FREEZE|LV3
                equipEffects &
                    INCREASE_ATT, 37, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Goddess Staff
                    VICR
                range 1, 1
                price 9700
                itemType WEAPON|RARE|BREAKABLE
                useSpell AURA|LV2
                equipEffects &
                    INCREASE_ATT, 31, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Mystery Staff
                    WIZ|SORC|VICR
                range 1, 1
                price 10000
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    UNDEFINED2, 2, &
                    NONE, 0
                    
                equipFlags &            ; Demon Rod
                    WIZ|SORC|VICR
                range 1, 1
                price 12500
                itemType WEAPON|RARE|CURSED|BREAKABLE
                useSpell SPOIT
                equipEffects &
                    INCREASE_ATT, 50, &
                    DECREASE_AGI, 10, &
                    NONE, 0
                    
                equipFlags NONE         ; Iron Ball
                range 1, 1
                price 3800
                itemType WEAPON|RARE|CURSED|BREAKABLE
                useSpell BLAZE|LV3
                equipEffects &
                    INCREASE_ATT, 44, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Short Knife
                    THIF
                range 1, 1
                price 70
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Dagger
                    THIF
                range 1, 1
                price 320
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 8, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Knife
                    THIF
                range 1, 1
                price 500
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Thieve's Dagger
                    THIF
                range 1, 1
                price 940
                itemType WEAPON
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 17, &
                    INCREASE_AGI, 5, &
                    NONE, 0
                    
                equipFlags &            ; Katana
                    NINJ
                range 1, 1
                price 9600
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 34, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Ninja Katana
                    NINJ
                range 1, 1
                price 11500
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_DOUBLE, 1, &
                    NONE, 0
                    
                equipFlags &            ; Gisarme
                    NINJ
                range 1, 1
                price 15000
                itemType WEAPON|RARE
                useSpell NOTHING
                equipEffects &
                    INCREASE_ATT, 42, &
                    SET_CRITICAL, 6, &
                    NONE, 0
                    
                equipFlags NONE         ; Taros Sword
                range 1, 2
                price 10000
                itemType WEAPON|RARE|BREAKABLE
                useSpell BOLT|LV2
                equipEffects &
                    INCREASE_ATT, 32, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Right of Hope
                range 0, 0
                price 10000
                itemType RARE|CONSUMABLE
                useSpell SHINE
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Wooden Panel
                range 0, 0
                price 0
                itemType RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Sky Orb
                range 0, 0
                price 0
                itemType RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Cannon
                range 0, 0
                price 0
                itemType RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Dry Stone
                range 0, 0
                price 0
                itemType RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Dynamite
                range 0, 0
                price 0
                itemType RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Arm of Golem
                range 0, 0
                price 0
                itemType RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Pegasus Wing
                range 0, 0
                price 3000
                itemType RARE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Warrior Pride
                range 0, 0
                price 3000
                itemType RARE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Silver Tank
                range 0, 0
                price 3000
                itemType RARE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Secret Book
                range 0, 0
                price 3000
                itemType RARE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Vigor Ball
                range 0, 0
                price 3000
                itemType RARE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Mithril
                range 0, 0
                price 2000
                itemType RARE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; Life Ring
                    HERO|PLDN|PGNT|GLDT|BRN|WIZ|SORC|VICR|MMNK|SNIP|BRGN|BDBT|WFBR|BWNT|PHNX|NINJ|MNST|RBT|GLM|RDBN
                range 0, 0
                price 5000
                itemType RING|RARE
                useSpell NOTHING
                equipEffects &
                    UNDEFINED1, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Cotton Balloon
                range 0, 0
                price 0
                itemType RARE|UNSELLABLE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; Chirrup Sandals
                range 0, 0
                price 5
                itemType RING|RARE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; Empty
                range 0, 0
                price 0
                itemType NONE
                useSpell NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
