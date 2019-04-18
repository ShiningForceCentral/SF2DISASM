
; ASM FILE data\stats\items\itemdefs.asm :
; 0x16EA6..0x176A6 : Item definitions
ItemDefs:       equipFlags 0            ; Medical Herb
                range 0, 1
                price 10
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_HEALIN
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Healing Seed
                range 0, 1
                price 200
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_HEALIN|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Healing Drop
                range 0, 1
                price 300
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_HEALIN|SPELL_LV3
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Antidote
                range 0, 1
                price 20
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_DETOX
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Angel Wing
                range 0, 0
                price 40
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_EGRESS
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Fairy Powder
                range 0, 1
                price 100
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_POWDER
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Healing Water
                range 0, 1
                price 400
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_HEAL|SPELL_LV4
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Fairy Tear
                range 0, 1
                price 300
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_G_TEAR|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Healing Rain
                range 0, 0
                price 10000
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_AURA|SPELL_LV4
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Power Water
                range 0, 0
                price 500
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_POWER
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Protect Milk
                range 0, 0
                price 500
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_GUARD
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Quick Chicken
                range 0, 0
                price 500
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_SPEED
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Running Pimento
                range 0, 0
                price 1500
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_IDATEN
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Cheerful Bread
                range 0, 0
                price 500
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_HEALTH
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Bright Honey
                range 0, 0
                price 500
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_HANNY
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Brave Apple
                range 0, 0
                price 500
                itemType &
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_BRAVE
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Shining Ball
                range 0, 1
                price 1000
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_FBALL
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Blizzard
                range 0, 1
                price 1200
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_BREZAD
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Holy Thunder
                range 0, 1
                price 1500
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_THUNDR
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags EQUIPFLAGS_ALL ; Power Ring
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_ATTACK
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags EQUIPFLAGS_ALL ; Protect Ring
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BOOST
                equipEffects &
                    EQUIPEFFECT_INCREASE_DEF, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags EQUIPFLAGS_ALL ; Quick Ring
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_AGI, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags EQUIPFLAGS_ALL ; Running Ring
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_MOV, 2, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; White Ring
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_VICR
                range 0, 0
                price 5000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_AURA|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_DEF, 10, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Black Ring
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC
                range 0, 0
                price 5000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BLAZE|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 10, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Evil Ring
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 0, 0
                price 5000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BOLT|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 15, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Leather Glove
                    EQUIPFLAG_MMNK
                range 1, 1
                price 1300
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 26, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Power Glove
                    EQUIPFLAG_MMNK
                range 1, 1
                price 1800
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 33, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Brass Knuckles
                    EQUIPFLAG_MMNK
                range 1, 1
                price 2900
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 39, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Iron Knuckles
                    EQUIPFLAG_MMNK
                range 1, 1
                price 4800
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 43, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Misty Knuckles
                    EQUIPFLAG_MMNK
                range 1, 1
                price 5500
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_SPOIT
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 48, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Giant Knuckles
                    EQUIPFLAG_MMNK
                range 1, 1
                price 7500
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_MUDDLE
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 55, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Evil Knuckles
                    EQUIPFLAG_MMNK
                range 1, 1
                price 9500
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 63, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Short Axe
                    EQUIPFLAG_WARR|&
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 120
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Hand Axe
                    EQUIPFLAG_WARR|&
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 340
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 9, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Middle Axe
                    EQUIPFLAG_WARR|&
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 610
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 13, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Power Axe
                    EQUIPFLAG_WARR|&
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 1100
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 17, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Battle Axe
                    EQUIPFLAG_WARR|&
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 1370
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 21, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Large Axe
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 2250
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 25, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Great Axe
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 4600
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 28, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Heat Axe
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 7200
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BLAZE|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 32, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Atlas Axe
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 9600
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BLAZE|SPELL_LV3
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 35, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Ground Axe
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 10000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 39, &
                    EQUIPEFFECT_INCREASE_MOV, 1, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Rune Axe
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 10000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_DETOX|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 42, &
                    EQUIPEFFECT_INCREASE_CRITICAL, 1, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Evil Axe
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 15000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 50, &
                    EQUIPEFFECT_DECREASE_DEF, 5, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Wooden Arrow
                    EQUIPFLAG_ACHR|&
                    EQUIPFLAG_RNGR|&
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 2
                price 250
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 7, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Iron Arrow
                    EQUIPFLAG_ACHR|&
                    EQUIPFLAG_RNGR|&
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 2
                price 600
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 12, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Steel Arrow
                    EQUIPFLAG_ACHR|&
                    EQUIPFLAG_RNGR|&
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 2
                price 1270
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 17, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Robin Arrow
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 1480
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 21, &
                    EQUIPEFFECT_INCREASE_CRITICAL, 1, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Assault Shell
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 2500
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 25, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Great Shot
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 5000
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 29, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Nazca Cannon
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 3000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 33, &
                    EQUIPEFFECT_INCREASE_CRITICAL, 1, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Buster Shot
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 6800
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 37, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Hyper Cannon
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 8700
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 40, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Grand Cannon
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 9800
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_DISPEL
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 43, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Evil Shot
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BWNT
                range 2, 3
                price 13000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 51, &
                    EQUIPEFFECT_DECREASE_DEF, 5, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Wooden Stick
                    EQUIPFLAG_KNTE|&
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 70
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 3, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Short Sword
                    EQUIPFLAG_SDMN|&
                    EQUIPFLAG_BDMN|&
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 140
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Middle Sword
                    EQUIPFLAG_SDMN|&
                    EQUIPFLAG_BDMN|&
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 340
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 8, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Long Sword
                    EQUIPFLAG_SDMN|&
                    EQUIPFLAG_BDMN|&
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 620
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 12, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Steel Sword
                    EQUIPFLAG_SDMN|&
                    EQUIPFLAG_BDMN|&
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 1120
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 16, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Achilles Sword
                    EQUIPFLAG_SDMN|&
                    EQUIPFLAG_HERO
                range 1, 1
                price 1350
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 19, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Broad Sword
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 1600
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 22, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Buster Sword
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 2600
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 26, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Great Sword
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 5100
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 29, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Critical Sword
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 7200
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 32, &
                    EQUIPEFFECT_INCREASE_CRITICAL, 1, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Battle Sword
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 9200
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 35, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Force Sword
                    EQUIPFLAG_HERO
                range 1, 1
                price 10000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 46, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Counter Sword
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 13000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 39, &
                    EQUIPEFFECT_INCREASE_COUNTER, 1, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Levanter
                    EQUIPFLAG_HERO
                range 1, 1
                price 14000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BLAZE|SPELL_LV3
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 42, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Dark Sword
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 17000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_DESOUL
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 50, &
                    EQUIPEFFECT_DECREASE_DEF, 5, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Wooden Sword
                    EQUIPFLAG_SDMN|&
                    EQUIPFLAG_BDMN|&
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_RDBN
                range 1, 1
                price 60
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 3, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Short Spear
                    EQUIPFLAG_KNTE|&
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 2
                price 120
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 6, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Bronze Lance
                    EQUIPFLAG_KNTE|&
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 260
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 9, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Spear
                    EQUIPFLAG_KNTE|&
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 2
                price 460
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 12, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Steel Lance
                    EQUIPFLAG_KNTE|&
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 810
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 16, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Power Spear
                    EQUIPFLAG_KNTE|&
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 2
                price 1270
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 20, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Heavy Lance
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 1600
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 23, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Javelin
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 2
                price 3400
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 26, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Chrome Lance
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 6900
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 31, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Valkyrie
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 2
                price 7700
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_ATTACK
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 33, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Holy Lance
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 9300
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_HEALIN
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 39, &
                    EQUIPEFFECT_INCREASE_DEF, 5, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Mist Javelin
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 2
                price 9900
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 42, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Halberd
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 7300
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BOLT
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 37, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Evil Lance
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT
                range 1, 1
                price 11000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 48, &
                    EQUIPEFFECT_DECREASE_MOV, 2, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Wooden Rod
                    EQUIPFLAG_MAGE|&
                    EQUIPFLAG_PRST|&
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 60
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 3, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Short Rod
                    EQUIPFLAG_MAGE|&
                    EQUIPFLAG_PRST|&
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 130
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Bronze Rod
                    EQUIPFLAG_MAGE|&
                    EQUIPFLAG_PRST|&
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 360
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 8, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Iron Rod
                    EQUIPFLAG_MAGE|&
                    EQUIPFLAG_PRST|&
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 560
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 12, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Power Stick
                    EQUIPFLAG_MAGE|&
                    EQUIPFLAG_PRST|&
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 1050
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 15, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Flail
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 1490
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 19, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Guardian Staff
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 2380
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 22, &
                    EQUIPEFFECT_INCREASE_DEF, 5, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Indra Staff
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 3200
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_SPOIT
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 25, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Mage Staff
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC
                range 1, 1
                price 6300
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BLAZE|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 27, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Wish Staff
                    EQUIPFLAG_VICR
                range 1, 1
                price 6100
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_ATTACK
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 26, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Great Rod
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 7900
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 28, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Supply Staff
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC
                range 1, 1
                price 8500
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_SPOIT
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 32, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Holy Staff
                    EQUIPFLAG_VICR
                range 1, 1
                price 9000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 29, &
                    EQUIPEFFECT_UNDEFINED1, 3, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Freeze Staff
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC
                range 1, 1
                price 9500
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_FREEZE|SPELL_LV3
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 37, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Goddess Staff
                    EQUIPFLAG_VICR
                range 1, 1
                price 9700
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_AURA|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 31, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Mystery Staff
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 10000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 39, &
                    EQUIPEFFECT_UNDEFINED2, 2, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Demon Rod
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR
                range 1, 1
                price 12500
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_SPOIT
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 50, &
                    EQUIPEFFECT_DECREASE_AGI, 10, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Iron Ball
                range 1, 1
                price 3800
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CURSED|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BLAZE|SPELL_LV3
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 44, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Short Knife
                    EQUIPFLAG_THIF
                range 1, 1
                price 70
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Dagger
                    EQUIPFLAG_THIF
                range 1, 1
                price 320
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 8, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Knife
                    EQUIPFLAG_THIF
                range 1, 1
                price 500
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 12, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Thieve's Dagger
                    EQUIPFLAG_THIF
                range 1, 1
                price 940
                itemType &
                    ITEMTYPE_WEAPON
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 17, &
                    EQUIPEFFECT_INCREASE_AGI, 5, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Katana
                    EQUIPFLAG_NINJ
                range 1, 1
                price 9600
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 34, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Ninja Katana
                    EQUIPFLAG_NINJ
                range 1, 1
                price 11500
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 39, &
                    EQUIPEFFECT_INCREASE_DOUBLE, 1, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Gisarme
                    EQUIPFLAG_NINJ
                range 1, 1
                price 15000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 42, &
                    EQUIPEFFECT_SET_CRITICAL, 6, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Taros Sword
                range 1, 2
                price 10000
                itemType &
                    ITEMTYPE_WEAPON|&
                    ITEMTYPE_RARE|&
                    ITEMTYPE_MAGICAL
                useSpell SPELL_BOLT|SPELL_LV2
                equipEffects &
                    EQUIPEFFECT_INCREASE_ATK, 32, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Right of Hope
                range 0, 0
                price 10000
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_CONSUMABLE
                useSpell SPELL_SHINE
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Wooden Panel
                range 0, 0
                price 0
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Sky Orb
                range 0, 0
                price 0
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Cannon
                range 0, 0
                price 0
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Dry Stone
                range 0, 0
                price 0
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Dynamite
                range 0, 0
                price 0
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Arm of Golem
                range 0, 0
                price 0
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Pegasus Wing
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Warrior Pride
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Silver Tank
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Secret Book
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Vigor Ball
                range 0, 0
                price 3000
                itemType &
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Mithril
                range 0, 0
                price 2000
                itemType &
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags &            ; Life Ring
                    EQUIPFLAG_HERO|&
                    EQUIPFLAG_PLDN|&
                    EQUIPFLAG_PGNT|&
                    EQUIPFLAG_GLDT|&
                    EQUIPFLAG_BRN|&
                    EQUIPFLAG_WIZ|&
                    EQUIPFLAG_SORC|&
                    EQUIPFLAG_VICR|&
                    EQUIPFLAG_MMNK|&
                    EQUIPFLAG_SNIP|&
                    EQUIPFLAG_BRGN|&
                    EQUIPFLAG_BDBT|&
                    EQUIPFLAG_WFBR|&
                    EQUIPFLAG_BWNT|&
                    EQUIPFLAG_PHNX|&
                    EQUIPFLAG_NINJ|&
                    EQUIPFLAG_MNST|&
                    EQUIPFLAG_RBT|&
                    EQUIPFLAG_GLM|&
                    EQUIPFLAG_RDBN
                range 0, 0
                price 5000
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_UNDEFINED1, 5, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Cotton Balloon
                range 0, 0
                price 0
                itemType &
                    ITEMTYPE_RARE|&
                    ITEMTYPE_UNSELLABLE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags EQUIPFLAGS_ALL ; Chirrup Sandals
                range 0, 0
                price 5
                itemType &
                    ITEMTYPE_RING|&
                    ITEMTYPE_RARE
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
                equipFlags 0            ; Empty
                range 0, 0
                price 0
                itemType 0
                useSpell SPELL_NOTHING
                equipEffects &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0, &
                    EQUIPEFFECT_NONE, 0
                    
