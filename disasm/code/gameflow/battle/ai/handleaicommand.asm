
; ASM FILE code\gameflow\battle\ai\handleaicommand.asm :
; 0xE294..0xE3EE : Handle AI Command function

; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
;     d1.b = command code (like Heal, Attack, etc.)


ExecuteAiCommand:
                
                movem.l d0/d2-a5,-(sp)
                cmpi.b  #AICOMMAND_HEAL,d1
                bne.s   @CheckHeal2
                move.w  #AICOMMAND_PARAM_HEAL,d1
                bsr.w   ExecuteAiCommand_Heal
                bra.w   @Done
@CheckHeal2:
                
                cmpi.b  #AICOMMAND_HEAL2,d1
                bne.s   @CheckHeal3
                move.w  #AICOMMAND_PARAM_HEAL2,d1
                bsr.w   ExecuteAiCommand_Heal
                bra.w   @Done
@CheckHeal3:
                
                cmpi.b  #AICOMMAND_HEAL3,d1
                bne.s   @CheckAttack
                move.w  #AICOMMAND_PARAM_HEAL3,d1
                bsr.w   ExecuteAiCommand_Heal
                bra.w   @Done
@CheckAttack:
                
                cmpi.b  #AICOMMAND_ATTACK,d1
                bne.s   @CheckAttack2
                move.w  #0,d1
                bsr.w   ExecuteAiCommand_Attack
                bra.w   @Done
@CheckAttack2:
                
                cmpi.b  #AICOMMAND_ATTACK2,d1
                bne.s   @CheckAttack3
                move.w  #2,d1
                bsr.w   ExecuteAiCommand_Attack
                bra.w   @Done
@CheckAttack3:
                
                cmpi.b  #AICOMMAND_ATTACK3,d1
                bne.s   @CheckAttack4
                move.w  #1,d1
                bsr.w   ExecuteAiCommand_Attack
                bra.w   @Done
@CheckAttack4:
                
                cmpi.b  #AICOMMAND_ATTACK4,d1
                bne.s   @CheckSupport
                move.w  #3,d1
                bsr.w   ExecuteAiCommand_Attack
                bra.w   @Done
@CheckSupport:
                
                cmpi.b  #AICOMMAND_SUPPORT,d1
                bne.s   @CheckSpecialMove
                move.w  #1,d1
                move.w  #0,d2
                bsr.w   ExecuteAiCommand_Support
                bra.w   @Done
@CheckSpecialMove:
                
                cmpi.b  #AICOMMAND_SPECIAL_MOVE,d1
                bne.s   @CheckMove
                move.w  #0,d1
                move.w  #0,d2
                bsr.w   ExecuteAiCommand_SpecialMove
                bra.w   @Done
@CheckMove:
                
                cmpi.b  #AICOMMAND_MOVE,d1
                bne.s   @CheckMove2
                move.w  #0,d1
                bsr.w   ExecuteAiCommand_Move
                bra.w   @Done
@CheckMove2:
                
                cmpi.b  #AICOMMAND_MOVE2,d1
                bne.s   @CheckMove3
                move.w  #1,d1
                bsr.w   ExecuteAiCommand_Move
                bra.w   @Done
@CheckMove3:
                
                cmpi.b  #AICOMMAND_MOVE3,d1
                bne.s   @CheckStay
                move.w  #2,d1
                bsr.w   ExecuteAiCommand_Move
                bra.w   @Done
@CheckStay:
                
                cmpi.b  #AICOMMAND_STAY,d1
                bne.s   @CheckSpecialMove2
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                clr.w   d0
                bra.w   @Done
@CheckSpecialMove2:
                
                cmpi.b  #AICOMMAND_SPECIAL_MOVE2,d1
                bne.s   @CheckSpecialMove3
                move.w  #2,d1
                move.w  #2,d2
                bsr.w   ExecuteAiCommand_SpecialMove
                bra.w   @Done
@CheckSpecialMove3:
                
                cmpi.b  #AICOMMAND_SPECIAL_MOVE3,d1
                bne.s   @CheckSpecialMove4
                move.w  #1,d1
                move.w  #1,d2
                bsr.w   ExecuteAiCommand_SpecialMove
                bra.w   @Done
@CheckSpecialMove4:
                
                cmpi.b  #AICOMMAND_SPECIAL_MOVE4,d1
                bne.s   @CheckSpecialMove5
                clr.w   d1
                move.w  #1,d2
                bsr.w   ExecuteAiCommand_SpecialMove
                bra.w   @Done
@CheckSpecialMove5:
                
                cmpi.b  #AICOMMAND_SPECIAL_MOVE5,d1
                bne.s   @Done
                clr.w   d1
                move.w  #2,d2
                bsr.w   ExecuteAiCommand_SpecialMove
                bra.w   *+4
@Done:
                
                movem.l (sp)+,d0/d2-a5
                rts

    ; End of function ExecuteAiCommand

