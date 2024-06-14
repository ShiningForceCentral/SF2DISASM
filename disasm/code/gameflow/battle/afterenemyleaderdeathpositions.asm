
; ASM FILE code\gameflow\battle\afterenemyleaderdeathpositions.asm :
; 0x47D9E..0x47E6C : After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.

; =============== S U B R O U T I N E =======================================

; After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies.
; Only used in battle 5.


ApplyPositionsAfterEnemyLeaderDies:
                
                movem.l d0-d1/d7-a0,-(sp)
                moveq   #ALLY_BOWIE,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @Done
                move.w  #COMBATANT_ENEMIES_START,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.w   @Done
                lea     table_AfterBattlePositions(pc), a0 ; if Bowie alive and enemy leader dead
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
@FindBattle_Loop:
                
                cmpi.w  #-1,(a0)
                beq.w   @Done
                cmp.w   (a0),d1
                beq.w   @Found          ; entry first word is battle index
                adda.w  #6,a0
                bra.s   @FindBattle_Loop
                move.w  #$80FF,(DEAD_COMBATANTS_LIST).l ; unreachable code
                move.w  #1,(DEAD_COMBATANTS_LIST_LENGTH).l
@Found:
                
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@MoveAllCombatantOffscreen_Loop:
                
                move.w  #-1,d1
                jsr     j_SetCombatantX
                ori.b   #COMBATANT_MASK_ENEMY_BIT,d0
                jsr     j_SetCombatantX ; move enemy as well
                moveq   #0,d1
                jsr     j_SetCurrentHp
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                addq.w  #1,d0
                dbf     d7,@MoveAllCombatantOffscreen_Loop
                
                move.w  #158,d0
                jsr     j_SetCombatantX
                addq.w  #1,d0
                jsr     j_SetCombatantX
                movea.l 2(a0),a0        ; get entry address for this battle
                clr.w   d1
@FindCombatant_Loop:
                
                cmpi.w  #-1,(a0)
                beq.w   @Done
                move.b  (a0),d0
            if (STANDARD_BUILD&CUTSCENE_PROTECTION=1)
                ; Always apply positions 
            else
                ; If character is alive, apply positions
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @ApplyPositions
                cmpi.b  #$80,d0
                bne.w   @NextCombatant
            endif
@ApplyPositions:
                
                move.b  1(a0),d1
                jsr     j_SetCombatantX
                move.b  2(a0),d1
                jsr     j_SetCombatantY
@NextCombatant:
                
                adda.w  #4,a0
                bra.s   @FindCombatant_Loop
@Done:
                
                movem.l (sp)+,d0-d1/d7-a0
                rts

    ; End of function ApplyPositionsAfterEnemyLeaderDies

