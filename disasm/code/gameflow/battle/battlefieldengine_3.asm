
; ASM FILE code\gameflow\battle\battlefieldengine_3.asm :
; 0xCDEA..0xD38A : Battlefield engine

; =============== S U B R O U T I N E =======================================

; If the target for healing uses AI #14 or #15, then return the maximum
;  priority of 13.
; 
; If not, then return a priority based upon the movetype for the enemy,
;  which approximately goes highest to lowest priority of
;  healer, mage, archer, flyer, melee, aquatic.
; 
; Specific decending priority for each move type is in tbl_MovetypesHealTargetPriority.
; 
; The first byte in that table is $FF to ensure there is never a movetype
;  match and therefore nothing has a priority higher than AI #14 or AI #15.
; 
;       In: D0 = target index
;       Out: D6 = target priority


CalculateHealTargetPriority:
                
                movem.l d0-d5/d7-a6,-(sp)
                bsr.w   GetAiCommandset 
                cmpi.w  #13,d1
                bne.s   loc_CE00
                move.w  #13,d6
                bra.w   loc_CE30
loc_CE00:
                
                cmpi.w  #14,d1
                bne.s   loc_CE0E
                move.w  #13,d6
                bra.w   loc_CE30
loc_CE0E:
                
                bsr.w   GetMoveType     
                lea     (tbl_MovetypesHealTargetPriority).l,a0
                move.w  #13,d6
                clr.w   d0
loc_CE1E:
                
                
                ; Cycle through each move type in decreasing priority until there is a match.
                ; Priority order roughly follows highest to lowest priority of
                ;  healer, mage, archer, flyer, melee, aquatic.
                cmp.b   (a0,d0.w),d1
                bne.s   loc_CE28
                bra.w   loc_CE30        ; Match found! Return the value in d6.
loc_CE28:
                
                addi.w  #1,d0
                subq.w  #1,d6
                bne.s   loc_CE1E        ; No match found, so decrement and check again.
loc_CE30:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function CalculateHealTargetPriority


; =============== S U B R O U T I N E =======================================

; Extra adjustments on target priority if the attacker is an ally 
;  (does not apply to enemies.)
; 
; In: D0 = defender index
;     D1 = defenders remaining HP after taking theoretical max damage from an attack (prior routines)
;     D4 = attacker index (the one attacking or casting the offensive spell)
;     D7 = who the enemy targeted last
; 
; Out: D6 = priority of the action (basically the total max damage output of the action plus adjustments)


AdjustTargetPriorityForAlly:
                
                movem.l d0-d5/d7-a6,-(sp)
                clr.w   d5
                move.b  d0,d5
                move.w  d4,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   loc_CE4A
                bra.w   loc_CE90
loc_CE4A:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_CE56        ; if attacker is not inflicted with Muddle2
                bra.w   loc_CE90
loc_CE56:
                
                cmpi.b  #1,d7
                bne.s   loc_CE66
                lea     (byte_DA22).l,a4
                bra.w   loc_CE80
loc_CE66:
                
                clr.l   d0
                move.b  d4,d0           ; d0 = attacker index
                jsr     GetMoveType     
                clr.l   d3
                move.b  d1,d3
                lea     (off_D9C2).l,a4 
                lsl.l   #2,d3
                movea.l (a4,d3.l),a4
loc_CE80:
                
                clr.w   d0
                move.b  d5,d0           ; d0 = defender index
                bsr.w   GetClass        
                clr.w   d2
                move.b  (a4,d1.w),d2
                add.w   d2,d6           ; d6 = priority of the action
loc_CE90:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AdjustTargetPriorityForAlly


; =============== S U B R O U T I N E =======================================


sub_CE96:
                
                movem.l d0/d3-a6,-(sp)
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
                bsr.w   MakeTargetsList_Everybody
                moveq   #0,d3
                moveq   #0,d4
                move.w  d1,d5
                move.w  d2,d6
                bsr.w   GetClosestAttackPosition
                cmpi.w  #$FFFF,d1
                bne.w   loc_CECC
                moveq   #1,d3
                moveq   #1,d4
                move.w  d5,d1
                move.w  d6,d2
                bsr.w   GetClosestAttackPosition
loc_CECC:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function sub_CE96


; =============== S U B R O U T I N E =======================================

; Get highest usable level of spell D1, considering current MP and highest known level
; 
;       In: D0 = combatant index
;           D1 = spell index
; 
;       Out: D1 = spell index


GetHighestUsableSpellLevel:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d2
                jsr     GetCurrentMP
                move.w  d1,d3
                move.w  d2,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                lsr.w   #6,d2
                andi.w  #3,d2
loc_CEEC:
                
                moveq   #0,d1
                add.w   d2,d1
                lsl.w   #6,d1
                add.w   d4,d1
                jsr     FindSpellDefAddress
                cmp.b   SPELLDEF_OFFSET_MP_COST(a0),d3
                bcc.w   loc_CF08
                dbf     d2,loc_CEEC
                moveq   #SPELL_NOTHING,d1
loc_CF08:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetHighestUsableSpellLevel


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = spell index
; 
; Out: D1 = spell index
;      D2 = slot


GetSlotContainingSpell:
                
                movem.l d0/d3-a6,-(sp)
                andi.b  #SPELLENTRY_MASK_INDEX,d1
                move.b  d1,d4
                moveq   #0,d3
loc_CF1A:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d2
                andi.b  #SPELLENTRY_MASK_INDEX,d2
                cmp.b   d4,d2
                beq.w   loc_CF38
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_CF1A
                moveq   #SPELL_NOTHING,d1
loc_CF38:
                
                move.w  d3,d2
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetSlotContainingSpell


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = item index
; 
; Out: D1 = item index
;      D2 = slot


GetSlotContainingItem:
                
                movem.l d0/d3-a6,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.w  d1,d4
                moveq   #0,d3
loc_CF4C:
                
                move.w  d3,d1
                jsr     GetItemAndNumberHeld
                move.w  d1,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmp.w   d4,d2
                beq.w   loc_CF6C
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_CF4C
                move.w  #ITEM_NOTHING,d1
loc_CF6C:
                
                move.w  d3,d2
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetSlotContainingItem


; =============== S U B R O U T I N E =======================================


GetNextUsableAttackSpell:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d7
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_CF88
                move.w  #1,d7
loc_CF88:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   loc_CFA0
                bra.w   loc_CFFC
loc_CFA0:
                
                tst.b   d7
                beq.s   loc_CFEA
                move.w  d1,d5
                andi.b  #SPELLENTRY_MASK_INDEX,d5
                cmpi.b  #SPELL_BLAZE,d5 ; HARDCODED spell indexes
                bne.s   loc_CFB4
                bra.w   loc_CFEA
loc_CFB4:
                
                cmpi.b  #SPELL_FREEZE,d5
                bne.s   loc_CFBE
                bra.w   loc_CFEA
loc_CFBE:
                
                cmpi.b  #SPELL_BOLT,d5
                bne.s   loc_CFC8
                bra.w   loc_CFEA
loc_CFC8:
                
                cmpi.b  #SPELL_BLAST,d5
                bne.s   loc_CFD2
                bra.w   loc_CFEA
loc_CFD2:
                
                cmpi.b  #SPELL_KATON,d5
                bne.s   loc_CFDC
                bra.w   loc_CFEA
loc_CFDC:
                
                cmpi.b  #SPELL_RAIJIN,d5
                bne.s   loc_CFE6
                bra.w   loc_CFEA
loc_CFE6:
                
                bra.w   loc_CFFC
loc_CFEA:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                beq.w   loc_D00C
loc_CFFC:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   loc_CF88
                move.w  #SPELL_NOTHING,d1
                bra.w   loc_D012
loc_D00C:
                
                bsr.w   GetHighestUsableSpellLevel
                move.w  d3,d2
loc_D012:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackSpell


; =============== S U B R O U T I N E =======================================

; Get next healing spell known by the combatant.
; 
;       In: D0 = entity index, D3 = starting spell slot
;       Out: D1 = spell index, D2 = spell slot


GetNextHealingSpell:
                
                movem.l d0/d3-a6,-(sp)
@Start:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   @Continue
                bra.w   @NextSlot
@Continue:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                beq.w   @GetSpellSlot
@NextSlot:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Start
                
                move.w  #SPELL_NOTHING,d1
                bra.w   @Done
@GetSpellSlot:
                
                move.w  d3,d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextHealingSpell


; =============== S U B R O U T I N E =======================================


GetNextStatusSpell:
                
                movem.l d0/d3-a6,-(sp)
loc_D066:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   loc_D07E
                bra.w   loc_D094
loc_D07E:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_STATUS,d2
                beq.w   loc_D0A4
loc_D094:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   loc_D066
                move.w  #SPELL_NOTHING,d1
                bra.w   loc_D0A6
loc_D0A4:
                
                move.w  d3,d2
loc_D0A6:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextStatusSpell


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
; BLAZE/FREEZE/BOLT/BLAST (HARDCODED spell indexes)
; 
;       In: D0 = combatant index, D3 = starting item slot
;       Out: D1 = item index, D2 = item slot


GetNextUsableAttackItem:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d6
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_D0C0
                move.w  #1,d6
loc_D0C0:
                
                move.w  d3,d1
                jsr     GetItemAndNumberHeld
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   loc_D0D2
                bra.w   loc_D0DC
loc_D0D2:
                
                jsr     IsItemUsableInBattle
                bcs.w   loc_D0E8
loc_D0DC:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   loc_D0C0
                bra.w   loc_D156
loc_D0E8:
                
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                bne.w   loc_D0F8
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.w   loc_D156
loc_D0F8:
                
                jsr     GetItemDefAddress
                move.w  d1,d7
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                tst.b   d6
                beq.s   loc_D13C
                move.w  d1,d5
                andi.b  #SPELLENTRY_MASK_INDEX,d5
                cmpi.b  #SPELL_BLAZE,d5 ; HARDCODED spell indexes
                bne.s   loc_D11A
                bra.w   loc_D13C
loc_D11A:
                
                cmpi.b  #SPELL_FREEZE,d5
                bne.s   loc_D124
                bra.w   loc_D13C
loc_D124:
                
                cmpi.b  #SPELL_BOLT,d5
                bne.s   loc_D12E
                bra.w   loc_D13C
loc_D12E:
                
                cmpi.b  #SPELL_BLAST,d5
                bne.s   loc_D138
                bra.w   loc_D13C
loc_D138:
                
                bra.w   loc_D156
loc_D13C:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                bne.w   loc_D156
                move.w  d3,d2
                move.w  d7,d1
                bra.w   loc_D15A
loc_D156:
                
                move.w  #ITEM_NOTHING,d1
loc_D15A:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackItem


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
; a healing spell. <HARDCODED>
; 
; This only looks for Healing Rain as a valid healing item,
; but is easy enough to change to allow the AI to use healing items.
; 
;       In: D0 = combatant index, D3 = starting item slot
;       Out: D1 = item entry, D2 = item slot


GetNextUsableHealingItem:
                
                movem.l d0/d3-a6,-(sp)
@Start:
                
                move.w  d3,d1
                jsr     GetItemAndNumberHeld
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   @Continue
                bra.w   @NextSlot
@Continue:
                
                move.w  d1,d7
                jsr     IsItemUsableInBattle
                bcc.s   @NextSlot
                cmpi.b  #ITEM_HEALING_RAIN,d7
                beq.s   @CheckSpellType ; Right now the logic requires the item to be Healing Rain to count as a healing item.
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.w   @NextSlot
@CheckSpellType:
                
                jsr     GetItemDefAddress
                move.w  d1,d7           ; D7 = copy of item entry
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                bne.w   @NextSlot
                move.w  d3,d2
                move.w  d7,d1
                bra.w   @Done
@NextSlot:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   @Start
                move.w  #ITEM_NOTHING,d1
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableHealingItem


; =============== S U B R O U T I N E =======================================


GetTargetsReachableByAttack:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((FF8804_LOADING_SPACE-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_ATTACK_LIST-$1000000)).w,a2
                lea     ((ATTACK_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a3
                bsr.w   GetAttackRange  
                bra.w   MakeReachableTargetsList

    ; End of function GetTargetsReachableByAttack


; =============== S U B R O U T I N E =======================================


GetTargetsReachableByItem:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((TARGETS_REACHABLE_BY_ITEM_NUMBER-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_ITEM_LIST-$1000000)).w,a2
                lea     ((ITEM_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a3
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
                bra.w   MakeReachableTargetsList

    ; End of function GetTargetsReachableByItem


; =============== S U B R O U T I N E =======================================


GetTargetsReachableBySpell:
                
                movem.l d0-d5/d7-a3,-(sp)
                lea     ((TARGETS_REACHABLE_BY_SPELL_NUMBER-$1000000)).w,a1
                lea     ((TARGETS_REACHABLE_BY_SPELL_LIST-$1000000)).w,a2
                lea     ((SPELL_MOVEMENT_TO_REACHABLE_TARGETS-$1000000)).w,a3
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
MakeReachableTargetsList:
                
                bsr.w   CheckMuddled2   
                tst.b   d1
                beq.s   loc_D23A
                eori.b  #COMBATANT_MASK_ENEMY_BIT,d0 ; flip enemy bit, to get the opposite type when muddled
loc_D23A:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   loc_D248
                moveq   #COMBATANT_ALLIES_START,d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
                bra.s   loc_D250
loc_D248:
                
                move.b  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d7
loc_D250:
                
                move.w  #0,(a1)
loc_D254:
                
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   loc_D262
                bra.w   loc_D28A        ; combatant is dead, so skip
loc_D262:
                
                jsr     GetYPos
                move.b  d1,d2
                jsr     GetXPos
                bsr.w   GetClosestAttackPosition
                cmpi.b  #$FF,d1
                beq.w   loc_D28A
                addq.w  #1,(a1)
                move.b  d0,(a2)+
                move.b  d0,d5
                bsr.w   GetDestinationMoveCost
                move.b  d0,(a3)+
                move.b  d5,d0
loc_D28A:
                
                addq.b  #1,d0
                dbf     d7,loc_D254
                
                movem.l (sp)+,d0-d5/d7-a3
                rts

    ; End of function GetTargetsReachableBySpell


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; Out: carry clear if true


IsCombatantAtLessThanHalfHP:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   @Continue
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   @Continue
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
@Continue:
                
                add.w   d2,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function IsCombatantAtLessThanHalfHP


; =============== S U B R O U T I N E =======================================


sub_D2D2:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D304
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D304

    ; End of function sub_D2D2


; =============== S U B R O U T I N E =======================================

; In: D0 = defender index
;     D1 = defenders theoretical remaining HP after attack
; 
; Set the carry flag if less than 2/3rds of defenders remaining HP
;  is expected to be taken by the attack.


sub_D2F8:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
loc_D304:
                
                mulu.w  #3,d2
                cmp.w   d2,d1           ; Compare defender's current HP to 3x their theoretical remaining HP after the attack
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D2F8


; =============== S U B R O U T I N E =======================================

; unused


sub_D310:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D342

    ; End of function sub_D310


; =============== S U B R O U T I N E =======================================

; unused


sub_D326:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D342

    ; End of function sub_D326


; =============== S U B R O U T I N E =======================================

; unused


sub_D336:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
loc_D342:
                
                lsl.w   #2,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D336


; =============== S U B R O U T I N E =======================================

; unused


sub_D34C:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D37E

    ; End of function sub_D34C


; =============== S U B R O U T I N E =======================================

; In: D0 = defender index
;     D1 = defenders theoretical remaining HP after attack
; 
; Set the carry flag if the defender is expected to have more than 20%
;  of max HP remain after attack.


sub_D362:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   loc_D37E
                movem.l d1-d2,-(sp)     ; unreachable code
                move.w  d1,d2
                jsr     GetCurrentHP
loc_D37E:
                
                mulu.w  #5,d2
                cmp.w   d2,d1           ; Compare defender's max HP to 5x their theoretical remaining HP after the attack
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D362

