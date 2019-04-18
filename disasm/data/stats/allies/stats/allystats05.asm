
; ASM FILE data\stats\allies\stats\allystats05.asm :
; 0x1EE426..0x1EE454 : Ally stats 05
AllyStats05:    forClass CLASS_THIF
                hpGrowth 8, 42, GROWTHCURVE_LATE
                mpGrowth 0, 0, GROWTHCURVE_NONE
                atkGrowth 5, 45, GROWTHCURVE_LATE
                defGrowth 6, 38, GROWTHCURVE_LATE
                agiGrowth 6, 38, GROWTHCURVE_LATE
                spellList 
                    
                forClass CLASS_NINJ
                hpGrowth 28, 90, GROWTHCURVE_LATE
                mpGrowth 0, 50, GROWTHCURVE_LINEAR
                atkGrowth 29, 53, GROWTHCURVE_LATE
                defGrowth 25, 82, GROWTHCURVE_LATE
                agiGrowth 25, 72, GROWTHCURVE_LATE
                spellList &
                    24, SPELL_KATON, &
                    29, SPELL_KATON|SPELL_LV2, &
                    34, SPELL_RAIJIN, &
                    39, SPELL_RAIJIN|SPELL_LV2, &
                    45, SPELL_KATON|SPELL_LV3, &
                    52, SPELL_RAIJIN|SPELL_LV3
                    
