
; ASM FILE code\gameflow\battle\ai\aicommandheal.asm :
; 0xE3EE..0xE78C : AI command : Heal

; =============== S U B R O U T I N E =======================================

; In: d0.b = caster index
;     d1.w = command parameter (values of 0-2), unused
; 
; Out: d1.w = -1 if command failed

option = -5
caster = -4
itemSlot = -3
itemEntry = -2
spellEntry = -1

ExecuteAiCommand_Heal:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                move.b  d0,caster(a6)
                move.b  d1,option(a6)   ; unused
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   @Continue
                bra.w   @Skip           ; skip this function if combatant is inflicted with muddle 2
@Continue:
                
                clr.w   d1
                move.b  option(a6),d1
                move.b  #ITEM_NOTHING,itemEntry(a6) ; used later to determine whether a spell or item is being used; if -2(a6) = ITEM_NOTHING then a spell is being used, otherwise an item
                move.b  #SPELL_NOTHING,spellEntry(a6)
                
                ; Check healing item
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextUsableHealingItem
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @CheckHealingSpell
                cmpi.b  #ITEM_HEALING_RAIN,d1
                bne.s   @CheckHealingSpell
                move.b  d1,itemEntry(a6) ; item is Healing Rain
                move.b  d2,itemSlot(a6)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),spellEntry(a6)
                move.w  #COMBATANT_ENEMIES_START,d0
                bsr.w   IsCombatantAtLessThanHalfHp
                bcc.s   @UseItem        ; first enemy has less than half HP, and we have a healing rain, so use it
                move.b  #ITEM_NOTHING,itemEntry(a6)
                move.b  #SPELL_NOTHING,spellEntry(a6)
                bra.w   @CheckHealingSpell
@UseItem:
                
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a1
                move.w  #BATTLEACTION_USE_ITEM,(a1)
                clr.w   d0
                move.b  itemSlot(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_SLOT(a1)
                clr.w   d0
                move.b  caster(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a1)
                clr.w   d1
                move.b  itemEntry(a6),d1
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a1
                move.w  #TERMINATOR_BYTE,(a1)
                bra.w   @Done
@CheckHealingSpell:
                
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextHealingSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   @CheckHealingItem
                move.b  d1,spellEntry(a6)
                move.w  d1,d2
                andi.w  #SPELLENTRY_MASK_INDEX,d2
                bsr.w   GetCurrentMp    ; d1 = current MP
                cmpi.w  #SPELL_HEAL,d2  ; HARDCODED spell index
                bne.s   @CheckAura      
                cmpi.w  #ENEMYAI_MIN_MP_HEAL1,d1 ; HARDCODED required MP amount
                bge.s   @Goto_CastSpell ; if at least 3 MP is available to cast Heal (any level)
                bra.w   @CheckHealingItem ; if 3 MP is not available
                bra.s   @CheckAura      
@Goto_CastSpell:
                
                bra.w   @CastSpell
@CheckAura:
                
                cmpi.w  #SPELL_AURA,d2  ; HARDCODED spell index
                bne.s   @CheckHealingItem
                cmpi.w  #ENEMYAI_MIN_MP_AURA1,d1 ; HARDCODED required MP amount
                bge.s   @Goto_CastSpell_0 ; if at least 7 MP is available to cast Aura (any level)
                bra.w   @CheckHealingItem ; if 7 MP is not available
                bra.s   @CheckHealingItem
@Goto_CastSpell_0:
                
                bra.w   @CastSpell
                                        ; if no spell healing occurred, then check for healing items
@CheckHealingItem:
                
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextUsableHealingItem
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   @CheckItemHasUseSpell
                bra.w   @Skip
                                        ; healing item is found
@CheckItemHasUseSpell:
                
                move.b  d1,itemEntry(a6)
                move.b  d2,itemSlot(a6)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),spellEntry(a6)
                                        ; find target for healing (spell or item)
@CastSpell:
                
                move.b  caster(a6),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @AllyCaster
                bsr.w   PopulateTargetsArrayWithEnemies
                bra.s   @UpdateTargetsList
@AllyCaster:
                
                bsr.w   PopulateTargetsArrayWithAllies
@UpdateTargetsList:
                
                move.w  #-1,d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                move.b  caster(a6),d0
                bsr.w   InitializeMovementArrays
                bsr.w   PopulateMovementArrays
                clr.w   d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies ; Update target list to only include targets in range of the spell.
                                        ; Because this doesn't look at the range for all spell levels,
                                        ;  if the range of higher level spells is less than lower levels,
                                        ;  then those targets in range of a lower level spell will be excluded from the search.
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0 
                                                        ; a0 = list of targets needing healing
                clr.w   d3
                move.b  caster(a6),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyTargets   
                
                clr.w   d0              ; if ally (aka force member), highest priority target to heal is Bowie
                move.w  #COMBATANT_ALLIES_COUNTER,d4 ; check the first 30 force members whether they need healing (this is only for when AI controls the force member)
                bra.s   @MakeTargetsList_Loop
@EnemyTargets:
                
                move.w  #COMBATANT_ENEMIES_START,d0 ; if enemy is healer, highest priority target to heal is the first enemy combatant in the battle
                move.w  #COMBATANT_ENEMIES_COUNTER,d4 ; check the first 32 monsters in a battle
@MakeTargetsList_Loop:
                
                bsr.w   GetCurrentHp    ; d1 = current HP
                tst.w   d1
                bne.s   @TargetIsAlive
                bra.w   @NextTarget     ; if target is dead
@TargetIsAlive:
                
                bsr.w   DoesCombatantRequireHealing
                bcc.s   @PopulateList   
                bra.w   @NextTarget     
@PopulateList:
                
                move.b  d0,(a0,d3.w)    ; add combatant to list of targets needing healing
                addi.w  #1,d3
@NextTarget:
                
                addi.w  #1,d0           ; check the next possible target for healing
                dbf     d4,@MakeTargetsList_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a1
                move.w  d3,(a1)
                tst.b   d3
                bne.s   @GetTargetsPriority
                bra.w   @Skip           ; if no targets were found that needed healing
@GetTargetsPriority:
                
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1 
                                                        ; List of either a 0 or 1 for each target in the AOE (1 if target has AI #14 or #15, and 0 otherwise).
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST-$1000000)).w,a3
                clr.w   d4
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a4
                move.w  #0,(a4)
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a0,d4.w),d0    ; combatant offset of target needing healing that is the center of the AOE (target on which the heal spell is actually cast)
                clr.w   d1
                move.b  spellEntry(a6),d1
                bsr.w   PopulateTargetableGrid
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d5
                tst.w   d5
                bne.s   @Continue_0
                bra.w   @RecordTotalPriority ; if no targets are found in AOE
@Continue_0:
                
                clr.w   d7
                clr.w   d2
                move.b  #0,(a1,d4.w)
@CheckHighestPriority_Loop:
                
                move.b  (a3,d7.w),d0
                bsr.w   CalculateHealTargetPriority
                cmpi.w  #13,d6
                bne.s   @CalculatePriority ; if not the highest priority
                
                ; Mark the target as a highest priority target
                move.b  #1,(a1,d4.w)
                addq.w  #1,(a4)
@CalculatePriority:
                
                add.w   d6,d2           ; Add the target priority to the total priority.
                                        ; Total priority = sum of priorities for each healed
                                        ;  by the AOE of the healing spell centered on
                                        ;  combatant (a0,d4.w).
                addi.w  #4,d2           ; Base value of +4 is added for each target.
                                        ; This forces a slightly higher prioritization
                                        ;  for more targets over higher priority targets.
                addi.w  #1,d7
                subq.w  #1,d5
                bne.s   @CheckHighestPriority_Loop ; Check the next target in the AOE.
@RecordTotalPriority:
                
                move.b  d2,(a2,d4.w)
                addi.w  #1,d4
                subq.w  #1,d3
                bne.s   @GetTargetsPriority_Loop ; Repeat for all targets in AOE.
                
                bra.w   *+4
                move.w  ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,d1
                cmpi.w  #1,d1
                bgt.s   @SortTargets
                bra.w   @FindPositionForTargets
@SortTargets:
                
                subq.w  #2,d1
                clr.w   d2
                move.b  #0,d2
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
@SortTargets_OuterLoop:
                
                tst.b   d2
                bpl.s   @Continue_1
                bra.w   @FindPositionForTargets
@Continue_1:
                
                move.b  #-1,d2
                clr.w   d3
@SortTargets_InnerLoop:
                
                move.b  1(a1,d3.w),d4
                cmp.b   (a1,d3.w),d4
                ble.s   @Next
                move.b  1(a1,d3.w),d4
                move.b  (a1,d3.w),1(a1,d3.w)
                move.b  d4,(a1,d3.w)
                move.b  1(a0,d3.w),d4
                move.b  (a0,d3.w),1(a0,d3.w)
                move.b  d4,(a0,d3.w)
                move.w  d3,d2
@Next:
                
                tst.w   d1
                beq.s   @LoopAround
                addq.w  #1,d3
                subq.w  #1,d1
                bra.s   @SortTargets_InnerLoop
@LoopAround:
                
                move.w  d2,d1
                bra.s   @SortTargets_OuterLoop
@FindPositionForTargets:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5         ; d5 = number of potential targets -- counts down to zero
                clr.w   d6
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
@FindPositionForTargets_Loop:
                
                cmpi.b  #ITEM_NOTHING,itemEntry(a6) ; loop to cycle through all potential targets, starting with the highest priority, and choosing the first one in range
                beq.s   @CheckSpellLevel
                bra.w   @CheckItemEntry
@CheckSpellLevel:
                
                move.b  (a0,d6.w),d0    ; d0 = target index
                move.b  caster(a6),d1
                move.b  spellEntry(a6),d4
                bsr.w   DetermineHealingSpellLevel
                cmpi.b  #-1,d2
                bne.s   @AdjustSpellLevel
                bra.w   @FindPositionForNextTarget ; if no healing needed
@AdjustSpellLevel:
                
                tst.b   d2              ; check spell level
                bne.s   @UpdateSpellEntry ; if not lv 1 spell
                cmp.b   d0,d1
                beq.s   @UpdateSpellEntry ; if the target is the spell user
                
                ; If is a lv 1 spell and the target is not the spell user, then do an additional MP check
                move.b  caster(a6),d0
                bsr.w   GetCurrentMp    ; d1 = current MP
                cmpi.b  #ENEMYAI_MIN_MP_HEAL3,d1
                blt.s   @UpdateSpellEntry ; if less than 11 MP
                move.b  spellEntry(a6),d0
                lsr.b   #6,d0
                andi.b  #SPELLENTRY_LOWERMASK_LV,d0
                cmpi.b  #SPELLENTRY_LV3,d0
                blt.s   @UpdateSpellEntry ; if best spell available is lv 1 or lv 2
                move.b  #SPELLENTRY_LV2,d2 ; if more than 11 MP and a lv 3+ spell is available but lv 1 is selected to cast on someone other than the caster, then use the lv 2 version of the spell instead
@UpdateSpellEntry:
                
                move.b  spellEntry(a6),d0
                lsl.b   #6,d2
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                or.b    d2,d0           ; combine d0 and d2 to create the spell selected by the caster with the appropriate spell level
                move.b  d0,spellEntry(a6)
@CheckItemEntry:
                
                clr.w   d0
                move.b  (a0,d6.w),d0    ; d0 = target index
                cmpi.b  #ITEM_NOTHING,itemEntry(a6)
                beq.s   @CheckSpellRange ; Healing items take precedence over healing spells for usage
                
                ; Check item range
                clr.w   d1
                move.b  itemEntry(a6),d1
                bsr.w   GetItemRange
                bra.s   @GetPosition
@CheckSpellRange:
                
                clr.w   d1              ; If no healing items, check the healing spell instead
                move.b  spellEntry(a6),d1
                bsr.w   GetSpellRange
@GetPosition:
                
                bsr.w   GetCombatantY   ; In: d0 = heal target combatant index; Out: d1 = y position
                move.w  d1,d2
                bsr.w   GetCombatantX   ; In: d0 = heal target combatant index; Out: d1 = x position
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                beq.s   @FindPositionForNextTarget ; if no spell or item cast position is available
                bra.w   @LoadBattleactionData
@FindPositionForNextTarget:
                
                addi.w  #1,d6           ; select the next potential target
                subq.w  #1,d5           ; d5 = number of potential targets -- counts down to zero
                bne.w   @FindPositionForTargets_Loop
                bra.w   @Skip
@LoadBattleactionData:
                
                
                ; At this point:
                ;
                ;     (a0,d6.w) = combatant index for the spell target
                ;     spellEntry(a6) = the spell to cast (or the spell from the item)
                ;     itemEntry(a6) = the item to use (is $7F if no item)
                ;     itemSlot(a6) = item slot to use (if use item)
                ;     combatant(a6) = caster
                ;     d1 = chosen X pos for caster to move to
                ;     d2 = chosen Y pos for caster to move to
                ;     d6 = the index of the target in the list of targets A0; d6 starts at zero and ignores invalid targets
                
                move.b  d1,d0           ; d1 = chosen x pos
                move.b  d2,d1           ; d2 = chosen y pos
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4400_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a1 ; unnecessary
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a1
                cmpi.b  #ITEM_NOTHING,itemEntry(a6)
                bne.s   @LoadUseItemData
                
                ; Load cast spell data
                move.w  #BATTLEACTION_CAST_SPELL,(a1)
                clr.w   d0
                move.b  spellEntry(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
                clr.w   d0
                move.b  (a0,d6.w),d0
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a1)
                bra.s   @Goto_Done
@LoadUseItemData:
                
                move.w  #BATTLEACTION_USE_ITEM,(a1)
                clr.w   d0
                move.b  itemSlot(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_SLOT(a1)
                clr.w   d0
                move.b  (a0,d6.w),d0
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a1)
                clr.w   d0
                move.b  caster(a6),d0
                move.b  itemSlot(a6),d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
@Goto_Done:
                
                bra.w   @Done
@Skip:
                
                move.w  #-1,d1
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts
@Done:
                
                clr.w   d1
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ExecuteAiCommand_Heal

