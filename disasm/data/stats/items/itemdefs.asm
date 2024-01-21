
; ASM FILE data\stats\items\itemdefs.asm :
; 0x16EA6..0x176A6 : Item definitions
table_ItemDefinitions:
                
; Syntax        equipFlags   [EQUIPFLAG_]bitfield
;               equipFlags2  [EQUIPFLAG2_]bitfield (if EXPANDED_CLASSES is enabled)
;               range        min, max 0-3
;               price        0-65535
;               itemType     [ITEMTYPE_]bitfield
;               useSpell     [SPELL_]enum[|level]
;               equipEffects [EQUIPEFFECT_]enum, parameter, &
;                            [EQUIPEFFECT_]enum, parameter, &
;                            [EQUIPEFFECT_]enum, parameter
;
;        level: LV1 = 0 (default when omitted)
;               LV2 = $40
;               LV3 = $80
;               LV4 = $C0
;
; Notes regarding additional equip effects:
;       Parameters for INCREASE/DECREASE_RES_ can be a combination i.e. MODIFY_FIRE1|MODIFY_WIND3
;       Parameter for SET_RES_ should be every resistance for the byte i.e. RESISTANCE_WIND_NONE|RESISTANCE_LIGHTNING_MAJOR|RESISTANCE_ICE_WEAKNESS|RESISTANCE_FIRE_NONE
;       Parameter for SET_STATUS should be single effect i.e. STATUS_POISON, STATUS_SILENCE, etc.
;
; Notes: Equip parameter range depends on effect.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                ; 0: Medical Herb
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        10
                itemType     CONSUMABLE
                useSpell     HEALIN
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 1: Healing Seed
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        200
                itemType     CONSUMABLE
                useSpell     HEALIN|LV2
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 2: Healing Drop
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        300
                itemType     CONSUMABLE
                useSpell     HEALIN|LV3
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 3: Antidote
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        20
                itemType     CONSUMABLE
                useSpell     DETOX
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 4: Angel Wing
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        40
                itemType     CONSUMABLE
                useSpell     EGRESS
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 5: Fairy Powder
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        100
                itemType     CONSUMABLE
                useSpell     POWDER
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 6: Healing Water
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        400
                itemType     CONSUMABLE
                useSpell     HEAL|LV4
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 7: Fairy Tear
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        300
                itemType     CONSUMABLE
                useSpell     G_TEAR|LV2
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 8: Healing Rain
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        10000
                itemType     RARE|CONSUMABLE
                useSpell     AURA|LV4
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 9: Power Water
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        500
                itemType     CONSUMABLE
                useSpell     POWER
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 10: Protect Milk
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        500
                itemType     CONSUMABLE
                useSpell     GUARD
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 11: Quick Chicken
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        500
                itemType     CONSUMABLE
                useSpell     SPEED
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 12: Running Pimento
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        1500
                itemType     CONSUMABLE
                useSpell     IDATEN
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 13: Cheerful Bread
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        500
                itemType     CONSUMABLE
                useSpell     HEALTH
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 14: Bright Honey
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        500
                itemType     CONSUMABLE
                useSpell     HANNY
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 15: Brave Apple
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        500
                itemType     CONSUMABLE
                useSpell     BRAVE
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 16: Shining Ball
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        1000
                itemType     RARE|CONSUMABLE
                useSpell     FBALL
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 17: Blizzard
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        1200
                itemType     RARE|CONSUMABLE
                useSpell     BREZAD
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 18: Holy Thunder
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 1
                price        1500
                itemType     RARE|CONSUMABLE
                useSpell     THUNDR
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 19: Power Ring
                equipFlags   ALL
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RING|RARE|BREAKABLE
                useSpell     ATTACK
                equipEffects INCREASE_ATT, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 20: Protect Ring
                equipFlags   ALL
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RING|RARE|BREAKABLE
                useSpell     BOOST
                equipEffects INCREASE_DEF, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 21: Quick Ring
                equipFlags   ALL
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RING|RARE|BREAKABLE
                useSpell     NOTHING
                equipEffects INCREASE_AGI, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 22: Running Ring
                equipFlags   ALL
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RING|RARE
                useSpell     NOTHING
                equipEffects INCREASE_MOV, 2, &
                             NONE, 0, &
                             NONE, 0
                
                ; 23: White Ring
                equipFlags   HERO|VICR
                equipFlags2  NONE
                range        0, 0
                price        5000
                itemType     RING|RARE|BREAKABLE
                useSpell     AURA|LV2
                equipEffects INCREASE_DEF, 10, &
                             NONE, 0, &
                             NONE, 0
                
                ; 24: Black Ring
                equipFlags   WIZ|SORC
                equipFlags2  NONE
                range        0, 0
                price        5000
                itemType     RING|RARE|CURSED|BREAKABLE
                useSpell     BLAZE|LV2
                equipEffects INCREASE_ATT, 10, &
                             NONE, 0, &
                             NONE, 0
                
                ; 25: Evil Ring
                equipFlags   WIZ|SORC|VICR
                equipFlags2  NONE
                range        0, 0
                price        5000
                itemType     RING|RARE|CURSED|BREAKABLE
                useSpell     BOLT|LV2
                equipEffects INCREASE_ATT, 15, &
                             NONE, 0, &
                             NONE, 0
                
                ; 26: Leather Glove
                equipFlags   MMNK
                equipFlags2  NONE
                range        1, 1
                price        1300
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 26, &
                             NONE, 0, &
                             NONE, 0
                
                ; 27: Power Glove
                equipFlags   MMNK
                equipFlags2  NONE
                range        1, 1
                price        1800
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 33, &
                             NONE, 0, &
                             NONE, 0
                
                ; 28: Brass Knuckles
                equipFlags   MMNK
                equipFlags2  NONE
                range        1, 1
                price        2900
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 39, &
                             NONE, 0, &
                             NONE, 0
                
                ; 29: Iron Knuckles
                equipFlags   MMNK
                equipFlags2  NONE
                range        1, 1
                price        4800
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 43, &
                             NONE, 0, &
                             NONE, 0
                
                ; 30: Misty Knuckles
                equipFlags   MMNK
                equipFlags2  NONE
                range        1, 1
                price        5500
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     SPOIT
                equipEffects INCREASE_ATT, 48, &
                             NONE, 0, &
                             NONE, 0
                
                ; 31: Giant Knuckles
                equipFlags   MMNK
                equipFlags2  NONE
                range        1, 1
                price        7500
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     MUDDLE
                equipEffects INCREASE_ATT, 55, &
                             NONE, 0, &
                             NONE, 0
                
                ; 32: Evil Knuckles
                equipFlags   MMNK
                equipFlags2  NONE
                range        1, 1
                price        9500
                itemType     WEAPON|RARE|CURSED
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 63, &
                             NONE, 0, &
                             NONE, 0
                
                ; 33: Short Axe
                equipFlags   WARR|GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        120
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 34: Hand Axe
                equipFlags   WARR|GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        340
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 9, &
                             NONE, 0, &
                             NONE, 0
                
                ; 35: Middle Axe
                equipFlags   WARR|GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        610
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 13, &
                             NONE, 0, &
                             NONE, 0
                
                ; 36: Power Axe
                equipFlags   WARR|GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        1100
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 17, &
                             NONE, 0, &
                             NONE, 0
                
                ; 37: Battle Axe
                equipFlags   WARR|GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        1370
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 21, &
                             NONE, 0, &
                             NONE, 0
                
                ; 38: Large Axe
                equipFlags   GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        2250
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 25, &
                             NONE, 0, &
                             NONE, 0
                
                ; 39: Great Axe
                equipFlags   GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        4600
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 28, &
                             NONE, 0, &
                             NONE, 0
                
                ; 40: Heat Axe
                equipFlags   GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        7200
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     BLAZE|LV2
                equipEffects INCREASE_ATT, 32, &
                             NONE, 0, &
                             NONE, 0
                
                ; 41: Atlas Axe
                equipFlags   GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        9600
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     BLAZE|LV3
                equipEffects INCREASE_ATT, 35, &
                             NONE, 0, &
                             NONE, 0
                
                ; 42: Ground Axe
                equipFlags   GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        10000
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 39, &
                             INCREASE_MOV, 1, &
                             NONE, 0
                
                ; 43: Rune Axe
                equipFlags   GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        10000
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     DETOX|LV2
                equipEffects INCREASE_ATT, 42, &
                             INCREASE_CRITICAL, 1, &
                             NONE, 0
                
                ; 44: Evil Axe
                equipFlags   GLDT|BRN|RDBN
                equipFlags2  NONE
                range        1, 1
                price        15000
                itemType     WEAPON|RARE|CURSED
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 50, &
                             DECREASE_DEF, 5, &
                             NONE, 0
                
                ; 45: Wooden Arrow
                equipFlags   ACHR|RNGR|SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 2
                price        250
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 7, &
                             NONE, 0, &
                             NONE, 0
                
                ; 46: Iron Arrow
                equipFlags   ACHR|RNGR|SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 2
                price        600
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 12, &
                             NONE, 0, &
                             NONE, 0
                
                ; 47: Steel Arrow
                equipFlags   ACHR|RNGR|SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 2
                price        1270
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 17, &
                             NONE, 0, &
                             NONE, 0
                
                ; 48: Robin Arrow
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        1480
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 21, &
                             INCREASE_CRITICAL, 1, &
                             NONE, 0
                
                ; 49: Assault Shell
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        2500
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 25, &
                             NONE, 0, &
                             NONE, 0
                
                ; 50: Great Shot
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        5000
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 29, &
                             NONE, 0, &
                             NONE, 0
                
                ; 51: Nazca Cannon
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        3000
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 33, &
                             INCREASE_CRITICAL, 1, &
                             NONE, 0
                
                ; 52: Buster Shot
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        6800
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 37, &
                             NONE, 0, &
                             NONE, 0
                
                ; 53: Hyper Cannon
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        8700
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 40, &
                             NONE, 0, &
                             NONE, 0
                
                ; 54: Grand Cannon
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        9800
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     DISPEL
                equipEffects INCREASE_ATT, 43, &
                             NONE, 0, &
                             NONE, 0
                
                ; 55: Evil Shot
                equipFlags   SNIP|BRGN|BWNT
                equipFlags2  NONE
                range        2, 3
                price        13000
                itemType     WEAPON|RARE|CURSED
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 51, &
                             DECREASE_DEF, 5, &
                             NONE, 0
                
                ; 56: Wooden Stick
                equipFlags   KNTE|PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        70
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 3, &
                             NONE, 0, &
                             NONE, 0
                
                ; 57: Short Sword
                equipFlags   SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        140
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 58: Middle Sword
                equipFlags   SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        340
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 8, &
                             NONE, 0, &
                             NONE, 0
                
                ; 59: Long Sword
                equipFlags   SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        620
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 12, &
                             NONE, 0, &
                             NONE, 0
                
                ; 60: Steel Sword
                equipFlags   SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        1120
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 16, &
                             NONE, 0, &
                             NONE, 0
                
                ; 61: Achilles Sword
                equipFlags   SDMN|HERO
                equipFlags2  NONE
                range        1, 1
                price        1350
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 19, &
                             NONE, 0, &
                             NONE, 0
                
                ; 62: Broad Sword
                equipFlags   HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        1600
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 22, &
                             NONE, 0, &
                             NONE, 0
                
                ; 63: Buster Sword
                equipFlags   HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        2600
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 26, &
                             NONE, 0, &
                             NONE, 0
                
                ; 64: Great Sword
                equipFlags   HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        5100
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 29, &
                             NONE, 0, &
                             NONE, 0
                
                ; 65: Critical Sword
                equipFlags   HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        7200
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 32, &
                             INCREASE_CRITICAL, 1, &
                             NONE, 0
                
                ; 66: Battle Sword
                equipFlags   HERO|BRN|BDBT|RDBN
                equipFlags2  NONE
                range        1, 1
                price        9200
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 35, &
                             NONE, 0, &
                             NONE, 0
                
                ; 67: Force Sword
                equipFlags   HERO
                equipFlags2  NONE
                range        1, 1
                price        10000
                itemType     WEAPON|RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 46, &
                             NONE, 0, &
                             NONE, 0
                
                ; 68: Counter Sword
                equipFlags   HERO|BRN|BDBT|RDBN
                equipFlags2  NONE
                range        1, 1
                price        13000
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 39, &
                             INCREASE_COUNTER, 1, &
                             NONE, 0
                
                ; 69: Levanter
                equipFlags   HERO
                equipFlags2  NONE
                range        1, 1
                price        14000
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     BLAZE|LV3
                equipEffects INCREASE_ATT, 42, &
                             NONE, 0, &
                             NONE, 0
                
                ; 70: Dark Sword
                equipFlags   HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        17000
                itemType     WEAPON|RARE|CURSED|BREAKABLE
                useSpell     DESOUL
                equipEffects INCREASE_ATT, 50, &
                             DECREASE_DEF, 5, &
                             NONE, 0
                
                ; 71: Wooden Sword
                equipFlags   SDMN|BDMN|HERO|BRN|BDBT|NINJ|RDBN
                equipFlags2  NONE
                range        1, 1
                price        60
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 3, &
                             NONE, 0, &
                             NONE, 0
                
                ; 72: Short Spear
                equipFlags   KNTE|PLDN|PGNT
                equipFlags2  NONE
                range        1, 2
                price        120
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 6, &
                             NONE, 0, &
                             NONE, 0
                
                ; 73: Bronze Lance
                equipFlags   KNTE|PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        260
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 9, &
                             NONE, 0, &
                             NONE, 0
                
                ; 74: Spear
                equipFlags   KNTE|PLDN|PGNT
                equipFlags2  NONE
                range        1, 2
                price        460
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 12, &
                             NONE, 0, &
                             NONE, 0
                
                ; 75: Steel Lance
                equipFlags   KNTE|PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        810
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 16, &
                             NONE, 0, &
                             NONE, 0
                
                ; 76: Power Spear
                equipFlags   KNTE|PLDN|PGNT
                equipFlags2  NONE
                range        1, 2
                price        1270
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 20, &
                             NONE, 0, &
                             NONE, 0
                
                ; 77: Heavy Lance
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        1600
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 23, &
                             NONE, 0, &
                             NONE, 0
                
                ; 78: Javelin
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 2
                price        3400
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 26, &
                             NONE, 0, &
                             NONE, 0
                
                ; 79: Chrome Lance
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        6900
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 31, &
                             NONE, 0, &
                             NONE, 0
                
                ; 80: Valkyrie
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 2
                price        7700
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     ATTACK
                equipEffects INCREASE_ATT, 33, &
                             NONE, 0, &
                             NONE, 0
                
                ; 81: Holy Lance
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        9300
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     HEALIN
                equipEffects INCREASE_ATT, 39, &
                             INCREASE_DEF, 5, &
                             NONE, 0
                
                ; 82: Mist Javelin
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 2
                price        9900
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 42, &
                             NONE, 0, &
                             NONE, 0
                
                ; 83: Halberd
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        7300
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     BOLT
                equipEffects INCREASE_ATT, 37, &
                             NONE, 0, &
                             NONE, 0
                
                ; 84: Evil Lance
                equipFlags   PLDN|PGNT
                equipFlags2  NONE
                range        1, 1
                price        11000
                itemType     WEAPON|RARE|CURSED
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 48, &
                             DECREASE_MOV, 2, &
                             NONE, 0
                
                ; 85: Wooden Rod
                equipFlags   MAGE|PRST|WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        60
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 3, &
                             NONE, 0, &
                             NONE, 0
                
                ; 86: Short Rod
                equipFlags   MAGE|PRST|WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        130
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 87: Bronze Rod
                equipFlags   MAGE|PRST|WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        360
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 8, &
                             NONE, 0, &
                             NONE, 0
                
                ; 88: Iron Rod
                equipFlags   MAGE|PRST|WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        560
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 12, &
                             NONE, 0, &
                             NONE, 0
                
                ; 89: Power Stick
                equipFlags   MAGE|PRST|WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        1050
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 15, &
                             NONE, 0, &
                             NONE, 0
                
                ; 90: Flail
                equipFlags   WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        1490
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 19, &
                             NONE, 0, &
                             NONE, 0
                
                ; 91: Guardian Staff
                equipFlags   WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        2380
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 22, &
                             INCREASE_DEF, 5, &
                             NONE, 0
                
                ; 92: Indra Staff
                equipFlags   WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        3200
                itemType     WEAPON|BREAKABLE
                useSpell     SPOIT
                equipEffects INCREASE_ATT, 25, &
                             NONE, 0, &
                             NONE, 0
                
                ; 93: Mage Staff
                equipFlags   WIZ|SORC
                equipFlags2  NONE
                range        1, 1
                price        6300
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     BLAZE|LV2
                equipEffects INCREASE_ATT, 27, &
                             NONE, 0, &
                             NONE, 0
                
                ; 94: Wish Staff
                equipFlags   VICR
                equipFlags2  NONE
                range        1, 1
                price        6100
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     ATTACK
                equipEffects INCREASE_ATT, 26, &
                             NONE, 0, &
                             NONE, 0
                
                ; 95: Great Rod
                equipFlags   WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        7900
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 28, &
                             NONE, 0, &
                             NONE, 0
                
                ; 96: Supply Staff
                equipFlags   WIZ|SORC
                equipFlags2  NONE
                range        1, 1
                price        8500
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     SPOIT
                equipEffects INCREASE_ATT, 32, &
                             NONE, 0, &
                             NONE, 0
                
                ; 97: Holy Staff
                equipFlags   VICR
                equipFlags2  NONE
                range        1, 1
                price        9000
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 29, &
                             UNDEFINED1, 3, &
                             NONE, 0
                
                ; 98: Freeze Staff
                equipFlags   WIZ|SORC
                equipFlags2  NONE
                range        1, 1
                price        9500
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     FREEZE|LV3
                equipEffects INCREASE_ATT, 37, &
                             NONE, 0, &
                             NONE, 0
                
                ; 99: Goddess Staff
                equipFlags   VICR
                equipFlags2  NONE
                range        1, 1
                price        9700
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     AURA|LV2
                equipEffects INCREASE_ATT, 31, &
                             NONE, 0, &
                             NONE, 0
                
                ; 100: Mystery Staff
                equipFlags   WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        10000
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 39, &
                             UNDEFINED2, 2, &
                             NONE, 0
                
                ; 101: Demon Rod
                equipFlags   WIZ|SORC|VICR
                equipFlags2  NONE
                range        1, 1
                price        12500
                itemType     WEAPON|RARE|CURSED|BREAKABLE
                useSpell     SPOIT
                equipEffects INCREASE_ATT, 50, &
                             DECREASE_AGI, 10, &
                             NONE, 0
                
                ; 102: Iron Ball
                equipFlags   NONE
                equipFlags2  NONE
                range        1, 1
                price        3800
                itemType     WEAPON|RARE|CURSED|BREAKABLE
                useSpell     BLAZE|LV3
                equipEffects INCREASE_ATT, 44, &
                             NONE, 0, &
                             NONE, 0
                
                ; 103: Short Knife
                equipFlags   THIF
                equipFlags2  NONE
                range        1, 1
                price        70
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 104: Dagger
                equipFlags   THIF
                equipFlags2  NONE
                range        1, 1
                price        320
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 8, &
                             NONE, 0, &
                             NONE, 0
                
                ; 105: Knife
                equipFlags   THIF
                equipFlags2  NONE
                range        1, 1
                price        500
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 12, &
                             NONE, 0, &
                             NONE, 0
                
                ; 106: Thieve's Dagger
                equipFlags   THIF
                equipFlags2  NONE
                range        1, 1
                price        940
                itemType     WEAPON
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 17, &
                             INCREASE_AGI, 5, &
                             NONE, 0
                
                ; 107: Katana
                equipFlags   NINJ
                equipFlags2  NONE
                range        1, 1
                price        9600
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 34, &
                             NONE, 0, &
                             NONE, 0
                
                ; 108: Ninja Katana
                equipFlags   NINJ
                equipFlags2  NONE
                range        1, 1
                price        11500
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 39, &
                             INCREASE_DOUBLE, 1, &
                             NONE, 0
                
                ; 109: Gisarme
                equipFlags   NINJ
                equipFlags2  NONE
                range        1, 1
                price        15000
                itemType     WEAPON|RARE
                useSpell     NOTHING
                equipEffects INCREASE_ATT, 42, &
                             SET_CRITICAL, 6, &
                             NONE, 0
                
                ; 110: Taros Sword
                equipFlags   NONE
                equipFlags2  NONE
                range        1, 2
                price        10000
                itemType     WEAPON|RARE|BREAKABLE
                useSpell     BOLT|LV2
                equipEffects INCREASE_ATT, 32, &
                             NONE, 0, &
                             NONE, 0
                
                ; 111: Right of Hope
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        10000
                itemType     RARE|CONSUMABLE
                useSpell     SHINE
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 112: Wooden Panel
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 113: Sky Orb
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 114: Cannon
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 115: Dry Stone
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 116: Dynamite
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 117: Arm of Golem
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 118: Pegasus Wing
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RARE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 119: Warrior Pride
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RARE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 120: Silver Tank
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RARE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 121: Secret Book
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RARE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 122: Vigor Ball
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        3000
                itemType     RARE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 123: Mithril
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        2000
                itemType     RARE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 124: Life Ring
                equipFlags   HERO|PLDN|PGNT|GLDT|BRN|WIZ|SORC|VICR|MMNK|SNIP|BRGN|BDBT|WFBR|BWNT|PHNX|NINJ|MNST|RBT|GLM|RDBN
                equipFlags2  NONE
                range        0, 0
                price        5000
                itemType     RING|RARE
                useSpell     NOTHING
                equipEffects UNDEFINED1, 5, &
                             NONE, 0, &
                             NONE, 0
                
                ; 125: Cotton Balloon
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     RARE|UNSELLABLE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 126: Chirrup Sandals
                equipFlags   ALL
                equipFlags2  NONE
                range        0, 0
                price        5
                itemType     RING|RARE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 127: Empty
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                
                ; 128: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 129: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 130: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 131: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 132: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 133: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 134: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 135: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 136: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 137: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 138: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 139: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 140: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 141: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 142: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 143: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 144: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 145: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 146: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 147: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 148: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 149: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 150: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 151: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 152: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 153: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 154: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 155: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 156: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 157: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 158: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 159: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 160: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 161: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 162: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 163: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 164: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 165: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 166: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 167: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 168: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 169: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 170: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 171: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 172: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 173: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 174: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 175: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 176: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 177: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 178: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 179: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 180: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 181: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 182: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 183: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 184: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 185: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 186: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 187: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 188: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 189: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 190: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 191:
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 192: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 193: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 194: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 195: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 196: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 197: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 198: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 199: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 200: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 201: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 202: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 203: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 204: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 205: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 206: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 207: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 208: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 209: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 210: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 211: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 212: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 213: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 214: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 215: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 216: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 217: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 218: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 219: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 220: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 221: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 222: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 223: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 224: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 225: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 226: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 227: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 228: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 229: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 230: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 231: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 232: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 233: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 234: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 235: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 236: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 237: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 238: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 239: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 240: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 241: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 242: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 243: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 244: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 245: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 246: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 247: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 248: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 249: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 250: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 251: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 252: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 253: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 254: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
                ; 255: 
                equipFlags   NONE
                equipFlags2  NONE
                range        0, 0
                price        0
                itemType     NONE
                useSpell     NOTHING
                equipEffects NONE, 0, &
                             NONE, 0, &
                             NONE, 0
                
            endif
