
; ASM FILE code\gameflow\battle\beforebattlecutscenesstart.asm :
; 0x47A50..0x47A88 : Before battle cutscenes function start

; =============== S U B R O U T I N E =======================================

; cutscene before the battle begins


ExecuteBeforeBattleCutscene:
                
                movem.l d1,-(sp)
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_INTRO_CUTSCENE_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.w   loc_47AE8
                movem.l d0/a0,-(sp)
                clr.w   d0
                getSavedByte CURRENT_BATTLE, d0
                add.w   d0,d0
                move.w  rpt_BeforeBattleCutscenes(pc,d0.w),d0
                lea     rpt_BeforeBattleCutscenes(pc,d0.w),a0
                bsr.w   ExecuteMapScript
                movem.l (sp)+,d0/a0
                bra.w   loc_47AE8
