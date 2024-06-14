
; ASM FILE code\gameflow\battle\battlefunctions\executeindividualturn-standard.asm :
; 

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index

aiControlFlag = -10
statusEffects = -8
battleEntity = -6
itemOrSpellIndex = -4
combatant = -2

ExecuteIndividualTurn:
                
                jsr     (InitializeBattlefieldSpritesFrameCounter).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                link    a6,#-10
                move.w  d0,combatant(a6)
                clr.b   aiControlFlag(a6)
                
@Start:         clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                
                ; Check if we're currently battling Taros, and Bowie is the actor
                checkSavedByte #BATTLE_VERSUS_TAROS, CURRENT_BATTLE  ; HARDCODED battle index
                bne.s   @IsActorAlive
                tst.w   combatant(a6)
                bne.s   @IsActorAlive
                clrFlg  112             ; Currently attacking Taros with Achilles Sword
                
@IsActorAlive:  jsr     GetCurrentHP
                tst.w   d1
                beq.w   @Done           ; skip turn if actor is dead
                
                ; Actor is alive
                move.w  combatant(a6),d0
                jsr     GetCombatantX
                move.w  d1,((BATTLE_ACTOR_X-$1000000)).w
                move.w  d1,((BATTLE_TARGET_X-$1000000)).w
                move.w  d1,d2
                jsr     GetCombatantY
                move.w  d1,((BATTLE_ACTOR_Y-$1000000)).w
                move.w  d1,((BATTLE_TARGET_Y-$1000000)).w
                move.w  d1,d3
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.w  d0,battleEntity(a6)
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   SetCursorDestinationToNextCombatant ; In: d2.w, d3.w = entity X,Y coordinates
                move.w  combatant(a6),d0
                jsr     GetStatusEffects
                move.w  d1,statusEffects(a6)
                andi.w  #STATUSEFFECT_MUDDLE,d1
                bne.s   @AiControl1
                jsr     GetActivationBitfield
                andi.w  #4,d1
                bne.s   @AiControl1
                tst.b   d0
                bpl.s   @IsAutoBattle       ; check auto battle if ally
                tst.b   ((CONTROL_OPPONENT_TOGGLE-$1000000)).w
                beq.s   @AiControl1
                bra.s   @PlayerControl
                
@IsAutoBattle:  tst.b   ((AUTO_BATTLE_TOGGLE-$1000000)).w
                beq.s   @PlayerControl
                
@AiControl1:    st      aiControlFlag(a6)
                jsr     StartAiControl      ; AI controlled unit (enemy, auto-control cheat, MUDDLEd force member)
                
@PlayerControl: bsr.w   WaitForCursorToStopMoving ; player controlled unit (normal force member, enemy with control opponent cheat)
                jsr     (WaitForViewScrollEnd).w
                clr.b   ((IS_TARGETING-$1000000)).w
                move.w  combatant(a6),d0
                move.w  d0,((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w
                jsr     OpenBattlefieldMiniStatusWindow
                jsr     OpenLandEffectWindow
                jsr     CreateMovementRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                bsr.w   HideCursorEntity
                move.w  statusEffects(a6),d1
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_SLEEP,d1
                bne.s   @Stay
                tst.b   aiControlFlag(a6)
                bne.s   @AiControl2
                
                ; Handle player input
                bsr.w   ProcessBattleEntityControlPlayerInput
                cmpi.w  #-1,d0
                bne.s   @HandleBattleaction
                jsr     (WaitForViewScrollEnd).w
                clr.b   ((IS_TARGETING-$1000000)).w
                jsr     CloseLandEffectWindow
                jsr     CloseBattlefieldMiniStatusWindow
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  battleEntity(a6),d0
                moveq   #3,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
                bsr.w   BattlefieldMenu
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                bra.w   @Start
                
@Stay:          jsr     (WaitForViewScrollEnd).w
                jsr     (WaitForVInt).w
                clr.b   ((IS_TARGETING-$1000000)).w
                move.w  battleEntity(a6),d0
                moveq   #3,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
                jsr     CloseLandEffectWindow
                jsr     CloseBattlefieldMiniStatusWindow
                bra.w   @Done
                
@AiControl2:    bsr.w   ExecuteAiControl
@HandleBattleaction:
                
                move.w  ((CURRENT_BATTLEACTION-$1000000)).w,d0
                tst.b   d0
                bmi.s   @TrappedChest
                add.w   d0,d0
                jmp     @bt_Battleactions(pc,d0.w)
@bt_Battleactions:
                
                bra.s   @Attack
                bra.s   @CastSpell
                bra.s   @UseItem
                bra.s   @Stay
                bra.s   @Continue
                bra.s   @Continue
                bra.s   @Continue
                
                ; Check if casting Egress
@CastSpell:     move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                cmpi.w  #SPELL_EGRESS,d0
                bne.s   @Continue
                bra.w   ExecuteBattleaction_Egress
                
                ; Check if using Angel Wing
@UseItem:       move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_ANGEL_WING,d0
                bne.s   @Continue
                bra.w   ExecuteBattleaction_AngelWing
                
                ; Prepare enemy attack coming out of a trapped chest 
@TrappedChest:  clr.w   ((CURRENT_BATTLEACTION-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  combatant(a6),((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,combatant(a6)
                
@Attack:        bsr.w   DetermineRandomAttackSpell
                
@Continue:      checkSavedByte #BATTLE_FAIRY_WOODS, CURRENT_BATTLE   ; HARDCODED Battle check : Fairy wood secret battle
                bne.s   @WriteBattlesceneScript
                jsr     CloseTimerWindow
@WriteBattlesceneScript:
                
                jsr     (WaitForVInt).w ; make sure that VDP planes are updated one last time (to clear flashing range blocks) before transitioning to the battlescene
                jsr     (WaitForVInt).w
                move.w  combatant(a6),d0
                jsr     WriteBattlesceneScript
                bsr.w   LoadBattlesceneMusicIndex
                
                ; Get first battlescene enemy and ally indexes
                clr.w   d0
                move.b  ((BATTLESCENE_FIRST_ENEMY-$1000000)).w,d0
                cmpi.b  #-1,d0
                bne.s   @GetFirstBattlesceneAlly
                ext.w   d0              ; d0.w = battlescene enemy
@GetFirstBattlesceneAlly:
                
                clr.w   d1
                move.b  ((BATTLESCENE_FIRST_ALLY-$1000000)).w,d1
                cmpi.b  #-1,d1
                bne.s   @InitBattlescene
                ext.w   d1              ; d1.w = battlescene ally
@InitBattlescene:
                
                move.l  a6,-(sp)
                jsr     InitializeBattlescene
                st      ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                jsr     ExecuteBattlesceneScript
                jsr     EndBattlescene
                jsr     ApplyPositionsAfterEnemyLeaderDies ; After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.
                movea.l (sp)+,a6
                move.l  a6,-(sp)
                move.w  itemOrSpellIndex(a6),d0
                bsr.w   LoadBattle
                jsr     (WaitForVInt).w
                clr.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                st      ((VIEW_TARGET_ENTITY-$1000000)).w
                movea.l (sp)+,a6
@Done:          unlk    a6
                rts

    ; End of function ExecuteIndividualTurn


; =============== S U B R O U T I N E =======================================

; Find pointer to random spell on attack data for class or enemy.

DetermineRandomAttackSpell:
                
                movem.l d1-d2/a0,-(sp)
                moveq   #5,d2
                move.w  combatant(a6),d0
                tst.b   d0
                bmi.s   @Enemy
                lea     table_RandomAttackSpellsForClasses(pc), a0
                jsr     GetClass
                bra.s   @Continue
@Enemy:         lea     table_RandomAttackSpellsForEnemies(pc), a0
                jsr     GetEnemy
@Continue:      jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                ; Randomly determine if spell is cast
                move.w  #256,d6
                jsr     (GenerateRandomNumber).w
                cmp.b   (a0)+,d7                     ; d6/256 chance to cast spell
                bhs.s   @Done
                
                ; Determine spell level
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  #BATTLEACTION_CAST_SPELL,((CURRENT_BATTLEACTION-$1000000)).w
                jsr     GetCurrentLevel
                clr.w   d0
                
                ; Check upgrade level 1
                cmp.b   (a0)+,d1
                blt.s   @CheckUpgrade2
                addq.w  #1,d0
@CheckUpgrade2: cmp.b   (a0)+,d1
                blt.s   @CheckUpgrade3
                addq.w  #1,d0
@CheckUpgrade3: cmp.b   (a0)+,d1
                blt.s   @LoadSpell
                addq.w  #1,d0
@LoadSpell:     lsl.w   #6,d0
                or.b    (a0),d0
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
@Done:          movem.l (sp)+,d1-d2/a0
                rts

    ; End of function DetermineRandomAttackSpell


; =============== S U B R O U T I N E =======================================

; Load battlescene music index for combatant d0.w

LoadBattlesceneMusicIndex:
                
                movem.l d1-d2/a0,-(sp)
                tst.b   d0
                bmi.s   @Enemy
                move.b  #MUSIC_ATTACK,d3
                jsr     GetClassType
                beq.s   @LoadIndex
                move.b  #MUSIC_PROMOTED_ATTACK,d3
                bra.s   @LoadIndex
@Enemy:         move.b  #MUSIC_ENEMY_ATTACK,d3
                lea     table_EnemyBattlesceneMusics(pc), a0
                jsr     GetEnemy
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @LoadIndex
                move.b  (a0),d3
@LoadIndex:     move.b  d3,((BATTLESCENE_MUSIC_INDEX-$1000000)).w
                movem.l (sp)+,d1-d2/a0
                rts

    ; End of function LoadBattlesceneMusicIndex

