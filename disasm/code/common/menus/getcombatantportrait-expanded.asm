
; ASM FILE code\common\menus\getcombatantportrait-expanded.asm :
; Alternate GetCombatantPortrait function to be included in expanded ROM

; =============== S U B R O U T I N E =======================================

; Get portrait index for combatant D0 -> D0

GetCombatantPortrait:
                
                tst.b   d0
                bpl     GetAllyPortrait
                jsr     GetEntityPortaitAndSpeechSound
                move.w  d1,d0
                rts

	; End of function GetCombatantPortrait

