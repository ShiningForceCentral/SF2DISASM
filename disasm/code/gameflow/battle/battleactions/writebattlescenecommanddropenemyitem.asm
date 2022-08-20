
; ASM FILE code\gameflow\battle\battleactions\writebattlescenecommanddropenemyitem.asm :
; 0xBD24..0xBE52 : Write Battlescene Command : Drop Enemy Item function

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
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done           ; skip function if actor is an enemy
                btst    #COMBATANT_BIT_ENEMY,(a5)
                beq.w   @Done           ; skip function if target is an ally
                tst.b   targetDies(a2)
                beq.w   @Done           ; skip function if target was not defeated
                getSavedByte CURRENT_BATTLE, d3
                lea     tbl_EnemyItemDrops(pc), a0
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
                
            if (STANDARD_BUILD=1)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.w  d1,d3
                move.w  d2,d4
                lea     tbl_RandomItemDrops(pc),a0
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w   ; a0 = pointer to drop chance in 256
                bcs.s   @DropItem
            else
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
            endif
@DetermineRandomDrop:
                
            if (STANDARD_BUILD=1)
                move.w  #256,d0
                jsr     (GenerateRandomOrDebugNumber).w
                cmp.b   (a0),d0
                bhi.w   @Done
            else
                moveq   #ENEMYITEMDROP_RANDOM_CHANCE,d0
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.w   @Done
                bra.w   @DropItem
                jsr     j_DoesBattleUpgrade ; unreachable code
                tst.w   d1
                beq.w   @DropItem       ; if battle index not in list
                moveq   #3,d0           ; else
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                beq.w   @Done
            endif
@DropItem:
                
                clr.w   d0
                move.b  ENEMYITEMDROP_OFFSET_FLAG(a0),d0
                loadSavedDataAddress ENEMY_ITEM_DROPPED_FLAGS, a0
                divu.w  #8,d0
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d0,d0
            endif
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

    ; End of function WriteBattlesceneScript_EnemyDropItem

