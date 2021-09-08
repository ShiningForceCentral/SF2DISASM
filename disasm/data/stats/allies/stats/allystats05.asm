
; ASM FILE data\stats\allies\stats\allystats05.asm :
; 0x1EE426..0x1EE454 : Ally stats 05
AllyStats05:    forClass  THIF
                hpGrowth  8, 42, LATE
                mpGrowth  0, 0, NONE
                attGrowth 5, 45, LATE
                defGrowth 6, 38, LATE
                agiGrowth 6, 38, LATE
                spellList 
                    
                forClass  NINJ
                hpGrowth  28, 90, LATE
                mpGrowth  0, 50, LINEAR
                attGrowth 29, 53, LATE
                defGrowth 25, 82, LATE
                agiGrowth 25, 72, LATE
                spellList &
                    24, KATON, &
                    29, KATON|LV2, &
                    34, RAIJIN, &
                    39, RAIJIN|LV2, &
                    45, KATON|LV3, &
                    52, RAIJIN|LV3
                    
