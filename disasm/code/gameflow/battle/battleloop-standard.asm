
; ASM FILE code\gameflow\battle\battleloop-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; In: d0.b = map index
;     d1.b = battle index


BattleLoop:
                ; Clear AI memory tables
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a0
                lea     ((AI_MEMORY_TABLE-$1000000)).w,a1
                moveq   #-1,d2
                moveq   #11,d7
@ClearAiMemory_Loop:
                
                move.l  d2,(a0)+
                clr.l   (a1)+
                dbf     d7,@ClearAiMemory_Loop
                
                clearSavedByte PLAYER_TYPE
            if (MUSIC_RESUMING&RESUME_BATTLESCENE_MUSIC=1)
                activateMusicResuming
            endif
                
                ; Make sure to clear the "invulnerable enemy" flag when initializing a new battle (standard build)
                clrFlg  112             ; Currently attacking Taros with Achilles Sword
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                chkFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                beq.s   @Initialize
                
                ; Start here if game was suspended mid-battle
                loadSavedDataAddress SAVED_SECONDS_COUNTER, a0
                getSavedLong a0, d0
                move.l  d0,((SECONDS_COUNTER-$1000000)).w
                
                ; Clear the "saved mid-battle" flag when continuing
                clrFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                clr.w   d0              ; VIEW_TARGET_ENTITY = party leader when loading battle
                pea     @IndividualTurn(pc)
                jmp     LoadBattle(pc)
                
; ---------------------------------------------------------------------------
@Initialize:
                
                clr.l   ((SECONDS_COUNTER-$1000000)).w
                setSavedByte d0, CURRENT_MAP
                setSavedByte d1, CURRENT_BATTLE
                bsr.w   SetBaseVIntFunctions
                jsr     ExecuteBeforeBattleCutscene
                
                moveq   #BATTLE_REGION_FLAGS_START,d1
@ClearBattleRegionFlags_Loop:
                
                jsr     ClearFlag       ; clear battle region flags
                addq.w  #1,d1
                cmpi.w  #BATTLE_REGION_FLAGS_END,d1
                ble.s   @ClearBattleRegionFlags_Loop
                
                clr.w   d0              ; VIEW_TARGET_ENTITY = party leader when loading battle
                pea     @StartRound(pc)
                pea     ExecuteBattleStartCutscene
                pea     LoadBattle(pc)
                pea     InitializeCombatantsForBattle(pc)
                jmp     HealLivingAndImmortalAllies(pc)

; ---------------------------------------------------------------------------
            if (EXTENDED_BATTLE_TURN_UPDATE=1)
@StartTurn:     ; Is end of round?
                getBattleTurnActor d0
                cmpi.b  #-1,d0
                bne.s   @Update
                
@StartRound:    ; Start a new round
                pea     @IndividualTurn(pc)
                pea     GenerateBattleTurnOrder(pc)
                pea     SpawnAllEnemies(pc)
                bra.s   @Regions
                
@Update:        ; Start of individual turn
                pea     @IndividualTurn(pc)
                pea     UpdateBattleTurnOrder(pc)
                pea     SpawnRegionActivatedEnemies(pc)
@Regions:       pea     ExecuteBattleRegionCutscene
                pea     PrintNewlyActivatedDefCons(pc)
                pea     ActivateEnemies(pc)
                jmp     TriggerRegions(pc)
            else
@StartRound:    ; Start a new round
                pea     @IndividualTurn(pc)
                pea     GenerateBattleTurnOrder(pc)
                pea     SpawnAllEnemies(pc)
                pea     ExecuteBattleRegionCutscene
                pea     PrintAllActivatedDefCons(pc)
                pea     ActivateEnemies(pc)
                jmp     TriggerRegions(pc)
                
@StartTurn:     ; Start of individual turn
            endif
                
; ---------------------------------------------------------------------------
@IndividualTurn:
                ; Is end of round?
                getBattleTurnActor d0
                cmpi.b  #-1,d0
                beq.s   @StartRound
                
                ; Start of individual turn execution
                bsr.w   ExecuteIndividualTurn
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @IsBattleEnd
                
                ; Kill all enemies cheat
                cmpi.b  #INPUT_UP|INPUT_B|INPUT_C|INPUT_A,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @IsBattleEnd
                
                bsr.w   KillRemainingEnemies
@IsBattleEnd:
                
                jsr     ExecuteBattleCutscene_Defeated
                bsr.w   ProcessKilledCombatants ; Get number of allies living, number of enemies living -> d2.w, d3.w
                tst.w   d2
                beq.s   @Defeat
                
                tst.w   d3
                beq.w   @Victory
                
                getBattleTurnActor d0
                bsr.w   ProcessAfterTurnEffectsAndKilledCombatants ; Get number of allies living, number of enemies living -> d2.w, d3.w
                tst.w   d2
                beq.s   @Defeat
                
                tst.w   d3
                beq.w   @Victory
                
                ; Start a new round of turns
                loadSavedDataAddress CURRENT_BATTLE_TURN, a0
                getSavedWord a0, d0
                addq.w  #TURN_ORDER_ENTRY_SIZE,d0
                setSavedWord d0, a0
                bra.w   @StartTurn

; ---------------------------------------------------------------------------
@Defeat:
                
                bsr.w   UpdateBattleUnlockedFlag
                clr.w   ((DIALOGUE_NAME_INDEX_1-$1000000)).w
                
                ; HARDCODED music index
                sndCom  MUSIC_SAD_THEME_2
                txt     363             ; "{LEADER} is exhausted.{W1}"
                clsTxt
            if (PLAYER_DEFEAT_IS_GAME_OVER=1)
                jmp     (ResetGame).w
            endif
                
                ; Revive battle party leader and divide current gold amount by 2
                jsr     UpdateForce
                move.b  ((BATTLE_PARTY_MEMBERS-$1000000)).w,d0
                jsr     GetMaxHp
                jsr     SetCurrentHp
                jsr     GetGold
                lsr.l   #1,d1
                jsr     SetGold
                bsr.w   GetEgressPositionForBattle
                
                ; Are we allowed to progress even if the battle is lost?
                movem.w d1-d3,-(sp)
                moveq   #-1,d4
                
                lea     table_LosableBattles(pc), a0
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     ClearFlag
                addi.w  #BATTLE_COMPLETED_FLAGS_START-BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     SetFlag
                cmpi.b  #-1,(a0)
                beq.s   @Done
                
                move.b  (a0),d0         ; get map index to warp to
                clr.w   d4
                
@Done:          movem.w (sp)+,d1-d3
                rts

; ---------------------------------------------------------------------------
@Victory:
                
                lea     table_DisplayTimerBattles(pc), a0
                getSavedByte CURRENT_BATTLE, d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @GetMap
                
                jsr     CloseTimerWindow
@GetMap:        getSavedByte CURRENT_MAP, ((MAP_EVENT_PARAM_2-$1000000)).w
                
                ; Get first living, non-airborne battle party member in order to avoid a potential soft-lock
                moveq   #-1,d3          ; set check airborne movetype toggle
                jsr     FindFirstLivingBattlePartyMember ; -> d0.w (also updates the battle party members list)
                bpl.s   @GetPosition
                
                ; If nobody is eligible, default to the leader's starting battle position
                clr.w   d0
                move.b  ((BATTLE_PARTY_MEMBERS-$1000000)).w,d0
                pea     @Continue(pc)
                jmp     GetCombatantStartingPosition
@GetPosition:   
                
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
@Continue:      
                ; Convert battle to map coordinates
                addFromSavedByte BATTLE_AREA_X, d1
                addFromSavedByte BATTLE_AREA_Y, d2
                move.b  d1,((MAP_EVENT_PARAM_3-$1000000)).w
                move.b  d2,((MAP_EVENT_PARAM_4-$1000000)).w
                
                ; Get party leader's facing direction
                bsr.w   GetEntityIndexForCombatant
                bpl.s   @GetFacing
                
                clr.w   d0              ; default to first entity if the leader entity does not exist (i.e., if they died)
@GetFacing:
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.b  ENTITYDEF_OFFSET_FACING(a0,d0.w),((MAP_EVENT_PARAM_5-$1000000)).w
                
                clr.b   ((MAP_EVENT_PARAM_1-$1000000)).w
                jsr     ExecuteAfterBattleCutscene
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     ClearFlag
                addi.w  #BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET,d1
                jsr     SetFlag
                clr.w   d0
                clr.w   d1
                clr.w   d2
                clr.w   d3
                move.b  ((MAP_EVENT_PARAM_2-$1000000)).w,d0
                move.b  ((MAP_EVENT_PARAM_3-$1000000)).w,d1
                move.b  ((MAP_EVENT_PARAM_4-$1000000)).w,d2
                move.b  ((MAP_EVENT_PARAM_5-$1000000)).w,d3
                moveq   #1,d4
                rts

    ; End of function BattleLoop

