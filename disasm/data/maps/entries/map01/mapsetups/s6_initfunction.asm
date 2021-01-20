
; ASM FILE data\maps\entries\map01\mapsetups\s6_initfunction.asm :
; 0x5E760..0x5E772 : 

; =============== S U B R O U T I N E =======================================


ms_map1_InitFunction:
                
                 
                chkFlg  21              ; Taya joined
                beq.s   return_5E770
                move.w  #$88,d0 
                jsr     MoveEntityOutOfMap
return_5E770:
                
                rts

    ; End of function ms_map1_InitFunction

