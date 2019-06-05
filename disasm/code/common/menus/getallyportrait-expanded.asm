
; ASM FILE code\common\menus\getallyportrait-expanded.asm :
; Alternate GetAllyPortrait function to be included in expanded ROM

; =============== S U B R O U T I N E =======================================

; Get portrait index for ally D0 -> D0

GetAllyPortrait:
                
                movem.l d1-d2/d4,-(sp)
                jsr     GetAllyMapSprite                ; D4 = map sprite index
                move.w  d4,d0
                jsr     GetEntityPortaitAndSpeechSound_Ally
                move.w  d1,d0
                movem.l (sp)+,d1-d2/d4
                rts

    ; End of function GetAllyPortrait

