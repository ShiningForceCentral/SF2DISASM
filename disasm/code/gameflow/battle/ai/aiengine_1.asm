
; ASM FILE code\gameflow\battle\ai\aiengine_1.asm :
; 0xDEFC..0xE1AC : AI engine

; =============== S U B R O U T I N E =======================================

; Starting point for the AI control process.
; 
;   In: d0.w = combatant index


StartAiControl:
                
                movem.l d0-a5,-(sp)
                move.w  d0,d7           ; D7 = copy of AI controlled combatant index
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                move.w  #6,d5           ; if an ally is AI controlled (Peter, Jaro) use AI #6
                bra.w   @HandleAiCommandset
@Enemy:
                
                bsr.w   GetAiCommandset 
                cmpi.b  #AICOMMANDSET_SWARM,d1 ; check for AI #15, the "swarm" AI used in Kraken, Harpy, and Chess Battles
                beq.s   @IsAtFullHP
                bra.w   @NonSwarmAi
@IsAtFullHP:
                
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
                move.b  (a0),d2         ; D2 = number of swarm battles
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
                move.b  d7,d5           ; d7 holds the character index, for monsters it starts at $80
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d5 ; d5 now holds the monster index for the battle (starts at $00)
                move.b  (a0,d5.w),d0    ; d0 now holds the number from the swarm table corresponding to the monster
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
                
                lea     (BATTLE_REGION_FLAGS_TO_BE_TRIGGERED).l,a0
                move.w  #0,(a0)
                move.w  d7,d0
                bsr.w   GetAiRegion     
                cmpi.w  #15,d1
                bne.s   @CheckActivationFlag
                cmpi.w  #15,d2
                bne.s   @CheckActivationFlag
                bra.w   @HandleSpecialAttackers
@CheckActivationFlag:
                
                move.w  d7,d0
                bsr.w   GetActivationBitfield
                move.w  d1,d4
                andi.w  #3,d1
                btst    #0,d1
                bne.s   @HandleSpecialAttackers
                bsr.w   sub_F522        
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @Done
@HandleSpecialAttackers:
                
                move.w  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @CheckSpecialMoveOrders ; skip if ally
                
                ; If enemy, handle special attackers
                bsr.w   GetEnemy        
                
                ; Check if line attacker
                cmpi.w  #ENEMY_PRISM_FLOWER,d1
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
                
                move.w  d7,d0
                bsr.w   GetAiSpecialMoveOrders
                cmpi.w  #NOTHING_BYTE,d1
                beq.s   @HandleSecondaryCharacteristics
                btst    #6,d1
                bne.s   @HandleSecondaryCharacteristics
                move.w  d1,d0
                bsr.w   GetCurrentHp
                tst.w   d1
                bne.s   @HandleSecondaryCharacteristics
                move.w  d7,d0
                bsr.w   GetAiSpecialMoveOrders
                move.w  d2,d1
                move.w  #NOTHING_BYTE,d2
                bsr.w   SetAiSpecialMoveOrders
@HandleSecondaryCharacteristics:
                
                move.w  d7,d0
                bsr.w   GetAiCommandset 
                move.w  d1,d5           ; D5 = copy of AI commandset
                lea     table_E249(pc), a0
                nop
                move.b  (a0,d1.w),d6
                tst.b   d6
                beq.s   @HandleAiCommandset
                cmpi.b  #1,d6
                bne.s   @CheckSecondaryCharacteristic2
                jsr     j_GetMoveListForEnemyTarget
@CheckSecondaryCharacteristic2:
                
                cmpi.b  #2,d6
                bne.s   @HandleAiCommandset
                jsr     sub_1AC030      
@HandleAiCommandset:
                
                move.w  d5,d1
                lea     pt_AiCommandsets(pc), a0
                nop
                lsl.l   #2,d1
                movea.l (a0,d1.w),a1
                clr.w   d2
                move.b  (a1),d2         ; D2 = number of commands
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
                
                jsr     j_ClearBattleTerrainArrayObstructionFlags
                movem.l (sp)+,d0-a5
                rts

    ; End of function StartAiControl


; =============== S U B R O U T I N E =======================================

; Out: d1.w = defeated enemies count


CountDefeatedEnemies:
                
                movem.l d0/d2-a6,-(sp)
                if (FIX_COUNT_DEFEATED_ENEMIES=1)
            	    move.w  #BATTLESPRITESET_SUBSECTION_ENEMIES,d1 ;properly checks all monsters in the battle
            	else
            	    move.w  #BATTLESPRITESET_SUBSECTION_ALLIES,d1 ;incorrectly limits to the counting of dead monsters to the ally battle slot count
            	endif
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


ProcessLineAttackerAi:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                bsr.w   PopulateTargetsArrayWithAllies
                move.w  d7,d0
                jsr     j_GetLaserFacing
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                beq.s   loc_E12C
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_PRISM_LASER,(a0)
                lea     ((TARGETS_LIST-$1000000)).w,a1
                clr.w   d1
                move.b  ((TARGETS_LIST-$1000000)).w,d1
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.s   loc_E13E
loc_E12C:
                
                lea     (CURRENT_BATTLEACTION).l,a0
loc_E132:
                
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
loc_E13E:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ProcessLineAttackerAi


; =============== S U B R O U T I N E =======================================


ProcessExploderAi:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d5
                bsr.w   PopulateTargetsArrayWithAllies
                move.w  #SPELL_B_ROCK,d1 ; Burst Rock spell
                bsr.w   PopulateTargetableGrid_CastSpell
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d0
                tst.w   d0
                beq.s   loc_E190
                move.w  #6,d6
                jsr     j_GenerateRandomNumberUnderD6
                cmpi.b  #4,d7
                bne.s   loc_E190
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_BURST_ROCK,(a0)
                move.w  #SPELL_B_ROCK,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d5,BATTLEACTION_OFFSET_ACTOR(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   loc_E1A6
loc_E190:
                
                move.w  d5,d0
                move.w  #AICOMMAND_MOVE,d1
                clr.w   d7
                bsr.w   ExecuteAiCommand
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
loc_E1A6:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ProcessExploderAi

