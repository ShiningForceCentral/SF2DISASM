
; ASM FILE code\common\menus\caravan\displaycaravanmessagewithportrait.asm :
; 0x228A8..0x228D8 : Display Caravan message with portrait function

; =============== S U B R O U T I N E =======================================

; In: d1.w = message index


DisplayCaravanMessageWithPortrait:
                
                movem.l d0-d1,-(sp)
                move.l  d1,-(sp)
                chkFlg  70              ; Astral is a follower
                bne.s   @AstralIsPresent
                moveq   #PORTRAIT_ROHDE,d0 ; HARDCODED portraits
                bra.s   @DeliverLines
@AstralIsPresent:
                
                moveq   #PORTRAIT_ASTRAL,d0
@DeliverLines:
                
                moveq   #0,d1
                jsr     j_OpenPortraitWindow
                move.l  (sp)+,d0
                jsr     (DisplayText).w 
                clsTxt
                jsr     j_ClosePortraitWindow
                movem.l (sp)+,d0-d1
                rts

    ; End of function DisplayCaravanMessageWithPortrait

