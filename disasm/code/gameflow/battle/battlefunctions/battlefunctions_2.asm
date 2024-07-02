
; ASM FILE code\gameflow\battle\battlefunctions\battlefunctions_2.asm :
; 0x2448A..0x2550C : Battle functions

; =============== S U B R O U T I N E =======================================


SpawnEnemySkipCamera:
                
                moveq   #1,d1
                bra.w   SpawnEnemy

    ; End of function SpawnEnemySkipCamera


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant

combatant = -2

SpawnEnemyWithCamera:
                
                clr.w   d1
SpawnEnemy:
                
                movem.l d7-a0,-(sp)
                link    a6,#-16
                move.w  d1,-(sp)
                move.w  d0,combatant(a6)
                move.w  combatant(a6),d0
                jsr     sub_440B8
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
                andi.w  #3,d1
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


; =============== S U B R O U T I N E =======================================

; Unused in standard build

ClearDeadCombatantsListLength:
                
            if (VANILLA_BUILD=1)
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                rts
            endif

    ; End of function ClearDeadCombatantsListLength


; =============== S U B R O U T I N E =======================================


ProcessKilledCombatants:
                
                tst.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                beq.w   @NoneKilled
                movem.l d0-a2/a6,-(sp)
                moveq   #ANIM_SPRITE_DEATH_SPINS_NUMBER,d6
@DeathSpin_Loop:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0 ; loop point for sprite death spin animation
                lea     ((ENTITY_ANIMATION_COUNTER-$1000000)).w,a1
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@GetDeadCombatant_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                jsr     GetEntityIndexForCombatant
                move.w  d6,d1
                andi.w  #3,d1
                clr.w   d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).l
                cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                blt.s   @Continue
                jsr     (WaitForVInt).w
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
@Continue:
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                move.b  #-1,(a1,d0.w)
                dbf     d7,@GetDeadCombatant_Loop
                
                moveq   #ANIM_SPRITE_DEATH_SPIN_DELAY,d0
                jsr     (Sleep).w       
                dbf     d6,@DeathSpin_Loop
                
                sndCom  SFX_BATTLEFIELD_DEATH
                moveq   #2,d6
@DeathSound_Loop:
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@UpdateDeadCombatant_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                jsr     GetEntityIndexForCombatant
                cmpi.b  #ENTITY_SPECIAL_SPRITE,d0
                bne.s   @NormalEntity
                move.l  #$60006000,((ENTITY_SPECIAL_SPRITE_DATA-$1000000)).w
                move.l  #$60006000,((ENTITY_SPECIAL_SPRITE_DESTINATION-$1000000)).w
@NormalEntity:
                
                move.w  #DOWN,d1
                sub.w   d6,d1
                clr.w   d2
                move.w  #MAPSPRITE_EFFECT1,d3
                jsr     (UpdateEntityProperties).l
                cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                blt.s   @NextDeadEntity
                jsr     (WaitForVInt).w
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
@NextDeadEntity:
                
                dbf     d7,@UpdateDeadCombatant_Loop
                
                moveq   #8,d0
                jsr     (Sleep).w       
                dbf     d6,@DeathSound_Loop
                
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@CheckKillDefeat_Loop:
                
                moveq   #1,d1
                clr.w   d0
                move.b  (a0)+,d0
                blt.s   @IncreaseKills
                jsr     j_IncreaseDefeats
                bra.s   @ClearDeadCombatant
@IncreaseKills:
                
                movem.l d0,-(sp)
                clr.w   d0
                move.b  ((BATTLESCENE_FIRST_ALLY-$1000000)).w,d0
                jsr     j_IncreaseKills
                movem.l (sp)+,d0
@ClearDeadCombatant:
                
                moveq   #-1,d1
                jsr     j_SetCombatantX
                jsr     j_SetCombatantY
                clr.w   d1
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
                jsr     GetEntityIndexForCombatant
                move.w  #$7000,d1
                move.w  #$7000,d2
                jsr     SetEntityPosition
                dbf     d7,@CheckKillDefeat_Loop
                
                moveq   #10,d0
                jsr     (Sleep).w       
                movem.l (sp)+,d0-a2/a6
@NoneKilled:
                
                rts

    ; End of function ProcessKilledCombatants


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index

itemOrSpellIndex = -4
combatant = -2

UpdateTargetsListForCombatant:
                
                movem.w d0,-(sp)
                move.w  combatant(a6),d0
                tst.b   d0
                movem.w (sp)+,d0
                blt.s   @Enemy
                jsr     j_UpdateBattleTerrainOccupiedByEnemies
                bra.s   @Return
@Enemy:
                
                jsr     j_UpdateBattleTerrainOccupiedByAllies
@Return:
                
                rts

    ; End of function UpdateTargetsListForCombatant


; =============== S U B R O U T I N E =======================================

; Handle player input when controlling battle entity.

itemOrSpellIndex = -4
combatant = -2

ProcessBattleEntityControlPlayerInput:
                
                module
                movem.l d1-a6,-(sp)
                move.w  combatant(a6),((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w
@Start:
                
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   SetMoveSfx
                bsr.w   ControlBattleEntity
                jsr     (WaitForViewScrollEnd).w
                btst    #INPUT_BIT_B,d4
                beq.w   @CheckPosition
                
                ; Pressed B
                movem.w d2-d3,-(sp)
                move.w  ((BATTLE_ACTOR_X-$1000000)).w,d3
                move.w  ((BATTLE_ACTOR_Y-$1000000)).w,d4
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a5
                moveq   #1,d0
                bsr.s   UpdateTargetsListForCombatant
                moveq   #$1E,d0
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                jsr     j_PopulateMovementArrays
                clr.w   d0
                jsr     UpdateTargetsListForCombatant(pc)
                movem.w (sp)+,d0-d1
                jsr     j_BuildCancelMoveString
                move.w  combatant(a6),d0
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a0
                bsr.w   MoveBattleEntityByMoveString
                move.w  #-1,((CURRENT_BATTLEACTION-$1000000)).w
                moveq   #-1,d0
                bra.w   @EndBattleEntityControl
@CheckPosition:
                
                clr.w   d0
                moveq   #COMBATANTS_ALL_COUNTER,d7
@CheckPosition_Loop:
                
                cmp.w   combatant(a6),d0 ; check if chosen position is inhabited already (for debug mode B-button trick)
                beq.w   @NextCombatant
                jsr     j_GetCombatantX
                cmp.w   d1,d2
                bne.w   @NextCombatant
                jsr     j_GetCombatantY
                cmp.w   d1,d3
                bne.w   @NextCombatant
                sndCom  SFX_REFUSAL
                beq.w   @Start
@NextCombatant:
                
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bne.s   @Continue
                move.w  #COMBATANT_ENEMIES_START,d0
@Continue:
                
                dbf     d7,@CheckPosition_Loop
                
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  combatant(a6),d0
                move.w  d2,d1
                jsr     j_SetCombatantX
                move.w  d3,d1
                jsr     j_SetCombatantY
                clr.w   d1
@StartBattleMenu:
                
                move.w  d1,-(sp)
                jsr     DeletePulsatingBlocks
                jsr     (WaitForVInt).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityPositionAfterApplyingFacing
                jsr     (CheckChestItem).w
                move.w  d2,((CHEST_CONTENTS-$1000000)).w
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                move.w  #-1,d0
                andi.b  #ITEMENTRY_MASK_INDEX,d0
                cmp.w   d0,d2
            else
                cmpi.w  #-1,d2
            endif
                bne.s   @SearchMenu     ; if d2.w != -1, then there is an item
                
                moveq   #MENU_BATTLE_WITH_STAY,d2
                bra.s   @CheckTargetReachableByAttack
@SearchMenu:
                
                moveq   #MENU_BATTLE_WITH_SEARCH,d2
@CheckTargetReachableByAttack:
                
                move.w  combatant(a6),d0
                jsr     j_CreateAttackRangeGrid
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.s   @TargetIsInAttackRange
                
                moveq   #3,d0
                bra.s   @NoTarget
@TargetIsInAttackRange:
                
                clr.w   d0
@NoTarget:
                
                bsr.w   HideCursorEntity
                move.w  (sp)+,d1
                lea     (InitialStack).w,a0
                jsr     j_ExecuteDiamondMenu
                cmpi.w  #-1,d0
                bne.w   @CheckChoice_Attack
                
                ; Canceled out of menu
                move.w  combatant(a6),d0
                move.w  ((BATTLE_ACTOR_X-$1000000)).w,d1
                jsr     j_SetCombatantX
                move.w  ((BATTLE_ACTOR_Y-$1000000)).w,d1
                jsr     j_SetCombatantY
                move.w  combatant(a6),d0
                jsr     j_CreateMovementRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                bra.w   @Start
@CheckChoice_Attack:
                
                tst.w   d0
                bne.w   @CheckChoice_Magic
                move.w  combatant(a6),d0
                jsr     j_CreateAttackRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   @HasTarget_Attack
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @StartBattleMenu
@HasTarget_Attack:
                
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   ControlCursorEntity_ChooseTarget
                cmpi.w  #-1,d0
                bne.w   @Confirm_Attack
                
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,d2
                jsr     j_GetCombatantY
                move.w  d1,d3
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #-1,d1
                bra.w   @StartBattleMenu
@Confirm_Attack:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                clr.w   ((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   @EndBattleEntityControl
@CheckChoice_Magic:
                
                cmpi.w  #1,d0
                bne.w   @CheckChoice_Item
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                tst.w   d2
                bne.w   @HasSpell
                txt     436             ; "Learned no new magic spell.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @StartBattleMenu
@HasSpell:
                
                clr.w   d1
@ChooseSpell:
                
                move.w  combatant(a6),d0
                bsr.w   HideCursorEntity
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
                lea     CreatePulsatingSpellRangeGrid(pc), a0
                nop
                jsr     j_ExecuteBattlefieldMagicMenu
                cmpi.w  #-1,d0
                bne.w   @CheckMpCost
                
                moveq   #-1,d1
                bra.w   @StartBattleMenu
@CheckMpCost:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,d4
                move.w  combatant(a6),d0
                jsr     j_GetCurrentMp
                move.w  d1,d3
                move.w  d4,d1
                jsr     j_GetSpellCost
                sub.w   d1,d3
                bge.w   @MeetsMpRequirement
                txt     437             ; "More MP needed.{W1}"
                clsTxt
                clr.w   d1
                bra.s   @ChooseSpell
@MeetsMpRequirement:
                
                move.w  d4,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   @HasTarget_Spell
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @ChooseSpell
@HasTarget_Spell:
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((CURSOR_RADIUS-$1000000)).w
                bsr.w   ControlCursorEntity_ChooseTarget
                cmpi.w  #-1,d0
                bne.w   @Confirm_Spell
                
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,((BATTLE_TARGET_X-$1000000)).w
                jsr     j_GetCombatantY
                move.w  d1,((BATTLE_TARGET_Y-$1000000)).w
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #-1,d1
                bra.w   @ChooseSpell
@Confirm_Spell:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                move.w  #BATTLEACTION_CAST_SPELL,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   @EndBattleEntityControl

    ; End of function ProcessBattleEntityControlPlayerInput


; =============== S U B R O U T I N E =======================================


CreatePulsatingSpellRangeGrid:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  ((TEMP_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_CreateSpellRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreatePulsatingSpellRangeGrid


; START OF FUNCTION CHUNK FOR ProcessBattleEntityControlPlayerInput

@CheckChoice_Item:
                
                cmpi.w  #2,d0
                bne.w   @CheckChoice_SearchStay
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                tst.w   d2
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                ; Skip ahead to Give action if no item held
                beq.w   @StartGiveAction
            else
                bne.w   @HasItemToUse
                txt     438             ; "You have no item.{W1}"
                clsTxt
                bra.w   @StartBattleMenu
            endif
@HasItemToUse:
                
                clr.w   d1
@ChooseItemSubmenuAction:
                
                moveq   #MENU_ITEM,d2
                clr.w   d0
                lea     (InitialStack).w,a0
                jsr     j_ExecuteDiamondMenu
                cmpi.w  #-1,d0
                bne.w   @CheckItemMenuChoice_Use
                
                moveq   #-1,d1
                bra.w   @StartBattleMenu
@CheckItemMenuChoice_Use:
                
                tst.w   d0
                bne.w   @CheckItemMenuChoice_Equip
                clr.w   d1
@ChooseItem:
                
                move.w  combatant(a6),d0
                bsr.w   HideCursorEntity
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                clr.w   d0
                clr.w   d1
                lea     CreatePulsatingItemRangeGrid(pc), a0
                nop
                jsr     j_ExecuteBattlefieldItemMenu
                cmpi.w  #-1,d0
                bne.w   @IsUsable
                
                bsr.w   DeletePulsatingBlocks
                bra.s   @ChooseItemSubmenuAction
@IsUsable:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d1,((BATTLEACTION_ITEM_SLOT-$1000000)).w
                move.w  d0,d1
                move.w  combatant(a6),d0
                jsr     j_IsItemUsableByCombatant
                bcs.w   @ItemHasUse
                txt     439             ; "It has no effect.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @StartBattleMenu
@ItemHasUse:
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateItemRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   @HasTarget_Use
                txt     439             ; "It has no effect.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @ChooseItem
@HasTarget_Use:
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((CURSOR_RADIUS-$1000000)).w
                bsr.w   ControlCursorEntity_ChooseTarget
                cmpi.w  #-1,d0
                bne.w   @Confirm_ItemUse
                
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,((BATTLE_TARGET_X-$1000000)).w
                jsr     j_GetCombatantY
                move.w  d1,((BATTLE_TARGET_Y-$1000000)).w
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #-1,d1
                bra.w   @StartBattleMenu
                bra.w   @ChooseItem
@Confirm_ItemUse:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                move.w  #BATTLEACTION_USE_ITEM,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   @EndBattleEntityControl

; END OF FUNCTION CHUNK FOR ProcessBattleEntityControlPlayerInput


; =============== S U B R O U T I N E =======================================


CreatePulsatingItemRangeGrid:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  ((TEMP_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_IsItemUsableByCombatant
                bcc.s   @NotUsable
                jsr     j_CreateItemRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                bra.s   @Done
@NotUsable:
                
                bsr.w   DeletePulsatingBlocks
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreatePulsatingItemRangeGrid


; START OF FUNCTION CHUNK FOR ProcessBattleEntityControlPlayerInput

@CheckItemMenuChoice_Equip:
                
                cmpi.w  #2,d0
                bne.w   @CheckItemMenuChoice_Give
                move.w  combatant(a6),d0
                jsr     j_GetEquippableWeapons
                move.w  d1,d2
                jsr     j_GetEquippableRings
                add.w   d2,d1
                bne.w   @HasItemToEquip
                txt     444             ; "You have nothing to equip.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @ChooseItemSubmenuAction
@HasItemToEquip:
                
                bsr.w   HideCursorEntity
                jsr     j_OpenBattleEquipWindow
                clr.w   d6
@StartEquipAction:
                
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
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_24BA0
                moveq   #1,d7
                move.w  #-1,d6
                bra.w   loc_24C44
loc_24BA0:
                
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                lsl.w   #INDEX_SHIFT_COUNT,d1
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
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_24C26
                jsr     j_GetEquippableWeapons
                tst.w   d1
                bne.s   loc_24C22
                moveq   #1,d7
                moveq   #-1,d6
                bra.w   loc_24C44
loc_24C22:
                
                bra.w   @StartEquipAction
loc_24C26:
                
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                lsl.w   #INDEX_SHIFT_COUNT,d1
                move.w  (a2,d1.w),d2
                move.w  2(a2,d1.w),d1
                move.w  d2,d5
                move.w  d1,d4
                jsr     j_GetEquippedRing
                bsr.w   EquipNewItemInBattle
                clr.w   d1
loc_24C44:
                
                jsr     j_CloseBattleEquipWindow
                bra.w   @StartBattleMenu

; END OF FUNCTION CHUNK FOR ProcessBattleEntityControlPlayerInput


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
                bra.s   @Goto_ExecuteDiamondMenu
@DefaultToUnarmed:
                
                moveq   #DOWN,d1        ; set menu initial choice to down slot
@Goto_ExecuteDiamondMenu:
                
                bra.s   @ExecuteDiamondMenu
@GetMenuInitialChoice:
                
                move.l  a0,-(sp)
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                moveq   #-1,d1
@Loop:
                
                addq.w  #1,d1
                addq.l  #2,a0
                move.w  (a0)+,d4
                cmp.w   d2,d4
                dbeq    d7,@Loop
                movea.l (sp)+,a0
@ExecuteDiamondMenu:
                
                move.b  d1,d0
                lea     CreatePulsatingAttackRangeGrid(pc), a0
                nop
                move.w  d6,d1
                move.w  d1,-(sp)
                jsr     j_ExecuteBattlefieldItemMenu
                move.w  (sp)+,d1
                move.w  (sp)+,d0
                rts

    ; End of function sub_24C4E


; =============== S U B R O U T I N E =======================================

; In: d2.w = old item slot, d4.w = new item slot


EquipNewItemInBattle:
                
                cmpi.w  #4,d2
                beq.w   @Equip
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   @Equip          ; equip new item if not cursed
                cmp.w   d4,d1
                beq.w   @Return         ; return if selecting old item slot
                
                ; Prohibited from exchanging equipment
                jsr     j_CloseBattleEquipWindow
                sndCom  MUSIC_CURSED_ITEM
                txt     43              ; "Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}"
                bra.w   @FadeOutMusic
@Equip:
                
                move.w  d4,d1
            if (STANDARD_BUILD&FIX_HIGINS_SPELL=1)
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   @Return
            endif
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.w   @Return         ; return if not cursed
                jsr     j_CloseBattleEquipWindow
                sndCom  MUSIC_CURSED_ITEM
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     34              ; "Gosh!  {NAME} is{N}cursed!{W2}"
@FadeOutMusic:
                
                bsr.w   FadeOut_WaitForP1Input
                clsTxt
                jsr     j_OpenBattleEquipWindow
@Return:
                
                rts

    ; End of function EquipNewItemInBattle


; =============== S U B R O U T I N E =======================================


CreatePulsatingAttackRangeGrid:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetStatusEffects
                move.w  d1,-(sp)
                clr.w   d2
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
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
                
                jsr     j_HideBattleEquipWindow
                jsr     j_CreateAttackRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  (sp)+,d1
                jsr     j_SetStatusEffects
                movem.l (sp)+,d0-a6
                rts

    ; End of function CreatePulsatingAttackRangeGrid


; START OF FUNCTION CHUNK FOR ProcessBattleEntityControlPlayerInput

@CheckItemMenuChoice_Give:
                
                cmpi.w  #1,d0
                bne.w   @ItemMenuChoice_Drop
@StartGiveAction:
                
                move.w  combatant(a6),d0
                bsr.w   HideCursorEntity
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                move.w  combatant(a6),d0
                jsr     j_PopulateTargetableGrid_GiveItem
                bsr.w   CreatePulsatingBlocksForGrid
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   @HasTarget_Give
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bsr.w   DeletePulsatingBlocks
                bra.w   @ChooseItemSubmenuAction
@HasTarget_Give:
                
                bsr.w   HideCursorEntity
                jsr     (WaitForVInt).w
                clr.w   d0
                lea     (InitialStack).w,a0
                jsr     j_ExecuteBattlefieldItemMenu
                cmpi.w  #-1,d0
                bne.w   @IsActorCursed
                
                bsr.w   DeletePulsatingBlocks
                bra.w   @ChooseItemSubmenuAction
@IsActorCursed:
                
                move.w  d0,((BATTLEACTION_ITEM_SLOT-$1000000)).w
                move.w  d1,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                btst    #ITEMENTRY_BIT_EQUIPPED,d0
                beq.w   @ChooseTarget
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   @ChooseTarget
                sndCom  MUSIC_CURSED_ITEM
                txt     441             ; "The equipment is cursed.{W1}"
                bsr.w   FadeOut_WaitForP1Input
                clsTxt
                clr.w   d1
                bra.s   @HasTarget_Give
@ChooseTarget:
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                clsTxt
            endif
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   ControlCursorEntity_ChooseTarget
                cmpi.w  #-1,d0
                bne.w   @IsTargetInventoryFull
                
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #-1,d1
                bra.w   @StartGiveAction
@IsTargetInventoryFull:
                
                move.w  d0,itemOrSpellIndex(a6)
                jsr     j_CloseBattlefieldMiniStatusWindow
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                ; Always trade items
            else
                ; Trade items if target's inventory is full
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                beq.w   @ChooseItemToTrade
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                andi.w  #7,d1
                move.w  combatant(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  itemOrSpellIndex(a6),d0
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                bclr    #ITEMENTRY_BIT_EQUIPPED,d1
                jsr     j_AddItem
                bra.w   @EndGiveAction
            endif
@ChooseItemToTrade:
                
                move.w  itemOrSpellIndex(a6),d0
                bsr.w   HideCursorEntity
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                clr.w   d0
                lea     (InitialStack).w,a0
                jsr     j_ExecuteBattlefieldItemMenu
                cmpi.w  #-1,d0
                bne.w   @IsTargetCursed
                bra.w   @ChooseTarget
@IsTargetCursed:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  d1,((CURRENT_BATTLEACTION-$1000000)).w
                btst    #ITEMENTRY_BIT_EQUIPPED,d0
                beq.w   @TradeItem
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   @TradeItem
                sndCom  MUSIC_CURSED_ITEM
                txt     441             ; "The equipment is cursed.{W1}"
                bsr.w   FadeOut_WaitForP1Input
                clsTxt
                clr.w   d1
                bra.w   @ChooseItemToTrade
@TradeItem:
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                andi.w  #3,d1
                move.w  combatant(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                move.w  d1,-(sp)
                move.w  ((CURRENT_BATTLEACTION-$1000000)).w,d1
                andi.w  #3,d1
                move.w  itemOrSpellIndex(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  ((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w,d1
                bclr    #ITEMENTRY_BIT_EQUIPPED,d1
                move.w  combatant(a6),d0
                jsr     j_AddItem
                move.w  (sp)+,d1
                bclr    #ITEMENTRY_BIT_EQUIPPED,d1
                move.w  itemOrSpellIndex(a6),d0
                jsr     j_AddItem
@EndGiveAction:
                
                move.w  #BATTLEACTION_STAY,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   @EndBattleEntityControl
@ItemMenuChoice_Drop:
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     GetItemBySlotAndHeldItemsNumber
                tst.w   d2
                bne.s   @ChooseDiscard
                
                txt     438             ; "You have no item.{W1}"
                clsTxt
                bra.s   @ReturnToMenu
@ChooseDiscard:
            endif
            
                move.w  combatant(a6),d0
                bsr.w   HideCursorEntity
                move.w  d1,-(sp)
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,(a0)+
                move.w  (sp)+,d1
                clr.w   d0
                clr.w   d1
                lea     (InitialStack).w,a0
                jsr     j_ExecuteBattlefieldItemMenu
                cmpi.w  #-1,d0
                bne.w   loc_24FC2
@ReturnToMenu:  
                
                moveq   #-1,d1
                bra.w   @ChooseItemSubmenuAction
loc_24FC2:
                
                move.w  d0,((BATTLEACTION_ITEM_SLOT-$1000000)).w
                move.w  d1,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                btst    #ITEMENTRY_BIT_EQUIPPED,d0
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
                bra.w   @ItemMenuChoice_Drop
loc_24FFA:
                
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_25022
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     443             ; "Are you sure?"
                clsTxt
                clr.w   d1
                bra.w   @ItemMenuChoice_Drop
loc_25022:
                
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_alt_YesNoPrompt
                clsTxt
                tst.w   d0
                bne.w   @StartBattleMenu
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   byte_25066      
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d0
                jsr     j_AddItemToDeals
byte_25066:
                
                txt     42              ; "Discarded the {ITEM}.{W2}"
                clsTxt
                bra.w   @StartBattleMenu
@CheckChoice_SearchStay:
                
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                move.w  #-1,d0
                andi.b  #ITEMENTRY_MASK_INDEX,d0
                cmp.w   ((CHEST_CONTENTS-$1000000)).w,d0
            else
                cmpi.w  #-1,((CHEST_CONTENTS-$1000000)).w
            endif
                bne.w   loc_25088
                move.w  #BATTLEACTION_STAY,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   @EndBattleEntityControl
loc_25088:
                
                move.w  combatant(a6),d0
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                bsr.w   GetEntityPositionAfterApplyingFacing
                bsr.w   sub_256E6
                cmpi.w  #-1,d3
                beq.s   loc_250B0
                
                move.w  d3,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     418             ; "{NAME} is distributing{N}items from the open chest.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @StartBattleMenu
loc_250B0:
                
                jsr     (OpenChest).w   
                txt     403             ; "{NAME} opened the chest.{W2}{CLEAR}"
                move.w  ((CHEST_CONTENTS-$1000000)).w,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   byte_25178      
                move.w  combatant(a6),d0
                bsr.w   GetEntityPositionAfterApplyingFacing
                move.w  d1,d2
                move.w  d0,d1
                jsr     sub_1AC054
                cmpi.w  #-1,d0
                beq.w   loc_250FC
                
                move.w  #BATTLEACTION_TRAPPED_CHEST,((CURRENT_BATTLEACTION-$1000000)).w
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                sndCom  MUSIC_CORRUPTED_SAVE
                bsr.w   SpawnEnemySkipCamera
                bra.w   @EndBattleEntityControl
loc_250FC:
                
                move.w  ((CHEST_CONTENTS-$1000000)).w,d2
                cmpi.w  #ITEMINDEX_GOLDCHESTS_START,d2
                blt.s   @ItemChest
                bsr.w   GetChestGoldAmount
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                jsr     j_IncreaseGold
                sndCom  MUSIC_ITEM
                txt     414             ; "{NAME} found {#} gold{N}coins."
                bsr.w   FadeOut_WaitForP1Input
                bra.w   byte_2517C
@ItemChest:
                
                move.w  ((CHEST_CONTENTS-$1000000)).w,d1
                move.w  d1,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.w  combatant(a6),d0
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                jsr     j_AddItem
                tst.w   d2
                bne.w   byte_2515A      
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  d1,((DIALOGUE_NAME_INDEX_2-$1000000)).w
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
                bra.w   @StartBattleMenu
byte_25178:
                
                txt     408             ; "But, it was empty.{W1}"
byte_2517C:
                
                clsTxt
                move.w  #BATTLEACTION_STAY,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
@EndBattleEntityControl:
                
                move.w  d0,-(sp)
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                move.w  (sp)+,d0
                bsr.w   DeletePulsatingBlocks
                movem.l (sp)+,d1-a6
                rts

; END OF FUNCTION CHUNK FOR ProcessBattleEntityControlPlayerInput

                modend

; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

BattlefieldMenu:
                
                module
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                clr.w   ((MOVE_SFX-$1000000)).w
                bsr.w   ControlCursorEntity
                btst    #INPUT_BIT_B,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Continue
                
                move.w  combatant(a6),d0
                rts
@Continue:
                
                moveq   #COMBATANTS_ALL_COUNTER,d7
                clr.w   d0
@Loop:
                
                jsr     j_GetCurrentHp
                tst.w   d1
                ble.w   @loc_6
                jsr     j_GetCombatantX
                cmp.w   d1,d2
                bne.w   @loc_6
                jsr     j_GetCombatantY
                cmp.w   d1,d3
                bne.w   @loc_6
                
                jsr     (WaitForViewScrollEnd).w
                btst    #INPUT_BIT_A,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @IsCursorOnMovingEntity
                
                jsr     j_BuildMemberScreen
                bra.s   @loc_5
@IsCursorOnMovingEntity:
                
                cmp.w   combatant(a6),d0
                bne.s   @OpenMiniStatus
                rts
@OpenMiniStatus:
                
                move.w  d0,((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w
                jsr     j_OpenBattlefieldMiniStatusWindow
                jsr     j_OpenLandEffectWindow
                jsr     (WaitForPlayerInput).w
                jsr     j_CloseLandEffectWindow
                jsr     j_CloseBattlefieldMiniStatusWindow
@loc_5:
                
                cmp.w   combatant(a6),d0
                bne.w   BattlefieldMenu
                rts
@loc_6:
                
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bne.s   @loc_7
                move.w  #COMBATANT_ENEMIES_START,d0
@loc_7:
                
                dbf     d7,@Loop
@StartMenu:
                
                lea     (InitialStack).w,a0
                moveq   #0,d0
                moveq   #0,d1
                moveq   #MENU_BATTLEFIELD,d2
                jsr     j_ExecuteDiamondMenu
                cmpi.w  #-1,d0
                beq.w   BattlefieldMenu
                tst.w   d0
                bne.w   @CheckMiniMap
                
                jsr     j_UpdateForce
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                beq.s   @StartMenu
                
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                jsr     (CopyBytes).w   
@CreateMembersList_Loop:
                
                jsr     j_ExecuteMembersListScreenOnMainSummaryPage
                tst.b   d0
                bmi.s   @StartMenu
                
                jsr     j_BuildMemberScreen
                bra.s   @CreateMembersList_Loop
@CheckMiniMap:
                
                cmpi.w  #1,d0
                bne.w   @CheckOptions
                
                jsr     j_BuildMinimapScreen
                bra.s   @StartMenu
@CheckOptions:
                
                cmpi.w  #2,d0
                bne.w   @SuspendGame
                
                jsr     j_BuildBattlefieldSettingsScreen
                bra.s   @StartMenu
@SuspendGame:
                
                checkSavedByte #BATTLE_VERSUS_ALL_BOSSES, CURRENT_BATTLE
                beq.s   @StartMenu
                txt     0               ; "The game will be suspended.{N}OK?"
                jsr     j_alt_YesNoPrompt
                clsTxt
                tst.w   d0
                bmi.w   @StartMenu
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                move.l  d0,-(sp)
                lea     (SAVED_SECONDS_COUNTER).l,a0
                move.l  ((SECONDS_COUNTER-$1000000)).w,d0
                movep.l d0,0(a0)
                move.l  (sp)+,d0
                movea.l (sp)+,a0
            else
                move.l  ((SECONDS_COUNTER-$1000000)).w,((SAVED_SECONDS_COUNTER-$1000000)).w
            endif
                setFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                getCurrentSaveSlot d0
                jsr     (SaveGame).l
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.w   byte_252E6
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   byte_252F2      
byte_252E6:
                
                
                ; Not in Debug Mode
                sndCom  SOUND_COMMAND_FADE_OUT
                jsr     (FadeOutToBlack).w
                jmp     (WitchSuspend).w
byte_252F2:
                
                
                ; Finish Suspend
                clrFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                bra.w   @StartMenu

    ; End of function BattlefieldMenu

                modend

; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

ExecuteAiControl:
                
                movem.l d0-a6,-(sp)
                
                ; Move entity by move string
                move.w  combatant(a6),d0
                jsr     j_CreateMovementRangeGrid
                bsr.w   CreatePulsatingBlocksForGrid
                move.w  combatant(a6),d0
                move.w  combatant(a6),d0
                bsr.w   SetMoveSfx
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a0
                jsr     MoveBattleEntityByMoveString
                move.w  combatant(a6),d0
                move.w  d2,d1
                jsr     j_SetCombatantX
                move.w  d3,d1
                jsr     j_SetCombatantY
                bsr.w   DeletePulsatingBlocks
                
                ; Perform battle action
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  ((CURRENT_BATTLEACTION-$1000000)).w,d0
                cmpi.w  #BATTLEACTION_STAY,d0
                beq.w   @EndTurn
                
                ; Is attacking?
                tst.w   d0
                bne.w   @Check_CastSpell
                
                move.w  combatant(a6),d0
                jsr     j_CreateAttackRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksForGrid
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   PerformAiTargetingVisualAct
                clr.w   d0
                bra.w   @EndAction
@Check_CastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,d0
                bne.w   @Check_UseItem
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksForGrid
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   PerformAiTargetingVisualAct
                clr.w   d0
                bra.w   @EndAction
@Check_UseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,d0
                bne.w   @Check_Explosion
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateItemRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksForGrid
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   PerformAiTargetingVisualAct
                clr.w   d0
                bra.w   @EndAction
@Check_Explosion:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,d0
                bne.w   @Check_Laser
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksForGrid
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   PerformAiTargetingVisualAct
                clr.w   d0
                bra.w   @EndAction
@Check_Laser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,d0
                bne.w   @EndAction
                move.w  combatant(a6),d0
                jsr     j_GetLaserFacing
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksForGrid
                clr.b   ((CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   PerformAiTargetingVisualAct
                clr.w   d0
                bra.w   *+4
@EndAction:
                
                jsr     DeletePulsatingBlocks
@EndTurn:
                
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                movem.l (sp)+,d0-a6
                rts

    ; End of function ExecuteAiControl


; =============== S U B R O U T I N E =======================================

; - Make actor mapsprite face target
; - Move unit cursor from actor to target
; - Display mini status windows and play the validation SFX

itemOrSpellIndex = -4
combatant = -2

PerformAiTargetingVisualAct:
                
                move.w  d0,itemOrSpellIndex(a6)
                move.w  itemOrSpellIndex(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,d2
                jsr     j_GetCombatantY
                move.w  d1,d3
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                sub.w   d1,d2
                blt.s   loc_254B8
                moveq   #RIGHT,d4
                bra.s   loc_254BC
loc_254B8:
                
                moveq   #LEFT,d4
                neg.w   d2
loc_254BC:
                
                jsr     j_GetCombatantY
                sub.w   d1,d3
                blt.s   loc_254CA
                moveq   #DOWN,d5
                bra.s   loc_254CE
loc_254CA:
                
                moveq   #UP,d5
                neg.w   d3
loc_254CE:
                
                cmp.w   d2,d3
                blt.s   loc_254D4
                move.w  d5,d4
loc_254D4:
                
                bsr.w   GetEntityIndexForCombatant
                move.w  d4,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).l
                move.w  itemOrSpellIndex(a6),d0
                bsr.w   sub_2322C
                bsr.w   WaitForCursorToStopMoving
                jsr     (WaitForViewScrollEnd).w
                move.b  #1,((IS_TARGETING-$1000000)).w
                jsr     j_OpenBattlefieldMiniStatusWindow
                moveq   #15,d0
                jsr     (Sleep).w       
                sndCom  SFX_VALIDATION
                rts

    ; End of function PerformAiTargetingVisualAct

