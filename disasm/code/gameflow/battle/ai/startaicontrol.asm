
; ASM FILE code\gameflow\battle\ai\startaicontrol.asm :
; 0xDEFC..0xE1AC : AI engine : preparatory phase

; =============== S U B R O U T I N E =======================================

; Starting point for the AI control process.
; 
;   In: d0.w = combatant index


StartAiControl:
                
                movem.l d0-a5,-(sp)
                move.w  d0,d7           ; d7.w = copy of AI controlled combatant index
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                
                ; If an ally is AI controlled (e.g., Peter, Jaro) use AI commandset #6
                move.w  #AICOMMANDSET_ATTACKER1,d5
                bra.w   @HandleAiCommandset
@Enemy:
                
                bsr.w   GetAiCommandset 
                cmpi.b  #AICOMMANDSET_SWARM,d1 ; check for AI #15, the "swarm" AI used in Kraken, Harpy, and Chess Battles
                beq.s   @IsAtFullHp
                bra.w   @NonSwarmAi
@IsAtFullHp:
                
                bsr.w   GetMaxHp
                move.w  d1,d2
                bsr.w   GetCurrentHp
                cmp.w   d2,d1
                beq.s   @FindSwarmBattle ; if AI #15 and full HP, go to the "swarm" AI check
                bra.w   @NonSwarmAi     ; if AI #15 but not at full HP, then immediately activate and attack normally
@FindSwarmBattle:
                
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                clr.w   d6
                move.b  (a0),d6
                lea     list_SwarmBattles(pc), a0
                nop
                clr.w   d2
                move.b  (a0),d2         ; d2.b = number of swarm battles
                subi.w  #1,d2
                clr.w   d0
                adda.w  #1,a0
@FindSwarmBattle_Loop:
                
                move.b  (a0,d0.w),d1
                cmp.b   d1,d6
                bne.s   @NextBattle
                bra.w   @GetSwarmAiEnemyCounts
@NextBattle:
                
                addi.w  #1,d0
                dbf     d2,@FindSwarmBattle_Loop
                
                bra.w   @NonSwarmAi
@GetSwarmAiEnemyCounts:
                
                lea     pt_SwarmAiEnemyCounts(pc), a0
                nop
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                clr.w   d5
                move.b  d7,d5           ; d5.w = combatant entry
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d5
                move.b  (a0,d5.w),d0    ; d0.b = number from the swarm table corresponding to the attacker
                tst.b   d0
                bne.s   @CheckSwarmActivation
                bra.w   @NonSwarmAi
@CheckSwarmActivation:
                
                bsr.w   CountDefeatedEnemies
                cmp.b   d1,d0
                ble.s   @NonSwarmAi     ; if d1 >= d0, process normally, else skip turn
                
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
                
                ; Resume normal AI scripting (end of "swarm" AI)
@NonSwarmAi:
                
                ; This causes issues with region triggers in the vanilla build. The RAM word is unused otherwise.
                lea     (NEWLY_TRIGGERED_BATTLE_REGIONS).l,a0
                move.w  #0,(a0)
                move.w  d7,d0
                bsr.w   GetTriggerRegions     
                cmpi.w  #AI_TRIGGER_REGION_NONE,d1
                bne.s   @CheckActivationFlag
                
                cmpi.w  #AI_TRIGGER_REGION_NONE,d2
                bne.s   @CheckActivationFlag
                bra.w   @HandleActivatedCombatant
@CheckActivationFlag:
                
                move.w  d7,d0
                bsr.w   GetActivationBitfield
                move.w  d1,d4
                andi.w  #AIBITFIELD_TRIGGER_REGIONS_MASK,d1
                btst    #AIBITFIELD_BIT_PRIMARY_ACTIVE,d1
                bne.s   @HandleActivatedCombatant
                
                ; If combatant AI is not yet activated
                bsr.w   DetermineAiStandbyMovement
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @Done
@HandleActivatedCombatant:
                
                move.w  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @CheckSpecialMoveOrders ; skip if ally
                
                ; If enemy, handle special attackers
                bsr.w   GetEnemy        
                
                ; Check if line attacker
                cmpi.w  #ENEMY_PRISM_FLOWER,d1 ; HARDCODED enemy indexes
                bne.s   @IsZeonGuard
                
                bsr.w   ProcessLineAttackerAi
                bra.w   @Done
@IsZeonGuard:
                
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                bne.s   @IsBurstRock
                
                bsr.w   ProcessLineAttackerAi
                bra.w   @Done
@IsBurstRock:
                
                cmpi.w  #ENEMY_BURST_ROCK,d1
                bne.s   @CheckSpecialMoveOrders
                
                bsr.w   ProcessExploderAi
                bra.w   @Done
@CheckSpecialMoveOrders:
                
                ; Check if following a dead target and if so, change to second special move orders
                move.w  d7,d0
                bsr.w   GetMoveOrders
                cmpi.w  #AIORDER_NONE,d1
                beq.s   @HandlePathfindingModes ; skip if no special orders
                
                btst    #AIORDER_BIT_MOVE_TO,d1
                bne.s   @HandlePathfindingModes ; skip if following a point
                
                move.w  d1,d0
                bsr.w   GetCurrentHp
                tst.w   d1
                bne.s   @HandlePathfindingModes ; skip if the followed target is still alive
                
                move.w  d7,d0
                bsr.w   GetMoveOrders
                move.w  d2,d1
                move.w  #AIORDER_NONE,d2
                bsr.w   SetMoveOrders ; set the primary special move orders equal to that of the secondary, and set the secondary to FF (aka no special orders)
@HandlePathfindingModes:
                
                move.w  d7,d0
                bsr.w   GetAiCommandset 
                move.w  d1,d5           ; d5.w = copy of AI commandset
                lea     table_PathfindingModesForAiCommandset(pc), a0
                nop
                move.b  (a0,d1.w),d6
                
                ; Is regular pathfinding mode?
                tst.b   d6
                beq.s   @HandleAiCommandset
                
                cmpi.b  #AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE,d6
                bne.s   @CheckBlockAndCarve
                
                jsr     j_BlockNonMovableSpacesAroundDestination
@CheckBlockAndCarve:
                
                cmpi.b  #AI_PATHFINDING_MODE_BLOCK_AND_CARVE,d6
                bne.s   @HandleAiCommandset
                
                jsr     j_BlockAndCarveAroundDestination
@HandleAiCommandset:
                
                move.w  d5,d1
                lea     pt_AiCommandsets(pc), a0
                nop
                lsl.l   #INDEX_SHIFT_COUNT,d1
                movea.l (a0,d1.w),a1
                clr.w   d2
                move.b  (a1),d2         ; d2.b = number of commands
                adda.w  #1,a1
                subi.b  #1,d2
@HandleAiCommandset_Loop:
                
                clr.w   d1
                move.b  (a1),d1
                move.b  d7,d0
                bsr.w   ExecuteAiCommand
                tst.b   d1
                bne.s   @NextAiCommand
                bra.w   @Done
@NextAiCommand:
                
                adda.w  #1,a1
                dbf     d2,@HandleAiCommandset_Loop
@Done:
                
                jsr     j_ClearAllTemporaryObstructionFlags
                movem.l (sp)+,d0-a5
                rts

    ; End of function StartAiControl


; =============== S U B R O U T I N E =======================================

; Out: d1.w = defeated enemies count


CountDefeatedEnemies:
                
                movem.l d0/d2-a6,-(sp)
                move.w  #BATTLESPRITESET_SUBSECTION_ALLIES,d1 ; BUG -- incorrectly limits the counting of dead monsters to the ally battle slot count
                                        ; first operand should be #BATTLESPRITESET_SUBSECTION_ENEMIES
                jsr     j_GetBattleSpritesetSubsection
                move.w  d1,d2
                subi.w  #2,d2
                clr.w   d0
                move.w  #COMBATANT_ENEMIES_START,d0
                clr.w   d3
@Loop:
                
                bsr.w   GetCurrentHp
                tst.w   d1
                bne.s   @Next
                addi.w  #1,d3
@Next:
                
                addi.w  #1,d0
                dbf     d2,@Loop
                
                move.w  d3,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function CountDefeatedEnemies


; =============== S U B R O U T I N E =======================================

; In: d0.w = attacker index


ProcessLineAttackerAi:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                bsr.w   BuildTargetsArrayWithAllies
                move.w  d7,d0
                jsr     j_GetLaserFacing
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                beq.s   @Skip           ; skip if no target
                
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_PRISM_LASER,(a0)
                lea     ((TARGETS_LIST-$1000000)).w,a1
                clr.w   d1
                move.b  ((TARGETS_LIST-$1000000)).w,d1
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.s   @Done
@Skip:
                
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ProcessLineAttackerAi


; =============== S U B R O U T I N E =======================================

; In: d0.w = attacker index


ProcessExploderAi:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d5
                bsr.w   BuildTargetsArrayWithAllies
                move.w  #SPELL_B_ROCK,d1 ; Burst Rock spell
                bsr.w   PopulateTargetsListForSpell
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                beq.s   @DoNotExplode   ; do not explode if no target
                
                move.w  #6,d6
                jsr     j_GenerateRandomNumberUnderD6
                cmpi.b  #4,d7
                bne.s   @DoNotExplode   ; randomly do not explode
                
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_BURST_ROCK,(a0)
                move.w  #SPELL_B_ROCK,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d5,BATTLEACTION_OFFSET_TARGET(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@DoNotExplode:
                
                move.w  d5,d0
                move.w  #AI_COMMAND_MOVE1,d1
                clr.w   d7
                bsr.w   ExecuteAiCommand
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ProcessExploderAi

