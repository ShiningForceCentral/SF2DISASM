
; SCRIPT SECTION system\battles\afterbattlecutscenesend :
; After battle cutscenes function end

; START OF FUNCTION CHUNK FOR ExecuteAfterBattleCutscene

loc_47D54:
										
										clr.w   d0
										move.b  ((CURRENT_BATTLE-$1000000)).w,d0
										move.b  byte_47D6A(pc,d0.w),d0
																						; unused feature to make an ally join force after battle ?
										jsr     j_JoinForce     ; unused probably because cutscenes can already trigger force joins
										movem.l (sp)+,d0-d1
										rts

; END OF FUNCTION CHUNK FOR ExecuteAfterBattleCutscene

