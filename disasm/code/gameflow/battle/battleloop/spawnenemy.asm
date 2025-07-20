
; ASM FILE code\gameflow\battle\battleloop\spawnenemy.asm :
; 0x2448A..0x24512 : Battle loop functions

; =============== S U B R O U T I N E =======================================


SpawnEnemySkipCamera:
                
                moveq   #1,d1
                bra.w   SpawnEnemy

    ; End of function SpawnEnemySkipCamera


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant

combatant = -2

SpawnEnemyWithCamera:
                
                clr.w   d1
SpawnEnemy:
                
                movem.l d7-a0,-(sp)
                link    a6,#-16
                move.w  d1,-(sp)
                move.w  d0,combatant(a6)
                move.w  combatant(a6),d0
                jsr     j_SpawnEnemyEntity
                move.w  (sp)+,d1
                bne.s   @SkipCamera
                
                ; Move cursor to combatant's position
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   SetCursorDestinationToNextCombatant
                bsr.w   WaitForCursorToStopMoving
                jsr     (WaitForViewScrollEnd).w
                bsr.w   HideCursorEntity
@SkipCamera:
                
                moveq   #11,d7
@Loop:
                
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.w  d7,d1
                addq.w  #3,d1
                andi.w  #DIRECTION_MASK,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).l
                moveq   #3,d0
                jsr     (Sleep).w       
                dbf     d7,@Loop
                
                sndCom  SFX_SPAWN
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     397             ; "{CLEAR}{NAME} appeared!{D3}"
                clsTxt
                unlk    a6
                movem.l (sp)+,d7-a0
                rts

    ; End of function SpawnEnemyWithCamera

