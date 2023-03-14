
; ASM FILE code\gameflow\battle\battleendcutscenesstart.asm :
; 0x47B92..0x47BE8 : Battle end cutscenes function start

; =============== S U B R O U T I N E =======================================


ExecuteBattleCutscene_Defeated:
                
                movem.l d0-d1/d7-a0,-(sp)
                moveq   #0,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   loc_47C88
                move.w  #COMBATANT_ENEMIES_START,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.w   loc_47C88
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_COMPLETED_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.w   loc_47C48
                movem.l d0/a0,-(sp)
                clr.w   d0
                getSavedByte CURRENT_BATTLE, d0
                add.w   d0,d0
                move.w  rpt_EnemyDefeatedCutscenes(pc,d0.w),d0
                lea     rpt_EnemyDefeatedCutscenes(pc,d0.w),a0
                bsr.w   ExecuteMapScript
                movem.l (sp)+,d0/a0
                bra.w   loc_47C48

    ; End of function ExecuteBattleCutscene_Defeated

