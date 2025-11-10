
; ASM FILE code\gameflow\battle\battleloop-standard\spawnenemies.asm :
;

; =============== S U B R O U T I N E =======================================


                module
SpawnAllEnemies:
                
                moveq   #-1,d5          ; set spawn all enemies toggle
                bra.s   @Continue
SpawnRegionActivatedEnemies:
                
                clr.w   d5              ; clear spawn all enemies toggle
                
                ; Build previously-triggered regions bitfield
@Continue:      clr.w   d3
                moveq   #0,d0
                move.w  #BATTLE_REGION_FLAGS_START,d1
                moveq   #AI_TRIGGER_REGIONS_COUNTER,d7
@Regions_Loop:  jsr     CheckFlag
                beq.s   @NextRegion
                
                bset    d0,d3           ; set region bit if previously triggered
@NextRegion:    addq.w  #1,d0
                addq.w  #1,d1
                dbf     d7,@Regions_Loop
                
                ; Process hidden and respawning enemy combatants
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@Enemies_Loop:  jsr     GetActivationBitfield
                move.w  d1,d4
                btst    #AIBITFIELD_BIT_HIDDEN,d4
                beq.s   @CheckRespawn
                
                jsr     GetMaxHp
                beq.s   @IsActivated    ; branch to activation check if hidden enemy has not spawned yet
                
@CheckRespawn:  tst.w   d5
                beq.s   @NextEnemy      ; continue only if we have reached the end of a round
                
                btst    #AIBITFIELD_BIT_RESPAWN,d4
                beq.s   @NextEnemy
                
                jsr     GetCurrentHp
                bne.s   @NextEnemy      ; continue only if respawning enemy is currently dead
                
                btst    #AIBITFIELD_BIT_HIDDEN,d4
                beq.s   @ResetStats     ; skip activation check if respawning enemy is not hidden
                
@IsActivated:   bsr.w   UpdateEnemyActivationBitfield ; Out: CCR carry-bit set if no update took place
                bcs.s   @NextEnemy
                
@ResetStats:    bsr.s   ResetSpawningEnemyStats ; Out: CCR carry-bit set if enemy is positioned off-screen (e.g., if spawn position is occupied)
                bcs.s   @NextEnemy
                
                ; Spawn qualifying enemy with camera
                clr.w   d1              ; clear skip camera toggle
                bsr.w   SpawnEnemy
@NextEnemy:     addq.w  #1,d0
                dbf     d7,@Enemies_Loop
                
                rts

    ; End of function SpawnAllEnemies

                modend

; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy combatant index
; 
; Out: CCR carry-bit set if enemy is positioned off-screen (e.g., if spawn position is occupied)


ResetSpawningEnemyStats:
                
                move.w  d3,-(sp)
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                jsr     GetBattleSpritesetSubsection ; Out: a0 = subsection address, d1.w = subsection size
                bset    #COMBATANT_BIT_ENEMY,d1
                cmp.b   d1,d0
                bhs.s   @PositionEnemyOffScreen
                
                move.w  d0,d1
                andi.w  #COMBATANT_MASK_INDEX,d1
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d1
                adda.w  d1,a0
                clr.w   d3
                clr.w   d4
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d3
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d4
                move.w  d0,-(sp)
                bsr.s   IsEnemyStartingPositionOccupied
                movem.w (sp)+,d0        ; restore combatant index without affecting the CCR
                bcs.s   @PositionEnemyOffScreen
                
                ; Reset stats but preserve the current activation state
                jsr     GetActivationBitfield
                bsr.w   InitializeEnemyStats
                jsr     SetActivationBitfield
                bra.s   @Done
                
@PositionEnemyOffScreen:
                clr.w   d1
                jsr     SetMaxHp
                jsr     SetCurrentHp
                moveq   #-1,d1
                jsr     SetCombatantX
                ori     #1,ccr
                
@Done:          movem.w (sp)+,d3        ; restore triggered regions bitfield without affecting the CCR
                rts

    ; End of function ResetSpawningEnemyStats


; =============== S U B R O U T I N E =======================================

; Is enemy starting position d3.w,d4.w currently occupied?
;
; In: d3.w, d4.w = spawning enemy's starting position
;
; Out: CCR carry-bit set if true


IsEnemyStartingPositionOccupied:
                
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d6
                bsr.s   @Loop
                bcs.s   @Return         ; immediately return true if any ally is occupying the position
                
                ; Otherwise, continue checking enemies
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d6
@Loop:          jsr     GetCombatantX
                cmp.w   d1,d3
                bne.s   @Next
                
                jsr     GetCombatantY
                cmp.w   d1,d4
                bne.s   @Next
                
                ori     #1,ccr
@Return:        rts
                
@Next:          addq.w  #1,d0
                dbf     d6,@Loop
                
                tst.b   d0
                rts

    ; End of function IsEnemyStartingPositionOccupied


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy combatant index
;     d1.w = skip camera toggle
;     d5.w = skip appending to turn order toggle

combatant = -2

SpawnEnemy:
                
                movem.w d0/d3/d5/d7,-(sp)
                link    a6,#-2
                move.w  d0,combatant(a6)
                
                jsr     SpawnEnemyEntity
                tst.w   d5
                bne.s   @CheckCamera
                
                bsr.s   AppendSpawnedEnemyToTurnOrder
@CheckCamera:   tst.w   d1
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
                
                ; Perform spinning mapsprite animation
@SkipCamera:    moveq   #ANIM_SPRITE_SPAWN_SPINS_COUNTER,d6
@Loop:          move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.w  d6,d1
                addq.w  #3,d1
                andi.w  #DIRECTION_MASK,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
                moveq   #ANIM_SPRITE_SPAWN_SPIN_DELAY,d0
                jsr     (Sleep).w       
                dbf     d6,@Loop
                
                sndCom  SFX_SPAWN
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     397             ; "{CLEAR}{NAME} appeared!{D3}"
                clsTxt
                
                unlk    a6
                movem.w (sp)+,d0/d3/d5/d7
                rts

    ; End of function SpawnEnemy


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy combatant index

AppendSpawnedEnemyToTurnOrder:
                
                move.w  d1,-(sp)
                
                ; Append turn entry before update
                loadSavedDataAddress (BATTLE_TURN_ORDER-TURN_ORDER_ENTRY_SIZE), a0
                moveq   #TURN_ORDER_ENTRIES_COUNTER,d6
                
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
                bpl.s   @Done
                
                ; Append second turn
                appendBattleTurnEntry d0, d1, a0
                bra.s   @Done
                
@Next:          dbf     d6,@FindNullTurn_Loop
                
@Done:          move.w  (sp)+,d1
                rts

    ; End of function AppendSpawnedEnemyToTurnOrder

