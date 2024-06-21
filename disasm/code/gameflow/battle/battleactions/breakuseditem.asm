
; ASM FILE code\gameflow\battle\battleactions\breakuseditem.asm :
; 0xBBE6..0xBCF0 : Write Battlescene Script : Break Used Item

; =============== S U B R O U T I N E =======================================


battlesceneScript_BreakUsedItem:
                
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
                bne.s   @Goto_Done      ; skip if item does not break
                moveq   #0,d0
                jsr     GetItemBreakMessage(pc)
                nop
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  BATTLEACTION_OFFSET_ITEM_SLOT(a3),d1
                jsr     BreakItemBySlot 
@Goto_Done:
                
                bra.w   @Done
@DestroyItem:
                
                moveq   #1,d0
                jsr     GetItemBreakMessage(pc)
                nop
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  BATTLEACTION_OFFSET_ITEM_SLOT(a3),d1
                jsr     RemoveItemBySlot
                bra.w   @Done
@RemoveItem:
                
                move.b  (a4),d0
                move.w  BATTLEACTION_OFFSET_ITEM_SLOT(a3),d1
                jsr     RemoveItemBySlot
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_BreakUsedItem


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d0.b = whether item is already damaged (0=no, 1=yes)
; 
; Out: d3.w = message index

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttackToggle = -14
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
                bne.s   @Destroy
                tst.b   dodge(a2)
                bne.s   @BreakAndMiss   
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_BROKEN_START,d3 
                                                        ; But smoke rose from{N}the {ITEM}.{D1}
                bra.s   @Goto_FindItem
@BreakAndMiss:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_BROKEN_START,d3 
                                                        ; And smoke emerged from{N}the {ITEM}.{D1}
@Goto_FindItem:
                
                bra.s   @FindItem
@Destroy:
                
                tst.b   dodge(a2)
                bne.s   @DestroyAndMiss 
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_DESTROYED_START,d3 
                                                        ; But, the {ITEM}{N}burst into flames.
                bra.s   @FindItem
@DestroyAndMiss:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_DESTROYED_START,d3 
                                                        ; And the {ITEM}{N}burst into flames.
@FindItem:
                
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                lea     table_ItemBreakMessages(pc), a0
@FindItem_Loop:
                
                cmpi.w  #-1,(a0)
                beq.w   @Done
                cmp.b   (a0),d0
                beq.w   @Found
                addq.l  #ITEMENTRY_SIZE,a0
                bra.s   @FindItem_Loop
@Found:
                
                moveq   #0,d0
                move.b  1(a0),d0
                add.w   d0,d3
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetItemBreakMessage

