
; ASM FILE data\maps\entries\map03\mapsetups\s6_initfunction.asm :
; 0x51382..0x513C0 : 

; =============== S U B R O U T I N E =======================================


ms_map3_InitFunction:
                
                 
                chkFlg  1               ; Sarah joined
                beq.s   byte_51390      
                script  cs_513BA
                bra.s   byte_513A8      
byte_51390:
                
                chkFlg  602             ; Set after Astral's second basement line
                beq.s   byte_513A8      
                script  cs_513A0
                bra.w   byte_513A8      
cs_513A0:
                
                setPos ALLY_SARAH,41,10,UP
                csc_end
byte_513A8:
                
                chkFlg  603             ; Set after the messenger scene
                beq.s   return_513B8
                move.w  #$8E,d0
                jsr     MoveEntityOutOfMap
return_513B8:
                
                rts

    ; End of function ms_map3_InitFunction

cs_513BA:       hide 142
                csc_end
