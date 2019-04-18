
; ASM FILE data\stats\allies\stats\allystats25.asm :
; 0x1EE748..0x1EE771 : Ally stats 25
AllyStats25:    forClass CLASS_MMNK
                hpGrowth 29, 79, GROWTHCURVE_LINEAR
                mpGrowth 31, 65, GROWTHCURVE_LINEAR
                atkGrowth 19, 36, GROWTHCURVE_LINEAR
                defGrowth 19, 61, GROWTHCURVE_EARLYANDLATE
                agiGrowth 21, 62, GROWTHCURVE_LINEAR
                spellList &
                    1, SPELL_HEAL, &
                    5, SPELL_HEAL|SPELL_LV2, &
                    7, SPELL_BLAST, &
                    11, SPELL_MUDDLE, &
                    18, SPELL_BLAST|SPELL_LV2, &
                    20, SPELL_BOOST, &
                    36, SPELL_MUDDLE|SPELL_LV2, &
                    38, SPELL_BLAST|SPELL_LV3, &
                    41, SPELL_HEAL|SPELL_LV3, &
                    44, SPELL_BOOST|SPELL_LV2, &
                    47, SPELL_BLAST|SPELL_LV4, &
                    51, SPELL_HEAL|SPELL_LV4
                    
