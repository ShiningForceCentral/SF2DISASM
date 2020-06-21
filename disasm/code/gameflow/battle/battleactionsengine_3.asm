
; ASM FILE code\gameflow\battle\battleactionsengine_3.asm :
; 0xBD24..0xBE52 : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker index
;     A5 = address in RAM of target index

WriteSkirmishScript_EnemyDropItem:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done           ; skip function if attacker is an enemy
                btst    #COMBATANT_BIT_ENEMY,(a5)
                beq.w   @Done           ; skip function if target is an ally
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.w   @Done           ; skip function if target was not defeated
                move.b  ((CURRENT_BATTLE-$1000000)).w,d3
                lea     EnemyItemDrops(pc), a0
@FindEntry_Loop:
                
                cmp.b   (a0),d3
                bne.w   @Next           ; move on to next entry if current battle doesn't match
                move.b  (a5),d0
                cmp.b   ENEMYITEMDROP_OFFSET_ENTITY(a0),d0
                bne.w   @Next
                clr.w   d1
                move.b  ENEMYITEMDROP_OFFSET_ITEM(a0),d1
                bsr.w   GetItemSlotContainingIndex
                cmpi.w  #CODE_NOTHING_WORD,d2
                bne.w   @EntryFound
@Next:
                
                adda.w  #ENEMYITEMDROP_ENTRY_SIZE,a0
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                bne.s   @FindEntry_Loop
                bra.w   @Done
@EntryFound:
                
                move.w  d1,d3
                andi.w  #ITEMENTRY_MASK_INDEX,d3
                move.w  d2,d4
                cmpi.w  #ITEM_TAROS_SWORD,d3 ; HARDCODED special items with 1/32 drop chances
                beq.w   @DetermineRandomDrop
                cmpi.w  #ITEM_IRON_BALL,d3
                beq.w   @DetermineRandomDrop
                cmpi.w  #ITEM_COUNTER_SWORD,d3
                beq.w   @DetermineRandomDrop
                bra.w   @DropItem
@DetermineRandomDrop:
                
                moveq   #ENEMYITEMDROP_RANDOM_CHANCE,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.w   @Done
                bra.w   @DropItem
                jsr     j_DoesBattleUpgrade
                tst.w   d1
                beq.w   @DropItem       ; if battle index not in list
                moveq   #3,d0           ; else
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                beq.w   @Done
@DropItem:
                
                clr.w   d0
                move.b  ENEMYITEMDROP_OFFSET_FLAG(a0),d0
                lea     ((ENEMY_ITEM_DROPS-$1000000)).w,a0
                divu.w  #8,d0
                adda.w  d0,a0
                swap    d0
                bset    d0,(a0)         ; set item dropped flag
                bne.w   @Done
                move.b  (a5),d0
                move.w  d4,d1
                jsr     RemoveItemBySlot
                move.b  (a4),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   @AddRareItemToDeals
                move.w  d3,d1
                jsr     AddItem         
                tst.b   d2
                bne.w   @AddRareItemToDeals ; add rare item to deals section if character is unable to pick it up
                displayMessage #MESSAGE_BATTLE_DROPPED_ITEM,(a5),d1,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                displayMessage #MESSAGE_BATTLE_RECEIVED_ITEM,(a4),d1,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@AddRareItemToDeals:
                
                move.w  d3,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Done
                jsr     AddItemToDeals  
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteSkirmishScript_EnemyDropItem

