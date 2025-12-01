
; ASM FILE code\gameflow\battle\ai\command\heal.asm :
; 0xE3EE..0xE78C : AI command : Heal

; =============== S U B R O U T I N E =======================================

; In: d0.b = caster index
;     d1.w = command parameter (values of 0-2), unused
; 
; Out: d1.w = -1 if command failed

parameter = -5
caster = -4
itemSlot = -3
itemEntry = -2
spellEntry = -1

aiCommand_Heal:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                move.b  d0,caster(a6)
                move.b  d1,parameter(a6)    ; unused
                bsr.w   IsCombatantConfused      
                tst.b   d1
                beq.s   @Continue
                bra.w   @Exit               ; exit if combatant is afflicted with Muddle 2
@Continue:
                
                clr.w   d1
                move.b  parameter(a6),d1
                move.b  #ITEM_NOTHING,itemEntry(a6)     ; used later to determine whether a spell or item is being used
                move.b  #SPELL_NOTHING,spellEntry(a6)   ; if itemEntry != ITEM_NOTHING then an item is being used, otherwise we assume it's a spell
                
                ; Check Healing Rain
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextUsableHealingItem
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @CheckHealingSpell
                
                cmpi.b  #ITEM_HEALING_RAIN,d1   ; HARDCODED item index
                bne.s   @CheckHealingSpell
                
                ; Caster is holding a Healing Rain
                move.b  d1,itemEntry(a6)
                move.b  d2,itemSlot(a6)
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),spellEntry(a6)
                
                ; Is the first enemy (usually the boss) at less than 50% HP?
                move.w  #COMBATANT_ENEMIES_START,d0
                bsr.w   IsCombatantAtLessThanHalfHp
                bcc.s   @UseItem
                
                move.b  #ITEM_NOTHING,itemEntry(a6)
                move.b  #SPELL_NOTHING,spellEntry(a6)
                bra.w   @CheckHealingSpell  ; branch to the healing spell path if not
; ---------------------------------------------------------------------------

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
; ---------------------------------------------------------------------------

@CheckHealingSpell:
                
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextHealingSpell
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   @CheckHealingItem   ; branch to non-Healing Rain healing item path if caster does not know a healing spell
                
                ; Get caster's current MP -> d1.w, then compare to hardcoded required amount
                move.b  d1,spellEntry(a6)
                move.w  d1,d2
                andi.w  #SPELLENTRY_MASK_INDEX,d2
                bsr.w   GetCurrentMp
                
                ; Check Heal spell required MP amount
                cmpi.w  #SPELL_HEAL,d2              ; HARDCODED spell index
                bne.s   @CheckAura      
                cmpi.w  #ENEMYAI_MIN_MP_HEAL1,d1    ; HARDCODED required MP amount
                bge.s   @Goto_CastSpell             ; continue if at least 3 MP is available to cast Heal (any level)
                
                bra.w   @CheckHealingItem           ; otherwise, branch to non-Healing Rain healing item path
                
                bra.s   @CheckAura                  ; unreachable code
@Goto_CastSpell:
                
                bra.w   @CastSpell
@CheckAura:
                ; Same as above, but for Aura spell
                cmpi.w  #SPELL_AURA,d2              ; HARDCODED spell index
                bne.s   @CheckHealingItem
                cmpi.w  #ENEMYAI_MIN_MP_AURA1,d1    ; HARDCODED required MP amount
                bge.s   @Goto_CastSpell_0           ; continue if at least 7 MP is available to cast Aura (any level)
                
                bra.w   @CheckHealingItem           ; otherwise, branch to non-Healing Rain healing item path
                
                bra.s   @CheckHealingItem           ; unreachable code
@Goto_CastSpell_0:
                
                bra.w   @CastSpell
; ---------------------------------------------------------------------------

@CheckHealingItem:
                ; If no spell healing occurred, then check for healing items
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextUsableHealingItem
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   @CheckItemHasUseSpell   ; continue if a usuable healing item is found
                bra.w   @Exit
@CheckItemHasUseSpell:
                
                move.b  d1,itemEntry(a6)
                move.b  d2,itemSlot(a6)
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),spellEntry(a6)
@CastSpell:
                ; Find target for healing (spell or item)
                move.b  caster(a6),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @AllyCaster
                
                bsr.w   BuildTargetsArrayWithEnemies
                bra.s   @PopulateReachableTargetsList
@AllyCaster:
                
                bsr.w   BuildTargetsArrayWithAllies
@PopulateReachableTargetsList:
                
                ; Populate list including targets in range of the spell
                ;
                ; Because this doesn't look at the range for all spell levels,
                ;   if the range of higher level spells is less than lower levels,
                ;   then those targets in range of a lower level spell will be excluded from the search
                move.w  #-1,d3
                bsr.w   UpdateOccupiedByAlliesTerrain   ; set flags
                move.b  caster(a6),d0
                bsr.w   InitializeMovementArrays
                bsr.w   BuildMovementArrays
                clr.w   d3
                bsr.w   UpdateOccupiedByAlliesTerrain   ; clear flags
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0 
                clr.w   d3
                move.b  caster(a6),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyTargets   
                
                clr.w   d0              ; if targeting allies, highest priority target to heal is the Party Leader
                move.w  #COMBATANT_ALLIES_COUNTER,d4
                bra.s   @MakeTargetsList_Loop
@EnemyTargets:
                
                move.w  #COMBATANT_ENEMIES_START,d0 ; if healer is an enemy, highest priority target to heal is the first enemy
                move.w  #COMBATANT_ENEMIES_COUNTER,d4
@MakeTargetsList_Loop:
                
                bsr.w   GetCurrentHp
                tst.w   d1
                bne.s   @TargetIsAlive
                bra.w   @NextTarget     ; skip if target is dead
@TargetIsAlive:
                
                bsr.w   DoesCombatantRequireHealing
                bcc.s   @PopulateList   
                bra.w   @NextTarget     ; skip if target does not require healing
@PopulateList:
                
                move.b  d0,(a0,d3.w)    ; add combatant to list of targets requiring healing
                addi.w  #1,d3
@NextTarget:
                
                addi.w  #1,d0
                dbf     d4,@MakeTargetsList_Loop
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a1
                move.w  d3,(a1)
                tst.b   d3
                bne.s   @GetTargetsPriority
                bra.w   @Exit           ; exit if no targets were found that required healing
@GetTargetsPriority:
                
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1 
                                                        ; a1 = list of either a 0 or 1 for each target in the AOE (1 if target has AI #14 or #15, and 0 otherwise)
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST-$1000000)).w,a3
                clr.w   d4
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a4
                move.w  #0,(a4)
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a0,d4.w),d0    ; d0.b = index of target needing healing that is the center of the AOE (target on which the heal spell is actually cast)
                clr.w   d1
                move.b  spellEntry(a6),d1
                bsr.w   PopulateTargetsList
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
                cmpi.w  #MOVETYPES_NUMBER,d6
                bne.s   @CalculatePriority ; if not the highest priority
                
                ; Mark the target as a highest priority target
                move.b  #1,(a1,d4.w)
                addq.w  #1,(a4)
@CalculatePriority:
                
                ; Add the target priority to the total priority
                
                ; Total priority = sum of priorities for each healed by the AOE
                ;   of the healing spell centered on combatant (a0,d4.w)
                add.w   d6,d2
                
                ; Base value of +4 is added for each target
                ;
                ; This forces a slightly higher prioritization for more targets over higher priority targets
                addi.w  #4,d2
                addi.w  #1,d7
                subq.w  #1,d5
                bne.s   @CheckHighestPriority_Loop ; check the next target in the AOE
@RecordTotalPriority:
                
                move.b  d2,(a2,d4.w)
                addi.w  #1,d4
                subq.w  #1,d3
                bne.s   @GetTargetsPriority_Loop ; repeat for all targets in AOE
                
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
                move.w  (a0),d5         ; d5.w = number of potential targets -- counts down to zero
                clr.w   d6
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
@FindPositionForTargets_Loop:
                
                cmpi.b  #ITEM_NOTHING,itemEntry(a6) ; loop to cycle through all potential targets, starting with the highest priority, and choosing the first one in range
                beq.s   @CheckSpellLevel
                bra.w   @CheckItemEntry
; ---------------------------------------------------------------------------

@CheckSpellLevel:
                
                move.b  (a0,d6.w),d0    ; d0.b = target index
                move.b  caster(a6),d1
                move.b  spellEntry(a6),d4
                bsr.w   DetermineHealingSpellLevel
                cmpi.b  #-1,d2
                bne.s   @AdjustSpellLevel
                bra.w   @FindPositionForNextTarget ; if no healing needed
@AdjustSpellLevel:
                
                tst.b   d2
                bne.s   @UpdateSpellEntry ; skip if not a level 1 spell
                
                cmp.b   d0,d1
                beq.s   @UpdateSpellEntry ; skip if caster is the target
                
                ; Otherwise, do an additional MP check
                move.b  caster(a6),d0
                bsr.w   GetCurrentMp
                cmpi.b  #ENEMYAI_MIN_MP_HEAL3,d1
                blt.s   @UpdateSpellEntry ; skip if caster has less than 11 MP
                
                move.b  spellEntry(a6),d0
                lsr.b   #6,d0
                andi.b  #SPELLENTRY_LOWERMASK_LV,d0
                cmpi.b  #SPELLENTRY_LV3,d0
                blt.s   @UpdateSpellEntry ; skip if best spell available is level 1 or 2
                
                ; Use the level 2 version of the spell if level 3+ is available but level 1 is selected to cast on a target other than the caster
                move.b  #SPELLENTRY_LV2,d2
@UpdateSpellEntry:
                
                move.b  spellEntry(a6),d0
                lsl.b   #6,d2
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                or.b    d2,d0           ; combine d0 and d2 to create the spell selected by the caster with the appropriate spell level
                move.b  d0,spellEntry(a6)
; ---------------------------------------------------------------------------

@CheckItemEntry:
                
                clr.w   d0
                move.b  (a0,d6.w),d0        ; d0.b = target index
                cmpi.b  #ITEM_NOTHING,itemEntry(a6)
                beq.s   @CheckSpellRange    ; items take precedence over spells for usage
                
                ; Check item range if available
                clr.w   d1
                move.b  itemEntry(a6),d1
                bsr.w   GetItemRange
                bra.s   @GetPosition
@CheckSpellRange:
                ; Otherwise, check spell range
                clr.w   d1
                move.b  spellEntry(a6),d1
                bsr.w   GetSpellRange
@GetPosition:
                
                bsr.w   GetCombatantY   ; In: d0.w = heal target combatant index; Out: d1.w = Y position
                move.w  d1,d2
                bsr.w   GetCombatantX   ; In: d0.w = heal target combatant index; Out: d1.w = X position
                bsr.w   DetermineAttackPosition
                cmpi.b  #-1,d1
                beq.s   @FindPositionForNextTarget ; if no spell or item cast position is available
                bra.w   @LoadBattleactionData
@FindPositionForNextTarget:
                
                addi.w  #1,d6           ; select the next potential target
                subq.w  #1,d5           ; d5.w = number of potential targets -- counts down to zero
                bne.w   @FindPositionForTargets_Loop
                bra.w   @Exit
; ---------------------------------------------------------------------------

@LoadBattleactionData:
                
                ; At this point:
                ;
                ;   (a0,d6.w) = target index
                ;   spellEntry(a6) = the spell to cast (or the spell from the item)
                ;   itemEntry(a6) = the item to use
                ;   itemSlot(a6) = item slot to use (if using an item)
                ;   combatant(a6) = caster index
                ;   d1 = chosen X pos for caster to move to
                ;   d2 = chosen Y pos for caster to move to
                ;   d6 = index in the list of targets a0; d6 starts at zero and ignores invalid targets
                
                move.b  d1,d0           ; d1 = chosen X pos
                move.b  d2,d1           ; d2 = chosen Y pos
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4400_LOADING_SPACE).l,a3
                bsr.w   BuildMoveStringForAi
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
@Exit:
                
                move.w  #-1,d1
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts
@Done:
                
                clr.w   d1
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function aiCommand_Heal

