
; ASM FILE data\maps\entries\map03\mapsetups\s6_initfunction_1FA.asm :
; 0x51360..0x51382 : 

; =============== S U B R O U T I N E =======================================

ms_map3_flag1FA_InitFunction:
                
                 
                chkFlg  $6              ; Kiwi joined
                beq.s   byte_5136C
                script  cs_51374
byte_5136C:
                
                script  cs_5137A
                rts

    ; End of function ms_map3_flag1FA_InitFunction

cs_51374:       hide ALLY_KIWI
                csc_end
cs_5137A:       playSound MUSIC_SAD_THEME_2
                fadeInB
                csc_end
