
; ASM FILE code\gameflow\battle\battleendcutscenesend.asm :
; 0x47C48..0x47C8E : Battle end cutscenes function end

; START OF FUNCTION CHUNK FOR ExecuteBattleCutscene_Defeated

loc_47C48:
                
                clr.w   d0
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                move.b  tbl_EnemyLeaderPresence(pc,d0.w),d0
                tst.b   d0
                beq.s   loc_47C88
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                lea     (DEAD_COMBATANTS_LIST).l,a0
loc_47C62:
                
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   loc_47C82
                move.w  (DEAD_COMBATANTS_LIST_LENGTH).l,d1
                move.b  d0,(a0,d1.w)
                move.b  #$FF,1(a0,d1.w)
                addq.w  #1,(DEAD_COMBATANTS_LIST_LENGTH).l
loc_47C82:
                
                addq.w  #1,d0
                dbf     d7,loc_47C62
loc_47C88:
                
                movem.l (sp)+,d0-d1/d7-a0
                rts

; END OF FUNCTION CHUNK FOR ExecuteBattleCutscene_Defeated

