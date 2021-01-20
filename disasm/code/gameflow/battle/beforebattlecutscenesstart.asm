
; ASM FILE code\gameflow\battle\beforebattlecutscenesstart.asm :
; 0x47A50..0x47A88 : Before battle cutscenes function start

; =============== S U B R O U T I N E =======================================

; cutscene before the battle begins


j_ExecuteBattleCutscene_Intro_0:
                
                movem.l d1,-(sp)
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                addi.w  #$1C2,d1
                jsr     j_CheckFlag
                bne.w   loc_47AE8
                movem.l d0/a0,-(sp)
                clr.w   d0
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                add.w   d0,d0
                move.w  rpt_BeforeBattleCutscenes(pc,d0.w),d0
                lea     rpt_BeforeBattleCutscenes(pc,d0.w),a0
                bsr.w   ExecuteMapScript
                movem.l (sp)+,d0/a0
                bra.w   loc_47AE8
