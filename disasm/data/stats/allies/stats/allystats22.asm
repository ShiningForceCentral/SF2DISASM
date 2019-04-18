
; ASM FILE data\stats\allies\stats\allystats22.asm :
; 0x1EE6FB..0x1EE726 : Ally stats 22
AllyStats22:    forClass CLASS_VICR
                hpGrowth 30, 81, GROWTHCURVE_LINEAR
                mpGrowth 32, 74, GROWTHCURVE_LINEAR
                atkGrowth 18, 42, GROWTHCURVE_LINEAR
                defGrowth 18, 59, GROWTHCURVE_LATE
                agiGrowth 22, 58, GROWTHCURVE_LINEAR
                spellList &
                    1, SPELL_HEAL, &
                    5, SPELL_DETOX, &
                    13, SPELL_HEAL|SPELL_LV2, &
                    17, SPELL_DETOX|SPELL_LV2, &
                    34, SPELL_AURA, &
                    37, SPELL_DETOX|SPELL_LV3, &
                    40, SPELL_AURA|SPELL_LV2, &
                    43, SPELL_DETOX|SPELL_LV4, &
                    46, SPELL_AURA|SPELL_LV3, &
                    49, SPELL_ATTACK, &
                    52, SPELL_AURA|SPELL_LV4, &
                    56, SPELL_HEAL|SPELL_LV3, &
                    60, SPELL_HEAL|SPELL_LV4
                    
