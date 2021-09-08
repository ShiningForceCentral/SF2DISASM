
; ASM FILE code\gameflow\battle\battlestartcutscenesstart.asm :
; 0x47AEE..0x47B2C : Battle start cutscenes function start

; =============== S U B R O U T I N E =======================================

; cutscene at the start of battle (after units are placed and battle officially begins)
; 
; only seems to happen in first "above Pacalon" battle


ExecuteBattleCutscene_Start:
                
                movem.l d1,-(sp)
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                addi.w  #$1C2,d1
                jsr     j_CheckFlag
                bne.w   loc_47B8C
                jsr     j_SetFlag
                movem.l d0/a0,-(sp)
                clr.w   d0
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                add.w   d0,d0
                move.w  rpt_BattleStartCutscenes(pc,d0.w),d0
                lea     rpt_BattleStartCutscenes(pc,d0.w),a0
                bsr.w   ExecuteMapScript
                movem.l (sp)+,d0/a0
                bra.w   loc_47B8C
