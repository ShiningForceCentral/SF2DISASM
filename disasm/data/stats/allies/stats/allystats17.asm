
; ASM FILE data\stats\allies\stats\allystats17.asm :
; 0x1EE628..0x1EE685 : Ally stats 17
AllyStats17:    forClass CLASS_MAGE
                hpGrowth 8, 28, GROWTHCURVE_LINEAR
                mpGrowth 6, 54, GROWTHCURVE_EARLY
                atkGrowth 4, 22, GROWTHCURVE_LINEAR
                defGrowth 3, 27, GROWTHCURVE_LINEAR
                agiGrowth 7, 33, GROWTHCURVE_LINEAR
                spellList &
                    1, SPELL_BLAZE, &
                    5, SPELL_FREEZE, &
                    11, SPELL_BLAZE|SPELL_LV2, &
                    22, SPELL_FREEZE|SPELL_LV2, &
                    25, SPELL_SLEEP, &
                    28, SPELL_BOLT, &
                    31, SPELL_FREEZE|SPELL_LV3, &
                    35, SPELL_BOLT|SPELL_LV2, &
                    38, SPELL_FREEZE|SPELL_LV4, &
                    51, SPELL_BLAZE|SPELL_LV3, &
                    54, SPELL_BOLT|SPELL_LV3, &
                    56, SPELL_BLAZE|SPELL_LV4, &
                    60, SPELL_BOLT|SPELL_LV4
                    
                forClass CLASS_WIZ
                hpGrowth 21, 69, GROWTHCURVE_LINEAR
                mpGrowth 40, 80, GROWTHCURVE_LINEAR
                atkGrowth 16, 30, GROWTHCURVE_EARLYANDLATE
                defGrowth 19, 57, GROWTHCURVE_EARLY
                agiGrowth 24, 66, GROWTHCURVE_LINEAR
                useFirstSpellList
                    
                forClass CLASS_SORC
                hpGrowth 21, 69, GROWTHCURVE_LINEAR
                mpGrowth 40, 87, GROWTHCURVE_LINEAR
                atkGrowth 16, 30, GROWTHCURVE_EARLYANDLATE
                defGrowth 19, 60, GROWTHCURVE_EARLY
                agiGrowth 24, 58, GROWTHCURVE_LINEAR
                spellList &
                    21, SPELL_DAO, &
                    23, SPELL_APOLLO, &
                    28, SPELL_NEPTUN, &
                    32, SPELL_DAO|SPELL_LV2, &
                    36, SPELL_APOLLO|SPELL_LV2, &
                    40, SPELL_ATLAS, &
                    45, SPELL_NEPTUN|SPELL_LV2, &
                    49, SPELL_ATLAS|SPELL_LV2
                    
