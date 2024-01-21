
; ASM FILE code\common\menus\getcombatantportrait-standard.asm :
; Standard reimplementation of combatant portrait getter functions.

; =============== S U B R O U T I N E =======================================

; Get portrait index for ally d0.w -> d0.w

GetAllyPortrait:
                
                move.l  d1,-(sp)
                move.w  d2,-(sp)
                bsr.s   GetCombatantPortrait
                move.w  (sp)+,d2
                move.l  (sp)+,d1
                rts

    ; End of function GetAllyPortrait


; =============== S U B R O U T I N E =======================================

; Get portrait index for combatant d0.w -> d0.w

GetCombatantPortrait:
                
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,d0
                rts

    ; End of function GetCombatantPortrait
