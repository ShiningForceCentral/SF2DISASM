
; ASM FILE code\gameflow\battle\afterbattlecutscenesstart.asm :
; 0x47CBC..0x47CF4 : After battle cutscenes function start

; =============== S U B R O U T I N E =======================================


ExecuteAfterBattleCutscene:
                
                movem.l d0-d1,-(sp)
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                addi.w  #$1F4,d1
                jsr     j_CheckFlag
                bne.w   loc_47D54
                movem.l d0/a0,-(sp)
                clr.w   d0
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                add.w   d0,d0
                move.w  rpt_AfterBattleCutscenes(pc,d0.w),d0
                lea     rpt_AfterBattleCutscenes(pc,d0.w),a0
                bsr.w   ExecuteMapScript
                movem.l (sp)+,d0/a0
                bra.w   loc_47D54
