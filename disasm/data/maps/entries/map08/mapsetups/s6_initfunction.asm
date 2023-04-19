
; ASM FILE data\maps\entries\map08\mapsetups\s6_initfunction.asm :
; 0x563A2..0x563B2 : 

; =============== S U B R O U T I N E =======================================


ms_map8_InitFunction:
                
                 
                chkFlg  8               ; May joined
                beq.s   return_563B0
                moveq   #8,d0
                jsr     MoveEntityOutOfMap
return_563B0:
                
                rts

    ; End of function ms_map8_InitFunction

