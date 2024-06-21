
; ASM FILE code\gameflow\battle\battleactions\sorttargets.asm :
; 0xA9CC..0xAA98 : Sort targets list function

; =============== S U B R O U T I N E =======================================


battlesceneScript_SortTargets:
                
                movem.l d0-d2/d6-a0,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bls.w   loc_AA92
loc_A9DE:
                
                move.b  (a0,d7.w),d0
                bpl.s   loc_A9F8
                jsr     GetEnemy        
                cmpi.w  #ENEMY_BURST_ROCK,d1
                bne.s   loc_A9F8
                ori.b   #COMBATANT_MASK_SORT_BIT,d0
                move.b  d0,(a0,d7.w)
loc_A9F8:
                
                dbf     d7,loc_A9DE
                lea     ((TARGETS_LIST-$1000000)).w,a0
                moveq   #0,d0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
loc_AA0A:
                
                move.w  d0,d1
                addq.w  #1,d1
loc_AA0E:
                
                move.b  (a0,d0.w),d2
                cmp.b   (a0,d1.w),d2
                bcs.s   loc_AA22
                move.b  (a0,d1.w),(a0,d0.w)
                move.b  d2,(a0,d1.w)
loc_AA22:
                
                addq.w  #1,d1
                cmp.w   ((TARGETS_LIST_LENGTH-$1000000)).w,d1
                bcs.w   loc_AA0E
                addq.w  #1,d0
                dbf     d7,loc_AA0A
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
                moveq   #0,d6
loc_AA40:
                
                btst    #COMBATANT_BIT_SORT,(a0,d6.w)
                beq.s   loc_AA78
                move.b  (a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
                jsr     GetCurrentHp
                move.w  d1,d2
                move.b  1(a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
                jsr     GetCurrentHp
                cmp.w   d1,d2
                bcc.s   loc_AA78
                move.b  (a0,d6.w),d0
                move.b  1(a0,d6.w),(a0,d6.w)
                move.b  d0,1(a0,d6.w)
loc_AA78:
                
                addq.w  #1,d6
                dbf     d7,loc_AA40
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
loc_AA88:
                
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,(a0,d7.w)
loc_AA8E:
                
                dbf     d7,loc_AA88
loc_AA92:
                
                movem.l (sp)+,d0-d2/d6-a0
                rts

    ; End of function battlesceneScript_SortTargets

