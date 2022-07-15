
; ASM FILE data\maps\entries\map19\mapsetups\s6_initfunction_506.asm :
; 0x5311E..0x53168 : 

; =============== S U B R O U T I N E =======================================


ms_map19_flag506_InitFunction:
                
                 
                chkFlg  620             ; Set after Astral talks Lemon into heading to the Ancient Tower
                beq.s   byte_5314C      
                move.w  #$1C,d0
                jsr     MoveEntityOutOfMap
                move.w  #$80,d0 
                jsr     MoveEntityOutOfMap
                move.w  #$84,d0 
                jsr     MoveEntityOutOfMap
                move.w  #$85,d0 
                jsr     MoveEntityOutOfMap
byte_5314C:
                
                chkFlg  621             ; Set after stepping in front of the Minister
                beq.s   return_53166
                move.w  #$81,d0 
                jsr     MoveEntityOutOfMap
                move.w  #$82,d0 
                jsr     MoveEntityOutOfMap
return_53166:
                
                rts

    ; End of function ms_map19_flag506_InitFunction

