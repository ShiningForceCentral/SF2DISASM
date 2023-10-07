
; ASM FILE data\battles\global\regionactivatedcutscenes.asm :
; 0x47EC8..0x47EEA : Region-activated cutscenes data
table_BattleRegionCutscenes:
                dc.b BATTLE_TO_MOUN     ; battle index
                dc.b 0                  ; region index
                dc.w 386                ; associated flag
                dc.l rbcs_battle32
                dc.b BATTLE_TO_MOUN
                dc.b 1
                dc.w 386
                dc.l rbcs_battle32
                dc.b BATTLE_VERSUS_ODD_EYE
                dc.b 0
                dc.w 387
                dc.l rbcs_battle40_1
                dc.b BATTLE_VERSUS_ODD_EYE
                dc.b 1
                dc.w 388
                dc.l rbcs_battle40_2
                dc.w TERMINATOR_WORD
