
; ASM FILE data\battles\global\regionactivatedcutscenes.asm :
; 0x47EC8..0x47EEA : Region-activated cutscenes data
                dc.b 32                 ; battle id
                dc.b 0                  ; region id
                dc.w $182               ; associated flag
                dc.l rbcs_battle32
                dc.b 32
                dc.b 1
                dc.w $182
                dc.l rbcs_battle32
                dc.b 40
                dc.b 0
                dc.w $183
                dc.l rbcs_battle40_1
                dc.b $28
                dc.b 1
                dc.w $184
                dc.l rbcs_battle40_2
                dc.w $FFFF
