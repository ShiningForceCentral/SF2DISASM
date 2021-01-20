
; ASM FILE data\stats\allies\stats\allystats27.asm :
; 0x1EE782..0x1EE7AD : Ally stats 27
AllyStats27:    forClass  WIZ
                hpGrowth  28, 83, LINEAR
                mpGrowth  42, 88, LINEAR
                attGrowth 15, 29, LINEAR
                defGrowth 17, 61, MIDDLE
                agiGrowth 27, 58, LINEAR
                spellList &
                    1, BLAZE, &
                    6, FREEZE, &
                    11, BLAZE|LV2, &
                    17, FREEZE|LV2, &
                    25, FREEZE|LV3, &
                    40, BOLT, &
                    41, DISPEL, &
                    44, BOLT|LV2, &
                    46, FREEZE|LV4, &
                    49, BOLT|LV3, &
                    53, BOLT|LV4, &
                    56, BLAZE|LV3, &
                    60, BLAZE|LV4
                    
