
; ASM FILE data\stats\allies\stats\allystats15.asm :
; 0x1EE5A8..0x1EE5F5 : Ally stats 15
AllyStats15:    forClass CLASS_PRST
                hpGrowth 5, 48, GROWTHCURVE_LINEAR
                mpGrowth 5, 56, GROWTHCURVE_LINEAR
                atkGrowth 5, 26, GROWTHCURVE_LINEAR
                defGrowth 6, 27, GROWTHCURVE_LINEAR
                agiGrowth 6, 29, GROWTHCURVE_LINEAR
                spellList &
                    1, SPELL_HEAL, &
                    5, SPELL_HEAL|SPELL_LV2, &
                    8, SPELL_BLAST, &
                    12, SPELL_BOOST, &
                    16, SPELL_BLAST|SPELL_LV2, &
                    22, SPELL_HEAL|SPELL_LV3, &
                    26, SPELL_BLAST|SPELL_LV3, &
                    30, SPELL_BOOST|SPELL_LV2, &
                    33, SPELL_AURA, &
                    37, SPELL_BLAST|SPELL_LV4, &
                    41, SPELL_AURA|SPELL_LV2, &
                    55, SPELL_AURA|SPELL_LV3, &
                    60, SPELL_AURA|SPELL_LV4
                    
                forClass CLASS_VICR
                hpGrowth 33, 92, GROWTHCURVE_LATE
                mpGrowth 38, 91, GROWTHCURVE_MIDDLE
                atkGrowth 19, 23, GROWTHCURVE_MIDDLE
                defGrowth 20, 45, GROWTHCURVE_EARLYANDLATE
                agiGrowth 21, 62, GROWTHCURVE_LINEAR
                useFirstSpellList
                    
                forClass CLASS_MMNK
                hpGrowth 33, 92, GROWTHCURVE_LATE
                mpGrowth 38, 71, GROWTHCURVE_MIDDLE
                atkGrowth 19, 46, GROWTHCURVE_MIDDLE
                defGrowth 20, 55, GROWTHCURVE_LATE
                agiGrowth 21, 62, GROWTHCURVE_LINEAR
                useFirstSpellList
                    
