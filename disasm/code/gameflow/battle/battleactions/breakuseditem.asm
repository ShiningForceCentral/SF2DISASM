
; ASM FILE code\gameflow\battle\battleactions\breakuseditem.asm :
; 0xBBE6..0xBCF0 : Write Battlescene Script : Break Used Item

; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_BreakUsedItem:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @Done           ; skip if action type is not "use item"
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d1
                jsr     GetEquipmentType
                tst.w   d2
                beq.w   @RemoveItem     ; remove item if neither weapon or ring
                jsr     GetItemDefAddress
                btst    #ITEMTYPE_BIT_BREAKABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   @Done           ; skip if item has no chance to break
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done           ; skip if user is an enemy
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d0
                btst    #ITEMENTRY_BIT_BROKEN,d0
                bne.w   @DestroyItem    ; destroy item if already broken
                moveq   #CHANCE_TO_BREAK_USED_ITEM,d0 ; 1/4 chance to break used item
                jsr     (GenerateRandomOrDebugNumber).w
                tst.b   d0
                bne.s   @Skip           ; skip if item does not break
                moveq   #0,d0
                jsr     GetItemBreakMessage(pc)
                nop
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     BreakItemBySlot 
@Skip:
                
                bra.w   @Done
@DestroyItem:
                
                moveq   #1,d0
                jsr     GetItemBreakMessage(pc)
                nop
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
                bra.w   @Done
@RemoveItem:
                
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteBattlesceneScript_BreakUsedItem


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     D0 = whether item is already damaged (0=no, 1=yes)
; 
; Out: D3 = message index

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

GetItemBreakMessage:
                
                movem.l d0/a0,-(sp)
                tst.b   d0
                bne.s   loc_BCB4
                tst.b   dodge(a2)
                bne.s   loc_BCAE        
loc_BCA8:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_BROKEN_START,d3 
                                                        ; But smoke rose from{N}the {ITEM}.{D1}
                bra.s   loc_BCB2
loc_BCAE:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_BROKEN_START,d3 
                                                        ; And smoke emerged from{N}the {ITEM}.{D1}
loc_BCB2:
                
                bra.s   loc_BCC4
loc_BCB4:
                
                tst.b   dodge(a2)
                bne.s   loc_BCC0        
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_DESTROYED_START,d3 
                                                        ; But, the {ITEM}{N}burst into flames.
                bra.s   loc_BCC4
loc_BCC0:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_DESTROYED_START,d3 
                                                        ; And the {ITEM}{N}burst into flames.
loc_BCC4:
                
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                lea     tbl_ItemBreakMessages(pc), a0
loc_BCD0:
                
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                beq.w   loc_BCEA
                cmp.b   (a0),d0
                beq.w   loc_BCE2
                addq.l  #2,a0
                bra.s   loc_BCD0
loc_BCE2:
                
                moveq   #0,d0
                move.b  1(a0),d0
                add.w   d0,d3
loc_BCEA:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetItemBreakMessage

