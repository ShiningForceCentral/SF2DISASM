
; ASM FILE data\stats\allies\stats\allystats17.asm :
; 0x1EE628..0x1EE685 : Ally stats 17
AllyStats17:    forClass  MAGE
                hpGrowth  8, 28, LINEAR
                mpGrowth  6, 54, EARLY
                attGrowth 4, 22, LINEAR
                defGrowth 3, 27, LINEAR
                agiGrowth 7, 33, LINEAR
                spellList &
                    1, BLAZE, &
                    5, FREEZE, &
                    11, BLAZE|LV2, &
                    22, FREEZE|LV2, &
                    25, SLEEP, &
                    28, BOLT, &
                    31, FREEZE|LV3, &
                    35, BOLT|LV2, &
                    38, FREEZE|LV4, &
                    51, BLAZE|LV3, &
                    54, BOLT|LV3, &
                    56, BLAZE|LV4, &
                    60, BOLT|LV4
                    
                forClass  WIZ
                hpGrowth  21, 69, LINEAR
                mpGrowth  40, 80, LINEAR
                attGrowth 16, 30, EARLYANDLATE
                defGrowth 19, 57, EARLY
                agiGrowth 24, 66, LINEAR
                useFirstSpellList
                    
                forClass  SORC
                hpGrowth  21, 69, LINEAR
                mpGrowth  40, 87, LINEAR
                attGrowth 16, 30, EARLYANDLATE
                defGrowth 19, 60, EARLY
                agiGrowth 24, 58, LINEAR
                spellList &
                    21, DAO, &
                    23, APOLLO, &
                    28, NEPTUN, &
                    32, DAO|LV2, &
                    36, APOLLO|LV2, &
                    40, ATLAS, &
                    45, NEPTUN|LV2, &
                    49, ATLAS|LV2
                    
