
; ASM FILE data\maps\entries\map16\mapsetups\s6_initfunction.asm :
; 0x51F76..0x51F88 : 

; =============== S U B R O U T I N E =======================================


ms_map16_InitFunction:
                
                 
                chkFlg  664             ; Set after the Galam guards catch you sneaking around, but before battle
                beq.s   return_51F86
                move.w  #$91,d0 
                jsr     MoveEntityOutOfMap
return_51F86:
                
                rts

    ; End of function ms_map16_InitFunction

