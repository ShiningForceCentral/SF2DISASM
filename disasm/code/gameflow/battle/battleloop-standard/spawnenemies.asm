
; ASM FILE code\gameflow\battle\battleloop-standard\spawnenemies.asm :
;

; =============== S U B R O U T I N E =======================================

                module

SpawnRegionActivatedEnemies:
                
                moveq   #-1,d2
                bra.s   @Continue
SpawnAllEnemies:
                
                clr.w   d2

; In: d2 = first time spawns only toggle, d3 = skip camera toggle
;
@Continue:      clr.w   d3              ; spawn with camera
                pea     SpawnListedEnemies(pc)
                
PopulateTargetsListWithSpawningEnemies:
                
                movem.l d0-a0,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  #COMBATANT_ENEMIES_START,d0
                clr.w   d5
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                
@Loop:          jsr     GetActivationBitfield
                andi.w  #WORD_LOWER_NIBBLE_MASK,d1
                beq.s   @Next
                
                ; $200 - region-triggered spawn - check if triggered and if not spawned yet
                cmpi.w  #$200,d1
                bne.s   @CheckRespawn
                
                jsr     GetMaxHp
                bne.s   @Next
                
                bra.s   @UpdateEnemyActivation
@CheckRespawn:
                
            if (EXTENDED_BATTLE_TURN_UPDATE=1)
                tst.w   d2
                bne.s   @Next
            endif
                ; $100 - respawn - check if dead
                cmpi.w  #$100,d1
                bne.s   @CheckRegionRespawn
                
                jsr     GetCurrentHp
                bne.s   @Next
                
                bra.s   @ResetEnemyStats
@CheckRegionRespawn:
                ; $300 - region-triggered respawn - check if dead and triggered
                cmpi.w  #$300,d1
                bne.s   @Next
@UpdateEnemyActivation:
                
                bsr.s   UpdateEnemyActivationIfDead ; Out: CCR carry-bit set if no update took place
                bcs.s   @Next
@ResetEnemyStats:
                
                jsr     GetActivationBitfield
                bsr.s   ResetSpawningEnemyStats
                bcs.s   @Next
                
                move.b  d0,(a0,d5.w)    ; append to targets list
                addq.w  #1,d5
                
@Next:          addq.w  #1,d0
                dbf     d7,@Loop
                
                move.w  d5,((TARGETS_LIST_LENGTH-$1000000)).w
                movem.l (sp)+,d0-a0
                rts

    ; End of function PopulateTargetsListWithSpawningEnemies

                modend

; =============== S U B R O U T I N E =======================================

; In: d0.w = character index
; 
; Out: CCR carry-bit set if no update took place

UpdateEnemyActivationIfDead:
                
                jsr     GetCurrentHp
                bne.s   @NoUpdate
                
                jsr     GetTriggerRegions ; -> d1.w, d2.w
                cmpi.b  #15,d1
                beq.s   @CheckRegion2
                
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     CheckFlag
                beq.s   @CheckRegion2
                
                jsr     GetActivationBitfield
                ori.w   #1,d1
                jmp     SetActivationBitfield
                
@CheckRegion2:  cmpi.b  #15,d2
                beq.s   @NoUpdate
                
                move.w  d2,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     CheckFlag
                beq.s   @NoUpdate
                
                jsr     GetActivationBitfield
                ori.w   #%11,d1
                jmp     SetActivationBitfield
                
@NoUpdate:      ori     #1,ccr
                rts

    ; End of function UpdateEnemyActivationIfDead


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
;     d1.w = AI activation bitfield
; 
; Out: CCR carry-bit set if spawn position is occupied


ResetSpawningEnemyStats:
                
                movem.l d0-a0,-(sp)
                move.w  d1,d2
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                jsr     GetBattleSpritesetSubsection
                bset    #7,d1
                cmp.b   d1,d0
                bhs.s   @PositionEnemyOffscreen
                
                move.b  d0,d1
                andi.l  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d1
                adda.w  d1,a0
                clr.w   d3
                clr.w   d4
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d3
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d4
                bsr.s   IsEnemyStartingPositionOccupied
                bcs.s   @PositionEnemyOffscreen
                
                bsr.w   InitializeEnemyStats
                move.w  d2,d1
                jsr     SetActivationBitfield
                bra.s   @Done
@PositionEnemyOffscreen:
                
                clr.w   d1
                jsr     SetMaxHp
                jsr     SetCurrentHp
                moveq   #-1,d1
                jsr     SetCombatantX
                ori     #1,ccr
@Done:
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function ResetSpawningEnemyStats


; =============== S U B R O U T I N E =======================================

; Is enemy starting position d3.w,d4.w curently occupied?
; Return CCR carry-bit set if true.


IsEnemyStartingPositionOccupied:
                
                movem.l d0-d2/d7,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@AlliesLoop:
                
                jsr     GetCombatantX
                cmp.w   d1,d3
                bne.s   @NextAlly
                
                jsr     GetCombatantY
                cmp.w   d1,d4
                ori     #1,ccr
                beq.s   @Done
@NextAlly:
                
                addq.w  #1,d0
                dbf     d7,@AlliesLoop
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@EnemiesLoop:
                
                jsr     GetCombatantX
                cmp.w   d1,d3
                bne.s   @NextEnemy
                
                jsr     GetCombatantY
                cmp.w   d1,d4
                ori     #1,ccr
                beq.s   @Done
@NextEnemy:
                
                addq.w  #1,d0
                dbf     d7,@EnemiesLoop
                
                tst.b   d0
@Done:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function IsEnemyStartingPositionOccupied


; =============== S U B R O U T I N E =======================================

; In/Out: d2 = first time spawns only toggle, d3 = skip camera toggle

SpawnListedEnemies:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                bra.s   @SpawnEnemies
@SpawnEnemies_Loop:
                
                move.b  (a0)+,d0
                bsr.s   SpawnEnemy
@SpawnEnemies:  dbf     d7,@SpawnEnemies_Loop
                
                rts

    ; End of function SpawnListedEnemies


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy combatant index

combatant = -2

                module

SpawnEnemySkipCamera:
                movem.l d2-d3/d7-a0,-(sp)
                clr.w   d2
                moveq   #-1,d3
                bra.s   @Continue

; In: d2 = first time spawns only toggle, d3 = skip camera toggle
;
SpawnEnemy:     
                
                movem.l d2-d3/d7-a0,-(sp)
@Continue:      link    a6,#-2
                move.w  d0,combatant(a6)
                
                jsr     SpawnEnemyEntity
            if (EXTENDED_BATTLE_TURN_UPDATE=1)
                tst.w   d2
                beq.s   @CheckCamera
                
                bsr.s   AppendSpawnedEnemyToTurnOrder
@CheckCamera:
            endif
                tst.w   d3
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
@SkipCamera:    moveq   #11,d7

@Loop:          move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.w  d7,d1
                addq.w  #3,d1
                andi.w  #3,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
                moveq   #3,d0
                jsr     (Sleep).w       
                dbf     d7,@Loop
                
                sndCom  SFX_SPAWN
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     397             ; "{CLEAR}{NAME} appeared!{D3}"
                clsTxt
                
                unlk    a6
                movem.l (sp)+,d2-d3/d7-a0
                rts

    ; End of function SpawnEnemyWithCamera

                modend

; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy combatant index

AppendSpawnedEnemyToTurnOrder:
                
                ; Append turn entry before update
                loadSavedDataAddress (BATTLE_TURN_ORDER-TURN_ORDER_ENTRY_SIZE), a0
                moveq   #TURN_ORDER_ENTRIES_COUNTER,d7
@FindNullTurn_Loop:
                
                ; Find first null entry
                addq.w  #TURN_ORDER_ENTRY_SIZE,a0
                getSavedWord a0, d1
                cmpi.w  #-1,d1
                bne.s   @Next
                
                ; Append first turn
                jsr     GetCurrentAgi
                move.w  d1,d2
                andi.w  #CHAR_STATCAP_AGI_CURRENT,d1
                appendBattleTurnEntry d0, d1, a0
                tst.b   d2
                bpl.s   @Return
                
                ; Append second turn
                appendBattleTurnEntry d0, d1, a0
                bra.s   @Return
                
@Next:          dbf     d7,@FindNullTurn_Loop
                
@Return:        rts

    ; End of function AppendSpawnedEnemyToTurnOrder

