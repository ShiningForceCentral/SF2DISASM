
; ASM FILE code\common\menus\getcombatantportrait.asm :
; 0x1263A..0x1264E : Get combatant portrait index function

; =============== S U B R O U T I N E =======================================

; Get portrait index for combatant D0 -> D0


GetCombatantPortrait:
                
                tst.b   d0
                bpl.s   @Ally
                jsr     j_GetEntityPortaitAndSpeechSfx
                move.w  d1,d0
                bra.s   @Return
@Ally:
                
                bsr.w   GetAllyPortrait 
@Return:
                
                rts

    ; End of function GetCombatantPortrait

