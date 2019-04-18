
; ASM FILE data\stats\allies\stats\allystats21.asm :
; 0x1EE6DA..0x1EE6FB : Ally stats 21
AllyStats21:    forClass CLASS_SORC
                hpGrowth 24, 72, GROWTHCURVE_LINEAR
                mpGrowth 42, 85, GROWTHCURVE_LINEAR
                atkGrowth 14, 26, GROWTHCURVE_LINEAR
                defGrowth 17, 53, GROWTHCURVE_LINEAR
                agiGrowth 26, 68, GROWTHCURVE_LINEAR
                spellList &
                    21, SPELL_DAO, &
                    32, SPELL_APOLLO, &
                    35, SPELL_DAO|SPELL_LV2, &
                    39, SPELL_APOLLO|SPELL_LV2, &
                    42, SPELL_NEPTUN, &
                    45, SPELL_ATLAS, &
                    49, SPELL_NEPTUN|SPELL_LV2, &
                    54, SPELL_ATLAS|SPELL_LV2
                    
