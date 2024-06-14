
; ASM FILE code\gameflow\battle\battlefunctions\battlefunctions_1.asm :
; 0x23A84..0x23E50 : Battle functions

; =============== S U B R O U T I N E =======================================

; In: D0 = map index
;     D1 = battle index


BattleLoop:
                
                clearSavedByte PLAYER_TYPE
            if (MUSIC_RESUMING&RESUME_BATTLESCENE_MUSIC=1)
                activateMusicResuming
            endif
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                chkFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                beq.s   @Initialize
                
                ; Start here if game was suspended mid-battle
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                move.l  d0,-(sp)
                lea     (SAVED_SECONDS_COUNTER).l,a0
                movep.l 0(a0),d0
                move.l  d0,((SECONDS_COUNTER-$1000000)).w
                move.l  (sp)+,d0
                movea.l (sp)+,a0
            else
                move.l  ((SAVED_SECONDS_COUNTER-$1000000)).w,((SECONDS_COUNTER-$1000000)).w
            endif
                clrFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                jsr     j_ClearAiMoveInfo
                clr.b   ((VIEW_TARGET_ENTITY-$1000000)).w
                bsr.w   LoadBattle      
                bra.w   @ExecuteIndividualTurns_Loop
                bra.w   @Start          ; unreachable
@Initialize:
                
                clr.l   ((SECONDS_COUNTER-$1000000)).w
                
                movem.w d0-d1,-(sp)
                setSavedByte d0, CURRENT_MAP
                setSavedByte d1, CURRENT_BATTLE
                bsr.w   SetBaseVIntFunctions
                jsr     j_ExecuteBeforeBattleCutscene
                movem.w (sp)+,d0-d1
                
                setSavedByte d0, CURRENT_MAP
                setSavedByte d1, CURRENT_BATTLE
                moveq   #BATTLE_REGION_FLAGS_START,d1
@ClearBattleRegionFlags_Loop:
                
                jsr     j_ClearFlag     ; clear battle region flags
                addq.w  #1,d1
                cmpi.w  #BATTLE_REGION_FLAGS_END,d1
                ble.s   @ClearBattleRegionFlags_Loop
                
                bsr.w   HealLivingAndImmortalAllies
                jsr     j_InitializeAllAlliesBattlePositions
                jsr     j_InitializeAllEnemiesBattlePositions
                jsr     j_ClearAiMoveInfo
                clr.w   d0
                bsr.w   LoadBattle      
                jsr     j_ExecuteBattleStartCutscene
@Start:
                
                bsr.w   UpdateAllEnemiesAi ; start of battle loop
                jsr     j_ExecuteBattleRegionCutscene
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @SpawnEnemies
                
                bsr.w   PrintAllActivatedDefCons
@SpawnEnemies:
                
                jsr     j_PopulateTargetsListWithRespawningEnemies
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                beq.s   @Call_GenerateBattleTurnOrder
                
                subq.w  #1,d7
                lea     ((TARGETS_LIST-$1000000)).w,a0
@SpawnEnemies_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                bsr.w   SpawnEnemyWithCamera
                dbf     d7,@SpawnEnemies_Loop
@Call_GenerateBattleTurnOrder:
                
                bsr.w   GenerateBattleTurnOrder
@ExecuteIndividualTurns_Loop:
                
                clr.w   d0              ; start of individual turn execution
                getBattleTurnActor d0
                cmpi.b  #-1,d0
                beq.s   @Start          
                
                bsr.w   ExecuteIndividualTurn
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @Continue
                cmpi.b  #INPUT_UP|INPUT_B|INPUT_C|INPUT_A,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @Continue
                bsr.w   KillRemainingEnemies
@Continue:
                
                jsr     j_ExecuteBattleCutscene_Defeated
                jsr     ProcessKilledCombatants(pc)
                nop
                bsr.w   GetRemainingCombatants
                tst.w   d2
                beq.w   BattleLoop_Defeat
                tst.w   d3
                beq.w   BattleLoop_Victory
                clr.w   d0
                getBattleTurnActor d0
                bsr.w   ProcessAfterTurnEffects
                jsr     ProcessKilledCombatants(pc)
                nop
                bsr.w   GetRemainingCombatants
                tst.w   d2
                beq.w   BattleLoop_Defeat
                tst.w   d3
                beq.w   BattleLoop_Victory
                addToSavedByte #TURN_ORDER_ENTRY_SIZE, CURRENT_BATTLE_TURN
                bra.s   @ExecuteIndividualTurns_Loop

    ; End of function BattleLoop


; =============== S U B R O U T I N E =======================================


KillRemainingEnemies:
                
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                move.w  #COMBATANT_ENEMIES_START,d0
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
@Loop:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @Skip           ; skip if already dead
                jsr     j_GetCombatantY
                tst.b   d1
                bmi.w   @Skip
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @Skip
                move.b  d0,(a0)+
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                moveq   #0,d1
                jsr     j_SetCurrentHp
@Skip:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                rts

    ; End of function KillRemainingEnemies


; =============== S U B R O U T I N E =======================================


HealLivingAndImmortalAllies:
                
            if (STANDARD_BUILD=1)
                movem.l d0-d2/d7-a0,-(sp)
                clr.w   d0
                moveq   #0,d2
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                
@Loop:          lea     table_ImmortalAllies(pc), a0
                move.w  d0,d1
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcc.s   @Immortal
                jsr     GetCurrentHP
                beq.s   @Dead           ; skip healing if character is dead
@Immortal:      jsr     GetMaxHP
                jsr     SetCurrentHP
                jsr     GetMaxMP
                jsr     SetCurrentMP
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE,d1 ; cure all but lasting status effects
                jsr     SetStatusEffects
                jsr     ApplyStatusEffectsAndItemsOnStats
@Dead:          addq.w  #1,d0
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-d2/d7-a0
                rts
            else
                movem.l d0-d7,-(sp)
                clr.w   d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                cmpi.b  #ALLY_PETER,d0  ; HARDCODED ally indexes
                beq.w   @Immortal
                cmpi.b  #ALLY_LEMON,d0
                beq.w   @Immortal       ; always heal if character is immortal
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @Dead           ; skip healing if character is dead
@Immortal:
                
                jsr     j_GetMaxHp
                jsr     j_SetCurrentHp
                jsr     j_GetMaxMp
                jsr     j_SetCurrentMp
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE,d1 
                                                        ; cure all but lasting status effects
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
@Dead:
                
                addq.w  #1,d0
                dbf     d7,@Loop        
                
                movem.l (sp)+,d0-d7
                rts
            endif

    ; End of function HealLivingAndImmortalAllies


; =============== S U B R O U T I N E =======================================

; Get number of allies living, number of enemies living -> D2, D3


GetRemainingCombatants:
                
                clr.w   d2
                clr.w   d3
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
@Allies_Loop:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @DeadAlly
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @DeadAlly
                addq.w  #1,d2
@DeadAlly:
                
                addq.w  #1,d0
                dbf     d7,@Allies_Loop
                
                move.w  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d7
@Enemies_Loop:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @DeadEnemy
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @DeadEnemy
                addq.w  #1,d3
@DeadEnemy:
                
                addq.w  #1,d0
                dbf     d7,@Enemies_Loop
                
            if (STANDARD_BUILD&BOWIE_CAN_DIE=1)
            else
                clr.w   d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Return
                clr.w   d2
            endif
@Return:
                
                rts

    ; End of function GetRemainingCombatants


; =============== S U B R O U T I N E =======================================


BattleLoop_Victory:
                
                bsr.w   HealLivingAndImmortalAllies
            if (STANDARD_BUILD=1)
                movem.l d1-d2/a0,-(sp)
                lea     table_DisplayTimerBattles(pc), a0
                getSavedByte CURRENT_BATTLE, d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                movem.l (sp)+,d1-d2/a0
                bcs.s   @Continue
                jsr     CloseTimerWindow
            else
                checkSavedByte #BATTLE_FAIRY_WOODS, CURRENT_BATTLE   ; HARDCODED Battle check for fairy woods
                bne.s   @Continue
                jsr     j_CloseTimerWindow
            endif
@Continue:
                
                getSavedByte CURRENT_MAP, ((MAP_EVENT_PARAM_2-$1000000)).w
                jsr     (UpdateForceAndGetFirstBattlePartyMemberIndex).w
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                jsr     GetCombatantX
                add.b   (BATTLE_AREA_X).l,d1
                move.b  d1,((MAP_EVENT_PARAM_3-$1000000)).w
                jsr     GetCombatantY
                add.b   (BATTLE_AREA_Y).l,d1
            else
                jsr     j_GetCombatantX
                add.b   ((BATTLE_AREA_X-$1000000)).w,d1
                move.b  d1,((MAP_EVENT_PARAM_3-$1000000)).w
                jsr     j_GetCombatantY
                add.b   ((BATTLE_AREA_Y-$1000000)).w,d1
            endif
                move.b  d1,((MAP_EVENT_PARAM_4-$1000000)).w
                bsr.w   GetEntityIndexForCombatant
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.b  ENTITYDEF_OFFSET_FACING(a0,d0.w),((MAP_EVENT_PARAM_5-$1000000)).w
                move.b  #0,((MAP_EVENT_PARAM_1-$1000000)).w
                jsr     j_ExecuteAfterBattleCutscene
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     j_ClearFlag
                addi.w  #BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET,d1
                jsr     j_SetFlag
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

    ; End of function BattleLoop_Victory


; =============== S U B R O U T I N E =======================================


BattleLoop_Defeat:
                
                bsr.w   UpdateBattleUnlockedFlag
                clr.w   ((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_SAD_THEME_2
                txt     363             ; "{LEADER} is exhausted.{W1}"
                clsTxt
        if (STANDARD_BUILD=1)
            if (PLAYER_DEFEAT_IS_GAME_OVER=1)
                jmp     (ResetGame).w
            else
                bsr.w   HealLivingAndImmortalAllies
                jsr     GetGold
                lsr.l   #1,d1           ; divide current gold amount by 2
                jsr     SetGold
                jsr     GetEgressPositionForBattle(pc)
                nop
                moveq   #-1,d4
                
                ; Losable battles
                movem.l d1-d2/a0,-(sp)
                clr.w   d1
                lea     table_LosableBattles(pc), a0
                getSavedByte CURRENT_BATTLE, d1
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     ClearFlag
                addi.w  #BATTLE_COMPLETED_FLAGS_START-BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     SetFlag
                cmpi.b  #TERMINATOR_BYTE,(a0)
                beq.s   @Done
                move.b  (a0),d0
                clr.w   d4
@Done:          movem.l (sp)+,d1-d2/a0
            endif
        else
                clr.w   d0
                jsr     j_GetMaxHp
                jsr     j_SetCurrentHp
                jsr     j_GetGold
                lsr.l   #1,d1           ; divide current gold amount by 2
                jsr     j_SetGold
                jsr     GetEgressPositionForBattle(pc)
                nop
                moveq   #-1,d4
                
                ; Losable battles
                checkSavedByte #BATTLE_AMBUSHED_BY_GALAM_SOLDIERS, CURRENT_BATTLE    ; HARDCODED battle 4 upgrade
                bne.s   @Return
                clrFlg  404             ; Battle 4 unlocked - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS
                setFlg  504             ; Battle 4 completed - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS   
                jsr     j_UpgradeBattle
                moveq   #MAP_GALAM_CASTLE_INNER,d0
                clr.w   d4
        endif
@Return:
                
                rts


    ; End of function BattleLoop_Defeat


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

ExecuteBattleaction_AngelWing:
                
                move.w  combatant(a6),d0
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                jsr     j_RemoveItemBySlot
                bsr.w   CloseBattlefieldWindows
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                andi.w  #ITEMENTRY_MASK_INDEX,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     275             ; "{NAME} used{N}{ITEM}!"
                bra.w   byte_23DFA

    ; End of function ExecuteBattleaction_AngelWing


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

ExecuteBattleaction_Egress:
                
                move.w  combatant(a6),d0
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetSpellCost
                jsr     j_DecreaseCurrentMp
                bsr.w   CloseBattlefieldWindows
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                andi.w  #SPELLENTRY_MASK_INDEX,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  #1,((DIALOGUE_NUMBER-$1000000)).w
                txt     274             ; "{NAME} cast{N}{SPELL} level {#}!"
byte_23DFA:
                
                sndCom  SFX_SPELL_CAST
                jsr     j_ExecuteFlashScreenScript
                clsTxt
                bsr.w   UpdateBattleUnlockedFlag
                unlk    a6
                movem.l (sp)+,d0
                bsr.w   GetEgressPositionForBattle
                clr.w   d4
                rts

    ; End of function ExecuteBattleaction_Egress


; =============== S U B R O U T I N E =======================================


UpdateBattleUnlockedFlag:
                
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_COMPLETED_FLAGS_START,d1
                jsr     j_CheckFlag     ; Check whether current battle is marked as completed
                beq.s   @Return
                subi.w  #BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET,d1
                jsr     j_ClearFlag     ; ...and if so, mark it as "locked".
@Return:
                
                rts

    ; End of function UpdateBattleUnlockedFlag


; =============== S U B R O U T I N E =======================================


CloseBattlefieldWindows:
                
                jsr     j_CloseLandEffectWindow
                jsr     j_CloseBattlefieldMiniStatusWindow
                clr.b   ((IS_TARGETING-$1000000)).w
                jsr     j_CloseBattlefieldMiniStatusWindow
                rts

    ; End of function CloseBattlefieldWindows

