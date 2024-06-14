
; ASM FILE code\gameflow\battle\battleactions\unused_battleactions.asm :
; 0xAA98..0xAAB6 : Unused battleactions functions

; =============== S U B R O U T I N E =======================================

; unused


OneSecondSleep:
                
                move.l  d0,-(sp)
                moveq   #60,d0
                jsr     (Sleep).w       
                move.l  (sp)+,d0
                rts

    ; End of function OneSecondSleep


; =============== S U B R O U T I N E =======================================

; unused


NopOnce:
                
                nop
                rts

    ; End of function NopOnce


; =============== S U B R O U T I N E =======================================

; unused


NopTwice:
                
                nop
                nop
                rts

    ; End of function NopTwice


; =============== S U B R O U T I N E =======================================

; unused


NopThrice:
                
                nop
                nop
                nop
                rts

    ; End of function NopThrice

