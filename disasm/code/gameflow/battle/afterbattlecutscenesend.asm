
; ASM FILE code\gameflow\battle\afterbattlecutscenesend.asm :
; 0x47D54..0x47D6A : After battle cutscenes function end

; START OF FUNCTION CHUNK FOR ExecuteAfterBattleCutscene

EndAfterBattleCutscene:
                
                clr.w   d0
                getSavedByte CURRENT_BATTLE, d0
                move.b  table_AfterBattleJoins(pc,d0.w),d0 ; unused feature to make an ally join force after battle
                jsr     j_JoinForce     ; unused probably because cutscenes can already trigger force joins
                movem.l (sp)+,d0-d1
                rts

; END OF FUNCTION CHUNK FOR ExecuteAfterBattleCutscene

