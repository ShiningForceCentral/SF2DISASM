
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
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   SetUnitCursorDestinationToNextCombatant
                bsr.w   WaitForUnitCursor
                jsr     (WaitForViewScrollEnd).w
                bsr.w   HideUnitCursor
@SkipCamera:
                
                moveq   #11,d7
@Loop:
                
                move.w  combatant(a6),d0
                bsr.w   GetEntityIndexForCombatant
                move.w  d7,d1
                addq.w  #3,d1
                andi.w  #3,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                moveq   #3,d0
                jsr     (Sleep).w       
                dbf     d7,@Loop
                
                sndCom  SFX_SPAWN
                move.w  combatant(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     397             ; "{CLEAR}{NAME} appeared!{D3}"
                clsTxt
                unlk    a6
                movem.l (sp)+,d7-a0
                rts

    ; End of function SpawnEnemyWithCamera


; =============== S U B R O U T I N E =======================================

; Unused in standard build

ClearDeadCombatantsListLength:
                
            if (STANDARD_BUILD=0)
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                rts
            endif

    ; End of function ClearDeadCombatantsListLength


; =============== S U B R O U T I N E =======================================


HandleKilledCombatants:
                
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
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                cmpi.b  #GFX_MAX_SPRITES_TO_LOAD,((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                blt.s   @Continue
                jsr     (WaitForVInt).w
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
@Continue:
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                move.b  #$FF,(a1,d0.w)
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

    ; End of function HandleKilledCombatants


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

HandleBattleEntityControlPlayerInput:
                
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
                beq.w   loc_246EC
                
                ; Pressed B
                movem.w d2-d3,-(sp)
                move.w  ((word_FFB08E-$1000000)).w,d3
                move.w  ((word_FFB090-$1000000)).w,d4
                lea     ((MOVE_COSTS_TABLE-$1000000)).w,a5
                moveq   #1,d0
                bsr.s   UpdateTargetsListForCombatant
                moveq   #$1E,d0
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                jsr     j_PopulateTotalMovecostsAndMovableGridArrays
                clr.w   d0
                jsr     UpdateTargetsListForCombatant(pc)
                movem.w (sp)+,d0-d1
                jsr     j_BuildCancelMoveString
                move.w  combatant(a6),d0
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a0
                bsr.w   MoveBattleEntityByMoveString
                move.w  #-1,((CURRENT_BATTLEACTION-$1000000)).w
                moveq   #-1,d0
                bra.w   loc_25188
loc_246EC:
                
                clr.w   d0
                moveq   #COMBATANTS_ALL_COUNTER,d7
loc_246F0:
                
                cmp.w   combatant(a6),d0 ; check if chosen position is inhabited already (for debug mode B-button trick)
                beq.w   loc_24718
                jsr     j_GetCombatantX
                cmp.w   d1,d2
                bne.w   loc_24718
                jsr     j_GetCombatantY
                cmp.w   d1,d3
                bne.w   loc_24718
                sndCom  SFX_REFUSAL
                beq.w   @Start
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
                jsr     j_SetCombatantX
                move.w  d3,d1
                jsr     j_SetCombatantY
                clr.w   d1
loc_24746:
                
                move.w  d1,-(sp)
                jsr     ClearPulsatingBlocksRange
                jsr     (WaitForVInt).w
                move.w  combatant(a6),d0
                bsr.w   GetEntityPositionAfterApplyingFacing
                jsr     (CheckChestItem).w
                move.w  d2,((CHEST_CONTENTS-$1000000)).w
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                move.w  #$FFFF,d0
                andi.b  #ITEM_NOTHING,d0
                cmp.w   d0,d2
            else
                cmpi.w  #$FFFF,d2
            endif
                bne.s   loc_2476C       ; if d2 != FFFF, then there is an item
                moveq   #MENU_BATTLE_WITH_STAY,d2 ; Battle menu with STAY option
                bra.s   loc_2476E
loc_2476C:
                
                moveq   #MENU_BATTLE_WITH_SEARCH,d2 ; Battle menu with SEARCH option
loc_2476E:
                
                move.w  combatant(a6),d0
                jsr     j_CreateAttackRangeGrid
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
                bne.w   @CheckChoice_Attack
                move.w  combatant(a6),d0
                move.w  ((word_FFB08E-$1000000)).w,d1
                jsr     j_SetCombatantX
                move.w  ((word_FFB090-$1000000)).w,d1
                jsr     j_SetCombatantY
                move.w  combatant(a6),d0
                jsr     j_GenerateTargetRangeLists
                bsr.w   CreatePulsatingBlocksRange
                bra.w   @Start
@CheckChoice_Attack:
                
                tst.w   d0
                bne.w   @CheckChoice_Magic
                move.w  combatant(a6),d0
                jsr     j_CreateAttackRangeGrid
                bsr.w   CreatePulsatingBlocksRange
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   @HaveTarget_Attack
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_24746
@HaveTarget_Attack:
                
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   loc_2482A
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,d2
                jsr     j_GetCombatantY
                move.w  d1,d3
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24746
loc_2482A:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                clr.w   ((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   loc_25188
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
                bra.w   loc_24746
@HasSpell:
                
                clr.w   d1
@ChooseSpell:
                
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
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,d4
                move.w  combatant(a6),d0
                jsr     j_GetCurrentMp
                move.w  d1,d3
                move.w  d4,d1
                jsr     j_GetSpellCost
                sub.w   d1,d3
                bge.w   @MeetsMPRequirement
                txt     437             ; "More MP needed.{W1}"
                clsTxt
                clr.w   d1
                bra.s   @ChooseSpell
@MeetsMPRequirement:
                
                move.w  d4,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                bsr.w   CreatePulsatingBlocksRange
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   @HaveTarget_Spell
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @ChooseSpell
@HaveTarget_Spell:
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((UNIT_CURSOR_RADIUS-$1000000)).w
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   loc_24952
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,((word_FFB094-$1000000)).w
                jsr     j_GetCombatantY
                move.w  d1,((word_FFB092-$1000000)).w
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   @ChooseSpell
loc_24952:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                move.w  #BATTLEACTION_CAST_SPELL,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   loc_25188

    ; End of function HandleBattleEntityControlPlayerInput


; =============== S U B R O U T I N E =======================================

;     createSpellRangeGridMaster ?


sub_24966:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  ((word_FFB18C-$1000000)).w,d1
                jsr     j_CreateSpellRangeGrid
                bsr.w   CreatePulsatingBlocksRange
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_24966


; START OF FUNCTION CHUNK FOR HandleBattleEntityControlPlayerInput

@CheckChoice_Item:
                
                cmpi.w  #2,d0
                bne.w   @CheckChoice_SearchStay
                move.w  combatant(a6),d0
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                tst.w   d2
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                ; Skip ahead to Give action if no item held
                beq.w   loc_24D6C
            else
                bne.w   @HasItem
                txt     438             ; "You have no item.{W1}"
                clsTxt
                bra.w   loc_24746
            endif
@HasItem:
                
                clr.w   d1
@ChooseItem:
                
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
@NoTargetInRange:
                
                move.w  combatant(a6),d0
                bsr.w   HideUnitCursor
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
                lea     loc_24ADC(pc), a0
                nop
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24A24
                bsr.w   ClearPulsatingBlocksRange
                bra.s   @ChooseItem
loc_24A24:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d1,((BATTLEACTION_ITEM_SLOT-$1000000)).w
                move.w  d0,d1
                move.w  combatant(a6),d0
                jsr     j_IsItemUsableByCombatant
                bcs.w   @ItemHasUse
                txt     439             ; "It has no effect.{W1}"
                clsTxt
                clr.w   d1
                bra.w   loc_24746
@ItemHasUse:
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateItemRangeGrid
                bsr.w   CreatePulsatingBlocksRange
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   @TargetInRange_Item
                txt     439             ; "It has no effect.{W1}"
                clsTxt
                clr.w   d1
                bra.w   @NoTargetInRange
@TargetInRange_Item:
                
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((UNIT_CURSOR_RADIUS-$1000000)).w
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   @ContinueWithTarget
                move.w  combatant(a6),d0
                jsr     j_GetCombatantX
                move.w  d1,((word_FFB094-$1000000)).w
                jsr     j_GetCombatantY
                move.w  d1,((word_FFB092-$1000000)).w
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24746
                bra.w   @NoTargetInRange
@ContinueWithTarget:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                move.w  #BATTLEACTION_USE_ITEM,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   loc_25188
loc_24ADC:
                
                movem.l d0-a6,-(sp)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  ((word_FFB18C-$1000000)).w,d1
                jsr     j_IsItemUsableByCombatant
                bcc.s   loc_24AFC
                jsr     j_CreateItemRangeGrid
                bsr.w   CreatePulsatingBlocksRange
                bra.s   loc_24B00
loc_24AFC:
                
                bsr.w   ClearPulsatingBlocksRange
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
                bra.w   @ChooseItem
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

; END OF FUNCTION CHUNK FOR HandleBattleEntityControlPlayerInput


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
                bra.s   @Goto_ExecuteMenu
@DefaultToUnarmed:
                
                moveq   #3,d1           ; set menu initial choice to down slot
@Goto_ExecuteMenu:
                
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
                if (STANDARD_BUILD&FIX_HIGINS_SPELL=1)
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
                jsr     j_CreateAttackRangeGrid
                bsr.w   CreatePulsatingBlocksRange
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                move.w  (sp)+,d1
                jsr     j_SetStatusEffects
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_24CF6


; START OF FUNCTION CHUNK FOR HandleBattleEntityControlPlayerInput

loc_24D64:
                
                cmpi.w  #1,d0
                bne.w   loc_24F6E
loc_24D6C:
                
                move.w  combatant(a6),d0
                bsr.w   HideUnitCursor
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
                jsr     sub_821C
                bsr.w   CreatePulsatingBlocksRange
                tst.w   ((TARGETS_LIST_LENGTH-$1000000)).w
                bne.w   loc_24DCC
                txt     435             ; "No opponent there.{W1}"
                clsTxt
                clr.w   d1
                bsr.w   ClearPulsatingBlocksRange
                bra.w   @ChooseItem
loc_24DCC:
                
                bsr.w   HideUnitCursor
                jsr     (WaitForVInt).w
                clr.w   d0
                lea     (InitStack).w,a0
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24DF0
                bsr.w   ClearPulsatingBlocksRange
                bra.w   @ChooseItem
loc_24DF0:
                
                move.w  d0,((BATTLEACTION_ITEM_SLOT-$1000000)).w
                move.w  d1,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                btst    #ITEMENTRY_BIT_EQUIPPED,d0
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
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                clsTxt
            endif
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_230E2
                cmpi.w  #$FFFF,d0
                bne.w   loc_24E4C
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  combatant(a6),d0
                bsr.w   sub_2322C
                moveq   #$FFFFFFFF,d1
                bra.w   loc_24D6C
loc_24E4C:
                
                move.w  d0,itemOrSpellIndex(a6)
                jsr     j_RemoveMiniStatusWindow
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                ; Always trade items
            else
                ; Trade items if target's inventory is full
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                beq.w   loc_24E8E
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                andi.w  #7,d1
                move.w  combatant(a6),d0
                jsr     j_RemoveItemBySlot
                move.w  itemOrSpellIndex(a6),d0
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                bclr    #ITEMENTRY_BIT_EQUIPPED,d1
                jsr     j_AddItem
                bra.w   loc_24F62
            endif
loc_24E8E:
                
                move.w  itemOrSpellIndex(a6),d0
                bsr.w   HideUnitCursor
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
                lea     (InitStack).w,a0
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24EDE
                bra.w   loc_24E26
loc_24EDE:
                
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w
                move.w  d1,((CURRENT_BATTLEACTION-$1000000)).w
                btst    #ITEMENTRY_BIT_EQUIPPED,d0
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
loc_24F62:
                
                move.w  #BATTLEACTION_STAY,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
                bra.w   loc_25188
loc_24F6E:
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
                bsr.w   HideUnitCursor
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
                lea     (InitStack).w,a0
                jsr     j_ExecuteItemMenu
                cmpi.w  #$FFFF,d0
                bne.w   loc_24FC2
@ReturnToMenu:  
                
                moveq   #$FFFFFFFF,d1
                bra.w   @ChooseItem
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
                bra.w   loc_24F6E
loc_24FFA:
                
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_25022
                move.w  combatant(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     443             ; "Are you sure?"
                clsTxt
                clr.w   d1
                bra.w   loc_24F6E
loc_25022:
                
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_YesNoChoiceBox
                clsTxt
                tst.w   d0
                bne.w   loc_24746
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
                bra.w   loc_24746
@CheckChoice_SearchStay:
                
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                move.w  #$FFFF,d0
                andi.b  #ITEM_NOTHING,d0
                cmp.w   ((CHEST_CONTENTS-$1000000)).w,d0
            else
                cmpi.w  #$FFFF,((CHEST_CONTENTS-$1000000)).w
            endif
                bne.w   loc_25088
                move.w  #BATTLEACTION_STAY,((CURRENT_BATTLEACTION-$1000000)).w
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
                move.w  ((CHEST_CONTENTS-$1000000)).w,d1
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
                move.w  #BATTLEACTION_TRAPPED_CHEST,((CURRENT_BATTLEACTION-$1000000)).w
                move.w  d0,((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w
                move.w  d0,itemOrSpellIndex(a6)
                sndCom  MUSIC_CORRUPTED_SAVE
                bsr.w   SpawnEnemySkipCamera
                bra.w   loc_25188
loc_250FC:
                
                move.w  ((CHEST_CONTENTS-$1000000)).w,d2
                cmpi.w  #ITEMINDEX_GOLDCHESTS_START,d2
                blt.s   @ItemChest
                bsr.w   GetChestGoldAmount
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                jsr     j_IncreaseGold
                sndCom  MUSIC_ITEM
                txt     414             ; "{NAME} found {#} gold{N}coins."
                bsr.w   FadeOut_WaitForP1Input
                bra.w   byte_2517C
@ItemChest:
                
                move.w  ((CHEST_CONTENTS-$1000000)).w,d1
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
                move.w  #BATTLEACTION_STAY,((CURRENT_BATTLEACTION-$1000000)).w
                clr.w   d0
loc_25188:
                
                move.w  d0,-(sp)
                move.w  combatant(a6),d0
                bsr.w   ClearEntityBlinkingFlag
                move.w  (sp)+,d0
                bsr.w   ClearPulsatingBlocksRange
                movem.l (sp)+,d1-a6
                rts

; END OF FUNCTION CHUNK FOR HandleBattleEntityControlPlayerInput

                modend

; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

BattlefieldMenuActions:
                
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
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
                
                jsr     j_GetCurrentHp
                tst.w   d1
                ble.w   loc_25226
                jsr     j_GetCombatantX
                cmp.w   d1,d2
                bne.w   loc_25226
                jsr     j_GetCombatantY
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
                jsr     j_RemoveLandEffectWindow
                jsr     j_RemoveMiniStatusWindow
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
                bne.w   @CheckMiniMap
                jsr     j_UpdateForce
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                beq.s   loc_25236
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                jsr     (CopyBytes).w   
@CreateMemberList_Loop:
                
                jsr     j_InitializeMemberListScreen
                tst.b   d0
                bmi.s   loc_25236
                jsr     j_BuildMemberScreen
                bra.s   @CreateMemberList_Loop
@CheckMiniMap:
                
                cmpi.w  #1,d0
                bne.w   @CheckOptions
                jsr     sub_10034
                bra.s   loc_25236
@CheckOptions:
                
                cmpi.w  #2,d0
                bne.w   @SuspendGame
                jsr     sub_10080
                bra.s   loc_25236
@SuspendGame:
                
                checkSavedByte #BATTLE_VERSUS_ALL_BOSSES, CURRENT_BATTLE
                beq.s   loc_25236
                txt     0               ; "The game will be suspended.{N}OK?"
                jsr     j_YesNoChoiceBox
                clsTxt
                tst.w   d0
                bmi.w   loc_25236
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
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.w   byte_252E6
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   byte_252F2      
byte_252E6:
                
                
                ; Not in Debug Mode
                sndCom  SOUND_COMMAND_FADE_OUT
                jsr     (FadeOutToBlack).w
                jmp     (WitchSuspend).w
byte_252F2:
                
                
                ; Finish Suspend
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
                bsr.w   CreatePulsatingBlocksRange
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
                bsr.w   ClearPulsatingBlocksRange
                move.w  combatant(a6),d0
                bsr.w   SetEntityBlinkingFlag
                move.w  ((CURRENT_BATTLEACTION-$1000000)).w,d0
                cmpi.w  #BATTLEACTION_STAY,d0
                beq.w   @EndTurn
                tst.w   d0
                bne.w   @Check_CastSpell
                move.w  combatant(a6),d0
                jsr     j_CreateAttackRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksRange
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   @ClearAction
@Check_CastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,d0
                bne.w   @Check_UseItem
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksRange
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   @ClearAction
@Check_UseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,d0
                bne.w   @Check_Explosion
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateItemRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksRange
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetItemDefAddress
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   @ClearAction
@Check_Explosion:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,d0
                bne.w   @Check_Laser
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                move.w  combatant(a6),d0
                jsr     j_CreateSpellRangeGrid
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksRange
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_RADIUS(a0),((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL_COPY-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   @ClearAction
@Check_Laser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,d0
                bne.w   @ClearAction
                move.w  combatant(a6),d0
                jsr     j_GetLaserFacing
                jsr     (WaitForViewScrollEnd).w
                bsr.w   CreatePulsatingBlocksRange
                clr.b   ((UNIT_CURSOR_RADIUS-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d0
                move.w  d0,itemOrSpellIndex(a6)
                bsr.w   sub_2548E
                clr.w   d0
                bra.w   *+4
@ClearAction:
                
                jsr     ClearPulsatingBlocksRange
@EndTurn:
                
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
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).l
                move.w  itemOrSpellIndex(a6),d0
                bsr.w   sub_2322C
                bsr.w   WaitForUnitCursor
                jsr     (WaitForViewScrollEnd).w
                move.b  #1,((IS_TARGETING-$1000000)).w
                jsr     j_CreateBattlefieldMiniStatusWindow
                moveq   #15,d0
                jsr     (Sleep).w       
                sndCom  SFX_VALIDATION
                rts

    ; End of function sub_2548E

