
; ASM FILE data\stats\allies\stats\allystats04.asm :
; 0x1EE3D1..0x1EE426 : Ally stats 04
AllyStats04:    forClass  MAGE
                hpGrowth  10, 34, LINEAR
                mpGrowth  7, 54, EARLY
                attGrowth 4, 18, LINEAR
                defGrowth 4, 26, LINEAR
                agiGrowth 6, 42, LINEAR
                spellList &
                    1, BLAZE, &
                    5, BLAZE|LV2, &
                    9, MUDDLE, &
                    13, DISPEL, &
                    18, DESOUL, &
                    22, BLAZE|LV3, &
                    25, MUDDLE|LV2, &
                    29, DESOUL|LV2, &
                    35, BLAZE|LV4
                    
                forClass  WIZ
                hpGrowth  26, 77, LATE
                mpGrowth  40, 83, LINEAR
                attGrowth 13, 28, LINEAR
                defGrowth 18, 57, LINEAR
                agiGrowth 29, 83, EARLYANDLATE
                useFirstSpellList
                    
                forClass  SORC
                hpGrowth  26, 77, LATE
                mpGrowth  40, 90, LINEAR
                attGrowth 13, 28, LINEAR
                defGrowth 18, 60, LINEAR
                agiGrowth 29, 60, EARLYANDLATE
                spellList &
                    21, DAO, &
                    24, APOLLO, &
                    27, NEPTUN, &
                    32, DAO|LV2, &
                    37, APOLLO|LV2, &
                    41, ATLAS, &
                    46, NEPTUN|LV2, &
                    52, ATLAS|LV2
                    
