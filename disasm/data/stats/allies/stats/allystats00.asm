
; ASM FILE data\stats\allies\stats\allystats00.asm :
; 0x1EE2F0..0x1EE31C : Ally stats 00
AllyStats00:    ; forClass  enum Classes : CLASS_*
; ___Growth Starting value, Projected value, enum GrowthCurves : GROWTHCURVE_*
; spellList Level learned at, enum Spells : SPELL_*
    
                forClass SDMN
                hpGrowth 12, 58, LINEAR
                mpGrowth 8, 16, EARLY
                atkGrowth 6, 40, LINEAR
                defGrowth 4, 36, LINEAR
                agiGrowth 4, 32, EARLY
                spellList &
                    1, EGRESS, &
                    22, BOLT, &
                    31, BOLT|LV2, &
                    42, BOLT|LV3, &
                    51, BOLT|LV4
                    
                forClass HERO
                hpGrowth 42, 102, LINEAR
                mpGrowth 14, 23, EARLY
                atkGrowth 28, 57, LINEAR
                defGrowth 25, 93, LINEAR
                agiGrowth 24, 57, EARLYANDLATE
                useFirstSpellList
                    
