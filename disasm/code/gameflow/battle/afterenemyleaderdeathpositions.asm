
; ASM FILE code\gameflow\battle\afterenemyleaderdeathpositions.asm :
; 0x47D9E..0x47E82 : After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.

; =============== S U B R O U T I N E =======================================

; After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.


ApplyPositionsAfterEnemyLeaderDies:
                
                movem.l d0-d1/d7-a0,-(sp)
                moveq   #0,d0
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   loc_47E66
                move.w  #$80,d0 
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.w   loc_47E66
                lea     AfterBattlePositions(pc), a0 ; if Bowie alive and enemy leader dead
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
loc_47DCA:
                
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_47E66
                cmp.w   (a0),d1
                beq.w   loc_47DEE       ; entry first word is battle index
                adda.w  #6,a0
                bra.s   loc_47DCA
                move.w  #$80FF,(DEAD_COMBATANTS_LIST).l ; dead code ?
                move.w  #1,(DEAD_COMBATANTS_LIST_LENGTH).l
loc_47DEE:
                
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7 ; HARDCODED $1D limit for number of allies ?
loc_47DF2:
                
                move.w  #$FFFF,d1
                jsr     j_SetXPos
                ori.b   #COMBATANT_MASK_ENEMY_BIT,d0
                jsr     j_SetXPos       ; move enemy as well
                moveq   #0,d1
                jsr     j_SetCurrentHP
                andi.b  #$7F,d0 
                addq.w  #1,d0
                dbf     d7,loc_47DF2
                move.w  #$9E,d0 
                jsr     j_SetXPos
                addq.w  #1,d0
                jsr     j_SetXPos
                movea.l 2(a0),a0
                clr.w   d1
loc_47E30:
                
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_47E66
                move.b  (a0),d0
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_47E4C       
                cmpi.b  #$80,d0
                bne.w   loc_47E60
loc_47E4C:
                
                move.b  1(a0),d1        ; if character alive, apply positions
                jsr     j_SetXPos
                move.b  2(a0),d1
                jsr     j_SetYPos
loc_47E60:
                
                adda.w  #4,a0
                bra.s   loc_47E30
loc_47E66:
                
                movem.l (sp)+,d0-d1/d7-a0
                rts

    ; End of function ApplyPositionsAfterEnemyLeaderDies

AfterBattlePositions:
                dc.w 5                  ; battle 5
                dc.l abp_Battle5        
                dc.w $FFFF
abp_Battle5:    dc.b 0                  ; character 0 : Bowie
                dc.b $10                ; X Pos
                dc.b 4                  ; Y pos
                dc.b $FF                ; ignored byte
                dc.b 5                  ; Slade
                dc.b $11
                dc.b 4
                dc.b $FF
                dc.b $80                ; enemy leader
                dc.b $11
                dc.b 2
                dc.b $FF
                dc.w $FFFF
