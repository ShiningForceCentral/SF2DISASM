
; ASM FILE data\stats\allies\stats\allystats27.asm :
; 0x1EE782..0x1EE7AD : Ally stats 27
AllyStats27:    forClass CLASS_WIZ
                hpGrowth 28, 83, GROWTHCURVE_LINEAR
                mpGrowth 42, 88, GROWTHCURVE_LINEAR
                atkGrowth 15, 29, GROWTHCURVE_LINEAR
                defGrowth 17, 61, GROWTHCURVE_MIDDLE
                agiGrowth 27, 58, GROWTHCURVE_LINEAR
                spellList &
                    1, SPELL_BLAZE, &
                    6, SPELL_FREEZE, &
                    11, SPELL_BLAZE|SPELL_LV2, &
                    17, SPELL_FREEZE|SPELL_LV2, &
                    25, SPELL_FREEZE|SPELL_LV3, &
                    40, SPELL_BOLT, &
                    41, SPELL_DISPEL, &
                    44, SPELL_BOLT|SPELL_LV2, &
                    46, SPELL_FREEZE|SPELL_LV4, &
                    49, SPELL_BOLT|SPELL_LV3, &
                    53, SPELL_BOLT|SPELL_LV4, &
                    56, SPELL_BLAZE|SPELL_LV3, &
                    60, SPELL_BLAZE|SPELL_LV4
                    
