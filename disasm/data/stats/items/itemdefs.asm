
; ASM FILE data\stats\items\itemdefs.asm :
; 0x16EA6..0x176A6 : Item definitions
tbl_ItemDefs:   
; Syntax        equipFlags [EQUIPFLAG_]bitfield
;               range      min, max 0-3
;               price      0-65535
;               itemType   [ITEMTYPE_]bitfield
;               useSpell   [SPELL_]enum[|level]
;               equipEffects &
;                   [EQUIPEFFECT_]enum, parameter, &
;                   [EQUIPEFFECT_]enum, parameter, &
;                   [EQUIPEFFECT_]enum, parameter
;
;        level: LV1 = 0 (default when omitted)
;               LV2 = $40
;               LV3 = $80
;               LV4 = $C0
;
; Notes: Equip parameter range depends on effect.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                equipFlags NONE         ; 0: Medical Herb
                range      0, 1
                price      10
                itemType   CONSUMABLE
                useSpell   HEALIN
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 1: Healing Seed
                range      0, 1
                price      200
                itemType   CONSUMABLE
                useSpell   HEALIN|LV2
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 2: Healing Drop
                range      0, 1
                price      300
                itemType   CONSUMABLE
                useSpell   HEALIN|LV3
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 3: Antidote
                range      0, 1
                price      20
                itemType   CONSUMABLE
                useSpell   DETOX
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 4: Angel Wing
                range      0, 0
                price      40
                itemType   CONSUMABLE
                useSpell   EGRESS
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 5: Fairy Powder
                range      0, 1
                price      100
                itemType   CONSUMABLE
                useSpell   POWDER
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 6: Healing Water
                range      0, 1
                price      400
                itemType   CONSUMABLE
                useSpell   HEAL|LV4
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 7: Fairy Tear
                range      0, 1
                price      300
                itemType   CONSUMABLE
                useSpell   G_TEAR|LV2
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 8: Healing Rain
                range      0, 0
                price      10000
                itemType   RARE|CONSUMABLE
                useSpell   AURA|LV4
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 9: Power Water
                range      0, 0
                price      500
                itemType   CONSUMABLE
                useSpell   POWER
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 10: Protect Milk
                range      0, 0
                price      500
                itemType   CONSUMABLE
                useSpell   GUARD
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 11: Quick Chicken
                range      0, 0
                price      500
                itemType   CONSUMABLE
                useSpell   SPEED
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 12: Running Pimento
                range      0, 0
                price      1500
                itemType   CONSUMABLE
                useSpell   IDATEN
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 13: Cheerful Bread
                range      0, 0
                price      500
                itemType   CONSUMABLE
                useSpell   HEALTH
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 14: Bright Honey
                range      0, 0
                price      500
                itemType   CONSUMABLE
                useSpell   HANNY
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 15: Brave Apple
                range      0, 0
                price      500
                itemType   CONSUMABLE
                useSpell   BRAVE
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 16: Shining Ball
                range      0, 1
                price      1000
                itemType   RARE|CONSUMABLE
                useSpell   FBALL
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 17: Blizzard
                range      0, 1
                price      1200
                itemType   RARE|CONSUMABLE
                useSpell   BREZAD
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 18: Holy Thunder
                range      0, 1
                price      1500
                itemType   RARE|CONSUMABLE
                useSpell   THUNDR
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; 19: Power Ring
                range      0, 0
                price      3000
                itemType   RING|RARE|BREAKABLE
                useSpell   ATTACK
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; 20: Protect Ring
                range      0, 0
                price      3000
                itemType   RING|RARE|BREAKABLE
                useSpell   BOOST
                equipEffects &
                    INCREASE_DEF, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; 21: Quick Ring
                range      0, 0
                price      3000
                itemType   RING|RARE|BREAKABLE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_AGI, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; 22: Running Ring
                range      0, 0
                price      3000
                itemType   RING|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_MOV, 2, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 23: White Ring
                    HERO|VICR
                range      0, 0
                price      5000
                itemType   RING|RARE|BREAKABLE
                useSpell   AURA|LV2
                equipEffects &
                    INCREASE_DEF, 10, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 24: Black Ring
                    WIZ|SORC
                range      0, 0
                price      5000
                itemType   RING|RARE|CURSED|BREAKABLE
                useSpell   BLAZE|LV2
                equipEffects &
                    INCREASE_ATT, 10, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 25: Evil Ring
                    WIZ|SORC|VICR
                range      0, 0
                price      5000
                itemType   RING|RARE|CURSED|BREAKABLE
                useSpell   BOLT|LV2
                equipEffects &
                    INCREASE_ATT, 15, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 26: Leather Glove
                    MMNK
                range      1, 1
                price      1300
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 27: Power Glove
                    MMNK
                range      1, 1
                price      1800
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 33, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 28: Brass Knuckles
                    MMNK
                range      1, 1
                price      2900
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 29: Iron Knuckles
                    MMNK
                range      1, 1
                price      4800
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 43, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 30: Misty Knuckles
                    MMNK
                range      1, 1
                price      5500
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   SPOIT
                equipEffects &
                    INCREASE_ATT, 48, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 31: Giant Knuckles
                    MMNK
                range      1, 1
                price      7500
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   MUDDLE
                equipEffects &
                    INCREASE_ATT, 55, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 32: Evil Knuckles
                    MMNK
                range      1, 1
                price      9500
                itemType   WEAPON|RARE|CURSED
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 63, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 33: Short Axe
                    WARR|GLDT|BRN|RDBN
                range      1, 1
                price      120
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 34: Hand Axe
                    WARR|GLDT|BRN|RDBN
                range      1, 1
                price      340
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 9, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 35: Middle Axe
                    WARR|GLDT|BRN|RDBN
                range      1, 1
                price      610
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 13, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 36: Power Axe
                    WARR|GLDT|BRN|RDBN
                range      1, 1
                price      1100
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 17, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 37: Battle Axe
                    WARR|GLDT|BRN|RDBN
                range      1, 1
                price      1370
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 21, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 38: Large Axe
                    GLDT|BRN|RDBN
                range      1, 1
                price      2250
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 25, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 39: Great Axe
                    GLDT|BRN|RDBN
                range      1, 1
                price      4600
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 28, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 40: Heat Axe
                    GLDT|BRN|RDBN
                range      1, 1
                price      7200
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   BLAZE|LV2
                equipEffects &
                    INCREASE_ATT, 32, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 41: Atlas Axe
                    GLDT|BRN|RDBN
                range      1, 1
                price      9600
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   BLAZE|LV3
                equipEffects &
                    INCREASE_ATT, 35, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 42: Ground Axe
                    GLDT|BRN|RDBN
                range      1, 1
                price      10000
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_MOV, 1, &
                    NONE, 0
                    
                equipFlags &            ; 43: Rune Axe
                    GLDT|BRN|RDBN
                range      1, 1
                price      10000
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   DETOX|LV2
                equipEffects &
                    INCREASE_ATT, 42, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; 44: Evil Axe
                    GLDT|BRN|RDBN
                range      1, 1
                price      15000
                itemType   WEAPON|RARE|CURSED
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 50, &
                    DECREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; 45: Wooden Arrow
                    ACHR|RNGR|SNIP|BRGN|BWNT
                range      2, 2
                price      250
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 7, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 46: Iron Arrow
                    ACHR|RNGR|SNIP|BRGN|BWNT
                range      2, 2
                price      600
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 47: Steel Arrow
                    ACHR|RNGR|SNIP|BRGN|BWNT
                range      2, 2
                price      1270
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 17, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 48: Robin Arrow
                    SNIP|BRGN|BWNT
                range      2, 3
                price      1480
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 21, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; 49: Assault Shell
                    SNIP|BRGN|BWNT
                range      2, 3
                price      2500
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 25, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 50: Great Shot
                    SNIP|BRGN|BWNT
                range      2, 3
                price      5000
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 29, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 51: Nazca Cannon
                    SNIP|BRGN|BWNT
                range      2, 3
                price      3000
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 33, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; 52: Buster Shot
                    SNIP|BRGN|BWNT
                range      2, 3
                price      6800
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 37, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 53: Hyper Cannon
                    SNIP|BRGN|BWNT
                range      2, 3
                price      8700
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 40, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 54: Grand Cannon
                    SNIP|BRGN|BWNT
                range      2, 3
                price      9800
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   DISPEL
                equipEffects &
                    INCREASE_ATT, 43, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 55: Evil Shot
                    SNIP|BRGN|BWNT
                range      2, 3
                price      13000
                itemType   WEAPON|RARE|CURSED
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 51, &
                    DECREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; 56: Wooden Stick
                    KNTE|PLDN|PGNT
                range      1, 1
                price      70
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 3, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 57: Short Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      140
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 58: Middle Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      340
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 8, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 59: Long Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      620
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 60: Steel Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      1120
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 16, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 61: Achilles Sword
                    SDMN|HERO
                range      1, 1
                price      1350
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 19, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 62: Broad Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      1600
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 22, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 63: Buster Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      2600
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 64: Great Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      5100
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 29, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 65: Critical Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      7200
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 32, &
                    INCREASE_CRITICAL, 1, &
                    NONE, 0
                    
                equipFlags &            ; 66: Battle Sword
                    HERO|BRN|BDBT|RDBN
                range      1, 1
                price      9200
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 35, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 67: Force Sword
                    HERO
                range      1, 1
                price      10000
                itemType   WEAPON|RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 46, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 68: Counter Sword
                    HERO|BRN|BDBT|RDBN
                range      1, 1
                price      13000
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_COUNTER, 1, &
                    NONE, 0
                    
                equipFlags &            ; 69: Levanter
                    HERO
                range      1, 1
                price      14000
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   BLAZE|LV3
                equipEffects &
                    INCREASE_ATT, 42, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 70: Dark Sword
                    HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      17000
                itemType   WEAPON|RARE|CURSED|BREAKABLE
                useSpell   DESOUL
                equipEffects &
                    INCREASE_ATT, 50, &
                    DECREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; 71: Wooden Sword
                    SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                range      1, 1
                price      60
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 3, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 72: Short Spear
                    KNTE|PLDN|PGNT
                range      1, 2
                price      120
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 6, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 73: Bronze Lance
                    KNTE|PLDN|PGNT
                range      1, 1
                price      260
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 9, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 74: Spear
                    KNTE|PLDN|PGNT
                range      1, 2
                price      460
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 75: Steel Lance
                    KNTE|PLDN|PGNT
                range      1, 1
                price      810
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 16, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 76: Power Spear
                    KNTE|PLDN|PGNT
                range      1, 2
                price      1270
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 20, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 77: Heavy Lance
                    PLDN|PGNT
                range      1, 1
                price      1600
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 23, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 78: Javelin
                    PLDN|PGNT
                range      1, 2
                price      3400
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 79: Chrome Lance
                    PLDN|PGNT
                range      1, 1
                price      6900
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 31, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 80: Valkyrie
                    PLDN|PGNT
                range      1, 2
                price      7700
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   ATTACK
                equipEffects &
                    INCREASE_ATT, 33, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 81: Holy Lance
                    PLDN|PGNT
                range      1, 1
                price      9300
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   HEALIN
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; 82: Mist Javelin
                    PLDN|PGNT
                range      1, 2
                price      9900
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 42, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 83: Halberd
                    PLDN|PGNT
                range      1, 1
                price      7300
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   BOLT
                equipEffects &
                    INCREASE_ATT, 37, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 84: Evil Lance
                    PLDN|PGNT
                range      1, 1
                price      11000
                itemType   WEAPON|RARE|CURSED
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 48, &
                    DECREASE_MOV, 2, &
                    NONE, 0
                    
                equipFlags &            ; 85: Wooden Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range      1, 1
                price      60
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 3, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 86: Short Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range      1, 1
                price      130
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 87: Bronze Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range      1, 1
                price      360
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 8, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 88: Iron Rod
                    MAGE|PRST|WIZ|SORC|VICR
                range      1, 1
                price      560
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 89: Power Stick
                    MAGE|PRST|WIZ|SORC|VICR
                range      1, 1
                price      1050
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 15, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 90: Flail
                    WIZ|SORC|VICR
                range      1, 1
                price      1490
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 19, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 91: Guardian Staff
                    WIZ|SORC|VICR
                range      1, 1
                price      2380
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 22, &
                    INCREASE_DEF, 5, &
                    NONE, 0
                    
                equipFlags &            ; 92: Indra Staff
                    WIZ|SORC|VICR
                range      1, 1
                price      3200
                itemType   WEAPON|BREAKABLE
                useSpell   SPOIT
                equipEffects &
                    INCREASE_ATT, 25, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 93: Mage Staff
                    WIZ|SORC
                range      1, 1
                price      6300
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   BLAZE|LV2
                equipEffects &
                    INCREASE_ATT, 27, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 94: Wish Staff
                    VICR
                range      1, 1
                price      6100
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   ATTACK
                equipEffects &
                    INCREASE_ATT, 26, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 95: Great Rod
                    WIZ|SORC|VICR
                range      1, 1
                price      7900
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 28, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 96: Supply Staff
                    WIZ|SORC
                range      1, 1
                price      8500
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   SPOIT
                equipEffects &
                    INCREASE_ATT, 32, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 97: Holy Staff
                    VICR
                range      1, 1
                price      9000
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 29, &
                    UNDEFINED1, 3, &
                    NONE, 0
                    
                equipFlags &            ; 98: Freeze Staff
                    WIZ|SORC
                range      1, 1
                price      9500
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   FREEZE|LV3
                equipEffects &
                    INCREASE_ATT, 37, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 99: Goddess Staff
                    VICR
                range      1, 1
                price      9700
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   AURA|LV2
                equipEffects &
                    INCREASE_ATT, 31, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 100: Mystery Staff
                    WIZ|SORC|VICR
                range      1, 1
                price      10000
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    UNDEFINED2, 2, &
                    NONE, 0
                    
                equipFlags &            ; 101: Demon Rod
                    WIZ|SORC|VICR
                range      1, 1
                price      12500
                itemType   WEAPON|RARE|CURSED|BREAKABLE
                useSpell   SPOIT
                equipEffects &
                    INCREASE_ATT, 50, &
                    DECREASE_AGI, 10, &
                    NONE, 0
                    
                equipFlags NONE         ; 102: Iron Ball
                range      1, 1
                price      3800
                itemType   WEAPON|RARE|CURSED|BREAKABLE
                useSpell   BLAZE|LV3
                equipEffects &
                    INCREASE_ATT, 44, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 103: Short Knife
                    THIF
                range      1, 1
                price      70
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 104: Dagger
                    THIF
                range      1, 1
                price      320
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 8, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 105: Knife
                    THIF
                range      1, 1
                price      500
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 12, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 106: Thieve's Dagger
                    THIF
                range      1, 1
                price      940
                itemType   WEAPON
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 17, &
                    INCREASE_AGI, 5, &
                    NONE, 0
                    
                equipFlags &            ; 107: Katana
                    NINJ
                range      1, 1
                price      9600
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 34, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 108: Ninja Katana
                    NINJ
                range      1, 1
                price      11500
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 39, &
                    INCREASE_DOUBLE, 1, &
                    NONE, 0
                    
                equipFlags &            ; 109: Gisarme
                    NINJ
                range      1, 1
                price      15000
                itemType   WEAPON|RARE
                useSpell   NOTHING
                equipEffects &
                    INCREASE_ATT, 42, &
                    SET_CRITICAL, 6, &
                    NONE, 0
                    
                equipFlags NONE         ; 110: Taros Sword
                range      1, 2
                price      10000
                itemType   WEAPON|RARE|BREAKABLE
                useSpell   BOLT|LV2
                equipEffects &
                    INCREASE_ATT, 32, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 111: Right of Hope
                range      0, 0
                price      10000
                itemType   RARE|CONSUMABLE
                useSpell   SHINE
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 112: Wooden Panel
                range      0, 0
                price      0
                itemType   RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 113: Sky Orb
                range      0, 0
                price      0
                itemType   RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 114: Cannon
                range      0, 0
                price      0
                itemType   RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 115: Dry Stone
                range      0, 0
                price      0
                itemType   RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 116: Dynamite
                range      0, 0
                price      0
                itemType   RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 117: Arm of Golem
                range      0, 0
                price      0
                itemType   RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 118: Pegasus Wing
                range      0, 0
                price      3000
                itemType   RARE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 119: Warrior Pride
                range      0, 0
                price      3000
                itemType   RARE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 120: Silver Tank
                range      0, 0
                price      3000
                itemType   RARE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 121: Secret Book
                range      0, 0
                price      3000
                itemType   RARE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 122: Vigor Ball
                range      0, 0
                price      3000
                itemType   RARE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 123: Mithril
                range      0, 0
                price      2000
                itemType   RARE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags &            ; 124: Life Ring
                    HERO|PLDN|PGNT|GLDT|BRN|WIZ|SORC|VICR|MMNK|SNIP|BRGN|BDBT|WFBR|BWNT|PHNX|NINJ|MNST|RBT|GLM|RDBN
                range      0, 0
                price      5000
                itemType   RING|RARE
                useSpell   NOTHING
                equipEffects &
                    UNDEFINED1, 5, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags NONE         ; 125: Cotton Balloon
                range      0, 0
                price      0
                itemType   RARE|UNSELLABLE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                equipFlags ALL          ; 126: Chirrup Sandals
                range      0, 0
                price      5
                itemType   RING|RARE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
                
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                
                equipFlags NONE         ; 127: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 128: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 129: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 130: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 131: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 132: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 133: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 134: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 135: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 136: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 137: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 138: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 139: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 140: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 141: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 142: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 143: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 144: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 145: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 146: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 147: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 148: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 149: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 150: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 151: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 152: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 153: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 154: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 155: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 156: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 157: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 158: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 159: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 160: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 161: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 162: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 163: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 164: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 165: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 166: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 167: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 168: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 169: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 170: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 171: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 172: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 173: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 174: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 175: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 176: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 177: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 178: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 179: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 180: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 181: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 182: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 183: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 184: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 185: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 186: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 187: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 188: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 189: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 190: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 191: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 192: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 193: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 194: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 195: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 196: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 197: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 198: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 199: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 200: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 201: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 202: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 203: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 204: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 205: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 206: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 207: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 208: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 209: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 210: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 211: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 212: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 213: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 214: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 215: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 216: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 217: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 218: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 219: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 220: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 221: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 222: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 223: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 224: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 225: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 226: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 227: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 228: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 229: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 230: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 231: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 232: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 233: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 234: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 235: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 236: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 237: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 238: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 239: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 240: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 241: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 242: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 243: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 244: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 245: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 246: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 247: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 248: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 249: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 250: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 251: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 252: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 253: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                equipFlags NONE         ; 254: 
                range      0, 0
                price      1
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                
                endif
                
                
                equipFlags NONE         ; 127: Empty (or 255 when items are expanded)
                range      0, 0
                price      0
                itemType   NONE
                useSpell   NOTHING
                equipEffects &
                    NONE, 0, &
                    NONE, 0, &
                    NONE, 0
                    
