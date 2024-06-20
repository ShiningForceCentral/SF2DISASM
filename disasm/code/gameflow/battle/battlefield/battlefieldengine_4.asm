
; ASM FILE code\gameflow\battle\battlefield\battlefieldengine_4.asm :
; 0xCDEA..0xCF74 : Battlefield engine

; =============== S U B R O U T I N E =======================================

; If the target for healing uses AI #14 or #15, then return the maximum
;  priority of 13.
; 
; If not, then return a priority based upon the movetype for the enemy,
;  which approximately goes highest to lowest priority of
;  healer, mage, archer, flyer, melee, aquatic.
; 
; Specific decending priority for each move type is in table_HealPriorityMoveTypes.
; 
; The first byte in that table is $FF to ensure there is never a movetype
;  match and therefore nothing has a priority higher than AI #14 or AI #15.
; 
;       In: D0 = target index
;       Out: D6 = target priority


CalculateHealTargetPriority:
                
                movem.l d0-d5/d7-a6,-(sp)
                bsr.w   GetAiCommandset 
                cmpi.w  #AICOMMANDSET_CRITICAL,d1
                bne.s   @CheckLeaderAi
                move.w  #MOVETYPE_TOTAL,d6
                bra.w   @Done
@CheckLeaderAi:
                
                cmpi.w  #AICOMMANDSET_LEADER,d1
                bne.s   @PrioritizeByMoveType
                move.w  #MOVETYPE_TOTAL,d6
                bra.w   @Done
@PrioritizeByMoveType:
                
                bsr.w   GetMoveType     
                lea     (table_HealPriorityMoveTypes).l,a0
                move.w  #MOVETYPE_TOTAL,d6
                clr.w   d0
@FindHealPriority_Loop:
                
                
                ; Cycle through each move type in decreasing priority until there is a match.
                ; Priority order roughly follows highest to lowest priority of
                ;  healer, mage, archer, flyer, melee, aquatic.
                cmp.b   (a0,d0.w),d1
                bne.s   @NextMoveType
                bra.w   @Done           ; Match found! Return the value in d6.
@NextMoveType:
                
                addi.w  #1,d0
                subq.w  #1,d6
                bne.s   @FindHealPriority_Loop ; No match found, so decrement and check again.
@Done:
                
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
                lea     (table_DA22).l,a4
                bra.w   loc_CE80
loc_CE66:
                
                clr.l   d0
                move.b  d4,d0           ; d0 = attacker index
                jsr     GetMoveType
                clr.l   d3
                move.b  d1,d3
                lea     (pt_D9C2).l,a4  
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
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   PopulateTargetsArrayWithAllCombatants
                moveq   #0,d3
                moveq   #0,d4
                move.w  d1,d5
                move.w  d2,d6
                bsr.w   GetClosestAttackPosition
                cmpi.w  #-1,d1
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

; Get highest usable level of spell D1, considering current MP and highest known level.
; 
;   In: d0.w = caster index, d1.w = highest known level spell entry, d4.w = spell index
;   Out: d1.w = highest usuable level spell entry


GetHighestUsableSpellLevel:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d2
                jsr     GetCurrentMp
                move.w  d1,d3
                move.w  d2,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                lsr.w   #SPELLENTRY_OFFSET_LV,d2
                andi.w  #SPELLENTRY_LOWERMASK_LV,d2
@Loop:
                
                moveq   #0,d1
                add.w   d2,d1
                lsl.w   #SPELLENTRY_OFFSET_LV,d1
                add.w   d4,d1
                jsr     FindSpellDefAddress
                cmp.b   SPELLDEF_OFFSET_MP_COST(a0),d3
                bcc.w   @Break
                dbf     d2,@Loop
                
                moveq   #SPELL_NOTHING,d1
@Break:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetHighestUsableSpellLevel

    if (STANDARD_BUILD=1)
    else

; =============== S U B R O U T I N E =======================================

; unused
; 
;   In: d0.b = combatant index, d1.b = spell index
;   Out: d1.w = spell index, d2.w = slot

;unused
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

; unused
; 
;   In: d0.b = combatant index, d1.b = item index
;   Out: d1.w = item index, d2.w = slot

;unused
GetSlotContainingItem:
                
                movem.l d0/d3-a6,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.w  d1,d4
                moveq   #0,d3
loc_CF4C:
                
                move.w  d3,d1
                jsr     GetItemBySlotAndHeldItemsNumber
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
    
    endif
