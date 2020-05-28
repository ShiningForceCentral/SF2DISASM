
; ASM FILE data\maps\entries\map19\mapsetups\s6_initfunction_1FB.asm :
; 0x53168..0x53176 : 

; =============== S U B R O U T I N E =======================================

ms_map19_flag1FB_InitFunction:
                
                 
                chkFlg  $1FB            ; Battle 7 completed
                beq.s   return_53174
                script  cs_53FD8
return_53174:
                
                rts

    ; End of function ms_map19_flag1FB_InitFunction

