
; ASM FILE code\gameflow\battle\battlefield\getenemydestination.asm :
; 0xC024..0xC070 : Battlefield engine

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

