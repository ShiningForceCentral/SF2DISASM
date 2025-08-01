
; ASM FILE code\gameflow\battle\ai\determineaibattleaction.asm :
; 0xEDD6..0xF1D4 : Determine AI Battleaction function

; =============== S U B R O U T I N E =======================================

; AI randomly chooses whether to attack, cast a spell, or use an item.
; 
; Then, AI will always target the highest priority option based upon
;  the chosen action, unless there are multiple options with equal priority.
; 
;       In: d0.b = character index of attacker
;       Out: d0.w = target index, d1.w = priority (max of 15), d2.b = battle action
; 
; If no targets in range then d0.w = -1, d1.w = 0, d2.b = 3

highPriorityTargetsCount = -196
battleaction = -195
priority = -194
attacker = -193
var_192 = -192
movementsList = -144
var_96 = -96
targetsList = -48

DetermineAiBattleaction:
                
                movem.l d3-a5,-(sp)
                link    a6,#-198
                move.b  d0,attacker(a6)
                move.b  #0,priority(a6)
                move.b  #0,battleaction(a6)
                clr.w   d3
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0 ; # targets reachable by phsyical attack
                tst.w   (a0)
                beq.s   @CheckSpellViability
                bset    #0,d3
@CheckSpellViability:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                tst.w   (a0)
                beq.s   @CheckItemViability
                bset    #1,d3
@CheckItemViability:
                
                lea     ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,a0
                tst.w   (a0)
                beq.s   @CheckResults
                bset    #2,d3
@CheckResults:
                
                tst.b   d3
                bne.s   @TakeAction     
                                        ; If no targets
                moveq   #BATTLEACTION_STAY,d2
                move.w  #-1,d0
                moveq   #0,d1
                bra.w   @loc_53
@TakeAction:
                
                
                ; Check spell and item use
                
                move.b  d3,d4           ; d3 = first three bits are set if targets are in range of a physical attack, spell, or item, respectively.
                andi.b  #%110,d4        ; #6 = 0110, so this ignores the physical and looks only at spell and item ranges
                tst.b   d4
                bne.s   @UseSpellOrItem
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0 ; physical -- # targets reachable
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_ATTACK,battleaction(a6)
                bra.w   @loc_20
                                        ; Targets are in range of either the spell or item for the AI.
                                        ; Remember that if the AI lacks a spell or item, it is replaced with a physical attack.
@UseSpellOrItem:
                
                move.w  d4,d1
                andi.b  #6,d1
                cmpi.b  #6,d1
                beq.w   @loc_15
                btst    #1,d4
                beq.s   @loc_11
                lea     ((ATTACK_COMMAND_SPELL-$1000000)).w,a1
                move.w  (a1),d1
                cmpi.w  #SPELL_AQUA,d1
                bne.s   @loc_6
                bra.w   @loc_18
@loc_6:
                
                move.b  #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.b  #2,d7
                bne.s   @loc_7          ; if d7 = 0,2,4 then go to loc_EEFA
                bra.w   @loc_18         ;  else go to loc_EEE0
@loc_7:
                
                cmpi.b  #4,d7
                bne.s   @loc_8
                bra.w   @loc_18
@loc_8:
                
                btst    #0,d3
                bne.s   @loc_9
                bra.w   @loc_18
                bra.s   @loc_10         ; not reachable
@loc_9:
                
                bra.w   @loc_17         
@loc_10:
                
                bra.s   @loc_15         ; unnecessary
@loc_11:
                
                move.b  #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.b  #3,d7
                bne.s   @loc_12         ; if d7 = 1,3,5 then go to loc_EF14
                bra.w   @loc_19         ;  else go to loc_EEE0
@loc_12:
                
                cmpi.b  #5,d7
                bne.s   @loc_13
                bra.w   @loc_19
@loc_13:
                
                btst    #0,d3
                bne.s   @loc_14
                bra.w   @loc_19
                bra.s   @loc_15         ; not reachable
@loc_14:
                
                bra.w   @loc_17         
@loc_15:
                
                move.b  #2,d6
            if (STANDARD_BUILD=1)
                jsr     (GenerateRandomNumberUnderD6).w
            else
                jsr     j_GenerateRandomNumberUnderD6
            endif
                cmpi.b  #1,d7
                bne.s   @loc_16
                bra.w   @loc_19
                bra.s   @loc_17         
@loc_16:
                
                bra.w   @loc_18
@loc_17:
                
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0 ; physical -- # targets reachable by phsyical attack
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_ATTACK,battleaction(a6)
                bra.w   @loc_20
@loc_18:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_CAST_SPELL,battleaction(a6)
                bra.w   @loc_20
@loc_19:
                
                lea     ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ITEM_LIST-$1000000)).w,a1
                lea     ((ITEM_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((ITEM_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_USE_ITEM,battleaction(a6)
                bra.w   *+4
@loc_20:
                
                
                ; Isolate highest priority targets.
                ;
                ; At this point, the address registers are populated as follows for the chosen attack (either physical, spell, or item):
                ;     a0 = # targets reachable
                ;     a1 = list of combatant indexes for reachable targets
                ;     a2 = movement to each reachable target
                ;     a3 = list of target priorities
                
                move.w  (a0),d3
                subi.w  #1,d3
                clr.b   d4
@GetHighestPriority_Loop:
                
                cmp.b   (a3,d3.w),d4
                bgt.s   @IsLowerPriority
                move.b  (a3,d3.w),d4
@IsLowerPriority:
                
                dbf     d3,@GetHighestPriority_Loop ; cycle through all targets and populate d4 with the highest priority.
                
                move.b  d4,priority(a6)
                cmpi.b  #15,d4
                bge.s   @CriticalPriority ; if >= 15 priority (which usually means a target is going to die)
                bra.w   @NoncriticalPriority ; if < 15 priority
@CriticalPriority:
                
                move.b  #15,priority(a6) ; if priority > 15, only save 15 as the priority
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.w  (a0),d3         ; d3 = # targets reachable
                subi.w  #1,d3
                clr.w   d5
                                        ; loop through all potential targets and identify all that equal the highest priority,
                                        ; storing that information in a4 and a6
@CriticalPriority_Loop:
                
                cmp.b   (a3,d3.w),d4    ; d4 = highest target priority
                bgt.s   @NotCriticalPriority
                move.b  (a1,d3.w),(a4,d5.w)
                move.l  a6,-(sp)
                adda.w  d5,a6
                move.b  (a2,d3.w),movementsList(a6) ; movement to each reachable target
                movea.l (sp)+,a6
                addi.w  #1,d5
@NotCriticalPriority:
                
                dbf     d3,@CriticalPriority_Loop
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a4
                move.w  d5,(a4)         ; # targets that have the maximum priority
                bra.w   @ChooseTarget   ; branch for < 15 target priority (no kills)
@NoncriticalPriority:
                
                ; This is an exact duplicate of the "priority >= 15" script,
                ; except this branch doesn't cap priority at 15.
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.w  (a0),d3
                subi.w  #1,d3
                clr.w   d5
@HighestPriority_Loop:
                
                cmp.b   (a3,d3.w),d4
                bne.s   @NotHighestPriority
                move.b  (a1,d3.w),(a4,d5.w)
                move.l  a6,-(sp)
                adda.w  d5,a6
                move.b  (a2,d3.w),movementsList(a6)
                movea.l (sp)+,a6
                addi.w  #1,d5
@NotHighestPriority:
                
                dbf     d3,@HighestPriority_Loop
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a4
                move.w  d5,(a4)
@ChooseTarget:
                
                cmpi.b  #1,d5
                bne.s   @MultipleTargets ; if more than one highest priority target
                                        ; else, select the single highest priority target as the target
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.b  (a4),d0         ; combatant index of the selected target
                move.b  priority(a6),d1
                move.b  battleaction(a6),d2
                bra.w   @loc_53
@MultipleTargets:
                
                
                ; At this point, the address registers are as follows:
                ;     a4 = combatant indexes of targets with the highest target priority (more than one if there were ties)
                
                clr.l   d0
                move.b  attacker(a6),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   @loc_32         ; if attacker is an enemy
                
                ; Attacker is an ally
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.b  d4,highPriorityTargetsCount(a6)
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
@CopyList_Loop:
                
                move.b  (a5)+,targetsList(a6,d5.w) ; copy targets list
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   @CopyList_Loop  ; repeat through the full list
                bra.w   @loc_48
@loc_32:
                
                move.b  priority(a6),d0
                cmpi.b  #15,d0          ; 15 = max priority and usually means death to a target
                bge.s   @loc_34
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.b  d4,highPriorityTargetsCount(a6)
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5 ; targets with the highest target priority
                clr.l   d5
@loc_33:
                
                move.b  (a5)+,targetsList(a6,d5.w) ; copy targets list
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   @loc_33         ; repeat through the full list
                bra.w   @loc_48
@loc_34:
                
                clr.l   d0
                move.b  attacker(a6),d0
                jsr     GetMoveType     ; D1 = value between 0-13 representing the move type (centaur, animal, aquatic, etc.)
                clr.l   d3
                move.b  d1,d3
                lea     (pt_AttackPriorityForMoveType).l,a4
                lsl.l   #2,d3
                movea.l (a4,d3.l),a4
                cmpi.b  #BATTLEACTION_CAST_SPELL,battleaction(a6)
                bne.s   @loc_35
                lea     (table_AttackPriority_Mage).l,a4
@loc_35:
                
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
@loc_36:
                
                move.b  (a5)+,targetsList(a6,d5.w)
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   @loc_36
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  #0,(a5)
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
@loc_37:
                
                clr.l   d4
@loc_38:
                
                clr.l   d0
                move.b  targetsList(a6,d4.w),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @ConsiderClass
                bra.w   @loc_41
@ConsiderClass:
                
                jsr     GetClass        
                cmp.b   (a4,d5.w),d1
                beq.s   @loc_40
                bra.w   @loc_41
@loc_40:
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d2
                lea     ((TARGETS_LIST-$1000000)).w,a5
                move.b  d0,(a5,d2.w)
                move.b  d1,var_96(a6,d2.w)
                move.l  a6,-(sp)
                adda.w  d4,a6
                move.b  movementsList(a6),d0
                movea.l (sp)+,a6
                move.l  a6,-(sp)
                adda.w  d2,a6
                move.b  d0,var_192(a6)
                movea.l (sp)+,a6
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d2
                addq.w  #1,d2
                move.w  d2,(a5)
@loc_41:
                
                addq.b  #1,d4
                cmpi.b  #48,d4          ; max num targets
                blt.s   @loc_42
                
                move.b  #-1,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   @loc_53
@loc_42:
                
                cmp.b   d4,d6
                beq.s   @loc_43
                bra.s   @loc_38
@loc_43:
                
                addq.b  #1,d5
                cmpi.b  #CLASS_NUMBER_TOTAL,d5
                bge.s   @loc_44
                bra.s   @loc_37
@loc_44:
                
                move.b  #0,highPriorityTargetsCount(a6)
                clr.l   d6
                clr.l   d2
                move.b  var_96(a6,d2.w),d2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d7
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d4
@loc_45:
                
                move.b  var_96(a6,d4.w),d5
                cmp.b   d5,d2
                bne.s   @loc_46
                move.b  (a5,d4.w),targetsList(a6,d6.w)
                move.l  a6,-(sp)
                adda.w  d4,a6
                move.b  var_192(a6),d0
                movea.l (sp)+,a6
                move.l  a6,-(sp)
                adda.w  d6,a6
                move.b  d0,movementsList(a6)
                movea.l (sp)+,a6
                addq.w  #1,d6
@loc_46:
                
                addi.w  #1,d4
                cmpi.w  #$30,d4 
                blt.s   @loc_47
                
                move.b  #-1,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   @loc_53
@loc_47:
                
                subq.w  #1,d7
                bne.s   @loc_45
                move.b  d6,highPriorityTargetsCount(a6)
                cmpi.b  #1,d6
                bne.s   @loc_48
                move.b  targetsList(a6),d0
                move.b  priority(a6),d1
                move.b  battleaction(a6),d2
                bra.w   @loc_53
@loc_48:
                
                clr.l   d2
                move.b  #-1,d2
                clr.w   d3
                move.b  highPriorityTargetsCount(a6),d3
                cmpi.w  #$30,d3 
                ble.s   @loc_49
                
                move.b  #-1,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   @loc_53
@loc_49:
                
                clr.l   d4
                clr.l   d6
@loc_50:
                
                movea.l a6,a5
                adda.w  d4,a5
                move.b  -$90(a5),d5
                cmp.b   d5,d2
                bgt.s   @loc_51
                move.b  d5,d2
                move.b  targetsList(a6,d4.w),d6
@loc_51:
                
                addi.w  #1,d4
                subq.w  #1,d3
                bne.s   @loc_50
                cmpi.b  #-1,d2
                bne.s   @loc_52
                
                move.b  #-1,d0
                clr.w   d1
                move.b  #3,d2
                bra.s   @loc_53
@loc_52:
                
                move.b  d6,d0
                move.b  priority(a6),d1
                move.b  battleaction(a6),d2
@loc_53:
                
                unlk    a6
                movem.l (sp)+,d3-a5
                rts

    ; End of function DetermineAiBattleaction

