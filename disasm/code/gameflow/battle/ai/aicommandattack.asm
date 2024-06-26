
; ASM FILE code\gameflow\battle\ai\aicommandattack.asm :
; 0xE78C..0xE98C : AI command : Attack

; =============== S U B R O U T I N E =======================================

; In: D0 = character index (attacker)
;     D1 = extra AI variable (values of 0-3)


ExecuteAiCommand_Attack:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d0,d7
                move.w  d1,d6
                bsr.w   PrioritizeReachableTargets
                bsr.w   DetermineAiBattleaction
                cmpi.b  #BATTLEACTION_STAY,d2
                bne.s   @TakeAction
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @EndTurn_Stay
@TakeAction:
                
                movem.l d0-d3,-(sp)
                move.w  d0,d1
                move.w  d7,d0
                bsr.w   DetermineMuddleBattleaction
                tst.w   d3
                beq.s   @NotMuddleAction
                movem.l (sp)+,d0-d3
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_MUDDLED,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @EndTurn
@NotMuddleAction:
                
                
                
                ; Battleaction : Use Item
                movem.l (sp)+,d0-d3
                cmpi.b  #BATTLEACTION_USE_ITEM,d2
                bne.w   @Check_CastSpell
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_USE_ITEM,(a0)
                lea     ((ATTACK_COMMAND_ITEM_SLOT-$1000000)).w,a1
                move.w  (a1),BATTLEACTION_OFFSET_ITEM_SLOT(a0)
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a0)
                move.w  d7,d0           ; d7 --> d0 = character index (aka attacker)
                move.w  (a1),d1         ; d1 = item slot of the attack item
                bsr.w   GetItemBySlotAndHeldItemsNumber
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                move.w  d7,d1           ; d7 --> d1 = character index (aka attacker)
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   @ValidTarget_Item ; if not enemy
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  d0,(a2,d1.w)    ; Error. The idea is to record the most recent target selected by the monster, but because d0 was overwritten above this instead always places the monster itself as its target.
                                        ; This error only occurs with BATTLEACTION_USE_ITEM. The other actions do not have this error.
@ValidTarget_Item:
                
                lea     ((ATTACK_COMMAND_ITEM_SLOT-$1000000)).w,a1
                move.w  (a1),d1
                move.w  d7,d0           ; d7 --> d0 = character index (aka attacker)
                bsr.w   GetItemBySlotAndHeldItemsNumber
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                bsr.w   GetSpellRange   
                bsr.w   PopulateTargetsArrayWithAllCombatants
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  BATTLEACTION_OFFSET_TARGET(a0),d0
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
                bra.w   @EndTurn
@Check_CastSpell:
                
                
                ; Battleaction : Cast Spell
                
                cmpi.b  #BATTLEACTION_CAST_SPELL,d2
                bne.s   @Check_Attack
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_CAST_SPELL,(a0)
                lea     ((ATTACK_COMMAND_SPELL-$1000000)).w,a1
                move.w  (a1),BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a0)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                move.w  d7,d1
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   @ValidTarget_Spell
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  d0,(a2,d1.w)
@ValidTarget_Spell:
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0),d1
                bsr.w   GetSpellRange   
                bsr.w   PopulateTargetsArrayWithAllCombatants
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
                bra.w   @EndTurn
@Check_Attack:
                
                
                ; Battleaction : Attack
                
                tst.b   d2
                bne.w   @EndTurn_Stay
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_ATTACK,(a0)
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                move.w  d7,d1
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   @ValidTarget_Attack
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  d0,(a2,d1.w)
@ValidTarget_Attack:
                
                move.l  d0,-(sp)
                move.w  d7,d0
                jsr     GetEquippedWeapon
                cmpi.w  #-1,d1
                bne.s   @GetWeaponAttackRange
                clr.l   d3
                clr.l   d4
                jsr     GetCombatantType
                cmpi.b  #ENEMY_KRAKEN_ARM,d1 ; BUG -- When getting Claude's class type, the previous routine 
                                        ;  returns a value in the byte area that happens to be the same
                                        ;  as the Kraken Arm's index, causing the former to perform 
                                        ;  a ranged attack when controlled by the AI.
                                        ;                                                 
                                        ; That can be fixed by using a word-sized CMPI instruction
                bne.s   @CheckKrakenHead
                move.w  #2,d3           ; max range 2
                move.w  #1,d4           ; min range 1
                bra.w   @FinishUnequipRange
@CheckKrakenHead:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   @BasicUnequipRange
                move.w  #3,d3           ; max range 3
                move.w  #1,d4           ; min range 1
                bra.w   @FinishUnequipRange
@BasicUnequipRange:
                
                moveq   #1,d3           ; max range 1
                moveq   #0,d4           ; min range 0
@FinishUnequipRange:
                
                bra.w   @FindTarget
@GetWeaponAttackRange:
                
                jsr     GetItemDefAddress
                moveq   #0,d3
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
@FindTarget:
                
                move.l  (sp)+,d0
                bsr.w   PopulateTargetsArrayWithAllCombatants
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildAiMoveString
                bra.w   @EndTurn
@EndTurn_Stay:
                
                moveq   #-1,d1
                movem.l (sp)+,d0/d2-a6
                rts
@EndTurn:
                
                moveq   #0,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ExecuteAiCommand_Attack

