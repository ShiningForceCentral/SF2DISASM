
; ASM FILE code\gameflow\battle\aiengine_3.asm :
; 0xE78C..0xF9B4 : AI engine

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
                bne.s   loc_E7B6
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_E97C
loc_E7B6:
                
                movem.l d0-d3,-(sp)
                move.w  d0,d1
                move.w  d7,d0
                bsr.w   DetermineMuddleBattleaction
                tst.w   d3
                beq.s   loc_E7DE
                movem.l (sp)+,d0-d3
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_MUDDLE,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_E984
loc_E7DE:
                
                
                
                ; Battleaction : Use Item
                movem.l (sp)+,d0-d3
                cmpi.b  #BATTLEACTION_USE_ITEM,d2
                bne.w   loc_E86C
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_USE_ITEM,(a0)
                lea     ((ATTACK_COMMAND_ITEM_SLOT-$1000000)).w,a1
                move.w  (a1),BATTLEACTION_OFFSET_ITEM_SLOT(a0)
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a0)
                move.w  d7,d0           ; d7 --> d0 = character index (aka attacker)
                move.w  (a1),d1         ; d1 = item slot of the attack item
                bsr.w   GetItemAndNumberHeld
                move.w  d1,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                move.w  d7,d1           ; d7 --> d1 = character index (aka attacker)
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   loc_E81E        ; if not enemy
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  d0,(a2,d1.w)    ; Error. The idea is to record the most recent target selected by the monster, but because d0 was overwritten above this instead always places the monster itself as its target.
                                        ; This error only occurs with BATTLEACTION_USE_ITEM. The other actions do not have this error.
loc_E81E:
                
                lea     ((ATTACK_COMMAND_ITEM_SLOT-$1000000)).w,a1
                move.w  (a1),d1
                move.w  d7,d0           ; d7 --> d0 = character index (aka attacker)
                bsr.w   GetItemAndNumberHeld
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                bsr.w   GetSpellRange   
                bsr.w   MakeTargetsList_Everybody
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  BATTLEACTION_OFFSET_TARGET(a0),d0
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
                bra.w   loc_E984
loc_E86C:
                
                
                ; Battleaction : Cast Spell
                
                cmpi.b  #BATTLEACTION_CAST_SPELL,d2
                bne.s   loc_E8D0
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_CAST_SPELL,(a0)
                lea     ((ATTACK_COMMAND_SPELL-$1000000)).w,a1
                move.w  (a1),BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a0)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                move.w  d7,d1
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   loc_E89A
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  d0,(a2,d1.w)
loc_E89A:
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0),d1
                bsr.w   GetSpellRange   
                bsr.w   MakeTargetsList_Everybody
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
                bra.w   loc_E984
loc_E8D0:
                
                
                ; Battleaction : Attack
                
                tst.b   d2
                bne.w   loc_E97C
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_ATTACK,(a0)
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a2
                move.w  d7,d1
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   loc_E8F6
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  d0,(a2,d1.w)
loc_E8F6:
                
                move.l  d0,-(sp)
                move.w  d7,d0
                jsr     GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                bne.s   loc_E93C
                clr.l   d3
                clr.l   d4
                jsr     GetSomethingClassType
                cmpi.b  #ENEMY_KRAKEN_ARM,d1 ; BUGGED When getting Claude's class type, the previous routine 
                                        ;  returns a value in the byte area that happens to be the same
                                        ;  as the Kraken Arm's index, causing the former to perform 
                                        ;  a ranged attack when controlled by the AI.
                                        ;                                                 
                                        ; That can be fixed by using a word-sized CMPI instruction
                bne.s   loc_E922
                move.w  #2,d3           ; max range 2
                move.w  #1,d4           ; min range 1
                bra.w   loc_E938
loc_E922:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   loc_E934        
                move.w  #3,d3           ; max range 3
                move.w  #1,d4           ; min range 1
                bra.w   loc_E938
loc_E934:
                
                moveq   #1,d3           ; max range 1
                moveq   #0,d4           ; min range 0
loc_E938:
                
                bra.w   loc_E94C
loc_E93C:
                
                jsr     GetItemDefAddress
                moveq   #0,d3
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
loc_E94C:
                
                move.l  (sp)+,d0
                bsr.w   MakeTargetsList_Everybody
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
                bra.w   loc_E984
loc_E97C:
                
                moveq   #$FFFFFFFF,d1
                movem.l (sp)+,d0/d2-a6
                rts
loc_E984:
                
                moveq   #0,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ExecuteAiCommand_Attack


; =============== S U B R O U T I N E =======================================

; Move scripts (move to point, follow ally, follow force member)

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

ExecuteAiCommand_SpecialMove:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_E9B2
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
loc_E9B2:
                
                move.b  d0,var_1(a6)
                move.b  d1,var_2(a6)
                move.b  d2,var_4(a6)
                bsr.w   GetCurrentMOV
                tst.b   d1
                bne.s   loc_E9DE
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
loc_E9DE:
                
                bsr.w   GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_EA00
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
loc_EA00:
                
                move.b  d1,var_3(a6)
                btst    #6,d1
                bne.s   loc_EA2E
                clr.w   d0
                move.b  d1,d0
                bsr.w   GetCurrentHP
                tst.w   d1
                bne.s   loc_EA2E
                move.b  #$FF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   loc_EB7A
loc_EA2E:
                
                move.b  var_2(a6),d0
                tst.b   d0
                bne.w   loc_EAE6
                move.b  var_1(a6),d0
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetsList_Allies
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                clr.w   d3
                bsr.w   UpdateTargetsList_Allies
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   sub_CE96
                tst.b   d1
                bne.s   loc_EA78
                move.w  #$FFFF,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
loc_EA78:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                jsr     sub_1AC028      
                move.b  var_1(a6),d0
                clr.w   d1
                bsr.w   ExecuteAiCommand_Attack
                tst.b   d1
                bne.s   loc_EA9C
                clr.w   d1
                bra.w   loc_EB7A
loc_EA9C:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #$FF,d1
                bne.s   loc_EAD4
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
                move.w  #$FFFF,d1
                bra.s   loc_EAE2
loc_EAD4:
                
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                clr.w   d1
                bra.w   loc_EB7A
loc_EAE2:
                
                bra.w   loc_EB7A
loc_EAE6:
                
                clr.w   d0
                move.b  var_1(a6),d0
                move.b  var_2(a6),d1
                bsr.w   sub_D430
                tst.b   d1
                bne.s   loc_EB10
                move.w  #$FFFF,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
loc_EB10:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                jsr     sub_1AC028      
                move.b  var_1(a6),d0
                clr.w   d1
                bsr.w   ExecuteAiCommand_Attack
                tst.b   d1
                bne.s   loc_EB34
                clr.w   d1
                bra.w   loc_EB7A
loc_EB34:
                
                jsr     j_ClearTerrainListObstructions
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                bsr.w   sub_F7A0
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #$FF,d1
                bne.s   loc_EB6C
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_EB7A
                move.w  #$FFFF,d1
                bra.s   loc_EB7A
loc_EB6C:
                
                clr.w   d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   *+4
loc_EB7A:
                
                clr.w   d2
                move.b  var_4(a6),d2
                tst.w   d2
                beq.s   loc_EB9C
                cmpi.w  #1,d2
                bne.s   loc_EB90
                jsr     j_GetMoveListForEnemyTarget
loc_EB90:
                
                cmpi.w  #2,d2
                bne.s   loc_EB9C
                jsr     sub_1AC030      
loc_EB9C:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ExecuteAiCommand_SpecialMove


; =============== S U B R O U T I N E =======================================

; Debuff spells AI (Muddle 2, Dispel 1)
; 
;       In: D0 = character index


ExecuteAiCommand_Debuff:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d0,d7
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                move.w  #$FFFF,d1
                
                ; If ally, do nothing
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@Enemy:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   @NotMuddled
                
                ; If muddled, do nothing
                move.w  #$FFFF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@NotMuddled:
                
                move.w  d7,d0
                clr.w   d3
                bsr.w   GetNextStatusSpell
                cmpi.w  #SPELL_NOTHING,d1
                bne.s   @CheckMuddle    
                
                ; If no known status spell, do nothing
                move.w  #$FFFF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@CheckMuddle:
                
                cmpi.w  #SPELL_MUDDLE|SPELL_LV2,d1 ; HARDCODED spell entries
                bne.s   @CheckDispel
                bra.w   @CheckMPcost    
@CheckDispel:
                
                cmpi.w  #SPELL_DISPEL,d1
                bne.s   @DoNothing
                bra.w   @CheckMPcost    
@DoNothing:
                
                move.w  #$FFFF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@CheckMPcost:
                
                move.w  d1,d6           ; d6 = copy of debuff spell entry
                bsr.w   FindSpellDefAddress
                clr.w   d2
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d2
                move.b  SPELLDEF_OFFSET_PROPS(a0),d5
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetCurrentMP
                cmp.b   d2,d1
                bge.s   @CheckTargetingGroup
                
                ; If not enough MP, do nothing
                move.w  #$FFFF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@CheckTargetingGroup:
                
                clr.w   d0
                btst    #SPELLPROPS_BIT_TARGETING,d5
                move.w  #$FFFF,d3
                bne.s   @TargetTeammates1
                bsr.w   UpdateTargetsList_Enemies
                bra.s   @CheckTargetingGroup2
@TargetTeammates1:
                
                bsr.w   UpdateTargetsList_Allies
@CheckTargetingGroup2:
                
                move.b  d7,d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                btst    #SPELLPROPS_BIT_TARGETING,d5
                clr.w   d3
                bne.s   @TargetTeammates2
                bsr.w   UpdateTargetsList_Enemies
                bsr.w   MakeTargetsList_Allies
                bra.s   @MakeTargetsList
@TargetTeammates2:
                
                bsr.w   UpdateTargetsList_Allies
                bsr.w   MakeTargetsList_Enemies
@MakeTargetsList:
                
                clr.w   d1
                move.b  d6,d1
                clr.w   d0
                move.b  d7,d0
                cmpi.w  #SPELL_ATTACK,d1
                bne.s   @CheckBoost
                bsr.w   sub_D460        
                bra.w   @CheckReachableTargets
@CheckBoost:
                
                cmpi.w  #SPELL_BOOST|SPELL_LV2,d1
                bne.s   @CheckMuddle2
                bsr.w   sub_D4E0        
                bra.w   @CheckReachableTargets
@CheckMuddle2:
                
                cmpi.w  #SPELL_MUDDLE|SPELL_LV2,d1
                bne.s   @CheckDispel2
                bsr.w   sub_D62C        
                bra.w   @CheckReachableTargets
@CheckDispel2:
                
                cmpi.w  #SPELL_DISPEL,d1
                bne.s   @DoNothing2
                bsr.w   sub_D560        
                bra.w   @CheckReachableTargets
@DoNothing2:
                
                move.w  #$FFFF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@CheckReachableTargets:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                move.w  (a0),d5
                tst.w   d5
                bne.s   @GetTarget
                
                ; If no reachable target, do nothing
                move.w  #$FFFF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@GetTarget:
                
                subi.w  #1,d5
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a0
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a1
                move.b  #$FF,d0
                clr.w   d1
                clr.w   d2
@GetTarget_Loop:
                
                clr.w   d3
                move.b  (a1,d2.w),d3
                cmp.b   d1,d3
                blt.s   @Next
                move.b  (a0,d2.w),d0
                move.b  d3,d1
@Next:
                
                addi.w  #1,d2
                dbf     d5,@GetTarget_Loop
                
                cmpi.b  #$FF,d0
                bne.s   @LoadBattleactionData
                move.w  #$FFFF,d1
                
                ; If no reachable target, do nothing
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@LoadBattleactionData:
                
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_CAST_SPELL,(a0)
                move.w  d6,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a0)
                move.w  d0,BATTLEACTION_OFFSET_TARGET(a0)
                move.w  d6,d1
                bsr.w   GetSpellRange   
                move.w  BATTLEACTION_OFFSET_TARGET(a0),d0
                bsr.w   MakeTargetsList_Everybody
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                cmpi.w  #$FF,d1
                bne.s   @MakeMoveString
                
                ; If no valid attack position, do nothing
                move.w  #$FFFF,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                bra.w   @Done
@MakeMoveString:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
                clr.w   d1
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function ExecuteAiCommand_Debuff


; =============== S U B R O U T I N E =======================================

; AI randomly chooses whether to attack, cast a spell, or use an item.
; 
; Then, AI will always target the highest priority option based upon
;  the chosen action, unless there are multiple options with equal priority.
; 
;       In: D0 = character index of attacker
;       Out: D0 = target index, D1 = priority (max of 15), D2 = battle action
; 
; If no targets in range then D0 = $FFFF, D1 = 0, D2 = 3

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
                beq.s   loc_EDFC
                bset    #0,d3
loc_EDFC:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                tst.w   (a0)
                beq.s   loc_EE08
                bset    #1,d3
loc_EE08:
                
                lea     ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,a0
                tst.w   (a0)
                beq.s   loc_EE14
                bset    #2,d3
loc_EE14:
                
                tst.b   d3
                bne.s   loc_EE24        
                                        ; If no targets
                moveq   #BATTLEACTION_STAY,d2
                move.w  #$FFFF,d0
                moveq   #0,d1
                bra.w   loc_F1CC
loc_EE24:
                
                
                ; Check spell and item use
                
                move.b  d3,d4           ; d3 = first three bits are set if targets are in range of a physical attack, spell, or item, respectively.
                andi.b  #6,d4           ; #6 = 0110, so this ignores the physical and looks only at spell and item ranges
                tst.b   d4
                bne.s   loc_EE48
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0 ; physical -- # targets reachable
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_ATTACK,battleaction(a6)
                bra.w   loc_EF2E
                                        ; Targets are in range of either the spell or item for the AI.
                                        ; Remember that if the AI lacks a spell or item, it is replaced with a physical attack.
loc_EE48:
                
                move.w  d4,d1
                andi.b  #6,d1
                cmpi.b  #6,d1
                beq.w   loc_EEC6
                btst    #1,d4
                beq.s   loc_EE9A
                lea     ((ATTACK_COMMAND_SPELL-$1000000)).w,a1
                move.w  (a1),d1
                cmpi.w  #SPELL_AQUA,d1
                bne.s   loc_EE6C
                bra.w   loc_EEFA
loc_EE6C:
                
                move.b  #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.b  #2,d7
                bne.s   loc_EE7E        ; if d7 = 0,2,4 then go to loc_EEFA
                bra.w   loc_EEFA        ;  else go to loc_EEE0
loc_EE7E:
                
                cmpi.b  #4,d7
                bne.s   loc_EE88
                bra.w   loc_EEFA
loc_EE88:
                
                btst    #0,d3
                bne.s   loc_EE94
                bra.w   loc_EEFA
                bra.s   loc_EE98        ; not reachable
loc_EE94:
                
                bra.w   loc_EEE0        
loc_EE98:
                
                bra.s   loc_EEC6        ; unnecessary
loc_EE9A:
                
                move.b  #6,d6
                jsr     (GenerateRandomNumber).w
                cmpi.b  #3,d7
                bne.s   loc_EEAC        ; if d7 = 1,3,5 then go to loc_EF14
                bra.w   loc_EF14        ;  else go to loc_EEE0
loc_EEAC:
                
                cmpi.b  #5,d7
                bne.s   loc_EEB6
                bra.w   loc_EF14
loc_EEB6:
                
                btst    #0,d3
                bne.s   loc_EEC2
                bra.w   loc_EF14
                bra.s   loc_EEC6        ; not reachable
loc_EEC2:
                
                bra.w   loc_EEE0        
loc_EEC6:
                
                move.b  #2,d6
                jsr     j_RandomUnderD6
                cmpi.b  #1,d7
                bne.s   loc_EEDC
                bra.w   loc_EF14
                bra.s   loc_EEE0        
loc_EEDC:
                
                bra.w   loc_EEFA
loc_EEE0:
                
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a0 ; physical -- # targets reachable by phsyical attack
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a1
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((ATTACK_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_ATTACK,battleaction(a6)
                bra.w   loc_EF2E
loc_EEFA:
                
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a1
                lea     ((SPELL_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((SPELL_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_CAST_SPELL,battleaction(a6)
                bra.w   loc_EF2E
loc_EF14:
                
                lea     ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,a0
                lea     ((TARGETS_REACHABLE_BY_ITEM_LIST-$1000000)).w,a1
                lea     ((ITEM_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a2
                lea     ((ITEM_TARGET_PRIORITIES_LIST-$1000000)).w,a3
                move.b  #BATTLEACTION_USE_ITEM,battleaction(a6)
                bra.w   *+4
loc_EF2E:
                
                
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
loc_EF36:
                
                cmp.b   (a3,d3.w),d4
                bgt.s   loc_EF40        
                move.b  (a3,d3.w),d4
loc_EF40:
                
                dbf     d3,loc_EF36     ; cycle through all targets and populate d4 with the highest priority.
                
                move.b  d4,priority(a6)
                cmpi.b  #15,d4
                bge.s   loc_EF52        ; if >= 15 priority (which usually means a target is going to die)
                bra.w   loc_EF8E        ; if < 15 priority
loc_EF52:
                
                move.b  #15,priority(a6) ; if priority > 15, only save 15 as the priority
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.w  (a0),d3         ; d3 = # targets reachable
                subi.w  #1,d3
                clr.w   d5
                                        ; loop through all potential targets and identify all that equal the highest priority,
                                        ; storing that information in a4 and a6
loc_EF64:
                
                cmp.b   (a3,d3.w),d4    ; d4 = highest target priority
                bgt.s   loc_EF80
                move.b  (a1,d3.w),(a4,d5.w)
                move.l  a6,-(sp)
                adda.w  d5,a6
                move.b  (a2,d3.w),movementsList(a6) ; movement to each reachable target
                movea.l (sp)+,a6
                addi.w  #1,d5
loc_EF80:
                
                dbf     d3,loc_EF64     
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a4
                move.w  d5,(a4)         ; # targets that have the maximum priority
                bra.w   loc_EFC0        ; branch for < 15 target priority (no kills)
loc_EF8E:
                
                ; This is an exact duplicate of the "priority >= 15" script,
                ; except this branch doesn't cap priority at 15.
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.w  (a0),d3
                subi.w  #1,d3
                clr.w   d5
loc_EF9A:
                
                cmp.b   (a3,d3.w),d4
                bne.s   loc_EFB6
                move.b  (a1,d3.w),(a4,d5.w)
                move.l  a6,-(sp)
                adda.w  d5,a6
                move.b  (a2,d3.w),movementsList(a6)
                movea.l (sp)+,a6
                addi.w  #1,d5
loc_EFB6:
                
                dbf     d3,loc_EF9A
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a4
                move.w  d5,(a4)
loc_EFC0:
                
                cmpi.b  #1,d5
                bne.s   loc_EFD8        ; if more than one highest priority target
                                        ; else, select the single highest priority target as the target
                lea     ((TARGETS_LIST-$1000000)).w,a4
                move.b  (a4),d0         ; combatant index of the selected target
                move.b  priority(a6),d1
                move.b  battleaction(a6),d2
                bra.w   loc_F1CC
loc_EFD8:
                
                
                ; At this point, the address registers are as follows:
                ;     a4 = combatant indexes of targets with the highest target priority (more than one if there were ties)
                
                clr.l   d0
                move.b  attacker(a6),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   loc_F008        ; if attacker is an enemy
                
                ; Attacker is an ally
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.b  d4,highPriorityTargetsCount(a6)
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
loc_EFFA:
                
                move.b  (a5)+,targetsList(a6,d5.w) ; copy targets list
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   loc_EFFA        ; repeat through the full list
                bra.w   loc_F172
loc_F008:
                
                move.b  priority(a6),d0
                cmpi.b  #15,d0          ; 15 = max priority and usually means death to a target
                bge.s   loc_F034
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.b  d4,highPriorityTargetsCount(a6)
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5 ; targets with the highest target priority
                clr.l   d5
loc_F026:
                
                move.b  (a5)+,targetsList(a6,d5.w) ; copy targets list
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   loc_F026        ; repeat through the full list
                bra.w   loc_F172
loc_F034:
                
                clr.l   d0
                move.b  attacker(a6),d0
                jsr     GetMoveType     ; D1 = value between 0-13 representing the move type (centaur, animal, aquatic, etc.)
                clr.l   d3
                move.b  d1,d3
                lea     (off_D982).l,a4 
                lsl.l   #2,d3
                movea.l (a4,d3.l),a4
                cmpi.b  #BATTLEACTION_CAST_SPELL,battleaction(a6)
                bne.s   loc_F05E
                lea     (byte_D921).l,a4
loc_F05E:
                
                clr.l   d4
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d4
                move.w  d4,d6
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
loc_F06E:
                
                move.b  (a5)+,targetsList(a6,d5.w)
                addq.l  #1,d5
                subq.w  #1,d4
                bne.s   loc_F06E
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  #0,(a5)
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d5
loc_F086:
                
                clr.l   d4
loc_F088:
                
                clr.l   d0
                move.b  targetsList(a6,d4.w),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   loc_F098
                bra.w   loc_F0D8
loc_F098:
                
                jsr     GetClass        
                cmp.b   (a4,d5.w),d1
                beq.s   loc_F0A8
                bra.w   loc_F0D8
loc_F0A8:
                
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
loc_F0D8:
                
                addq.b  #1,d4
                cmpi.b  #$30,d4 
                blt.s   loc_F0EE
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   loc_F1CC
loc_F0EE:
                
                cmp.b   d4,d6
                beq.s   loc_F0F4
                bra.s   loc_F088
loc_F0F4:
                
                addq.b  #1,d5
                cmpi.b  #$20,d5 
                bge.s   loc_F0FE
                bra.s   loc_F086
loc_F0FE:
                
                move.b  #0,highPriorityTargetsCount(a6)
                clr.l   d6
                clr.l   d2
                move.b  var_96(a6,d2.w),d2
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a5
                move.w  (a5),d7
                lea     ((TARGETS_LIST-$1000000)).w,a5
                clr.l   d4
loc_F118:
                
                move.b  var_96(a6,d4.w),d5
                cmp.b   d5,d2
                bne.s   loc_F13C
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
loc_F13C:
                
                addi.w  #1,d4
                cmpi.w  #$30,d4 
                blt.s   loc_F154
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   loc_F1CC
loc_F154:
                
                subq.w  #1,d7
                bne.s   loc_F118
                move.b  d6,highPriorityTargetsCount(a6)
                cmpi.b  #1,d6
                bne.s   loc_F172
                move.b  targetsList(a6),d0
                move.b  priority(a6),d1
                move.b  battleaction(a6),d2
                bra.w   loc_F1CC
loc_F172:
                
                clr.l   d2
                move.b  #$FF,d2
                clr.w   d3
                move.b  highPriorityTargetsCount(a6),d3
                cmpi.w  #$30,d3 
                ble.s   loc_F192
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.w   loc_F1CC
loc_F192:
                
                clr.l   d4
                clr.l   d6
loc_F196:
                
                movea.l a6,a5
                adda.w  d4,a5
                move.b  -$90(a5),d5
                cmp.b   d5,d2
                bgt.s   loc_F1A8
                move.b  d5,d2
                move.b  targetsList(a6,d4.w),d6
loc_F1A8:
                
                addi.w  #1,d4
                subq.w  #1,d3
                bne.s   loc_F196
                cmpi.b  #$FF,d2
                bne.s   loc_F1C2
                move.b  #$FF,d0
                clr.w   d1
                move.b  #3,d2
                bra.s   loc_F1CC
loc_F1C2:
                
                move.b  d6,d0
                move.b  priority(a6),d1
                move.b  battleaction(a6),d2
loc_F1CC:
                
                unlk    a6
                movem.l (sp)+,d3-a5
                rts

    ; End of function DetermineAiBattleaction


; =============== S U B R O U T I N E =======================================

; In: D0 = character index (mover)
;     D1 = extra AI variable (values of 0-2)

var_98 = -98
var_96 = -96
var_95 = -95
var_48 = -48
var_47 = -47

ExecuteAiCommand_Move:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-100
                move.w  d0,d7           ; character index of the moving unit
                move.b  d1,var_98(a6)
                tst.b   d1
                beq.s   loc_F1FE
                cmpi.b  #1,d1
                bne.s   loc_F1F2
                jsr     j_GetMoveListForEnemyTarget
loc_F1F2:
                
                cmpi.b  #2,d1
                bne.s   loc_F1FE
                jsr     sub_1AC030      
loc_F1FE:
                
                bsr.w   GetMoveInfo     
                move.w  #$80,d0 
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetsList_Everybody
                move.w  d7,d0
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_F22C
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_F222
                clr.w   d6
                bra.s   loc_F228
loc_F222:
                
                clr.w   d6
                move.w  #COMBATANT_ENEMIES_START,d6
loc_F228:
                
                bra.w   loc_F39E
loc_F22C:
                
                move.w  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_F23E
                move.w  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d6
                bra.s   loc_F244
loc_F23E:
                
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d6
loc_F244:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d2
loc_F24A:
                
                bsr.w   GetCurrentHP    ; iterate through combatants
                tst.w   d1
                bne.s   loc_F256
                bra.w   loc_F276
loc_F256:
                
                bsr.w   GetXPos
                tst.b   d1
                bpl.s   loc_F262
                bra.w   loc_F276
loc_F262:
                
                bsr.w   GetYPos
                tst.b   d1
                bpl.s   loc_F26E
                bra.w   loc_F276
loc_F26E:
                
                move.b  d0,(a0,d2.w)    ; add to targets if alive and on map
                addi.w  #1,d2
loc_F276:
                
                addq.w  #1,d0
                dbf     d6,loc_F24A
                move.w  d2,((TARGETS_LIST_LENGTH-$1000000)).w
                move.w  d2,d6
                clr.w   d2
loc_F284:
                
                clr.w   d0
                move.b  (a0,d2.w),d0
                bsr.w   GetMoveCostToEntity
                move.b  d0,var_96(a6,d2.w)
                addi.w  #1,d2
                subq.w  #1,d6
                bne.s   loc_F284
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d1
                cmpi.w  #1,d1
                bgt.s   loc_F2A8
                bra.w   loc_F39A
loc_F2A8:
                
                subq.w  #2,d1
                move.b  #0,d2
                lea     ((TARGETS_LIST-$1000000)).w,a0
loc_F2B2:
                
                tst.b   d2
                bpl.s   loc_F2BA
                bra.w   loc_F2F6
loc_F2BA:
                
                move.b  #$FF,d2
                clr.w   d3
loc_F2C0:
                
                move.b  var_95(a6,d3.w),d4
                cmp.b   var_96(a6,d3.w),d4
                bcc.s   loc_F2E8
                move.b  var_95(a6,d3.w),d4
                move.b  var_96(a6,d3.w),var_95(a6,d3.w)
                move.b  d4,var_96(a6,d3.w)
                move.b  1(a0,d3.w),d4
                move.b  (a0,d3.w),1(a0,d3.w)
                move.b  d4,(a0,d3.w)
                move.w  d3,d2
loc_F2E8:
                
                tst.w   d1
                beq.s   loc_F2F2
                addq.w  #1,d3
                subq.w  #1,d1
                bra.s   loc_F2C0
loc_F2F2:
                
                move.w  d2,d1
                bra.s   loc_F2B2
loc_F2F6:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_F300
                bra.w   loc_F39A
loc_F300:
                
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetMoveType     
                lea     (off_D982).l,a1 
                lsl.l   #2,d1
                movea.l (a1,d1.l),a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                clr.w   d5
loc_F31A:
                
                clr.w   d0
                move.b  (a0,d5.w),d0
                bsr.w   GetClass        
                move.b  d1,d4
                clr.w   d3
                move.w  #$20,d2 
loc_F32C:
                
                cmp.b   (a1,d3.w),d4
                bne.s   loc_F33A
                move.b  d3,var_48(a6,d5.w)
                bra.w   loc_F340
loc_F33A:
                
                addq.b  #1,d3
                subq.w  #1,d2
                bne.s   loc_F32C
loc_F340:
                
                addq.b  #1,d5
                subq.w  #1,d6
                bne.s   loc_F31A
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                subi.w  #2,d6
                clr.w   d5
loc_F350:
                
                move.b  var_48(a6,d5.w),d0
                move.b  var_47(a6,d5.w),d1
                sub.b   d1,d0
                bpl.s   loc_F35E
                neg.b   d0
loc_F35E:
                
                cmpi.b  #1,d0
                bgt.s   loc_F392
                move.b  (a0,d5.w),d0
                sub.b   1(a0,d5.w),d0
                bpl.s   loc_F370
                neg.b   d0
loc_F370:
                
                cmpi.b  #3,d0
                bgt.s   loc_F392
                move.b  var_48(a6,d5.w),d0
                move.b  d0,var_47(a6,d5.w)
                move.b  d1,var_48(a6,d5.w)
                move.b  (a0,d5.w),d0
                move.b  1(a0,d5.w),d1
                move.b  d0,1(a0,d5.w)
                move.b  d1,(a0,d5.w)
loc_F392:
                
                addi.w  #1,d5
                dbf     d6,loc_F350
loc_F39A:
                
                clr.w   d6
                move.b  (a0),d6
loc_F39E:
                
                clr.w   d0
                move.b  d7,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.w   loc_F404
                bsr.w   GetEnemyIndex   
                cmpi.b  #ENEMY_KRAKEN_LEG,d1 ; HARDCODED enemy indexes
                bne.s   loc_F3B8
                bra.w   loc_F3D0
loc_F3B8:
                
                cmpi.b  #ENEMY_KRAKEN_ARM,d1
                bne.s   loc_F3C2
                bra.w   loc_F3D0
loc_F3C2:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   loc_F3CC
                bra.w   loc_F3D0
loc_F3CC:
                
                bra.w   loc_F404
loc_F3D0:
                
                jsr     j_ClearTerrainListObstructions
                move.b  d6,d0
                bsr.w   GetYPos
                move.w  d1,d4
                bsr.w   GetXPos
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     tbl_KrakenMoveCosts(pc), a5
                nop
                bra.w   loc_F43A
loc_F404:
                
                jsr     j_ClearTerrainListObstructions
                clr.w   d0
                move.b  d7,d0
                bsr.w   MemorizePath    
                move.b  d6,d0
                bsr.w   GetYPos
                move.w  d1,d4
                bsr.w   GetXPos
                move.w  d1,d3
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     ((MOVE_COSTS_LIST-$1000000)).w,a5
loc_F43A:
                
                bsr.w   MakeRangeLists
                move.b  d7,d0
                bsr.w   GetXPos
                move.w  d1,d2
                move.w  #4,d3
                bsr.w   GetYPos
                move.w  d2,d0
                bsr.w   j_makeEnemyMoveOrder
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F476        
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_F512
loc_F476:
                
                move.b  var_98(a6),d1   ; special AI d1 value between 0-2
                tst.b   d1
                beq.s   loc_F49A        ; if d1 = 0, then no additional work
                cmpi.b  #1,d1
                bne.s   loc_F48C
                move.b  d7,d0           ; d7 = character index of the moving unit
                jsr     j_GetMoveListForEnemyTarget ; if d1 = 1
loc_F48C:
                
                cmpi.b  #2,d1
                bne.s   loc_F49A
                move.b  d7,d0
                jsr     sub_1AC030      ; if d1 = 2
loc_F49A:
                
                move.w  d7,d0
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetsList
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetsList_Everybody
                move.w  #0,d3
                move.w  d7,d0
                bsr.w   UpdateTargetsList
                clr.w   d0
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                bne.s   loc_F4FE
                move.b  d7,d0
                bsr.w   GetEnemyDestination
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                bne.s   loc_F4FE
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #CODE_TERMINATOR_BYTE,(a0)
                lea     (CURRENT_BATTLEACTION).l,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   loc_F512
loc_F4FE:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
loc_F512:
                
                jsr     j_ClearTerrainListObstructions
                clr.w   d1
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function ExecuteAiCommand_Move


; =============== S U B R O U T I N E =======================================

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_F522:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,var_3(a6)
                move.w  #8,d6
                jsr     j_RandomUnderD6
                cmpi.b  #2,d7
                bne.s   loc_F554
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F554:
                
                cmpi.b  #4,d7
                bne.s   loc_F570
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F570:
                
                cmpi.b  #6,d7
                bne.s   loc_F58C
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F58C:
                
                bsr.w   sub_F8EA
                tst.b   d1
                beq.s   loc_F5AA
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F5AA:
                
                tst.b   d2
                bne.s   loc_F5C4
                clr.w   d0
                move.b  var_3(a6),d0
                jsr     j_GetCombatantStartingPositions
                move.b  d1,var_1(a6)
                move.b  d2,var_2(a6)
                bra.s   loc_F5DE
loc_F5C4:
                
                clr.w   d0
                move.b  var_3(a6),d0
                bsr.w   GetAiSpecialMoveOrders
                move.w  d1,d0
                jsr     j_GetEnemyAiTargetPosition
                move.b  d1,var_1(a6)
                move.b  d1,var_2(a6)
loc_F5DE:
                
                move.b  var_3(a6),d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                bsr.w   MakeTargetsList_Everybody
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  var_3(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                clr.w   d1
                move.b  (a0),d1
                andi.b  #$F,d1
                tst.b   d1
                bne.s   loc_F62A
                clr.w   d6
                move.w  #2,d6
                jsr     j_RandomUnderD6
                tst.b   d7
                bne.s   loc_F624
                move.b  #4,d1
                move.b  d1,(a0)
                bra.s   loc_F62A
loc_F624:
                
                move.b  #3,d1
                move.b  d1,(a0)
loc_F62A:
                
                move.b  d1,var_4(a6)
                clr.l   d5
                move.b  d1,d5
                subi.l  #1,d5
                clr.w   d1
                move.b  (a0),d1
                lsr.w   #4,d1
                move.w  d1,d6
                clr.w   d7
                lea     off_F78A(pc), a1
                nop
                move.b  var_4(a6),d7
                subi.b  #3,d7
                lsl.l   #2,d7
                movea.l (a1,d7.w),a1
                clr.w   d7
                clr.w   d0
                clr.w   d3
loc_F65C:
                
                clr.w   d1
                clr.w   d2
                move.b  (a1,d0.w),d1
                move.b  1(a1,d0.w),d2
                add.b   var_1(a6),d1
                add.b   var_2(a6),d2
                tst.b   d1
                bpl.s   loc_F678
                bra.w   loc_F6AC
loc_F678:
                
                cmpi.b  #$30,d1 
                ble.s   loc_F682
                bra.w   loc_F6AC
loc_F682:
                
                tst.b   d2
                bpl.s   loc_F68A
                bra.w   loc_F6AC
loc_F68A:
                
                cmpi.b  #$30,d2 
                ble.s   loc_F694
                bra.w   loc_F6AC
loc_F694:
                
                move.l  d3,-(sp)
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                move.l  (sp)+,d3
                cmpi.b  #$FF,d1
                bne.s   loc_F6AA
                bra.w   loc_F6AC
loc_F6AA:
                
                bset    d3,d7
loc_F6AC:
                
                addi.w  #2,d0
                addi.w  #1,d3
                dbf     d5,loc_F65C
                bclr    d6,d7
                tst.b   d7
                bne.s   loc_F6EA
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  var_3(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  #0,(a0)
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #CODE_TERMINATOR_BYTE,(a2)
                bra.w   loc_F782
loc_F6EA:
                
                move.w  d7,d5
                move.w  #3,d4
                clr.w   d0
loc_F6F2:
                
                lsr.w   #1,d5
                bcc.s   loc_F6FA
                addi.b  #1,d0
loc_F6FA:
                
                dbf     d4,loc_F6F2
                move.w  d7,d5
                move.w  d0,d6
                jsr     j_RandomUnderD6
                clr.l   d4
                move.b  var_4(a6),d4
                subi.w  #1,d4
                clr.w   d0
                clr.w   d1
loc_F716:
                
                lsr.w   #1,d5
                bcc.s   loc_F726
                cmp.b   d7,d0
                bne.s   loc_F722
                bra.w   loc_F72E
loc_F722:
                
                addi.b  #1,d0
loc_F726:
                
                addi.b  #1,d1
                dbf     d4,loc_F716
loc_F72E:
                
                lea     (byte_FFB1DC).l,a0
                clr.w   d0
                move.b  var_3(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  (a0),d0
                move.b  d1,d2
                lsl.w   #4,d2
                andi.b  #$F0,d2
                andi.b  #$F,d0
                or.b    d2,d0
                move.b  d0,(a0)
                clr.l   d7
                move.b  d1,d7
                lsl.w   #1,d7
                move.b  (a1,d7.w),d0
                move.b  1(a1,d7.w),d1
                add.b   var_1(a6),d0
                add.b   var_2(a6),d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
loc_F782:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_F522

off_F78A:       dc.l byte_F792
                dc.l byte_F798
byte_F792:      dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 1
                dc.b 1
                dc.b 1
byte_F798:      dc.b 0
                dc.b $FF
                dc.b $FF
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0

; =============== S U B R O U T I N E =======================================

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_F7A0:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,var_1(a6)
                move.b  d1,var_2(a6)
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   MemorizePath    
                move.b  var_2(a6),d0
                jsr     j_GetEnemyAiTargetPosition
                move.w  d1,d3
                move.w  d2,d4
                move.w  #$80,d0 
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN).l,a4
                lea     ((MOVE_COSTS_LIST-$1000000)).w,a5
                bsr.w   MakeRangeLists
                move.w  #$FFFF,d3
                bsr.w   sub_C900
                bsr.w   MakeTargetsList_Everybody
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   GetXPos
                move.w  d1,d2
                bsr.w   GetCurrentMOV
                move.w  d1,d3
                add.w   d3,d3
                bsr.w   GetYPos
                move.w  d2,d0
                bsr.w   j_makeEnemyMoveOrder
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F820
                bra.w   loc_F8E2
loc_F820:
                
                clr.w   d0
                move.b  var_1(a6),d0
                bsr.w   GetEnemyDestination
                move.b  d1,var_4(a6)
                move.b  d2,var_3(a6)
                move.w  #$FFFF,d3
                bsr.w   UpdateTargetsList_Allies
                move.b  var_1(a6),d0
                bsr.w   GetMoveInfo     
                bsr.w   MakeRangeLists
                move.w  #0,d3
                bsr.w   UpdateTargetsList_Allies
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                clr.w   d3
                clr.w   d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F868
                bra.w   loc_F8CE
loc_F868:
                
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F886
                bra.w   loc_F8CE
loc_F886:
                
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                move.w  #2,d3
                move.w  #2,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F8A4
                bra.w   loc_F8CE
loc_F8A4:
                
                move.b  var_4(a6),d1
                move.b  var_3(a6),d2
                move.w  #3,d3
                move.w  #3,d4
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.s   loc_F8C2
                bra.w   loc_F8CE
loc_F8C2:
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #$FF,(a0)
                bra.w   loc_F8E2
loc_F8CE:
                
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   MakeAiMoveString
loc_F8E2:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_F7A0


; =============== S U B R O U T I N E =======================================

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_F8EA:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-4
                move.w  d0,d7
                bsr.w   GetAiSpecialMoveOrders
                move.b  d1,var_3(a6)
                move.b  d2,var_4(a6)
                bsr.w   GetAiRegion     
                move.b  d1,var_1(a6)
                move.b  d2,var_2(a6)
                move.b  var_3(a6),d0
                cmpi.b  #$FF,d0
                beq.s   loc_F924
                cmpi.b  #$F,d1
                beq.s   loc_F924
                move.b  #1,d1
                bra.w   loc_F9AC
loc_F924:
                
                move.b  var_4(a6),d0
                cmpi.b  #$FF,d0
                beq.s   loc_F93C
                cmpi.b  #$F,d2
                beq.s   loc_F93C
                move.b  #1,d1
                bra.w   loc_F9AC
loc_F93C:
                
                move.b  var_3(a6),d0
                cmpi.b  #$FF,d0
                beq.s   loc_F96E
                move.b  var_1(a6),d0
                cmpi.b  #$F,d0
                bne.s   loc_F96E
                move.b  var_4(a6),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F96E
                move.b  var_2(a6),d0
                cmpi.b  #$F,d0
                beq.s   loc_F96E
                clr.w   d1
                move.b  #1,d2
                bra.w   loc_F9AC
loc_F96E:
                
                move.b  var_3(a6),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F98A
                move.b  var_1(a6),d0
                cmpi.b  #$F,d0
                beq.s   loc_F98A
                clr.w   d1
                clr.w   d2
                bra.w   loc_F9AC
loc_F98A:
                
                move.b  var_4(a6),d0
                cmpi.b  #$FF,d0
                bne.s   loc_F9A6
                move.b  var_2(a6),d0
                cmpi.b  #$F,d0
                beq.s   loc_F9A6
                clr.w   d1
                clr.w   d2
                bra.w   loc_F9AC
loc_F9A6:
                
                move.w  #1,d1
                clr.w   d2
loc_F9AC:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function sub_F8EA

