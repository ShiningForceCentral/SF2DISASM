
; ASM FILE data\stats\allies\stats\allystats21.asm :
; 0x1EE6DA..0x1EE6FB : Ally stats 21
AllyStats21:    forClass  SORC
                hpGrowth  24, 72, LINEAR
                mpGrowth  42, 85, LINEAR
                attGrowth 14, 26, LINEAR
                defGrowth 17, 53, LINEAR
                agiGrowth 26, 68, LINEAR
                spellList &
                    21, DAO, &
                    32, APOLLO, &
                    35, DAO|LV2, &
                    39, APOLLO|LV2, &
                    42, NEPTUN, &
                    45, ATLAS, &
                    49, NEPTUN|LV2, &
                    54, ATLAS|LV2
                    
