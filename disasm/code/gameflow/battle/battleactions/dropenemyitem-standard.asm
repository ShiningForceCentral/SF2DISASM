
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

battlesceneScript_DropEnemyItem:
                
                ; all 3 conditions must be met for drop
                tst.b   (a4)
                bmi.w   @Return       ; continue function if actor is an enemy
                tst.b   (a5)
                bpl.w   @Return       ; continue function if target is an ally
                tst.b   targetDies(a2)
                beq.w   @Return       ; continue function if target was not defeated
                
@Continue:      movem.l d0-d3/a0-a1,-(sp)
                getSavedByte CURRENT_BATTLE, d3
                lea     table_EnemyItemDrops(pc), a1
                
@FindEntry_Loop:cmpi.w  #TERMINATOR_WORD,(a1)
                beq.w   @Done
                cmp.b   (a1),d3
                bne.s   @Next           ; move on to next entry if current battle doesn't match
                move.b  (a5),d0
                cmp.b   ENEMYITEMDROP_OFFSET_ENTITY(a1),d0
                bne.s   @Next
                clr.w   d1
                move.b  ENEMYITEMDROP_OFFSET_ITEM(a1),d1
                bsr.w   GetItemSlotContainingIndex
                tst.w   d2
                bpl.s   @EntryFound
@Next:          adda.w  #ENEMYITEMDROP_ENTRY_SIZE,a1
                bra.s   @FindEntry_Loop
                
@EntryFound:    andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.w  d1,d3
                move.w  d2,d4
                lea     table_RandomItemDrops(pc),a0
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w   ; a0 = pointer to drop chance in 256
                bcs.s   @DropItem       ; immediately drop if not an item with random chance to drop
@DetermineRandomDrop:
                
                move.w  #256,d0
                jsr     (GenerateRandomOrDebugNumber).w
                cmp.b   (a0),d0
                bhi.s   @Done
                
@DropItem:      clr.w   d0
                move.b  ENEMYITEMDROP_OFFSET_FLAG(a1),d0
                loadSavedDataAddress ENEMY_ITEM_DROPPED_FLAGS, a0
                divu.w  #8,d0
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d0,d0
            endif
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
            if (SEND_DROPPED_ITEMS_TO_CARAVAN=1)
                ; Try adding item to the Caravan first, and continue adding to deals if there is no room
                bsr.w   AddItemToCaravan
                bcc.s   @Done
            endif
                bsr.w   GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Done
                bsr.w   AddItemToDeals
                
@Done:          movem.l (sp)+,d0-d3/a0-a1
@Return:        rts

    ; End of function battlesceneScript_DropEnemyItem

