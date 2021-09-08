
; ASM FILE data\stats\allies\stats\allystats15.asm :
; 0x1EE5A8..0x1EE5F5 : Ally stats 15
AllyStats15:    forClass  PRST
                hpGrowth  5, 48, LINEAR
                mpGrowth  5, 56, LINEAR
                attGrowth 5, 26, LINEAR
                defGrowth 6, 27, LINEAR
                agiGrowth 6, 29, LINEAR
                spellList &
                    1, HEAL, &
                    5, HEAL|LV2, &
                    8, BLAST, &
                    12, BOOST, &
                    16, BLAST|LV2, &
                    22, HEAL|LV3, &
                    26, BLAST|LV3, &
                    30, BOOST|LV2, &
                    33, AURA, &
                    37, BLAST|LV4, &
                    41, AURA|LV2, &
                    55, AURA|LV3, &
                    60, AURA|LV4
                    
                forClass  VICR
                hpGrowth  33, 92, LATE
                mpGrowth  38, 91, MIDDLE
                attGrowth 19, 23, MIDDLE
                defGrowth 20, 45, EARLYANDLATE
                agiGrowth 21, 62, LINEAR
                useFirstSpellList
                    
                forClass  MMNK
                hpGrowth  33, 92, LATE
                mpGrowth  38, 71, MIDDLE
                attGrowth 19, 46, MIDDLE
                defGrowth 20, 55, LATE
                agiGrowth 21, 62, LINEAR
                useFirstSpellList
                    
