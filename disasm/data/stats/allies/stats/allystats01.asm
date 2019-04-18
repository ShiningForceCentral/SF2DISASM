
; ASM FILE data\stats\allies\stats\allystats01.asm :
; 0x1EE31C..0x1EE36B : Ally stats 01
AllyStats01:    forClass CLASS_PRST
                hpGrowth 11, 41, GROWTHCURVE_LINEAR
                mpGrowth 10, 42, GROWTHCURVE_EARLY
                atkGrowth 6, 26, GROWTHCURVE_LINEAR
                defGrowth 5, 25, GROWTHCURVE_LINEAR
                agiGrowth 5, 31, GROWTHCURVE_LINEAR
                spellList &
                    1, SPELL_HEAL, &
                    4, SPELL_DETOX, &
                    7, SPELL_HEAL|SPELL_LV2, &
                    10, SPELL_BLAST, &
                    13, SPELL_DETOX|SPELL_LV2, &
                    16, SPELL_BLAST|SPELL_LV2, &
                    19, SPELL_SLOW, &
                    22, SPELL_HEAL|SPELL_LV3, &
                    25, SPELL_BLAST|SPELL_LV3, &
                    29, SPELL_SLOW|SPELL_LV2, &
                    33, SPELL_DETOX|SPELL_LV3, &
                    36, SPELL_BLAST|SPELL_LV4, &
                    40, SPELL_HEAL|SPELL_LV4, &
                    45, SPELL_DETOX|SPELL_LV4
                    
                forClass CLASS_VICR
                hpGrowth 30, 84, GROWTHCURVE_LINEAR
                mpGrowth 33, 66, GROWTHCURVE_LINEAR
                atkGrowth 19, 34, GROWTHCURVE_LINEAR
                defGrowth 18, 59, GROWTHCURVE_LINEAR
                agiGrowth 22, 61, GROWTHCURVE_MIDDLE
                useFirstSpellList
                    
                forClass CLASS_MMNK
                hpGrowth 30, 84, GROWTHCURVE_LINEAR
                mpGrowth 23, 58, GROWTHCURVE_LINEAR
                atkGrowth 19, 50, GROWTHCURVE_LINEAR
                defGrowth 18, 69, GROWTHCURVE_LATE
                agiGrowth 22, 61, GROWTHCURVE_MIDDLE
                useFirstSpellList
                    
