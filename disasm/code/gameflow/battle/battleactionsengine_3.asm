
; ASM FILE code\gameflow\battle\battleactionsengine_3.asm :
; 0xBD24..0xBE52 : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker idx
;     A5 = address in RAM of target idx

WriteSkirmishScript_EnemyDropItem:
                
                movem.l d0-d3/a0,-(sp)
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.w   loc_BE4C
                btst    #CHAR_BIT_ENEMY,(a5)
                beq.w   loc_BE4C
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.w   loc_BE4C
                move.b  ((CURRENT_BATTLE-$1000000)).w,d3
                lea     EnemyItemDrops(pc), a0
loc_BD48:
                
                cmp.b   (a0),d3
                bne.w   loc_BD6A
                move.b  (a5),d0
                cmp.b   1(a0),d0
                bne.w   loc_BD6A
                clr.w   d1
                move.b  2(a0),d1
                bsr.w   GetItemSlotContainingIndex
                cmpi.w  #CODE_NOTHING_WORD,d2
                bne.w   loc_BD78
loc_BD6A:
                
                adda.w  #4,a0
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                bne.s   loc_BD48
                bra.w   loc_BE4C
loc_BD78:
                
                move.w  d1,d3
                andi.w  #ITEM_MASK_IDX,d3
                move.w  d2,d4
                cmpi.w  #ITEM_TAROS_SWORD,d3 ; HARDCODED special items with 1/32 drop chances
                beq.w   loc_BD9C
                cmpi.w  #ITEM_IRON_BALL,d3
                beq.w   loc_BD9C
                cmpi.w  #ITEM_COUNTER_SWORD,d3
                beq.w   loc_BD9C
                bra.w   loc_BDC4
loc_BD9C:
                
                moveq   #$20,d0 
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.w   loc_BE4C
                bra.w   loc_BDC4
                jsr     j_IsSpecialBattle
                tst.w   d1
                beq.w   loc_BDC4        ; if battle index not in list
                moveq   #3,d0           ; else
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                beq.w   loc_BE4C
loc_BDC4:
                
                clr.w   d0
                move.b  3(a0),d0
                lea     ((ENEMY_ITEM_DROPS-$1000000)).w,a0
                divu.w  #8,d0
                adda.w  d0,a0
                swap    d0
                bset    d0,(a0)
                bne.w   loc_BE4C
                move.b  (a5),d0
                move.w  d4,d1
                jsr     RemoveItemBySlot
                move.b  (a4),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_BE36
                move.w  d3,d1
                jsr     AddItem         
                tst.b   d2
                bne.w   loc_BE36
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_DROPPEDITEM,(a6)+ ; {NAME} dropped{N}a {ITEM}.{D1}
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_PICKEDUPITEM,(a6)+ ; {NAME} received{N}the {ITEM}.
                move.b  #0,(a6)+
                move.b  (a4),(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   loc_BE4C
loc_BE36:
                
                move.w  d3,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_BE4C
                jsr     AddItemToDeals  
loc_BE4C:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteSkirmishScript_EnemyDropItem

