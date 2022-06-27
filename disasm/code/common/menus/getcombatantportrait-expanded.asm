
; ASM FILE code\common\menus\getcombatantportrait-expanded.asm :
; Get combatant portrait index functions -- included when patch Force_Members_Expansion is enabled

; =============== S U B R O U T I N E =======================================

; Get portrait index for combatant D0 -> D0

GetCombatantPortrait:
                tst.b   d0
                bpl.s   GetAllyPortrait
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,d0
                rts

	; End of function GetCombatantPortrait


; =============== S U B R O U T I N E =======================================

; Get portrait index for ally D0 -> D0

GetAllyPortrait:
                movem.l d1-d2/d4,-(sp)
                jsr     GetAllyMapSprite_Regular            ; map sprite index -> D4
                move.w  d4,d0
                jsr     GetEntityPortaitAndSpeechSfx_Ally ; portrait index -> D1
                move.w  d1,d0
                movem.l (sp)+,d1-d2/d4
                rts

    ; End of function GetAllyPortrait
