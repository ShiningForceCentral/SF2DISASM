
; ASM FILE code\gameflow\battle\battlefield\battlefieldengine_5.asm :
; 0xD1CC..0xD38A : Battlefield engine

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
                
                jsr     GetCurrentHp
                tst.w   d1
                bne.s   loc_D262
                bra.w   loc_D28A        ; combatant is dead, so skip
loc_D262:
                
                jsr     GetCombatantY
                move.b  d1,d2
                jsr     GetCombatantX
                bsr.w   GetClosestAttackPosition
                cmpi.b  #-1,d1
                beq.w   loc_D28A
                addq.w  #1,(a1)
                move.b  d0,(a2)+
                move.b  d0,d5
                bsr.w   GetMoveCostToDestination
                move.b  d0,(a3)+
                move.b  d5,d0
loc_D28A:
                
                addq.b  #1,d0
                dbf     d7,loc_D254
                
                movem.l (sp)+,d0-d5/d7-a3
                rts

    ; End of function GetTargetsReachableBySpell


; =============== S U B R O U T I N E =======================================

; Is combatant d0.w at less than half HP? Return CCR carry-bit clear if true.


IsCombatantAtLessThanHalfHp:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHp
@Continue:
                
                add.w   d2,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function IsCombatantAtLessThanHalfHp


; =============== S U B R O U T I N E =======================================

; unused


sub_D2D2:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   loc_D304
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   loc_D304

    ; End of function sub_D2D2


; =============== S U B R O U T I N E =======================================

; Set the carry flag if less than 2/3rds of defenders remaining HP
;   is expected to be taken by the attack.
; 
;   In: d0.w = defender index, d1.w = defenders theoretical remaining HP after attack


sub_D2F8:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHp
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
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   loc_D342

    ; End of function sub_D310


; =============== S U B R O U T I N E =======================================

; unused


sub_D326:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   loc_D342

    ; End of function sub_D326


; =============== S U B R O U T I N E =======================================

; unused


sub_D336:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHp
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
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
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
                jsr     GetMaxHp
                bra.w   loc_D37E
                movem.l d1-d2,-(sp)     ; unreachable code
                move.w  d1,d2
                jsr     GetCurrentHp
loc_D37E:
                
                mulu.w  #5,d2
                cmp.w   d2,d1           ; Compare defender's max HP to 5x their theoretical remaining HP after the attack
                movem.l (sp)+,d1-d2
                rts

    ; End of function sub_D362

