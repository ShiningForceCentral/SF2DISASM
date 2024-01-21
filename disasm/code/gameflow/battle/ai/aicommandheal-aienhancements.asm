
; ASM FILE code\gameflow\battle\aicommandheal-aienhancements.asm :
; Enhanced healing AI command

; =============== S U B R O U T I N E =======================================

; In: d0.b = caster index
;     d1.w = command parameter (refer to enum AiCommand_Params)
;
; Out: d1.w = $FFFF if command failed

optimalSpell = -6
healingThresholds = -5
caster = -4
itemSlot = -3
itemEntry = -2
spellEntry = -1

ExecuteAiCommand_Heal:
                movem.l d0/d2-a4,-(sp)
                link    a6,#-6
                move.b  d0,caster(a6)
                move.b  d1,healingThresholds(a6)
                bsr.w   CheckMuddled2   ; returns zero bit clear if true
                bne.w   @Skip           ; skip this function if combatant is inflicted with muddle 2
                
                ; HEALING RAIN AND AURA 4 SECTION
                
                move.b  #ITEM_NOTHING,itemEntry(a6)
                move.b  #SPELL_NOTHING,spellEntry(a6)
                
                ; Check if the first enemy is at less than 50% HP
                move.w  #COMBATANT_ENEMIES_START,d0
                bsr.w   IsCombatantAtLessThanHalfHp
                blo.s   @CheckHealingSpell  ; if the first monster is at 50% or more HP then skip this section
                
                ; Aura 4 check --> If the first monster is at less than 50% HP and the caster has Aura 4, cast it
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextHealingSpell ; In: D0 = combatant, D3 = starting spell slot (0-3)
                                            ; Out: D1 = spell entry, D2 = spell slot (0-3)
                cmpi.b  #SPELL_AURA|SPELL_LV4,d1        ; HARDCODED spell entry
                bne.s   @CheckHealingRain
                
                ; Check to ensure the user has sufficient MP to cast Aura 4
                move.w  d1,d7               ; store spell entry
                bsr.w   GetSpellCost        ; In: d1 = spell entry; Out: d1 = MP cost
                move.w  d1,d2
                bsr.w   GetCurrentMP        ; In: d0 = combatant offset; Out: d1 = current MP
                cmp.w   d1,d2            
                bgt.s   @CheckHealingRain   ; if MP cost is greater than current MP, then check for Healing Rain
                move.b  d7,spellEntry(a6)   ; if sufficient MP, set Aura 4 as the spell to cast
                bra.s   @GetCasterPosition
@CheckHealingRain:

                ; Healing Rain check --> If the first monster is at less than 50% HP and the caster has a Healing Rain, use it
                clr.w   d3
                bsr.w   GetNextUsableHealingItem    ; In: D0 = combatant, D3 = starting item slot
                                                    ; Out: D1 = item entry, D2 = item slot
                cmpi.b  #ITEM_HEALING_RAIN,d1
                bne.s   @CheckHealingSpell
                move.b  d1,itemEntry(a6)            ; enemy 0 has less than half HP, and we have a healing rain, so use it
                move.b  d2,itemSlot(a6)
                bsr.w   GetItemDefAddress           ; Get pointer to item D1's definition in ROM -> A0
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),spellEntry(a6)
@GetCasterPosition:
                
                ; NEW SECTION FOR HEALING RAIN (15 words)
                ;
                ; The following has already been updated from the prior section
                ;  spellEntry(a6)= the spell to cast (or the spell from the item)
                ;  itemEntry(a6)= the item to use (is $7F if no item)
                ;  itemSlot(a6) = item slot to use (if use item)
                ;  caster(a6) = caster
                ;
                ; The following is updated below
                ;  d1 = chosen x pos for monster to move to
                ;  d2 = chosen y pos for monster to move to
                clr.w   d0
                move.b  caster(a6),d0
                bsr.w   GetCombatantY   ; In: d0 = character index; Out: d1 = Y position
                move.w  d1,d2
                bsr.w   GetCombatantX
                
                ; The regular code builds a list of possible targets at a0, with d6 being the offset for the target.
                ; Below a list of a single byte containing the caster's combatant offset is created at a0, with d6 = 0 so that it is selected.
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                move.b  d0,(a0)
                move.w  #0,d6
                bra.w   @LoadBattleactionData   ; Branch to the processing loop after an item or spell would normally be selected.
@CheckHealingSpell:
                
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextHealingSpell ; In: D0 = combatant, D3 = starting spell slot (0-3)
                                            ; Out: D1 = spell entry, D2 = spell slot (0-3)
                cmpi.w  #SPELL_NOTHING,d1 
                beq.s   @CheckHealingItem
                move.b  d1,spellEntry(a6)           ; store the spell index for later use
                move.w  d1,d2        
                andi.w  #SPELLENTRY_MASK_INDEX,d2   ; d2 now contains byte matches for spell indexes, minus the level (so Blaze rather than specifically Blaze 1 or Blaze 4)
                bsr.w   GetCurrentMP                ; d1 = current MP
                
                ; There used to be a bunch of checks for MP here since the original MP check code was broken.
                ; Now that the MP check code is fixed, the additional checks here can be removed.
                bra.s   @CastSpell
@CheckHealingItem:
                
                ; If no spell healing occurred, then check for healing items
                move.b  caster(a6),d0
                clr.w   d3
                bsr.w   GetNextUsableHealingItem ; In: D0 = combatant, D3 = starting item slot
                                                 ; Out: D1 = item entry, D2 = item slot
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   @Skip               ; if no spell healing and no item healing, skip this function
                move.b  d1,itemEntry(a6)
                move.b  d2,itemSlot(a6)
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),spellEntry(a6)
@CastSpell:
                
                move.b  caster(a6),d0
                bpl.s   @AllyCaster
                bsr.w   PopulateTargetsArrayWithEnemies
                bra.s   @UpdateTargetsList
@AllyCaster:
                
                bsr.w   PopulateTargetsArrayWithAllies
@UpdateTargetsList:
                
                move.w  #$FFFF,d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                move.b  caster(a6),d0
                bsr.w   InitializeMovementArrays     
                bsr.w   PopulateMovementArrays
                clr.w   d3
                bsr.w   UpdateBattleTerrainOccupiedByAllies
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                clr.w   d3
                move.b  caster(a6),d0
                bmi.s   @EnemyTargets
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d4
                bra.s   @MakeTargetsList_Loop
@EnemyTargets:
                
                move.w  #COMBATANT_ENEMIES_START,d0 
                move.w  #COMBATANT_ENEMIES_COUNTER,d4
@MakeTargetsList_Loop:
                
                bsr.w   GetCurrentHP
                beq.s   @NextTarget     ; move on if target is dead
                
                ; Insert secondary check for other spells here (such as detox, boost, or attack)
                bsr.w   GetStatusEffects    ; In: d0 = combatant index; Out: d1 = status effects (aka conditions)
                clr.w   d5
                move.b  spellEntry(a6),d5
                move.w  d5,d6                       ; d6 = spell and level being used (I am pretty sure that d2, d7 are also safe to use at this point)
                andi.w  #SPELLENTRY_MASK_INDEX,d5   ; d5 now contains byte matches for spell indexes, minus the level (so Blaze rather than specifically Blaze 1 or Blaze 4)                
                
                ; Detox check
                cmpi.w  #SPELL_DETOX,d5
                bne.s   @CheckForMissingHp
                cmpi.b  #SPELL_DETOX|SPELL_LV3,d6    ; Detox 3+
                bhs.s   @Detox3
                cmpi.b  #SPELL_DETOX|SPELL_LV2,d6    ; Detox 2
                beq.s   @Detox2
                andi.w  #STATUSEFFECT_POISON,d1 ; Conditions cured by detox 1 (since "and" is about as processor intensive as branch, it is space saving to skip extra branches here)
@Detox2:

                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON,d1   ; Conditions cured by detox 2
@Detox3:

                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE,d1    ; Conditions cured by detox 3/4
                bne.s   @PopulateList   ; If target is afflicted with a status ailment then they are a valid target for Detox (no HP requirements)
                bra.s   @NextTarget     ; otherwise, not a valid target
@CheckForMissingHp:

                clr.w   d5
                move.b  caster(a6),d5
                clr.w   d6
                move.b  healingThresholds(a6),d6
                bsr.w   DoesCombatantRequireHealing ; In: d0 = target index, d5 = caster index, d6 = extra AI variable --> determine if the target is a valid healing target
                bls.s   @NextTarget
@PopulateList:

                move.b  d0,(a0,d3.w)    ; add combatant to list of targets needing healing
                addq.w  #1,d3
@NextTarget:
                
                addq.w  #1,d0
                dbf     d4,@MakeTargetsList_Loop
                
                move.w  d3,((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w
                beq.w   @Skip   ; skip if no targets were found that needed healing
                
                ; Get targets priority
                subq.w  #1,d3
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a2
                lea     ((TARGETS_LIST-$1000000)).w,a3
                clr.w   d4
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a4
                move.w  #0,(a4)
@GetTargetsPriority_Loop:
                
                clr.w   d0
                move.b  (a0,d4.w),d0
                clr.w   d1
                move.b  spellEntry(a6),d1
                bsr.w   PopulateTargetableGrid
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d5
                subq.w  #1,d5
                beq.s   @RecordTotalPriority    ; if no targets are found in AOE
                
                clr.w   d7
                clr.w   d2
                move.b  #0,(a1,d4.w)
@CheckHighestPriority_Loop:
                
                move.b  (a3,d7.w),d0
                bsr.w   CalculateHealTargetPriority     ; Out: d6 = target priority
                cmpi.w  #13,d6
                bne.s   @CalculatePriority
                
                ; Mark the target as a highest priority target
                move.b  #1,(a1,d4.w)
                addq.w  #1,(a4)
@CalculatePriority:
                
                add.w   d6,d2
                addq.w  #4,d2
                addq.w  #1,d7
                dbf     d5,@CheckHighestPriority_Loop
@RecordTotalPriority:
                
                move.b  d2,(a2,d4.w)
                addq.w  #1,d4
                dbf     d3,@GetTargetsPriority_Loop
                
                move.w  ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,d1
                cmpi.w  #1,d1
                ble.s   @FindPositionForTargets
                
                ; Sort targets
                subq.w  #2,d1
                clr.w   d2
                move.b  #0,d2
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
@SortTargets_OuterLoop:
                
                tst.b   d2
                bmi.s   @FindPositionForTargets
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
                
                move.w  ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,d5
                subq.w  #1,d5
                clr.w   d6
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
@FindPositionForTargets_Loop:
                
                cmpi.b  #ITEM_NOTHING,itemEntry(a6)
                beq.s   @CheckSpellLevel    ; if no item is used, check for spell range instead

                ; Check for healing item
                clr.w   d0
                move.b  (a0,d6.w),d0        ; d0 = target index
                clr.w   d1
                move.b  itemEntry(a6),d1
                bsr.w   GetClosestHealingPositionForItem    ; In: d0 = target, d1 = spell; Out: d1, d2 = x, y (ccr-zero bit set if no valid location found)
                beq.s   @FindPositionForNextTarget
                bra.w   @LoadBattleactionData
@CheckSpellLevel:
                
                ; Find lowest level spell that still fully heals target
                move.b  (a0,d6.w),d0        ; d0 = target index
                move.b  caster(a6),d1
                move.b  spellEntry(a6),d4
                bsr.w   DetermineHealingSpellLevel  ; In:  D0 = heal target character index; D1 = combatant index of the spell caster; D4 = spell index
                                                    ; Out: D2 = spell level to cast (if -1, then no spell is cast)
                cmpi.b  #-1,d2
                beq.s   @FindPositionForNextTarget  ; If no spell is selected, loop to the next potential target to check
                
                ; Update spell entry
                move.b  spellEntry(a6),d1
                lsl.b   #6,d2
                andi.b  #SPELLENTRY_MASK_INDEX,d1
                or.b    d2,d1                   ; combine d1 and d2 to create the spell selected by the caster with the appropriate spell level    
                move.b  d1,optimalSpell(a6)     ; optimal spell index and what is intended to be cast
                move.w  d1,d7
@CheckSpellRange_Loop:

                ; Check healing spell range
                ; (a0,d6.w) = combatant offset for the spell target
                ; optimalSpell(a6) = optimal spell index and what is intended to be cast
                ; caster(a6) = caster
                ; spellEntry(a6)= original spell index (the highest spell level the caster knows)
                ; d0 = combatant offset for the spell target
                ; d3 = max spell range (from subroutine)
                ; d4 = min spell range (from subroutine)
                ; d5 = number of potential targets minus one -- loop counter
                ; d6 = target index for the healing spell
                ; d7 = the spell to use by the caster
                bsr.w   GetClosestHealingPositionForSpell   ; In: d0 = target, d1 = spell; Out: d1, d2 = x, y (ccr-zero bit set if no valid location found)
                bne.s   @FinalMpCheck       ; If not equal, then target is valid so cast the spell
                cmp.b   spellEntry(a6),d7   ; Check if the maximum spell level is being used
                beq.s   @PrepHealingLoop2   ; If the maximum spell level is reached already, then proceed to the 2nd loop
                addi.b  #64,d7              ; If the maximum spell level is not reached, check the next spell level
                move.w  d7,d1               ; Copy the spell index to d1
                bra.s   @CheckSpellRange_Loop
@PrepHealingLoop2:

                move.b  optimalSpell(a6),d7 ; optimal spell index and what is intended to be cast
@HealingLoop2:

                cmpi.b  #64,d7                      ; check if the spell level is already one (the minimum) and proceed to the next potential target if so
                blo.s   @FindPositionForNextTarget  ; if lower than 64 then move on to the next potential target
                subi.b  #64,d7                      ; reduce the spell entry d7 by one level
                move.b  d7,d1
                bsr.w   GetClosestHealingPositionForSpell   ; In: d0 = target, d1 = spell; Out: d1, d2 = x, y (ccr-zero bit set if no valid location found)
                bne.s   @FinalMpCheck   ; If not equal, then target is valid so cast the spell
                bra.s   @HealingLoop2
@FindPositionForNextTarget:
                
                addq.w  #1,d6
                dbf     d5,@FindPositionForTargets_Loop
                
                bra.w   @Skip   ; if caster cannot move into position to reach any target, do not take action
@FinalMpCheck:

                ; Check MP requirements for the selected spell and ensure the monster can still cast it.
                ; This assumes that MP requirements rise with spell level.
                ; If that is not the case, there will be times when the monster may have a valid higher level, higher range, but lower cost spell to cast and does not use it.
                ; This is required becasue the secondary check for range occurs after the check for MP. So if the range check causes a spell change, then the new spell must also be checked for MP cost.
                ; Only one check is required because if this check fails, there are no other valid spells for the monster to cast (assuming MP costs increase with spell level).
                move.w  d1,d4               ; save chosen x pos
                move.b  caster(a6),d0
                bsr.w   GetCurrentMP        ; In: d0 = combatant offset; Out: d1 = current MP
                move.w  d1,d0
                move.w  d7,d1
                bsr.w   GetSpellCost        ; In: d1 = spell index; Out: d1 = MP cost
                cmp.w   d0,d1            
                bgt.s   @FindPositionForNextTarget  ; If MP cost is greater than current MP, then check the next target.
                                                    ; Otherwise, restore values and continue processing to @LoadBattleactionData.
                move.w  d4,d1               ; restore chosen x pos
                move.b  d7,spellEntry(a6)
@LoadBattleactionData:
                
                ; At this point, it is necessary for...
                ; (a0,d6.w) = combatant offset for the spell target
                ;   spellEntry(a6)= the spell to cast (or the spell from the item)
                ;   itemEntry(a6)= the item to use (is $7F if no item)
                ;   itemSlot(a6) = item slot to use (if use item)
                ;   caster(a6) = caster
                ;   d1 = chosen x pos for monster to move to
                ;   d2 = chosen y pos for monster to move to
                ;   d6 = the index of the target in the list of targets A0; d6 starts at zero and ignores invalid targets
                move.b  d1,d0
                move.b  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4400_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a1
                clr.w   d0
                move.b  (a0,d6.w),d0
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a1)
                move.b  itemEntry(a6),d0
                cmpi.b  #ITEM_NOTHING,d0
                bne.s   @LoadUseItemData
                
                ; Load cast spell data
                move.b  spellEntry(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
                move.w  #BATTLEACTION_CAST_SPELL,(a1)
                bra.s   @ValidateAction
@LoadUseItemData:

                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a1)
                move.b  itemSlot(a6),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_SLOT(a1)
                move.w  #BATTLEACTION_USE_ITEM,(a1)
@ValidateAction:
                
                clr.w   d1
                bra.s   @Done
@Skip:
                
                move.w  #$FFFF,d1   ; No action taken
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a4
                rts

    ; End of function ExecuteAiCommand_Heal


; =============== S U B R O U T I N E =======================================

; Determines where the caster needs to move to reach the healing target.
; Returns $FF if the target is out of range.
;
; In:  d0 = combatant index of target
;      d1 = item or spell index
; Out: d1 = chosen x pos
;      d2 = chosen y pos
;      ccr = zero bit set if no valid location found


GetClosestHealingPositionForItem:

                bsr.w   GetItemRange    ; In:  d1 = item index; Out: d3 = max range; d4 = min range
                bra.s   GetClosestHealingPosition
GetClosestHealingPositionForSpell:

                bsr.w   GetSpellRange   ; In:  d1 = spell index; Out: d3 = max range; d4 = min range
GetClosestHealingPosition:
                
                bsr.w   GetCombatantY
                move.w  d1,d2
                bsr.w   GetCombatantX
                bsr.w   GetClosestAttackPosition    ; closest attack position of the unit whose turn it is to attack unit d0
                cmpi.b  #-1,d1
                rts

    ; End of function GetClosestHealingPositionForSpell

