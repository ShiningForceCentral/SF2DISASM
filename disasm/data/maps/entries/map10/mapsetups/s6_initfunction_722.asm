
; ASM FILE data\maps\entries\map10\mapsetups\s6_initfunction_722.asm :
; 0x5708E..0x570B0 : 

; =============== S U B R O U T I N E =======================================


ms_map10_flag722_InitFunction:
                
                 
                chkFlg  799             ; Set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
                beq.s   byte_5709E      
                move.w  #$A,d0
                jsr     MoveEntityOutOfMap
byte_5709E:
                
                chkFlg  724             ; Set after the scene where Skreech falls in Bedoe
                beq.s   return_570AE
                move.w  #$98,d0 
                jsr     MoveEntityOutOfMap
return_570AE:
                
                rts

    ; End of function ms_map10_flag722_InitFunction

