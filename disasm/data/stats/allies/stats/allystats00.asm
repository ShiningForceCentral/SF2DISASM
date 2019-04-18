
; ASM FILE data\stats\allies\stats\allystats00.asm :
; 0x1EE2F0..0x1EE31C : Ally stats 00
AllyStats00:    forClass CLASS_SDMN
                hpGrowth 12, 58, GROWTHCURVE_LINEAR
                mpGrowth 8, 16, GROWTHCURVE_EARLY
                atkGrowth 6, 40, GROWTHCURVE_LINEAR
                defGrowth 4, 36, GROWTHCURVE_LINEAR
                agiGrowth 4, 32, GROWTHCURVE_EARLY
                spellList &
                    1, SPELL_EGRESS, &
                    22, SPELL_BOLT, &
                    31, SPELL_BOLT|SPELL_LV2, &
                    42, SPELL_BOLT|SPELL_LV3, &
                    51, SPELL_BOLT|SPELL_LV4
                    
                forClass CLASS_HERO
                hpGrowth 42, 102, GROWTHCURVE_LINEAR
                mpGrowth 14, 23, GROWTHCURVE_EARLY
                atkGrowth 28, 57, GROWTHCURVE_LINEAR
                defGrowth 25, 93, GROWTHCURVE_LINEAR
                agiGrowth 24, 57, GROWTHCURVE_EARLYANDLATE
                useFirstSpellList
                    
