
; ASM FILE data\maps\entries\map19\mapsetups\s6_initfunction_507.asm :
; 0x53168..0x53176 : 

; =============== S U B R O U T I N E =======================================


ms_map19_flag507_InitFunction:
                
                 
                chkFlg  507             ; Battle 7 completed - BATTLE_VERSUS_DARK_SMOKES           
                beq.s   return_53174
                script  cs_53FD8
return_53174:
                
                rts

    ; End of function ms_map19_flag507_InitFunction

