
; ASM FILE data\maps\entries\map36\mapsetups\s6_initfunction.asm :
; 0x5DA16..0x5DA28 : 

; =============== S U B R O U T I N E =======================================


ms_map36_InitFunction:
                
                 
                chkFlg  22              ; Frayja joined
                beq.s   return_5DA26
                move.w  #$16,d0
                jsr     MoveEntityOutOfMap
return_5DA26:
                
                rts

    ; End of function ms_map36_InitFunction

