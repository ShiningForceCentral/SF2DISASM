
; ASM FILE data\stats\allies\stats\allystats01.asm :
; 0x1EE31C..0x1EE36B : Ally stats 01
AllyStats01:    forClass  PRST
                hpGrowth  11, 41, LINEAR
                mpGrowth  10, 42, EARLY
                attGrowth 6, 26, LINEAR
                defGrowth 5, 25, LINEAR
                agiGrowth 5, 31, LINEAR
                spellList &
                    1, HEAL, &
                    4, DETOX, &
                    7, HEAL|LV2, &
                    10, BLAST, &
                    13, DETOX|LV2, &
                    16, BLAST|LV2, &
                    19, SLOW, &
                    22, HEAL|LV3, &
                    25, BLAST|LV3, &
                    29, SLOW|LV2, &
                    33, DETOX|LV3, &
                    36, BLAST|LV4, &
                    40, HEAL|LV4, &
                    45, DETOX|LV4
                    
                forClass  VICR
                hpGrowth  30, 84, LINEAR
                mpGrowth  33, 66, LINEAR
                attGrowth 19, 34, LINEAR
                defGrowth 18, 59, LINEAR
                agiGrowth 22, 61, MIDDLE
                useFirstSpellList
                    
                forClass  MMNK
                hpGrowth  30, 84, LINEAR
                mpGrowth  23, 58, LINEAR
                attGrowth 19, 50, LINEAR
                defGrowth 18, 69, LATE
                agiGrowth 22, 61, MIDDLE
                useFirstSpellList
                    
