
; ASM FILE data\stats\allies\stats\allystats04.asm :
; 0x1EE3D1..0x1EE426 : Ally stats 04
AllyStats04:    forClass CLASS_MAGE
                hpGrowth 10, 34, GROWTHCURVE_LINEAR
                mpGrowth 7, 54, GROWTHCURVE_EARLY
                atkGrowth 4, 18, GROWTHCURVE_LINEAR
                defGrowth 4, 26, GROWTHCURVE_LINEAR
                agiGrowth 6, 42, GROWTHCURVE_LINEAR
                spellList &
                    1, SPELL_BLAZE, &
                    5, SPELL_BLAZE|SPELL_LV2, &
                    9, SPELL_MUDDLE, &
                    13, SPELL_DISPEL, &
                    18, SPELL_DESOUL, &
                    22, SPELL_BLAZE|SPELL_LV3, &
                    25, SPELL_MUDDLE|SPELL_LV2, &
                    29, SPELL_DESOUL|SPELL_LV2, &
                    35, SPELL_BLAZE|SPELL_LV4
                    
                forClass CLASS_WIZ
                hpGrowth 26, 77, GROWTHCURVE_LATE
                mpGrowth 40, 83, GROWTHCURVE_LINEAR
                atkGrowth 13, 28, GROWTHCURVE_LINEAR
                defGrowth 18, 57, GROWTHCURVE_LINEAR
                agiGrowth 29, 83, GROWTHCURVE_EARLYANDLATE
                useFirstSpellList
                    
                forClass CLASS_SORC
                hpGrowth 26, 77, GROWTHCURVE_LATE
                mpGrowth 40, 90, GROWTHCURVE_LINEAR
                atkGrowth 13, 28, GROWTHCURVE_LINEAR
                defGrowth 18, 60, GROWTHCURVE_LINEAR
                agiGrowth 29, 60, GROWTHCURVE_EARLYANDLATE
                spellList &
                    21, SPELL_DAO, &
                    24, SPELL_APOLLO, &
                    27, SPELL_NEPTUN, &
                    32, SPELL_DAO|SPELL_LV2, &
                    37, SPELL_APOLLO|SPELL_LV2, &
                    41, SPELL_ATLAS, &
                    46, SPELL_NEPTUN|SPELL_LV2, &
                    52, SPELL_ATLAS|SPELL_LV2
                    
