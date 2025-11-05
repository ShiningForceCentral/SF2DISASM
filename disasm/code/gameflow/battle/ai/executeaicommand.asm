
; ASM FILE code\gameflow\battle\ai\executeaicommand.asm :
; 0xE294..0xE3EE : Execute AI command function

; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
;     d1.b = command code (e.g., Heal, Attack, Support, Move, etc.)


ExecuteAiCommand:
                
                movem.l d0/d2-a5,-(sp)
                
                ; Check Heal1
                cmpi.b  #AI_COMMAND_HEAL1,d1
                bne.s   @CheckHeal2
                
                move.w  #AI_COMMAND_PARAM_HEAL1,d1
                bsr.w   aiCommand_Heal
                bra.w   @Done
@CheckHeal2:
                
                cmpi.b  #AI_COMMAND_HEAL2,d1
                bne.s   @CheckHeal3
                
                move.w  #AI_COMMAND_PARAM_HEAL2,d1
                bsr.w   aiCommand_Heal
                bra.w   @Done
@CheckHeal3:
                
                cmpi.b  #AI_COMMAND_HEAL3,d1
                bne.s   @CheckAttack1
                
                move.w  #AI_COMMAND_PARAM_HEAL3,d1
                bsr.w   aiCommand_Heal
                bra.w   @Done
@CheckAttack1:
                
                cmpi.b  #AI_COMMAND_ATTACK1,d1
                bne.s   @CheckAttack2
                
                move.w  #AI_COMMAND_PARAM_ATTACK1,d1
                bsr.w   aiCommand_Attack
                bra.w   @Done
@CheckAttack2:
                
                cmpi.b  #AI_COMMAND_ATTACK2,d1
                bne.s   @CheckAttack3
                
                move.w  #AI_COMMAND_PARAM_ATTACK2,d1
                bsr.w   aiCommand_Attack
                bra.w   @Done
@CheckAttack3:
                
                cmpi.b  #AI_COMMAND_ATTACK3,d1
                bne.s   @CheckAttack4
                
                move.w  #AI_COMMAND_PARAM_ATTACK3,d1
                bsr.w   aiCommand_Attack
                bra.w   @Done
@CheckAttack4:
                
                cmpi.b  #AI_COMMAND_ATTACK4,d1
                bne.s   @CheckSupport
                
                move.w  #AI_COMMAND_PARAM_ATTACK4,d1
                bsr.w   aiCommand_Attack
                bra.w   @Done
@CheckSupport:
                
                cmpi.b  #AI_COMMAND_SUPPORT,d1
                bne.s   @CheckMoveOrder1
                
                move.w  #1,d1
                move.w  #0,d2
                bsr.w   aiCommand_Support
                bra.w   @Done
@CheckMoveOrder1:
                
                cmpi.b  #AI_COMMAND_MOVE_ORDER1,d1
                bne.s   @CheckMove1
                
                move.w  #AI_TARGET_TYPE_MOVE_TO_POINT,d1
                move.w  #AI_PATHFINDING_MODE_REGULAR,d2
                bsr.w   aiCommand_MoveOrder
                bra.w   @Done
@CheckMove1:
                
                cmpi.b  #AI_COMMAND_MOVE1,d1
                bne.s   @CheckMove2
                
                move.w  #0,d1
                bsr.w   aiCommand_Move
                bra.w   @Done
@CheckMove2:
                
                cmpi.b  #AI_COMMAND_MOVE2,d1
                bne.s   @CheckMove3
                
                move.w  #1,d1
                bsr.w   aiCommand_Move
                bra.w   @Done
@CheckMove3:
                
                cmpi.b  #AI_COMMAND_MOVE3,d1
                bne.s   @CheckStay
                
                move.w  #2,d1
                bsr.w   aiCommand_Move
                bra.w   @Done
@CheckStay:
                
                cmpi.b  #AI_COMMAND_STAY,d1
                bne.s   @CheckMoveOrder2
                
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                clr.w   d0
                bra.w   @Done
@CheckMoveOrder2:
                
                cmpi.b  #AI_COMMAND_MOVE_ORDER2,d1
                bne.s   @CheckMoveOrder3
                
                move.w  #AI_TARGET_TYPE_FOLLOW2,d1
                move.w  #AI_PATHFINDING_MODE_BLOCK_AND_CARVE,d2
                bsr.w   aiCommand_MoveOrder
                bra.w   @Done
@CheckMoveOrder3:
                
                cmpi.b  #AI_COMMAND_MOVE_ORDER3,d1
                bne.s   @CheckMoveOrder4
                
                move.w  #AI_TARGET_TYPE_FOLLOW1,d1
                move.w  #AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE,d2
                bsr.w   aiCommand_MoveOrder
                bra.w   @Done
@CheckMoveOrder4:
                
                cmpi.b  #AI_COMMAND_MOVE_ORDER4,d1
                bne.s   @CheckMoveOrder5
                
                clr.w   d1              ; AI_TARGET_TYPE_MOVE_TO_POINT
                move.w  #AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE,d2
                bsr.w   aiCommand_MoveOrder
                bra.w   @Done
@CheckMoveOrder5:
                
                cmpi.b  #AI_COMMAND_MOVE_ORDER5,d1
                bne.s   @Done
                
                clr.w   d1              ; AI_TARGET_TYPE_MOVE_TO_POINT
                move.w  #AI_PATHFINDING_MODE_BLOCK_AND_CARVE,d2
                bsr.w   aiCommand_MoveOrder
                bra.w   *+4
@Done:
                
                movem.l (sp)+,d0/d2-a5
                rts

    ; End of function ExecuteAiCommand

