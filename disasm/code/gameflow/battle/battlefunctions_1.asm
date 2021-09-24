
; ASM FILE code\gameflow\battle\battlefunctions_1.asm :
; 0x23A84..0x257C0 : Battle functions

; =============== S U B R O U T I N E =======================================

; In: D0 = map index
;     D1 = battle index


BattleLoop:
                
                clr.b   ((PLAYER_TYPE-$1000000)).w
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                chkFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                beq.s   @Continue1
                move.l  ((SECONDS_COUNTER_FROM_SRAM-$1000000)).w,((SECONDS_COUNTER-$1000000)).w
                clrFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                jsr     j_ClearEnemyMoveInfo
                clr.b   ((VIEW_TARGET_ENTITY-$1000000)).w
                bsr.w   LoadBattle      
                bra.w   @ExecuteTurns_Loop
                bra.w   @Start          
@Continue1:
                
                clr.l   ((SECONDS_COUNTER-$1000000)).w
                movem.w d0-d1,-(sp)
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  d1,((CURRENT_BATTLE-$1000000)).w
                bsr.w   SetBaseVIntFunctions
                jsr     j_ExecuteBattleCutscene_Intro
                movem.w (sp)+,d0-d1
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  d1,((CURRENT_BATTLE-$1000000)).w
                moveq   #$5A,d1 
@ClearBattleRegionFlags:
                
                jsr     j_ClearFlag     ; clear battle region flags
                addq.w  #1,d1
                cmpi.w  #$69,d1 
                ble.s   @ClearBattleRegionFlags
                
                bsr.w   HealLivingAndImmortalAllies
                jsr     j_InitAllAlliesBattlePositions
                jsr     j_InitAllEnemiesBattlePositions
                jsr     j_ClearEnemyMoveInfo
                clr.w   d0
                bsr.w   LoadBattle      
                jsr     j_ExecuteBattleCutscene_Start
@Start:
                
                bsr.w   UpdateAllEnemiesAI ; start of battle loop
                jsr     j_ExecuteBattleRegionCutscene
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.s   @SpawnEnemies
                bsr.w   PrintAllActivatedDefCons
@SpawnEnemies:
                
                jsr     j_GetListOfSpawningEnemies
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                beq.s   @DetermineTurnOrder
                subq.w  #1,d7
                lea     ((TARGETS_LIST-$1000000)).w,a0
@SpawnEnemies_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                bsr.w   SpawnEnemy
                dbf     d7,@SpawnEnemies_Loop
@DetermineTurnOrder:
                
                bsr.w   CreateRandomizedTurnOrder
@ExecuteTurns_Loop:
                
                clr.w   d0              ; start of individual turn execution
                move.b  ((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w,d0
                lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                cmpi.b  #CODE_TERMINATOR_BYTE,d0
                beq.s   @Start          
                bsr.w   ExecuteIndividualTurn
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.s   @Continue2
                cmpi.b  #INPUT_UP|INPUT_B|INPUT_C|INPUT_A,((P1_INPUT-$1000000)).w
                bne.s   @Continue2
                bsr.w   KillRemainingEnemies
@Continue2:
                
                jsr     j_ExecuteBattleCutscene_Defeated
                jsr     HandleKilledCombatants(pc)
                nop
                bsr.w   GetRemainingCombatants
                tst.w   d2
                beq.w   BattleLoop_Defeat
                tst.w   d3
                beq.w   BattleLoop_Victory
                clr.w   d0
                move.b  ((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w,d0
                lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                bsr.w   HandleAfterTurnEffects
                jsr     HandleKilledCombatants(pc)
                nop
                bsr.w   GetRemainingCombatants
                tst.w   d2
                beq.w   BattleLoop_Defeat
                tst.w   d3
                beq.w   BattleLoop_Victory
                addq.b  #2,((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w
                bra.s   @ExecuteTurns_Loop

    ; End of function BattleLoop


; =============== S U B R O U T I N E =======================================


KillRemainingEnemies:
                
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                move.w  #COMBATANT_ENEMIES_START,d0
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
@Loop:
                
                jsr     j_GetXPos
                tst.b   d1
                bmi.w   @Skip           ; skip if already dead
                jsr     j_GetYPos
                tst.b   d1
                bmi.w   @Skip
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   @Skip
                move.b  d0,(a0)+
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                moveq   #0,d1
                jsr     j_SetCurrentHP
@Skip:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                rts

    ; End of function KillRemainingEnemies


; =============== S U B R O U T I N E =======================================


HealLivingAndImmortalAllies:
                
                movem.l d0-d7,-(sp)
                clr.w   d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                cmpi.b  #ALLY_PETER,d0  ; HARDCODED ally indexes
                beq.w   @Immortal
                cmpi.b  #ALLY_LEMON,d0
                beq.w   @Immortal       ; always heal if character is immortal
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   @Dead           ; skip healing if character is dead
@Immortal:
                
                jsr     j_GetMaxHP
                jsr     j_SetCurrentHP
                jsr     j_GetMaxMP
                jsr     j_SetCurrentMP
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

    ; End of function HealLivingAndImmortalAllies


; =============== S U B R O U T I N E =======================================

; Get number of allies living, number of enemies living -> D2, D3


GetRemainingCombatants:
                
                clr.w   d2
                clr.w   d3
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
@Allies_Loop:
                
                jsr     j_GetXPos
                tst.b   d1
                bmi.w   @DeadAlly
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   @DeadAlly
                addq.w  #1,d2
@DeadAlly:
                
                addq.w  #1,d0
                dbf     d7,@Allies_Loop
                
                move.w  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d7
@Enemies_Loop:
                
                jsr     j_GetXPos
                tst.b   d1
                bmi.w   @DeadEnemy
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   @DeadEnemy
                addq.w  #1,d3
@DeadEnemy:
                
                addq.w  #1,d0
                dbf     d7,@Enemies_Loop
                
                clr.w   d0
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   @Return
                clr.w   d2
@Return:
                
                rts

    ; End of function GetRemainingCombatants


; =============== S U B R O U T I N E =======================================


BattleLoop_Victory:
                
                bsr.w   HealLivingAndImmortalAllies
                cmpi.b  #BATTLE_FAIRY_WOODS,((CURRENT_BATTLE-$1000000)).w 
                                                        ; HARDCODED Battle check for fairy woods
                bne.s   @Continue
                jsr     j_DisplayTimerWindow
@Continue:
                
                move.b  ((CURRENT_MAP-$1000000)).w,((MAP_EVENT_PARAM_2-$1000000)).w
                jsr     (UpdateForceAndGetFirstBattlePartyMemberIndex).w
                jsr     j_GetXPos
                add.b   ((BATTLE_AREA_X-$1000000)).w,d1
                move.b  d1,((MAP_EVENT_PARAM_3-$1000000)).w
                jsr     j_GetYPos
                add.b   ((BATTLE_AREA_Y-$1000000)).w,d1
                move.b  d1,((MAP_EVENT_PARAM_4-$1000000)).w
                bsr.w   GetEntityIndexForCombatant
                lsl.w   #5,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.b  $10(a0,d0.w),((MAP_EVENT_PARAM_5-$1000000)).w
                move.b  #0,((MAP_EVENT_PARAM_1-$1000000)).w
                jsr     j_ExecuteAfterBattleCutscene
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                addi.w  #$190,d1
                jsr     j_ClearFlag
                addi.w  #$64,d1 
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
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_SAD_THEME_2
                txt     363             ; "{LEADER} is exhausted.{W1}"
                clsTxt
                clr.w   d0
                jsr     j_GetMaxHP
                jsr     j_SetCurrentHP
                jsr     j_GetGold
                lsr.l   #1,d1           ; divide current gold amount by 2
                jsr     j_SetGold
                jsr     GetEgressPositionForBattle(pc)
                nop
                moveq   #$FFFFFFFF,d4
                
                ; Losable battles
                cmpi.b  #BATTLE_AMBUSHED_BY_GALAM_SOLDIERS,((CURRENT_BATTLE-$1000000)).w 
                                                        ; HARDCODED battle 4 upgrade
                bne.s   @Return
                clrFlg  404             ; Battle 4 unlocked - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS
                setFlg  504             ; Battle 4 completed - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS   
                jsr     j_UpgradeBattle
                moveq   #$11,d0
                clr.w   d4
@Return:
                
                rts

    ; End of function BattleLoop_Defeat


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

BattleAction_UseAngelWing:
                
                move.w  combatant(a6),d0
                move.w  ((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w,d1
                jsr     j_RemoveItemBySlot
                bsr.w   HideBattlefieldWindows
                move.w  combatant(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,((TEXT_NAME_INDEX_2-$1000000)).w
                andi.w  #ITEMENTRY_MASK_INDEX,((TEXT_NAME_INDEX_2-$1000000)).w
                txt     275             ; "{NAME} used{N}{ITEM}!"
                bra.w   byte_23DFA

    ; End of function BattleAction_UseAngelWing


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

BattleAction_CastEgress:
                
                move.w  combatant(a6),d0
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetSpellCost
                jsr     j_DecreaseCurrentMP
                bsr.w   HideBattlefieldWindows
                move.w  combatant(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,((TEXT_NAME_INDEX_2-$1000000)).w
                andi.w  #SPELLENTRY_MASK_INDEX,((TEXT_NAME_INDEX_2-$1000000)).w
                move.l  #1,((TEXT_NUMBER-$1000000)).w
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

    ; End of function BattleAction_CastEgress


; =============== S U B R O U T I N E =======================================


UpdateBattleUnlockedFlag:
                
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                addi.w  #$1F4,d1
                jsr     j_CheckFlag     ; Check whether current battle is marked as completed
                beq.s   @Return
                subi.w  #$64,d1 
                jsr     j_ClearFlag     ; ...and if so, mark it as "locked".
@Return:
                
                rts

    ; End of function UpdateBattleUnlockedFlag


; =============== S U B R O U T I N E =======================================


HideBattlefieldWindows:
                
                jsr     j_HideLandEffectWindow
                jsr     j_HideMiniStatusWindow
                clr.b   ((IS_TARGETING-$1000000)).w
                jsr     j_HideMiniStatusWindow
                rts

    ; End of function HideBattlefieldWindows


; =============== S U B R O U T I N E =======================================

; HARDCODED special cases


GetEgressPositionForBattle:
                
                clr.b   d7
                move.b  ((CURRENT_BATTLE-$1000000)).w,d7
                cmpi.b  #BATTLE_VERSUS_GESHP,d7
                bne.s   loc_23E60
                clrFlg  438             ; Battle 38 unlocked - BATTLE_VERSUS_GESHP              
loc_23E60:
                
                cmpi.b  #BATTLE_TO_ANCIENT_SHRINE,d7
                bne.s   loc_23E6A
                clrFlg  439             ; Battle 39 unlocked - BATTLE_TO_ANCIENT_SHRINE         
loc_23E6A:
                
                cmpi.b  #BATTLE_VERSUS_KRAKEN,d7
                bne.s   loc_23E76
                moveq   #MAP_POLCA,d0
                bra.w   loc_23EAA
loc_23E76:
                
                cmpi.b  #BATTLE_TO_TAROS_SHRINE,d7
                bne.s   loc_23E82
                moveq   #MAP_HASSAN,d0
                bra.w   loc_23EAA
loc_23E82:
                
                cmpi.b  #BATTLE_POLCA_VILLAGE,d7
                bne.s   loc_23E8E
                moveq   #MAP_MOUNT_VOLCANON,d0
                bra.w   loc_23EAA
loc_23E8E:
                
                cmpi.b  #BATTLE_PACALON,d7
                bne.s   loc_23E9A
                moveq   #MAP_PACALON_CASTLE,d0
                bra.w   loc_23EAA
loc_23E9A:
                
                cmpi.b  #BATTLE_TO_MOUN,d7
                bne.s   loc_23EA6
                moveq   #MAP_PACALON,d0
                bra.w   loc_23EAA
loc_23EA6:
                
                move.b  ((EGRESS_MAP_INDEX-$1000000)).w,d0
loc_23EAA:
                
                jsr     (GetSavePointForMap).w
                rts

    ; End of function GetEgressPositionForBattle


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index

itemOrSpellIndex = -4
combatant = -2

ExecuteIndividualTurn:
                
                jsr     (sub_4ED8).w
                clr.w   ((SPEECH_SFX-$1000000)).w
                link    a6,#-16
                andi.w  #COMBATANT_MASK_ALL,d0
                move.w  d0,combatant(a6)
@Start:
                
                bsr.w   ClearDeadCombatantsListLength
                cmpi.b  #BATTLE_VERSUS_TAROS,((CURRENT_BATTLE-$1000000)).w 
                                                        ; HARDCODED battle index
                bne.s   @Continue1
                tst.w   combatant(a6)
                bne.s   @Continue1
                clrFlg  112             ; Currently attacking Taros with Achilles Sword
@Continue1:
                
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   @Done
                move.w  combatant(a6),d0
                jsr     j_GetXPos
                move.w  d1,((word_FFB08E-$1000000)).w
                move.w  d1,((word_FFB094-$1000000)).w
                jsr     j_GetYPos
                move.w  d1,((word_FFB090-$1000000)).w
                move.w  d1,((word_FFB092-$1000000)).w
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   SetUnitCursorDestinationToNextCombatant
                move.w  combatant(a6),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE,d1
                bne.w   @AutoControl1   
                jsr     j_GetCharacterWord34
                andi.w  #4,d1
                bne.w   @AutoControl1   
                tst.b   d0
                bpl.s   @Ally1          ; check if current combatant is ally or enemy
                tst.b   ((CONTROL_OPPONENT_CHEAT-$1000000)).w
                beq.w   @AutoControl1   
                bra.s   @Continue2
@Ally1:
                
                tst.b   ((AUTO_BATTLE_CHEAT-$1000000)).w
                bne.w   @AutoControl1   
@Continue2:
                
                bra.w   @PlayerControl  
@AutoControl1:
                
                jsr     sub_82A0        ; AI controlled unit (enemy, auto-control cheat, MUDDLEd force member)
@PlayerControl:
                
                bsr.w   WaitForUnitCursor ; player controlled unit (normal force member, enemy with control opponent cheat)
                jsr     (WaitForViewScrollEnd).w
                clr.b   ((IS_TARGETING-$1000000)).w
                move.w  combatant(a6),d0
                move.w  d0,((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w
                jsr     j_CreateBattlefieldMiniStatusWindow
                jsr     j_CreateLandEffectWindow
                move.w  combatant(a6),d0
                jsr     j_GenerateTargetRangeLists
                bsr.w   CreateMoveableRangeForUnit
                bsr.w   HideUnitCursor
                move.w  combatant(a6),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_SLEEP,d1
                bne.w   @NoAction
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_STUN,d1
                bne.w   @NoAction
                move.w  combatant(a6),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE,d1
                bne.w   @AutoControl2
                jsr     j_GetCharacterWord34
                andi.w  #4,d1
                bne.w   @AutoControl2
                tst.b   d0
                bpl.s   @Ally2
                tst.b   ((CONTROL_OPPONENT_CHEAT-$1000000)).w
                beq.w   @AutoControl2
                bra.s   @Continue3
@Ally2:
                
                tst.b   ((AUTO_BATTLE_CHEAT-$1000000)).w
                bne.w   @AutoControl2
@Continue3:
                
                bsr.w   sub_24662
                cmpi.w  #$FFFF,d0
                bne.w   @CheckBattleAction_CastEgress
                jsr     (WaitForViewScrollEnd).w
                move.w  combatant(a6),d0
                clr.b   ((IS_TARGETING-$1000000)).w
                jsr     j_HideLandEffectWindow
                jsr     j_HideMiniStatusWindow
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                moveq   #3,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                bsr.w   BattlefieldMenuActions
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                bra.w   @Start
@AutoControl2:
                
                bsr.w   sub_252FA       
@CheckBattleAction_CastEgress:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                bne.s   @CheckBattleAction_UseAngelWing
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d0
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                cmpi.w  #SPELL_EGRESS,d0
                beq.w   BattleAction_CastEgress
@CheckBattleAction_UseAngelWing:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                bne.s   @CheckBattleAction3
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_ANGEL_WING,d0
                beq.w   BattleAction_UseAngelWing
@CheckBattleAction3:
                
                cmpi.w  #BATTLEACTION_3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                beq.w   @NoAction
                cmpi.w  #BATTLEACTION_80,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                bne.w   @KiwiFlameBreath
                clr.w   ((BATTLESCENE_ACTION_TYPE-$1000000)).w
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  combatant(a6),((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,combatant(a6)
@KiwiFlameBreath:
                
                move.w  combatant(a6),d0
                jsr     j_GetClass
                cmpi.w  #CLASS_MNST,d1  ; HARDCODED class test : MNST (Monster, for Kiwi)
                bne.s   @CheckFairyWoodsBattle
                tst.w   ((BATTLESCENE_ACTION_TYPE-$1000000)).w
                bne.s   @CheckFairyWoodsBattle
                moveq   #CHANCE_TO_PERFORM_KIWI_FLAME_BREATH,d6 ; 1/4 chance to perform Kiwi's Flame Breath
                jsr     (GenerateRandomNumber).w ; Kiwi's special attack ?
                tst.w   d7
                bne.s   @CheckFairyWoodsBattle
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,((word_FFB632-$1000000)).w
                move.w  #BATTLEACTION_CAST_SPELL,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                jsr     j_GetCurrentLevel
                clr.w   d0
                cmpi.w  #KIWI_FLAME_BREATH_UPGRADE_LEVEL1,d1
                blt.s   @CheckUpgradeLevel2
                addq.w  #1,d0
@CheckUpgradeLevel2:
                
                cmpi.w  #KIWI_FLAME_BREATH_UPGRADE_LEVEL2,d1
                blt.s   @CheckUpgradeLevel3
                addq.w  #1,d0
@CheckUpgradeLevel3:
                
                cmpi.w  #KIWI_FLAME_BREATH_UPGRADE_LEVEL3,d1
                blt.s   @GetSpellIndex
                addq.w  #1,d0
@GetSpellIndex:
                
                lsl.w   #6,d0
                ori.w   #SPELL_KIWI,d0
                move.w  d0,((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
@CheckFairyWoodsBattle:
                
                cmpi.b  #BATTLE_FAIRY_WOODS,((CURRENT_BATTLE-$1000000)).w 
                                                        ; HARDCODED Battle check : Fairy wood secret battle
                bne.s   @WriteBattlesceneScript
                jsr     j_DisplayTimerWindow
@WriteBattlesceneScript:
                
                jsr     (WaitForVInt).w
                jsr     (WaitForVInt).w
                move.w  combatant(a6),d0
                jsr     j_WriteBattlesceneScript
                move.w  combatant(a6),d0
                
                ; Get battlescene music index
                tst.b   d0
                blt.s   @EnemyMusic     
                jsr     j_GetClass
                cmpi.w  #CHAR_CLASS_FIRSTPROMOTED,d1 ; HARDCODED music choices
                bge.s   @PromotedMusic  
                move.b  #MUSIC_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; regular
                bra.s   @Continue4
@PromotedMusic:
                
                move.b  #MUSIC_PROMOTED_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; promoted
@Continue4:
                
                bra.w   @GetFirstBattlesceneEnemy
@EnemyMusic:
                
                move.b  #MUSIC_ENEMY_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; enemy
                jsr     j_GetEnemyIndex
                
                ; Determine boss attack music
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1 ; HARDCODED enemy indexes
                bne.s   @CheckTaros
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; boss
@CheckTaros:
                
                cmpi.b  #ENEMY_TAROS,d1
                bne.s   @CheckZalbard
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
@CheckZalbard:
                
                cmpi.b  #ENEMY_ZALBARD,d1
                bne.s   @CheckCameela
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
@CheckCameela:
                
                cmpi.b  #ENEMY_CAMEELA,d1
                bne.s   @CheckRedBaron
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
@CheckRedBaron:
                
                cmpi.b  #ENEMY_RED_BARON,d1
                bne.s   @CheckGeshp
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
@CheckGeshp:
                
                cmpi.b  #ENEMY_GESHP,d1
                bne.s   @CheckOddEye
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
@CheckOddEye:
                
                cmpi.b  #ENEMY_ODD_EYE,d1
                bne.s   @CheckGalam
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
@CheckGalam:
                
                cmpi.b  #ENEMY_GALAM,d1
                bne.s   @CheckZeon
                move.b  #MUSIC_BOSS_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
@CheckZeon:
                
                cmpi.b  #ENEMY_ZEON,d1
                bne.s   @GetFirstBattlesceneEnemy
                move.b  #MUSIC_ZEON_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; zeon
@GetFirstBattlesceneEnemy:
                
                clr.w   d0
                move.b  ((BATTLESCENE_FIRST_ENEMY-$1000000)).w,d0
                cmpi.b  #$FF,d0
                bne.s   @GetFirstBattlesceneAlly
                move.w  #$FFFF,d0       ; D0 = battlescene enemy
@GetFirstBattlesceneAlly:
                
                clr.w   d1
                move.b  ((BATTLESCENE_FIRST_ALLY-$1000000)).w,d1
                cmpi.b  #$FF,d1
                bne.s   @InitBattlescene
                move.w  #$FFFF,d1       ; D1 = battlescene ally
@InitBattlescene:
                
                movem.l a6,-(sp)
                jsr     j_InitializeBattlescene
                move.b  #$FF,((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                jsr     j_ExecuteBattlesceneScript
                jsr     j_EndBattlescene
                jsr     j_ApplyPositionsAfterEnemyLeaderDies ; After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.
                movem.l (sp)+,a6
                movem.l a6,-(sp)
                clr.w   d0
                move.w  itemOrSpellIndex(a6),d0
                jsr     LoadBattle(pc)  
                nop
                jsr     (WaitForVInt).w
                clr.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                movem.l (sp)+,a6
                bra.s   @Done
@NoAction:
                
                jsr     (WaitForViewScrollEnd).w
                jsr     (WaitForVInt).w
                clr.b   ((IS_TARGETING-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                moveq   #3,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                move.w  combatant(a6),d0
                jsr     j_HideLandEffectWindow
                jsr     j_HideMiniStatusWindow
@Done:
                
                unlk    a6
                rts

    ; End of function ExecuteIndividualTurn


; =============== S U B R O U T I N E =======================================

; Handle after-turn effects (status effects, HP/MP regen/degen, etc)
; 
;       In: D0 = combatant index

combatant = -2

HandleAfterTurnEffects:
                
                bsr.w   ClearDeadCombatantsListLength
                link    a6,#-16
                move.w  d0,combatant(a6)
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   @Skip           ; skip everything if combatant died
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_STUN,d1
                beq.s   @CheckSleep     ; go to next step if not stunned
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                andi.w  #STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                move.w  #CHANCE_TO_NO_LONGER_BE_STUNNED,d6 ; 1/2 chance to no longer be stunned
                jsr     (GenerateRandomNumber).w
                tst.w   d7
                bne.s   @Stunned        
                txt     358             ; "{CLEAR}{NAME} is no longer stunned.{D3}"
                clr.w   d1
                bra.s   @UpdateStun
@Stunned:
                
                txt     309             ; "{NAME} is stunned.{D3}"
@UpdateStun:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckSleep:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLEEP,d1
                beq.s   @CheckMuddle
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                move.w  d1,d6
                jsr     (GenerateRandomNumber).w
                andi.w  #STATUSEFFECT_SLEEP,d7
                bne.s   @Sleeping       
                txt     354             ; "{CLEAR}{NAME} has awakened.{D3}"
                clr.w   d1
                bra.s   @UpdateSleep
@Sleeping:
                
                txt     306             ; "{NAME} is sleeping.{D3}"
                subi.w  #STATUSEFFECTCOUNTER_SLEEP,d1 ; randomly decrement sleep counter
@UpdateSleep:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckMuddle:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d1
                beq.s   @CheckSilence
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                move.w  d1,d6
                jsr     (GenerateRandomNumber).w
                andi.w  #STATUSEFFECT_MUDDLE,d7
                bne.s   @Muddled        
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     355             ; "{CLEAR}{NAME} is fine.{D3}"
                clr.w   d1
                andi.w  #$FFF7,d2
                bra.s   @UpdateMuddle
@Muddled:
                
                subi.w  #STATUSEFFECTCOUNTER_MUDDLE,d1 ; randomly decrement muddle counter
@UpdateMuddle:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckSilence:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SILENCE,d1
                beq.s   @CheckSlow
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                move.w  d1,d6
                jsr     (GenerateRandomNumber).w
                andi.w  #STATUSEFFECT_SILENCE,d7
                bne.s   @Silenced       
                move.w  #SPELL_DISPEL,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  d0,((TEXT_NAME_INDEX_2-$1000000)).w
                txt     351             ; "{CLEAR}{SPELL} expired.{N}{NAME} is no longer{N}silenced.{D3}"
                clr.w   d1
                bra.s   @UpdateSilence
@Silenced:
                
                subi.w  #STATUSEFFECTCOUNTER_SILENCE,d1 ; randomly decrement silence counter
@UpdateSilence:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckSlow:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_SLOW,d1
                beq.s   @CheckAttack
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d2
                subi.w  #STATUSEFFECTCOUNTER_SLOW,d1 ; decrement slow counter
                bne.s   @UpdateSlow
                move.w  #SPELL_SLOW,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     349             ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
@UpdateSlow:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckAttack:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_ATTACK,d1
                beq.s   @CheckBoost
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST,d2
                subi.w  #STATUSEFFECTCOUNTER_ATTACK,d1 ; decrement attack counter
                bne.s   @UpdateAttack
                move.w  #SPELL_ATTACK,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     350             ; "{CLEAR}{SPELL} expired.{N}Attack returns to normal.{D3}"
@UpdateAttack:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@CheckBoost:
                
                jsr     j_GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_BOOST,d1
                beq.s   @ApplyHolyStaffRecovery
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_ATTACK,d2
                subi.w  #STATUSEFFECTCOUNTER_BOOST,d1 ; decrement boost counter
                bne.s   @UpdateBoost
                move.w  #SPELL_BOOST,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     348             ; "{CLEAR}{SPELL} expired.{N}Agility and defense{N}return to normal.{D3}"
@UpdateBoost:
                
                or.w    d2,d1
                jsr     j_SetStatusEffects
@ApplyHolyStaffRecovery:
                
                jsr     j_GetEquippedWeapon
                cmpi.w  #ITEM_HOLY_STAFF,d1
                bne.s   @ApplyMysteryStaffRecovery
                jsr     j_GetCurrentHP
                move.w  d1,d2
                moveq   #HOLY_STAFF_HP_RECOVERY,d1
                jsr     j_IncreaseCurrentHP
                sub.w   d2,d1
                ble.s   @ApplyMysteryStaffRecovery
                ext.l   d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     356             ; "{CLEAR}{NAME} recovered{N}{#} hit points.{D3}"
@ApplyMysteryStaffRecovery:
                
                jsr     j_GetEquippedWeapon
                cmpi.w  #ITEM_MYSTERY_STAFF,d1
                bne.s   @ApplyLifeRingRecovery
                jsr     j_GetCurrentMP
                move.w  d1,d2
                moveq   #MYSTERY_STAFF_MP_RECOVERY,d1
                jsr     j_IncreaseCurrentMP
                sub.w   d2,d1
                ble.s   @ApplyLifeRingRecovery
                ext.l   d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     357             ; "{CLEAR}{NAME} recovered{N}{#} magic points.{D3}"
@ApplyLifeRingRecovery:
                
                jsr     j_GetEquippedRing
                cmpi.w  #ITEM_LIFE_RING,d1
                bne.s   @ApplyPoisonDamage
                jsr     j_GetCurrentHP
                move.w  d1,d2
                moveq   #LIFE_RING_HP_RECOVERY,d1
                jsr     j_IncreaseCurrentHP
                sub.w   d2,d1
                ble.s   @ApplyPoisonDamage
                ext.l   d1
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     356             ; "{CLEAR}{NAME} recovered{N}{#} hit points.{D3}"
@ApplyPoisonDamage:
                
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_POISON,d1
                beq.s   @UpdateStats
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                
                if (PERCENT_POISON_DAMAGE>=1)
                jsr     GetMaxHP
                mulu.w  #PERCENT_POISON_DAMAGE,d1
                divu.w  #100,d1
                andi.l  #$FFFF,d1
                else
                moveq   #POISON_DAMAGE,d1 ; constant poison damage
                endif
                
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     307             ; "{CLEAR}{NAME} gets damaged{N}by {#} because of the poison.{D3}"
                jsr     j_DecreaseCurrentHP
                tst.w   d1
                bne.s   @UpdateStats
                txt     308             ; "{NAME} is exhausted.{D3}"
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                move.b  d0,((DEAD_COMBATANTS_LIST-$1000000)).w
@UpdateStats:
                
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                clsTxt
@Skip:
                
                unlk    a6
                rts

    ; End of function HandleAfterTurnEffects


; =============== S U B R O U T I N E =======================================

var_2 = -2

SpawnEnemySkipCamera:
                
                moveq   #1,d1
                bra.w   loc_24492
SpawnEnemy:
                
                clr.w   d1
loc_24492:
                
                movem.l d7-a0,-(sp)
                link    a6,#-16
                move.w  d1,-(sp)
                move.w  d0,var_2(a6)
                move.w  var_2(a6),d0
                jsr     sub_440B8
                move.w  (sp)+,d1
                bne.s   loc_244D2
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  var_2(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  var_2(a6),d0
                bsr.w   SetUnitCursorDestinationToNextCombatant
                bsr.w   WaitForUnitCursor
                jsr     (WaitForViewScrollEnd).w
                bsr.w   HideUnitCursor
loc_244D2:
                
                moveq   #$B,d7
loc_244D4:
                
                move.w  var_2(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.w  d7,d1
                addq.w  #3,d1
                andi.w  #3,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                moveq   #3,d0
                jsr     (Sleep).w       
                dbf     d7,loc_244D4
                sndCom  SFX_SPAWN
                move.w  var_2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     397             ; "{CLEAR}{NAME} appeared!{D3}"
                clsTxt
                unlk    a6
                movem.l (sp)+,d7-a0
                rts

    ; End of function SpawnEnemySkipCamera


; =============== S U B R O U T I N E =======================================


ClearDeadCombatantsListLength:
                
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                rts

    ; End of function ClearDeadCombatantsListLength


; =============== S U B R O U T I N E =======================================


HandleKilledCombatants:
                
                tst.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                beq.w   return_24640
                movem.l d0-a2/a6,-(sp)
                moveq   #ANIM_SPRITE_DEATH_SPINS_NUMBER,d6
loc_24526:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0 ; loop point for sprite death spin animation
                lea     ((ENTITY_ANIMATION_COUNTER-$1000000)).w,a1
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
loc_24534:
                
                clr.w   d0
                move.b  (a0)+,d0
                jsr     GetEntityIndexForCombatant
                move.w  d6,d1
                andi.w  #3,d1
                clr.w   d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                blt.s   loc_2455E
                jsr     (WaitForVInt).w
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
loc_2455E:
                
                lsl.w   #5,d0
                move.b  #$FF,(a1,d0.w)
                dbf     d7,loc_24534
                moveq   #ANIM_SPRITE_DEATH_SPIN_DELAY,d0
                jsr     (Sleep).w       
                dbf     d6,loc_24526    
                sndCom  SFX_BATTLEFIELD_DEATH
                moveq   #2,d6
loc_2457A:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
loc_24584:
                
                clr.w   d0
                move.b  (a0)+,d0
                jsr     GetEntityIndexForCombatant
                cmpi.b  #$2F,d0 
                bne.s   loc_245A4
                move.l  #$60006000,((byte_FFAEE2-$1000000)).w
                move.l  #$60006000,((byte_FFAEEE-$1000000)).w
loc_245A4:
                
                move.w  #3,d1
                sub.w   d6,d1
                clr.w   d2
                move.w  #$3F,d3 
                jsr     (UpdateEntityProperties).l
                cmpi.b  #7,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                blt.s   loc_245C6
                jsr     (WaitForVInt).w
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
loc_245C6:
                
                dbf     d7,loc_24584
                moveq   #8,d0
                jsr     (Sleep).w       
                dbf     d6,loc_2457A
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
loc_245DE:
                
                moveq   #1,d1
                clr.w   d0
                move.b  (a0)+,d0
                blt.s   loc_245EE
                jsr     j_IncreaseDefeats
                bra.s   loc_24602
loc_245EE:
                
                movem.l d0,-(sp)
                clr.w   d0
                move.b  ((BATTLESCENE_FIRST_ALLY-$1000000)).w,d0
                jsr     j_IncreaseKills
                movem.l (sp)+,d0
loc_24602:
                
                moveq   #$FFFFFFFF,d1
                jsr     j_SetXPos
                jsr     j_SetYPos
                clr.w   d1
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                jsr     GetEntityIndexForCombatant
                move.w  #$7000,d1
                move.w  #$7000,d2
                jsr     SetEntityPosition
                dbf     d7,loc_245DE
                moveq   #$A,d0
                jsr     (Sleep).w       
                movem.l (sp)+,d0-a2/a6
return_24640:
                
                rts

    ; End of function HandleKilledCombatants


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index

itemOrSpellIndex = -4
combatant = -2

UpdateTargetListForCombatant:
                
                movem.w d0,-(sp)
                move.w  combatant(a6),d0
                tst.b   d0
                movem.w (sp)+,d0
                blt.s   @Enemy
                jsr     j_UpdateTargetListEnemies
                bra.s   @Return
@Enemy:
                
                jsr     j_UpdateTargetListAllies
@Return:
                
                rts

    ; End of function UpdateTargetListForCombatant


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

sub_24662:
                
                movem.l d1-a6,-(sp)
                move.w  combatant(a6),((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w
loc_2466C:
                
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   SetMoveSfx
                bsr.w   ControlBattleUnit
                jsr     (WaitForViewScrollEnd).w
                btst    #INPUT_BIT_B,d4
                beq.w   loc_246EC
                movem.w d2-d3,-(sp)
                move.w  ((word_FFB08E-$1000000)).w,d3
                move.w  ((word_FFB090-$1000000)).w,d4
                lea     ((MOVE_COST_LIST-$1000000)).w,a5
                moveq   #1,d0
                bsr.s   UpdateTargetListForCombatant
                moveq   #$1E,d0
                lea     (byte_FF4400).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                jsr     j_MakeRangeLists
                clr.w   d0
                jsr     UpdateTargetListForCombatant(pc)
                movem.w (sp)+,d0-d1
                jsr     MakeBattleEntityCancelMoveString
                move.w  combatant(a6),d0
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a0
                bsr.w   MoveBattleEntityByMoveString
                move.w  #$FFFF,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                moveq   #$FFFFFFFF,d0
                bra.w   loc_25188
loc_246EC:
                
                clr.w   d0
                moveq   #COMBATANTS_ALL_COUNTER,d7
loc_246F0:
                
                cmp.w   combatant(a6),d0 ; check if chosen position is inhabited already (for debug mode B-button trick)
                beq.w   loc_24718
                jsr     j_GetXPos
                cmp.w   d1,d2
                bne.w   loc_24718
                jsr     j_GetYPos
                cmp.w   d1,d3
                bne.w   loc_24718
                sndCom  SFX_REFUSAL
                beq.w   loc_2466C
loc_24718:
                
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bne.s   loc_24724
                move.w  #COMBATANT_ENEMIES_START,d0
loc_24724:
                
                dbf     d7,loc_246F0    
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  combatant(a6),d0
                move.w  d2,d1
                jsr     j_SetXPos
                move.w  d3,d1
                jsr     j_SetYPos
                clr.w   d1
loc_24746:
                
                move.w  d1,-(sp)
                jsr     ClearFadingBlockRange
                jsr     (WaitForVInt).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityPositionAfterApplyingFacing
                jsr     (CheckChestItem).w
                move.w  d2,((byte_FFB180-$1000000)).w
                cmpi.w  #$FFFF,d2
                bne.s   loc_2476C       ; if d2 != FFFF, then there is an item
                moveq   #MENU_BATTLE_WITH_STAY,d2 ; Battle menu with STAY option
                bra.s   loc_2476E
loc_2476C:
                
                moveq   #MENU_BATTLE_WITH_SEARCH,d2 ; Battle menu with SEARCH option
loc_2476E:
                
                move.w  combatant(a6),d0
                jsr     sub_8210
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.s   loc_24782
                moveq   #3,d0
                bra.s   loc_24784
loc_24782:
                
                clr.w   d0
loc_24784:
                
                bsr.w   HideUnitCursor
                move.w  (sp)+,d1
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_247C6
                move.w  combatant(a6),d0
                move.w  ((word_FFB08E-$1000000)).w,d1
                jsr     j_SetXPos
                move.w  ((word_FFB090-$1000000)).w,d1
                jsr     j_SetYPos
                move.w  combatant(a6),d0
                jsr     j_GenerateTargetRangeLists
                bsr.w   CreateMoveableRangeForUnit
                bra.w   loc_2466C
loc_247C6:
                
                tst.w   d0
                bne.w   loc_2483C
                move.w  combatant(a6),d0
                jsr     sub_8210
                bsr.w   CreateMoveableRangeForUnit
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   loc_247F0
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_24746
loc_247F0:
                
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   loc_2482A
                move.w  combatant(a6),d0
                jsr     j_GetXPos
                move.w  d1,d2
                jsr     j_GetYPos
                move.w  d1,d3
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24746
loc_2482A:
                
                move.w  d0,((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                clr.w   ((BATTLESCENE_ACTION_TYPE-$1000000)).w
                clr.w   d0
                bra.w   loc_25188
loc_2483C:
                
                cmpi.w  #1,d0
                bne.w   loc_24982
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                tst.w   d2
                bne.w   loc_24864
                txt     436             ; "Learned no new magic spell.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_24746
loc_24864:
                
                clr.w   d1
loc_24866:
                
                move.w  combatant(a6),d0
                bsr.w   HideUnitCursor
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetSpellAndNumberOfSpells
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetSpellAndNumberOfSpells
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetSpellAndNumberOfSpells
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetSpellAndNumberOfSpells
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                clr.w   d0
                lea     sub_24966(pc), a0
                nop
                jsr     j_ExecuteMagicMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_248BA
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24746
loc_248BA:
                
                move.w  d0,((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,d4
                move.w  combatant(a6),d0
                jsr     j_GetCurrentMP
                move.w  d1,d3
                move.w  d4,d1
                jsr     j_GetSpellCost
                sub.w   d1,d3
                bge.w   loc_248E6
                txt     437             ; "More MP needed.{W1}"
                clsTxt
                clr.w   d1
                bra.s   loc_24866
loc_248E6:
                
                move.w  d4,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                bsr.w   CreateMoveableRangeForUnit
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   loc_2490C
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_24866
loc_2490C:
                
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((word_FFAF8E-$1000000)).w
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   loc_24952
                move.w  combatant(a6),d0
                jsr     j_GetXPos
                move.w  d1,((word_FFB094-$1000000)).w
                jsr     j_GetYPos
                move.w  d1,((word_FFB092-$1000000)).w
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24866
loc_24952:
                
                move.w  d0,((word_FFB632-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                move.w  #1,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                clr.w   d0
                bra.w   loc_25188

    ; End of function sub_24662


; =============== S U B R O U T I N E =======================================

;     createSpellRangeGridMaster ?


sub_24966:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  ((word_FFB18C-$1000000)).w,d1
                jsr     j_CreateSpellRangeGrid
                bsr.w   CreateMoveableRangeForUnit
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_24966


; START OF FUNCTION CHUNK FOR sub_24662

loc_24982:
                
                cmpi.w  #2,d0
                bne.w   loc_25072
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetItemAndNumberHeld
                tst.w   d2
                bne.w   loc_249A8
                txt     438             ; "You have no item.{W1}"
                clsTxt
                bra.w   loc_24746
loc_249A8:
                
                clr.w   d1
loc_249AA:
                
                moveq   #3,d2
                clr.w   d0
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_249C6
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24746
loc_249C6:
                
                tst.w   d0
                bne.w   loc_24B06
                clr.w   d1
loc_249CE:
                
                move.w  combatant(a6),d0
                bsr.w   HideUnitCursor
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                clr.w   d0
                clr.w   d1
                lea     loc_24ADC(pc), a0
                nop
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24A24
                bsr.w   ClearFadingBlockRange
                bra.s   loc_249AA
loc_24A24:
                
                move.w  d0,((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d1,((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w
                move.w  d0,d1
                move.w  combatant(a6),d0
                jsr     j_IsItemUsableWeaponInBattle
                bcs.w   loc_24A4A
                txt     439             ; "It has no effect.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_24746
loc_24A4A:
                
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateItemRangeGrid
                bsr.w   CreateMoveableRangeForUnit
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   loc_24A72
                txt     439             ; "It has no effect.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_249CE
loc_24A72:
                
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((word_FFAF8E-$1000000)).w
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   loc_24AC8
                move.w  combatant(a6),d0
                jsr     j_GetXPos
                move.w  d1,((word_FFB094-$1000000)).w
                jsr     j_GetYPos
                move.w  d1,((word_FFB092-$1000000)).w
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24746
                bra.w   loc_249CE
loc_24AC8:
                
                move.w  d0,((word_FFB632-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                move.w  #BATTLEACTION_USE_ITEM,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                clr.w   d0
                bra.w   loc_25188
loc_24ADC:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  ((word_FFB18C-$1000000)).w,d1
                jsr     j_IsItemUsableWeaponInBattle
                bcc.s   loc_24AFC
                jsr     j_CreateItemRangeGrid
                bsr.w   CreateMoveableRangeForUnit
                bra.s   loc_24B00
loc_24AFC:
                
                bsr.w   ClearFadingBlockRange
loc_24B00:
                
                movem.l (sp)+,d0-a6
                rts
loc_24B06:
                
                cmpi.w  #2,d0
                bne.w   loc_24D64
                move.w  combatant(a6),d0
                jsr     j_GetEquippableWeapons
                move.w  d1,d2
                jsr     j_GetEquippableRings
                add.w   d2,d1
                bne.w   loc_24B34
                txt     444             ; "You have nothing to equip.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_249AA
loc_24B34:
                
                bsr.w   HideUnitCursor
                jsr     j_CreateBattleEquipWindow
                clr.w   d6
loc_24B40:
                
                move.w  combatant(a6),d0
                jsr     j_GetEquippableWeapons
                tst.w   d1
                beq.w   loc_24BBE
                movea.l a0,a2           ; A0, A2 = pointer to equippable items list
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
                move.w  (a0),(a1)+
                move.w  4(a0),(a1)+
                move.w  8(a0),(a1)+
                move.w  $C(a0),(a1)+
                move.w  d1,d3
                jsr     j_GetEquippedWeapon
                move.w  d2,-(sp)
                bsr.w   sub_24C4E       
                jsr     j_GetEquippedWeapon
                move.w  d2,d1
                jsr     j_UnequipItemBySlot
                move.w  (sp)+,d2
                move.w  d1,-(sp)
                move.w  d2,d1
                jsr     j_EquipItemBySlot
                move.w  (sp)+,d1
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_24BA0
                moveq   #1,d7
                move.w  #$FFFF,d6
                bra.w   loc_24C44
loc_24BA0:
                
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                lsl.w   #2,d1
                move.w  (a2,d1.w),d2
                move.w  2(a2,d1.w),d1
                move.w  d2,d5
                move.w  d1,d4
                jsr     j_GetEquippedWeapon
                bsr.w   EquipNewItemInBattle
                clr.w   d6
loc_24BBE:
                
                jsr     j_GetEquippableRings
                tst.w   d1
                beq.w   loc_24C44
                movea.l a0,a2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
                move.w  (a0),(a1)+
                move.w  4(a0),(a1)+
                move.w  8(a0),(a1)+
                move.w  $C(a0),(a1)+
                move.w  d1,d3
                jsr     j_GetEquippedRing
                move.w  d2,-(sp)
                bsr.w   sub_24C4E       
                jsr     j_GetEquippedRing
                move.w  d2,d1
                jsr     j_UnequipItemBySlot
                move.w  (sp)+,d2
                move.w  d1,-(sp)
                move.w  d2,d1
                jsr     j_EquipItemBySlot
                move.w  (sp)+,d1
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_24C26
                jsr     j_GetEquippableWeapons
                tst.w   d1
                bne.s   loc_24C22
                moveq   #1,d7
                moveq   #$FFFFFFFF,d6
                bra.w   loc_24C44
loc_24C22:
                
                bra.w   loc_24B40
loc_24C26:
                
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                lsl.w   #2,d1
                move.w  (a2,d1.w),d2
                move.w  2(a2,d1.w),d1
                move.w  d2,d5
                move.w  d1,d4
                jsr     j_GetEquippedRing
                bsr.w   EquipNewItemInBattle
                clr.w   d1
loc_24C44:
                
                jsr     j_HideBattleEquipWindow
                bra.w   loc_24746

; END OF FUNCTION CHUNK FOR sub_24662


; =============== S U B R O U T I N E =======================================

; In: A0 = pointer to equippable items list
;     D1 = old item index
;     D2 = old item slot
;     D3 = equippable items count


sub_24C4E:
                
                move.w  d0,-(sp)
                tst.w   d1
                bpl.s   @GetMenuInitialChoice ; branch if something equipped
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bne.s   @DefaultToUnarmed
                
                ; Equip first item if inventory is full with equippable items
                clr.w   d1
                jsr     j_EquipItemBySlot
                bra.s   @GoToExecuteMenu
@DefaultToUnarmed:
                
                moveq   #3,d1           ; set menu initial choice to down slot
@GoToExecuteMenu:
                
                bra.s   @ExecuteMenu
@GetMenuInitialChoice:
                
                move.l  a0,-(sp)
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                moveq   #$FFFFFFFF,d1
@Loop:
                
                addq.w  #1,d1
                addq.l  #2,a0
                move.w  (a0)+,d4
                cmp.w   d2,d4
                dbeq    d7,@Loop
                movea.l (sp)+,a0
@ExecuteMenu:
                
                move.b  d1,d0
                lea     sub_24CF6(pc), a0
                nop
                move.w  d6,d1
                move.w  d1,-(sp)
                jsr     j_ExecuteItemMenu
                move.w  (sp)+,d1
                move.w  (sp)+,d0
                rts

    ; End of function sub_24C4E


; =============== S U B R O U T I N E =======================================

; In: D2 = old item slot
;     D4 = new item slot


EquipNewItemInBattle:
                
                cmpi.w  #4,d2
                beq.w   @Equip
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   @Equip          ; equip new item if not cursed
                cmp.w   d4,d1
                beq.w   @Return         ; return if selecting old item slot
                jsr     j_HideBattleEquipWindow
                sndCom  MUSIC_CURSED_ITEM
                txt     43              ; "Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}"
                bra.w   @Continue
@Equip:
                
                move.w  d4,d1
                
                if (BUGFIX_HIGINS_SPELL>=1)
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   @Return
                endif
                
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.w   @Return         ; return if not cursed
                jsr     j_HideBattleEquipWindow
                sndCom  MUSIC_CURSED_ITEM
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     34              ; "Gosh!  {NAME} is{N}cursed!{W2}"
@Continue:
                
                bsr.w   FadeOut_WaitForP1Input
                clsTxt
                jsr     j_CreateBattleEquipWindow
@Return:
                
                rts

    ; End of function EquipNewItemInBattle


; =============== S U B R O U T I N E =======================================


sub_24CF6:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetStatusEffects
                move.w  d1,-(sp)
                clr.w   d2
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d2
                lsl.w   #2,d2
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                move.w  (a2,d2.w),d5
                move.w  2(a2,d2.w),d6
                move.w  (a2),d1
                jsr     j_GetEquipmentType
                tst.w   d2
                blt.s   loc_24D2E
                jsr     j_UnequipWeapon
                bra.s   loc_24D34
loc_24D2E:
                
                jsr     j_UnequipRing
loc_24D34:
                
                move.w  d6,d1
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   loc_24D42
                jsr     j_EquipItemBySlot
loc_24D42:
                
                jsr     sub_10060
                jsr     sub_8210
                bsr.w   CreateMoveableRangeForUnit
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  (sp)+,d1
                jsr     j_SetStatusEffects
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_24CF6


; START OF FUNCTION CHUNK FOR sub_24662

loc_24D64:
                
                cmpi.w  #1,d0
                bne.w   loc_24F6E
loc_24D6C:
                
                move.w  combatant(a6),d0
                bsr.w   HideUnitCursor
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                move.w  combatant(a6),d0
                jsr     sub_821C
                bsr.w   CreateMoveableRangeForUnit
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   loc_24DCC
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bsr.w   ClearFadingBlockRange
                bra.w   loc_249AA
loc_24DCC:
                
                bsr.w   HideUnitCursor
                jsr     (WaitForVInt).w
                clr.w   d0
                lea     (InitStack).w,a0
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24DF0
                bsr.w   ClearFadingBlockRange
                bra.w   loc_249AA
loc_24DF0:
                
                move.w  d0,((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w
                move.w  d1,((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
                btst    #7,d0
                beq.w   loc_24E26
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_24E26
                sndCom  MUSIC_CURSED_ITEM
                txt     441             ; "The equipment is cursed.{W1}"
                bsr.w   FadeOut_WaitForP1Input
                clsTxt
                clr.w   d1
                bra.s   loc_24DCC
loc_24E26:
                
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   loc_24E4C
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24D6C
loc_24E4C:
                
                move.w  d0,itemOrSpellIndex(a6)
                jsr     j_HideMiniStatusWindow
                clr.w   d1
                jsr     j_GetItemAndNumberHeld
                cmpi.w  #4,d2
                beq.w   loc_24E8E
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                andi.w  #7,d1
                move.w  combatant(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  itemOrSpellIndex(a6),d0
                move.w  ((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w,d1
                bclr    #7,d1
                jsr     j_AddItem
                bra.w   loc_24F62
loc_24E8E:
                
                move.w  itemOrSpellIndex(a6),d0
                bsr.w   HideUnitCursor
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                clr.w   d0
                lea     (InitStack).w,a0
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24EDE
                bra.w   loc_24E26
loc_24EDE:
                
                move.w  d0,((word_FFB632-$1000000)).w
                move.w  d1,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                btst    #7,d0
                beq.w   loc_24F16
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_24F16
                sndCom  MUSIC_CURSED_ITEM
                txt     441             ; "The equipment is cursed.{W1}"
                bsr.w   FadeOut_WaitForP1Input
                clsTxt
                clr.w   d1
                bra.w   loc_24E8E
loc_24F16:
                
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                andi.w  #3,d1
                move.w  combatant(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  ((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w,d1
                move.w  d1,-(sp)
                move.w  ((BATTLESCENE_ACTION_TYPE-$1000000)).w,d1
                andi.w  #3,d1
                move.w  itemOrSpellIndex(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  ((word_FFB632-$1000000)).w,d1
                bclr    #ITEMENTRY_BIT_EQUIPPED,d1
                move.w  combatant(a6),d0
                jsr     j_AddItem
                move.w  (sp)+,d1
                bclr    #7,d1
                move.w  itemOrSpellIndex(a6),d0
                jsr     j_AddItem
loc_24F62:
                
                move.w  #3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                clr.w   d0
                bra.w   loc_25188
loc_24F6E:
                
                move.w  combatant(a6),d0
                bsr.w   HideUnitCursor
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                clr.w   d0
                clr.w   d1
                lea     (InitStack).w,a0
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24FC2
                moveq   #$FFFFFFFF,d1
                bra.w   loc_249AA
loc_24FC2:
                
                move.w  d0,((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w
                move.w  d1,((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
                btst    #7,d0
                beq.w   loc_24FFA
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_24FFA
                sndCom  MUSIC_CURSED_ITEM
                txt     441             ; "The equipment is cursed.{W1}"
                bsr.w   FadeOut_WaitForP1Input
                clsTxt
                clr.w   d1
                bra.w   loc_24F6E
loc_24FFA:
                
                move.w  ((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_25022
                move.w  combatant(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     443             ; "Are you sure?"
                clsTxt
                clr.w   d1
                bra.w   loc_24F6E
loc_25022:
                
                move.w  ((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_YesNoChoiceBox
                clsTxt
                tst.w   d0
                bne.w   loc_24746
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  ((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   byte_25066      
                move.w  ((BATTLESCENE_ACTION_ITEMSLOT-$1000000)).w,d0
                jsr     j_AddItemToDeals
byte_25066:
                
                txt     42              ; "Discarded the {ITEM}.{W2}"
                clsTxt
                bra.w   loc_24746
loc_25072:
                
                cmpi.w  #$FFFF,((byte_FFB180-$1000000)).w
                bne.w   loc_25088
                move.w  #3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                clr.w   d0
                bra.w   loc_25188
loc_25088:
                
                move.w  combatant(a6),d0
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                bsr.w   GetEntityPositionAfterApplyingFacing
                bsr.w   sub_256E6
                cmpi.w  #$FFFF,d3
                beq.s   loc_250B0
                move.w  d3,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     418             ; "{NAME} is distributing{N}items from the open chest.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_24746
loc_250B0:
                
                jsr     (OpenChest).w
                txt     403             ; "{NAME} opened the chest.{W2}{CLEAR}"
                move.w  ((byte_FFB180-$1000000)).w,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   byte_25178      
                move.w  combatant(a6),d0
                bsr.w   GetEntityPositionAfterApplyingFacing
                move.w  d1,d2
                move.w  d0,d1
                jsr     sub_1AC054      
                cmpi.w  #$FFFF,d0
                beq.w   loc_250FC
                move.w  #$80,((BATTLESCENE_ACTION_TYPE-$1000000)).w 
                move.w  d0,((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                sndCom  MUSIC_CORRUPTED_SAVE
                bsr.w   SpawnEnemySkipCamera
                bra.w   loc_25188
loc_250FC:
                
                move.w  ((byte_FFB180-$1000000)).w,d2
                cmpi.w  #ITEMINDEX_GOLDCHESTS_START,d2
                blt.s   loc_25124
                bsr.w   GetChestGoldAmount
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                jsr     j_IncreaseGold
                sndCom  MUSIC_ITEM
                txt     414             ; "{NAME} found {#} gold{N}coins."
                bsr.w   FadeOut_WaitForP1Input
                bra.w   byte_2517C
loc_25124:
                
                move.w  ((byte_FFB180-$1000000)).w,d1
                move.w  d1,((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  combatant(a6),d0
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                jsr     j_AddItem
                tst.w   d2
                bne.w   byte_2515A      
                move.w  combatant(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  d1,((TEXT_NAME_INDEX_2-$1000000)).w
                sndCom  MUSIC_ITEM
                txt     415             ; "{NAME} recieved{N}{ITEM}."
                bsr.w   FadeOut_WaitForP1Input
                bra.w   byte_2517C
byte_2515A:
                
                txt     413             ; "{NAME} found{N}{ITEM}.{W2}{CLEAR}"
                txt     419             ; "{NAME} hands are full.{W1}"
                clsTxt
                move.w  combatant(a6),d0
                bsr.w   GetEntityPositionAfterApplyingFacing
                jsr     (CloseChest).w
                clr.w   d1
                bra.w   loc_24746
byte_25178:
                
                txt     408             ; "But, it was empty.{W1}"
byte_2517C:
                
                clsTxt
                move.w  #3,((BATTLESCENE_ACTION_TYPE-$1000000)).w
                clr.w   d0
loc_25188:
                
                move.w  d0,-(sp)
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                move.w  (sp)+,d0
                bsr.w   ClearFadingBlockRange
                movem.l (sp)+,d1-a6
                rts

; END OF FUNCTION CHUNK FOR sub_24662


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

BattlefieldMenuActions:
                
                clr.b   ((word_FFAF8E-$1000000)).w
                clr.w   ((MOVE_SFX-$1000000)).w
                bsr.w   ControlUnitCursor
                btst    #INPUT_BIT_B,((P1_INPUT-$1000000)).w
                beq.s   loc_251B8
                move.w  combatant(a6),d0
                rts
loc_251B8:
                
                moveq   #COMBATANTS_ALL_COUNTER,d7
                clr.w   d0
loc_251BC:
                
                jsr     j_GetCurrentHP
                tst.w   d1
                ble.w   loc_25226
                jsr     j_GetXPos
                cmp.w   d1,d2
                bne.w   loc_25226
                jsr     j_GetYPos
                cmp.w   d1,d3
                bne.w   loc_25226
                jsr     (WaitForViewScrollEnd).w
                btst    #INPUT_BIT_A,((P1_INPUT-$1000000)).w
                beq.s   loc_251F4
                jsr     j_BuildMemberScreen
                bra.s   loc_2521C
loc_251F4:
                
                cmp.w   combatant(a6),d0
                bne.s   loc_251FC
                rts
loc_251FC:
                
                move.w  d0,((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w
                jsr     j_CreateBattlefieldMiniStatusWindow
                jsr     j_CreateLandEffectWindow
                jsr     (WaitForPlayerInput).w
                jsr     j_HideLandEffectWindow
                jsr     j_HideMiniStatusWindow
loc_2521C:
                
                cmp.w   combatant(a6),d0
                bne.w   BattlefieldMenuActions
                rts
loc_25226:
                
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bne.s   loc_25232
                move.w  #COMBATANT_ENEMIES_START,d0
loc_25232:
                
                dbf     d7,loc_251BC
loc_25236:
                
                lea     (InitStack).w,a0
                moveq   #0,d0
                moveq   #0,d1
                moveq   #MENU_BATTLEFIELD,d2
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.w   BattlefieldMenuActions
                tst.w   d0
                bne.w   loc_25286
                jsr     j_UpdateForce
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                beq.s   loc_25236
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                jsr     (CopyBytes).w   
loc_25274:
                
                jsr     j_InitMemberListScreen
                tst.b   d0
                bmi.s   loc_25236
                jsr     j_BuildMemberScreen
                bra.s   loc_25274
loc_25286:
                
                cmpi.w  #1,d0
                bne.w   loc_25296
                jsr     sub_10034
                bra.s   loc_25236
loc_25296:
                
                cmpi.w  #2,d0
                bne.w   loc_252A6
                jsr     sub_10080
                bra.s   loc_25236
loc_252A6:
                
                tst.b   ((CURRENT_BATTLE-$1000000)).w
                beq.s   loc_25236
                txt     0               ; "The game will be suspended.{N}OK?"
                jsr     j_YesNoChoiceBox
                clsTxt
                tst.w   d0
                bmi.w   loc_25236
                move.l  ((SECONDS_COUNTER-$1000000)).w,((SECONDS_COUNTER_FROM_SRAM-$1000000)).w
                setFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                getCurrentSaveSlot
                enableSram
                jsr     (SaveGame).l
                disableSram
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.w   byte_252E6
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   byte_252F2      
byte_252E6:
                
                sndCom  SOUND_COMMAND_FADE_OUT
                jsr     (FadeOutToBlack).w
                jmp     (WitchSuspend).w
byte_252F2:
                
                clrFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                bra.w   loc_25236

    ; End of function BattlefieldMenuActions


; =============== S U B R O U T I N E =======================================

; related to AI controlled unit (enemy, auto-control cheat, MUDDLEd force member)

itemOrSpellIndex = -4
combatant = -2

sub_252FA:
                
                movem.l d0-a6,-(sp)
                move.w  combatant(a6),d0
                jsr     j_GenerateTargetRangeLists
                bsr.w   CreateMoveableRangeForUnit
                move.w  combatant(a6),d0
                move.w  combatant(a6),d0
                bsr.w   SetMoveSfx
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a0
                jsr     MoveBattleEntityByMoveString
                move.w  combatant(a6),d0
                move.w  d2,d1
                jsr     j_SetXPos
                move.w  d3,d1
                jsr     j_SetYPos
                bsr.w   ClearFadingBlockRange
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  ((BATTLESCENE_ACTION_TYPE-$1000000)).w,d0
                cmpi.w  #3,d0
                beq.w   loc_25480
                tst.w   d0
                bne.w   loc_2537E
                move.w  combatant(a6),d0
                jsr     sub_8210
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreateMoveableRangeForUnit
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   loc_2547A
loc_2537E:
                
                cmpi.w  #1,d0
                bne.w   loc_253BE
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreateMoveableRangeForUnit
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((word_FFAF8E-$1000000)).w
                move.w  ((word_FFB632-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   loc_2547A
loc_253BE:
                
                cmpi.w  #2,d0
                bne.w   loc_2540A
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateItemRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreateMoveableRangeForUnit
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((word_FFAF8E-$1000000)).w
                move.w  ((word_FFB632-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   loc_2547A
loc_2540A:
                
                cmpi.w  #4,d0
                bne.w   loc_2544A
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreateMoveableRangeForUnit
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((word_FFAF8E-$1000000)).w
                move.w  ((word_FFB632-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   loc_2547A
loc_2544A:
                
                cmpi.w  #6,d0
                bne.w   loc_2547A
                move.w  combatant(a6),d0
                jsr     sub_1AC05C      
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreateMoveableRangeForUnit
                clr.b   ((word_FFAF8E-$1000000)).w
                move.w  ((BATTLESCENE_ACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   *+4
loc_2547A:
                
                jsr     ClearFadingBlockRange
loc_25480:
                
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_252FA


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

sub_2548E:
                
                move.w  d0,itemOrSpellIndex(a6)
                move.w  itemOrSpellIndex(a6),d0
                jsr     j_GetXPos
                move.w  d1,d2
                jsr     j_GetYPos
                move.w  d1,d3
                move.w  combatant(a6),d0
                jsr     j_GetXPos
                sub.w   d1,d2
                blt.s   loc_254B8
                moveq   #0,d4
                bra.s   loc_254BC
loc_254B8:
                
                moveq   #2,d4
                neg.w   d2
loc_254BC:
                
                jsr     j_GetYPos
                sub.w   d1,d3
                blt.s   loc_254CA
                moveq   #3,d5
                bra.s   loc_254CE
loc_254CA:
                
                moveq   #1,d5
                neg.w   d3
loc_254CE:
                
                cmp.w   d2,d3
                blt.s   loc_254D4
                move.w  d5,d4
loc_254D4:
                
                bsr.w   GetEntityIndexForCombatant
                move.w  d4,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                move.w  itemOrSpellIndex(a6),d0
                bsr.w   sub_2322C
                bsr.w   WaitForUnitCursor
                jsr     (WaitForViewScrollEnd).w
                move.b  #1,((IS_TARGETING-$1000000)).w
                jsr     j_CreateBattlefieldMiniStatusWindow
                moveq   #$F,d0
                jsr     (Sleep).w       
                sndCom  SFX_VALIDATION
                rts

    ; End of function sub_2548E


; =============== S U B R O U T I N E =======================================

; <BUG> A Goddess Staff is added to the deals section in shops whenever a DEF-CON switch 
;       is activated, and if one of the following items is also present :
;       - Quick Ring
;       - Protect Ring
;       - White Ring
;       - Running Ring
; 
; End function with a RTS intruction to fix


UpdateAllEnemiesAI:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@Loop:
                
                move.w  d7,-(sp)
                bsr.w   UpdateEnemyAI
                move.w  (sp)+,d7
                addq.w  #1,d0
                dbf     d7,@Loop
                
                if (BUGFIX_GODDESS_STAFF_DEALS_ABUSE=1)
                rts
                endif

    ; End of function UpdateAllEnemiesAI


; =============== S U B R O U T I N E =======================================


UpdateEnemyAI:
                
                jsr     j_GetXPos
                tst.b   d1
                bmi.w   @Return
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   @Return
                tst.b   d0
                bpl.s   @Return
                jsr     j_UpdateTriggeredRegionsAndAI
@Return:
                
                rts

    ; End of function UpdateEnemyAI


; =============== S U B R O U T I N E =======================================


CreateRandomizedTurnOrder:
                
                lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
                move.l  a0,-(sp)
                moveq   #$3F,d7 
loc_2554C:
                
                move.w  #$FFFF,(a0)+
                dbf     d7,loc_2554C
                movea.l (sp)+,a0
                clr.w   d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
loc_2555A:
                
                move.w  d7,-(sp)
                bsr.w   AddRandomizedAGItoTurnOrder
                move.w  (sp)+,d7
                addq.w  #1,d0
                dbf     d7,loc_2555A
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #$1D,d7         ; that is technically a bug.
                                        ;  As we're iterating enemy combatants, we should be moving value $1F instead
loc_2556E:
                
                move.w  d7,-(sp)
                bsr.w   AddRandomizedAGItoTurnOrder
                move.w  (sp)+,d7
                addq.w  #1,d0
                dbf     d7,loc_2556E
                moveq   #COMBATANTS_ALL_COUNTER,d6
loc_2557E:
                
                moveq   #$3E,d7 
                lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
loc_25584:
                
                move.w  (a0),d0
                move.w  2(a0),d1
                cmp.b   d0,d1
                ble.s   loc_25594
                move.w  d1,(a0)
                move.w  d0,2(a0)
loc_25594:
                
                addq.l  #2,a0
                dbf     d7,loc_25584
                dbf     d6,loc_2557E
                clr.b   ((BATTLE_CURRENT_TURN_OFFSET-$1000000)).w
                rts

    ; End of function CreateRandomizedTurnOrder


; =============== S U B R O U T I N E =======================================

; In: A0 = turn order in RAM
;     D0 = combatant index


AddRandomizedAGItoTurnOrder:
                
                jsr     j_GetXPos
                tst.b   d1
                bmi.w   @Return
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.w   @Return         ; skip if combatant is not alive
                jsr     j_GetCurrentAGI
                move.w  d1,d3
                andi.w  #CHAR_STATCAP_AGI_CURRENT,d1
                move.w  d1,d6
                lsr.w   #3,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d1
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #1,d7
                add.w   d7,d1
                
                if (BUGFIX_SKIPPED_TURNS=1)
                tst.b   d1
                bpl.s   @AddTurnData
                moveq   #CHAR_STATCAP_AGI_CURRENT,d1 ; cap randomized AGI
                endif
@AddTurnData:
                
                move.b  d0,(a0)+
                move.b  d1,(a0)+
                cmpi.w  #128,d3
                blt.s   @Return
                
                ; Add a second turn if AGI >= 128
                move.w  d3,d1
                andi.w  #CHAR_STATCAP_AGI_CURRENT,d1
                mulu.w  #5,d1
                divu.w  #6,d1
                move.w  d1,d6
                lsr.w   #3,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d1
                
                if (BUGFIX_SKIPPED_TURNS=1)
                tst.b   d1
                bpl.s   @AddSecondTurnData
                moveq   #CHAR_STATCAP_AGI_CURRENT,d1 ; cap randomized AGI
                endif
@AddSecondTurnData:
                
                move.b  d0,(a0)+
                move.b  d1,(a0)+
@Return:
                
                rts

    ; End of function AddRandomizedAGItoTurnOrder


; =============== S U B R O U T I N E =======================================

; load all battle properties


LoadBattle:
                
                move.w  d0,-(sp)
                clr.w   d1
                move.b  ((CURRENT_MAP-$1000000)).w,d1
                bsr.w   FadeOutToBlackAll
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                jsr     (LoadMapTilesets).w
                bsr.w   WaitForFadeToFinish
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w
                jsr     j_MoveEntitiesToBattlePositions
                move.w  (sp)+,d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                bpl.s   loc_25646
                clr.w   d0
loc_25646:
                
                andi.w  #$3F,d0 
                lsl.w   #5,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0
                move.w  (a0)+,d0
                ext.l   d0
                divs.w  #$180,d0
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.w  (a0)+,d0
                ext.l   d0
                divs.w  #$180,d0
                move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                moveq   #$3F,d0 
                jsr     (InitSprites).w 
                move.w  #$FFFF,d0
                jsr     (LoadMap).w     
                jsr     (WaitForVInt).w
                jsr     (LoadMapEntitySprites).w
                bsr.w   SetBaseVIntFunctions
                jsr     j_LoadBattleTerrainData
                jsr     (PlayMapMusic).w
                jsr     (FadeInFromBlack).w
                cmpi.b  #BATTLE_FAIRY_WOODS,((CURRENT_BATTLE-$1000000)).w 
                                                        ; if battle 44, then special battle !
                bne.s   return_256A0
                jsr     j_SpecialBattle
return_256A0:
                
                rts

    ; End of function LoadBattle

tbl_RelativeTileMoveX:
                dc.w 1
tbl_RelativeTileMoveY:
                dc.w 0
                dc.w 0
                dc.w $FFFF
                dc.w $FFFF
                dc.w 0
                dc.w 0
                dc.w 1

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; Out: D0 = new X
;      D1 = new Y


GetEntityPositionAfterApplyingFacing:
                
                movem.l d2-d3/a0,-(sp)
                jsr     j_GetXPos
                move.w  d1,d2
                jsr     j_GetYPos
                bsr.w   GetEntityIndexForCombatant_0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                clr.w   d3
                move.b  ENTITYDEF_OFFSET_FACING(a0,d0.w),d3
                move.w  d2,d0
                lsl.w   #2,d3
                add.w   tbl_RelativeTileMoveX(pc,d3.w),d0
                add.w   tbl_RelativeTileMoveY(pc,d3.w),d1
                movem.l (sp)+,d2-d3/a0
                rts

    ; End of function GetEntityPositionAfterApplyingFacing


; =============== S U B R O U T I N E =======================================


sub_256E6:
                
                movem.l d0-d2/d7,-(sp)
                move.w  d0,d2
                move.w  d1,d3
                clr.w   d0
                move.w  #COMBATANTS_ALL_COUNTER,d7
loc_256F4:
                
                jsr     j_GetXPos
                cmp.w   d1,d2
                bne.w   loc_25712
                jsr     j_GetYPos
                cmp.w   d1,d3
                bne.w   loc_25712
                move.w  d0,d3
                bra.w   loc_25724
loc_25712:
                
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bne.s   loc_2571E
                move.w  #COMBATANT_ENEMIES_START,d0
loc_2571E:
                
                dbf     d7,loc_256F4
                moveq   #$FFFFFFFF,d3
loc_25724:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function sub_256E6


; =============== S U B R O U T I N E =======================================


PrintAllActivatedDefCons:
                
                moveq   #$5A,d1 
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                clsTxt
                rts

    ; End of function PrintAllActivatedDefCons


; =============== S U B R O U T I N E =======================================

; if flag D1 is set, display def-con textbox


PrintActivatedDefCon:
                
                move.w  d1,-(sp)
                jsr     j_CheckFlag
                beq.s   loc_2578A
                subi.w  #$5A,d1 
                ext.l   d1
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     463             ; "DEF-CON No. {#} has been{N}implemented.{D3}"
loc_2578A:
                
                move.w  (sp)+,d1
                addq.w  #1,d1
                rts

    ; End of function PrintActivatedDefCon


; =============== S U B R O U T I N E =======================================


SetMoveSfx:
                
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   loc_2579E
                clr.w   ((MOVE_SFX-$1000000)).w
                bra.s   loc_257A4
loc_2579E:
                
                move.w  #SFX_WALKING,((MOVE_SFX-$1000000)).w
loc_257A4:
                
                movem.w d0-d7,-(sp)
                jsr     j_GetEquippedRing
                cmpi.w  #ITEM_CHIRRUP_SANDALS,d1 ; HARDCODED chirrup sandals item index for specific sfx
                bne.s   loc_257BA
                move.w  #SFX_BLOAB,((MOVE_SFX-$1000000)).w
loc_257BA:
                
                movem.w (sp)+,d0-d7
                rts

    ; End of function SetMoveSfx
