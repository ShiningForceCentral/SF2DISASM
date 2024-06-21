
; ASM FILE code\gameflow\battle\battleactions\dropenemyitem.asm :
; 0xBD24..0xBE52 : Write Battlescene Command : Drop Enemy Item function

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a3 = battleaction type pointer
;     a4 = actor index pointer
;     a5 = target index pointer

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

battlesceneScript_DropEnemyItem:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done           ; skip function if actor is an enemy
                btst    #COMBATANT_BIT_ENEMY,(a5)
                beq.w   @Done           ; skip function if target is an ally
                tst.b   targetDies(a2)
                beq.w   @Done           ; skip function if target was not defeated
                
                move.b  ((CURRENT_BATTLE-$1000000)).w,d3
                lea     table_EnemyItemDrops(pc), a0
@FindEntry_Loop:
                
                cmp.b   (a0),d3
                bne.w   @Next           ; move on to next entry if current battle doesn't match
                move.b  (a5),d0
                cmp.b   ENEMYITEMDROP_OFFSET_ENTITY(a0),d0
                bne.w   @Next
                clr.w   d1
                move.b  ENEMYITEMDROP_OFFSET_ITEM(a0),d1
                bsr.w   GetItemSlotContainingIndex
                cmpi.w  #-1,d2
                bne.w   @EntryFound
@Next:
                
                adda.w  #ENEMYITEMDROP_ENTRY_SIZE,a0
                cmpi.w  #-1,(a0)
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
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.w   @Done
                bra.w   @DropItem
                jsr     j_IsBattleUpgradable ; unreachable code
                tst.w   d1
                beq.w   @DropItem       ; if battle index not in list
                moveq   #3,d0           ; else
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                beq.w   @Done
@DropItem:
                
                clr.w   d0
                move.b  ENEMYITEMDROP_OFFSET_FLAG(a0),d0
                lea     ((ENEMY_ITEM_DROPPED_FLAGS-$1000000)).w,a0
                divu.w  #8,d0
                adda.w  d0,a0
                swap    d0
                bset    d0,(a0)
                bne.w   @Done           ; done if item dropped flag was already set
                move.b  (a5),d0
                move.w  d4,d1
                jsr     RemoveItemBySlot
                move.b  (a4),d0
                jsr     GetCurrentHp
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

    ; End of function battlesceneScript_DropEnemyItem

