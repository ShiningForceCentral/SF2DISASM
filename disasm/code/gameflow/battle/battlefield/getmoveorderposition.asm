
; ASM FILE code\gameflow\battle\battlefield\getmoveorderposition.asm :
; 0x1B15F8..0x1B1630 : Move Order position getter function

; =============== S U B R O U T I N E =======================================

; Get coordinates for AI move order d0.w -> d1.w, d2.w


GetMoveOrderPosition:
                
                movem.l d0/a0,-(sp)
                btst    #AIORDER_BIT_MOVE_TO,d0
                bne.s   @GetAiPointCoordinates
                
                ; Get position of combatant to follow
                jsr     j_GetCombatantY
                move.w  d1,d2
                jsr     j_GetCombatantX
                bra.s   @Done
@GetAiPointCoordinates:
                
                moveq   #BATTLESPRITESET_SUBSECTION_AI_POINTS,d1
                bsr.w   GetBattleSpritesetSubsection
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                add.w   d0,d0
                adda.w  d0,a0
                clr.w   d1
                clr.w   d2
                move.b  (a0),d1
                move.b  1(a0),d2
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetMoveOrderPosition

