
; ASM FILE data\stats\allies\stats\allystats22.asm :
; 0x1EE6FB..0x1EE726 : Ally stats 22
AllyStats22:    forClass  VICR
                hpGrowth  30, 81, LINEAR
                mpGrowth  32, 74, LINEAR
                attGrowth 18, 42, LINEAR
                defGrowth 18, 59, LATE
                agiGrowth 22, 58, LINEAR
                spellList &
                    1, HEAL, &
                    5, DETOX, &
                    13, HEAL|LV2, &
                    17, DETOX|LV2, &
                    34, AURA, &
                    37, DETOX|LV3, &
                    40, AURA|LV2, &
                    43, DETOX|LV4, &
                    46, AURA|LV3, &
                    49, ATTACK, &
                    52, AURA|LV4, &
                    56, HEAL|LV3, &
                    60, HEAL|LV4
                    
