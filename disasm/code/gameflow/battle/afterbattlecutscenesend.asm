
; ASM FILE code\gameflow\battle\afterbattlecutscenesend.asm :
; 0x47D54..0x47D6A : After battle cutscenes function end
loc_47D54:
                
                clr.w   d0
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                move.b  AfterBattleJoins(pc,d0.w),d0 ; unused feature to make an ally join force after battle ?
                jsr     j_JoinForce     ; unused probably because cutscenes can already trigger force joins
                movem.l (sp)+,d0-d1
                rts

    ; End of function ExecuteAfterBattleCutscene

