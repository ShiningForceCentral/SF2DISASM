
; ASM FILE code\gameflow\battle\battlefunctions\executeindividualturn.asm :
; 0x23EB0..0x24242 : Execute Individual Turn function

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index

itemOrSpellIndex = -4
combatant = -2

ExecuteIndividualTurn:
                
                jsr     (sub_4ED8).w
                clr.w   ((SPEECH_SFX-$1000000)).w
                link    a6,#-16
                andi.w  #COMBATANT_MASK_ALL,d0
                move.w  d0,combatant(a6)
@Start:
            if (STANDARD_BUILD=1)
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
            else
                bsr.w   ClearDeadCombatantsListLength
            endif
                
                ; Check if we're currently battling Taros, and Bowie is the actor
                checkSavedByte #BATTLE_VERSUS_TAROS, CURRENT_BATTLE  ; HARDCODED battle index
                bne.s   @IsActorAlive
                tst.w   combatant(a6)
                bne.s   @IsActorAlive
                clrFlg  112             ; Currently attacking Taros with Achilles Sword
@IsActorAlive:
                
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @Done           ; skip turn if actor is dead
                
                ; Actor is alive
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,((word_FFB08E-$1000000)).w
                move.w  d1,((word_FFB094-$1000000)).w
                jsr     j_GetCombatantY
                move.w  d1,((word_FFB090-$1000000)).w
                move.w  d1,((word_FFB092-$1000000)).w
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   SetUnitCursorDestinationToNextCombatant
                move.w  combatant(a6),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE,d1
                bne.w   @AiControl1     
                jsr     j_GetAiActivationFlag
                andi.w  #4,d1
                bne.w   @AiControl1     
                tst.b   d0
                bpl.s   @CheckAutoBattleCheat1 ; check auto battle if ally
                tst.b   ((CONTROL_OPPONENT_CHEAT-$1000000)).w
                beq.w   @AiControl1     
                bra.s   @Goto_PlayerControl
@CheckAutoBattleCheat1:
                
                tst.b   ((AUTO_BATTLE_CHEAT-$1000000)).w
                bne.w   @AiControl1     
@Goto_PlayerControl:
                
                bra.w   @PlayerControl  
@AiControl1:
                
                jsr     j_StartAiControl ; AI controlled unit (enemy, auto-control cheat, MUDDLEd force member)
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
                bsr.w   CreatePulsatingBlocksRange
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
                bne.w   @AiControl2
                jsr     j_GetAiActivationFlag
                andi.w  #4,d1
                bne.w   @AiControl2
                tst.b   d0
                bpl.s   @CheckAutoBattleCheat2
                tst.b   ((CONTROL_OPPONENT_CHEAT-$1000000)).w
                beq.w   @AiControl2
                bra.s   @Continue
@CheckAutoBattleCheat2:
                
                tst.b   ((AUTO_BATTLE_CHEAT-$1000000)).w
                bne.w   @AiControl2
@Continue:
                
                bsr.w   HandleBattleEntityControlPlayerInput
                cmpi.w  #$FFFF,d0
                bne.w   @CheckBattleaction_CastEgress
                jsr     (WaitForViewScrollEnd).w
                move.w  combatant(a6),d0
                clr.b   ((IS_TARGETING-$1000000)).w
                jsr     j_RemoveLandEffectWindow
                jsr     j_RemoveMiniStatusWindow
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                moveq   #DOWN,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                bsr.w   BattlefieldMenuActions
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                bra.w   @Start
@AiControl2:
                
                bsr.w   sub_252FA       
@CheckBattleaction_CastEgress:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,((CURRENT_BATTLEACTION-$1000000)).w
                bne.s   @CheckBattleaction_UseAngelWing
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                cmpi.w  #SPELL_EGRESS,d0
                beq.w   ExecuteBattleaction_Egress
@CheckBattleaction_UseAngelWing:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,((CURRENT_BATTLEACTION-$1000000)).w
                bne.s   @CheckBattleaction_Stay
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_ANGEL_WING,d0
                beq.w   ExecuteBattleaction_AngelWing
@CheckBattleaction_Stay:
                
                cmpi.w  #BATTLEACTION_STAY,((CURRENT_BATTLEACTION-$1000000)).w
                beq.w   @NoAction
                cmpi.w  #BATTLEACTION_TRAPPED_CHEST,((CURRENT_BATTLEACTION-$1000000)).w
                bne.w   @DetermineKiwiFlameBreath
                clr.w   ((CURRENT_BATTLEACTION-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  combatant(a6),((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,combatant(a6)
@DetermineKiwiFlameBreath:
                
                move.w  combatant(a6),d0
                jsr     j_GetClass
                cmpi.w  #CLASS_MNST,d1  ; HARDCODED class test : MNST (Monster, for Kiwi)
                bne.s   @CheckFairyWoodsBattle
                tst.w   ((CURRENT_BATTLEACTION-$1000000)).w
                bne.s   @CheckFairyWoodsBattle
                moveq   #CHANCE_TO_PERFORM_KIWI_FLAME_BREATH,d6 ; 1/4 chance to perform Kiwi's Flame Breath
                jsr     (GenerateRandomNumber).w
                tst.w   d7
                bne.s   @CheckFairyWoodsBattle
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  #BATTLEACTION_CAST_SPELL,((CURRENT_BATTLEACTION-$1000000)).w
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
                blt.s   @LoadKiwiFlameBreathSpellEntry
                addq.w  #1,d0
@LoadKiwiFlameBreathSpellEntry:
                
                lsl.w   #6,d0
                ori.w   #SPELL_KIWI,d0
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
@CheckFairyWoodsBattle:
                
                checkSavedByte #BATTLE_FAIRY_WOODS, CURRENT_BATTLE   ; HARDCODED Battle check : Fairy wood secret battle
                bne.s   @WriteBattlesceneScript
                jsr     j_RemoveTimerWindow
@WriteBattlesceneScript:
                
                jsr     (WaitForVInt).w ; make sure that VDP planes are updated one last time (to clear flashing range blocks) before transitioning to the battlescene
                jsr     (WaitForVInt).w
                move.w  combatant(a6),d0
                jsr     j_WriteBattlesceneScript
                move.w  combatant(a6),d0
                
                ; Load battlescene music index
                tst.b   d0
                blt.s   @EnemyMusic     
                jsr     j_GetClass
                cmpi.w  #CHAR_CLASS_FIRSTPROMOTED,d1 ; HARDCODED music choices
                bge.s   @PromotedMusic  
                move.b  #MUSIC_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; regular
                bra.s   @Goto_GetFirstBattlesceneEnemy
@PromotedMusic:
                
                move.b  #MUSIC_PROMOTED_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; promoted
@Goto_GetFirstBattlesceneEnemy:
                
                bra.w   @GetFirstBattlesceneEnemy
@EnemyMusic:
                
                move.b  #MUSIC_ENEMY_ATTACK,((BATTLESCENE_MUSIC_INDEX-$1000000)).w 
                                                        ; enemy
                jsr     j_GetEnemy
                
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
                moveq   #DOWN,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                move.w  combatant(a6),d0
                jsr     j_RemoveLandEffectWindow
                jsr     j_RemoveMiniStatusWindow
@Done:
                
                unlk    a6
                rts

    ; End of function ExecuteIndividualTurn

