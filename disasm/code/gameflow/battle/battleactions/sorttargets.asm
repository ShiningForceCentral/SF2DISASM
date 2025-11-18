
; ASM FILE code\gameflow\battle\battleactions\sorttargets.asm :
; 0xA9CC..0xAA98 : Sort targets list function

; =============== S U B R O U T I N E =======================================


battlesceneScript_SortTargets:
                
                movem.l d0-d2/d6-a0,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bls.w   @Done
@SetSortBit_Loop:
                
                move.b  (a0,d7.w),d0
                bpl.s   @NextTarget
                jsr     GetEnemy        
                cmpi.w  #ENEMY_BURST_ROCK,d1
                bne.s   @NextTarget
                ori.b   #COMBATANT_MASK_SORT_BIT,d0  ; set bit to ensure a Burst Rock is the final target (so it can explode)
                move.b  d0,(a0,d7.w)
@NextTarget:
                
                dbf     d7,@SetSortBit_Loop
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                moveq   #0,d0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
@SortTargets_Loop:
                
                ; Sort targets by combatant index (Burst Rocks put at end)
                move.w  d0,d1
                addq.w  #1,d1
@SortTargets_InnerLoop:
                
                move.b  (a0,d0.w),d2
                cmp.b   (a0,d1.w),d2
                bcs.s   @NextEntry
                move.b  (a0,d1.w),(a0,d0.w)
                move.b  d2,(a0,d1.w)
@NextEntry:
                
                addq.w  #1,d1
                cmp.w   ((TARGETS_LIST_LENGTH-$1000000)).w,d1
                bcs.w   @SortTargets_InnerLoop
                addq.w  #1,d0
                dbf     d7,@SortTargets_Loop
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
                moveq   #0,d6
@SortTargets_Loop_2:
                
                ; Sort enemy targets by health (weakest Burst Rock put at end)
                btst    #COMBATANT_BIT_SORT,(a0,d6.w)
                beq.s   @NextEntry_2
                move.b  (a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
                jsr     GetCurrentHp
                move.w  d1,d2
                move.b  1(a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
                jsr     GetCurrentHp
                cmp.w   d1,d2
                bcc.s   @NextEntry_2
                move.b  (a0,d6.w),d0
                move.b  1(a0,d6.w),(a0,d6.w)
                move.b  d0,1(a0,d6.w)
@NextEntry_2:
                
                addq.w  #1,d6
                dbf     d7,@SortTargets_Loop_2
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@ClearSortBit_Loop:
                
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,(a0,d7.w)
                dbf     d7,@ClearSortBit_Loop
@Done:
                
                movem.l (sp)+,d0-d2/d6-a0
                rts

    ; End of function battlesceneScript_SortTargets

