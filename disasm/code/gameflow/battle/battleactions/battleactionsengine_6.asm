
; ASM FILE code\gameflow\battle\battleactions\battleactionsengine_6.asm :
; 0xC024..0xC09A : Battleactions Engine, part 6

; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
; Out: d1.w, d2.w = X,Y coordinates


GetEnemyDestination:
                
                movem.l d0/a0,-(sp)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
@Loop:
                
                move.b  (a0)+,d0
                cmpi.b  #-1,d0
                beq.w   @Done
                
                ; Check move right
                tst.b   d0
                bne.s   @CheckMoveUp
                addq.w  #1,d1
                bra.s   @Next
@CheckMoveUp:
                
                subq.b  #1,d0
                bne.s   @CheckMoveLeft
                subq.w  #1,d2
                bra.s   @Next
@CheckMoveLeft:
                
                subq.b  #1,d0
                bne.s   @CheckMoveDown
                subq.w  #1,d1
                bra.s   @Next
@CheckMoveDown:
                
                subq.b  #1,d0
                bne.s   @Goto_Done
                addq.w  #1,d2
                bra.s   @Next
@Goto_Done:
                
                bra.w   @Done
@Next:
                
                bra.s   @Loop
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetEnemyDestination


; =============== S U B R O U T I N E =======================================


ClearAiMoveInfo:
                
                movem.l d0-a6,-(sp)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a0
                lea     ((byte_FFB1DC-$1000000)).w,a1
                clr.w   d0
                move.w  #48,d1
@Loop:
                
                move.b  #-1,(a0,d0.w)
                move.b  #0,(a1,d0.w)
                addq.w  #1,d0
                subq.w  #1,d1
                bne.s   @Loop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearAiMoveInfo

