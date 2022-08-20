
; ASM FILE code\gameflow\battle\battleactions\dropenemyitem-standard.asm :
; Write Battlescene Command : Drop Enemy Item function

; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     A3 = scene action type in RAM
;     A4 = actor index in RAM
;     A5 = target index in RAM

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

WriteBattlesceneScript_EnemyDropItem:
                
                tst.b   (a4)
                bpl.s   @Continue       ; continue function if actor is an enemy
                tst.b   (a5)
                bmi.s   @Continue       ; continue function if target is an ally
                tst.b   targetDies(a2)
                bne.s   @Continue       ; continue function if target was not defeated
                rts
                
@Continue:      movem.l d0-d3/a0,-(sp)
                move.b  ((CURRENT_BATTLE-$1000000)).w,d3
                lea     tbl_EnemyItemDrops(pc), a0
                
@FindEntry_Loop:cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                beq.w   @Done
                cmp.b   (a0),d3
                bne.s   @Next           ; move on to next entry if current battle doesn't match
                move.b  (a5),d0
                cmp.b   ENEMYITEMDROP_OFFSET_ENTITY(a0),d0
                bne.s   @Next
                clr.w   d1
                move.b  ENEMYITEMDROP_OFFSET_ITEM(a0),d1
                bsr.w   GetItemSlotContainingIndex
                tst.w   d2
                bpl.s   @EntryFound
@Next:          adda.w  #ENEMYITEMDROP_ENTRY_SIZE,a0
                bra.s   @FindEntry_Loop
                
@EntryFound:    andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.w  d1,d3
                move.w  d2,d4
                lea     tbl_RandomItemDrops(pc),a0
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w   ; a0 = pointer to drop chance in 256
                bcs.s   @DropItem       ; immediately drop if not an item with random chance to drop
@DetermineRandomDrop:
                
                move.w  #256,d0
                jsr     (GenerateRandomOrDebugNumber).w
                cmp.b   (a0),d0
                bhi.s   @Done
                
@DropItem:      clr.w   d0
                move.b  ENEMYITEMDROP_OFFSET_FLAG(a0),d0
                lea     ((ENEMY_ITEM_DROPPED_FLAGS-$1000000)).w,a0
                divu.w  #8,d0
                adda.w  d0,a0
                swap    d0
                bset    d0,(a0)
                bne.s   @Done           ; done if item dropped flag was already set
                move.b  (a5),d0
                move.w  d4,d1
                bsr.w   RemoveItemBySlot
                move.b  (a4),d0
                bsr.w   GetCurrentHP
                beq.s   @AddRareItemToDeals
                move.w  d3,d1
                bsr.w   AddItem
                bne.s   @AddRareItemToDeals ; add rare item to deals section if character is unable to pick it up
                displayMessage #MESSAGE_BATTLE_DROPPED_ITEM,(a5),d1,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                displayMessage #MESSAGE_BATTLE_RECEIVED_ITEM,(a4),d1,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.s   @Done
@AddRareItemToDeals:
                
                move.w  d3,d1
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Done
                bsr.w   AddItemToDeals
                
@Done:          movem.l (sp)+,d0-d3/a0
@Return:        rts

    ; End of function WriteBattlesceneScript_EnemyDropItem

