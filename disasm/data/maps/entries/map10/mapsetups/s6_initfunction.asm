
; ASM FILE data\maps\entries\map10\mapsetups\s6_initfunction.asm :
; 0x57030..0x5708E : 

; =============== S U B R O U T I N E =======================================


ms_map10_InitFunction:
                
                 
                chkFlg  719             ; Set after the initial Bedoe scene (where the guards confront you)
                bne.s   byte_57040      
                script  cs_570B0
                setFlg  719             ; Set after the initial Bedoe scene (where the guards confront you)
byte_57040:
                
                chkFlg  720             ; Set after the King of Bedoe speaks to his soldiers and they disperse
                beq.s   return_5708C
                move.w  #150,d0
                jsr     MoveEntityOutOfMap
                move.w  #151,d0
                jsr     MoveEntityOutOfMap
                move.w  #152,d0
                jsr     MoveEntityOutOfMap
                move.w  #153,d0
                jsr     MoveEntityOutOfMap
                move.w  #154,d0
                jsr     MoveEntityOutOfMap
                move.w  #155,d0
                jsr     MoveEntityOutOfMap
                move.w  #156,d0
                jsr     MoveEntityOutOfMap
return_5708C:
                
                rts

    ; End of function ms_map10_InitFunction

