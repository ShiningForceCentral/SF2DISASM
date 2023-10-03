
; ASM FILE code\gameflow\battle\battleactions\battleactionsengine_4.asm :
; 0xA872..0xAAB6 : Battleactions Engine, part 4

; =============== S U B R O U T I N E =======================================


CalculateHealingExp:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   @Skip           ; skip if enemy
                
                ; Check if healer class
            if (STANDARD_BUILD=1)
                lea     table_HealerClasses(pc),a0
                bsr.w   GetClass
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Skip
            else
                jsr     GetClass        
                cmpi.b  #CLASS_PRST,d1  ; HARDCODED healer class indexes
                beq.w   @Continue
                cmpi.b  #CLASS_VICR,d1
                beq.w   @Continue
                cmpi.b  #CLASS_MMNK,d1
                beq.w   @Continue
                bra.w   @Skip           ; skip if not a healer class
            endif
@Continue:
                
                move.b  (a5),d0
                jsr     GetMaxHp
                tst.w   d1
                beq.w   @Skip           ; safety measure to prevent division by 0
                move.w  #25,d5
                mulu.w  d6,d5
                divu.w  d1,d5
                cmpi.w  #10,d5
                bcc.s   @Add
                moveq   #10,d5
@Add:
                
                bsr.w   AddExpAndApplyHealingCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CalculateHealingExp


; =============== S U B R O U T I N E =======================================


battlesceneScript_CalculateDamageExp:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Skip           ; skip function if actor is an enemy
                move.b  (a5),d0
                jsr     GetMaxHp
                tst.w   d1
                beq.w   @Skip           ; skip function to prevent division by zero error
                bsr.w   battlesceneScript_GetKillExp
                mulu.w  d6,d5
                divu.w  d1,d5
                bsr.w   AddExpAndApplyPerActionCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_CalculateDamageExp


; =============== S U B R O U T I N E =======================================


AddStatusEffectSpellExp:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done
                moveq   #STATUSEFFECT_SPELL_EXP,d5
                bsr.w   AddExpAndApplyPerActionCap
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function AddStatusEffectSpellExp


; =============== S U B R O U T I N E =======================================


battlesceneScript_AddExpAndGoldForKill:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Skip           ; skip if actor is an enemy
                bsr.w   battlesceneScript_GetKillExp
                bsr.w   AddExpAndApplyPerActionCap
                move.b  (a5),d0
                bpl.s   @Skip
                jsr     GetEnemy        
                add.w   d1,d1
                lea     table_EnemyGold(pc), a0
                adda.w  d1,a0
                move.w  (a0),d0
                add.w   d0,((BATTLESCENE_GOLD-$1000000)).w
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_AddExpAndGoldForKill


; =============== S U B R O U T I N E =======================================


AddExpAndApplyPerActionCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #PER_ACTION_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
                ble.s   @Return
                move.w  #PER_ACTION_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
@Return:
                
                rts

    ; End of function AddExpAndApplyPerActionCap


; =============== S U B R O U T I N E =======================================


AddExpAndApplyHealingCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #HEALING_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
                ble.s   @Return
                move.w  #HEALING_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
@Return:
                
                rts

    ; End of function AddExpAndApplyHealingCap


; =============== S U B R O U T I N E =======================================

; Get EXP gained for a kill based on level difference between actor and target.
; 
;   In: a4, a5 = pointers to actor and target indexes
;   Out: d5.l = EXP amount


battlesceneScript_GetKillExp:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a5),d0
                jsr     GetCurrentLevel 
                move.w  d1,d2
                move.b  (a4),d0
                jsr     GetClass        
                move.w  d1,d3
            if (STANDARD_BUILD=1)
                bsr.w   GetCurrentLevel
                move.w  d1,d5
                bsr.w   GetClassType
                beq.s   @NotPromoted
                addi.w  #CHAR_CLASS_EXTRALEVEL,d5
@NotPromoted:   move.w  d5,d1
            else
                jsr     GetCurrentLevel 
                cmpi.b  #CHAR_CLASS_FIRSTPROMOTED,d3
                bcs.s   @Continue
                addi.w  #CHAR_CLASS_EXTRALEVEL,d1
            endif
@Continue:
                
                sub.w   d2,d1
                moveq   #50,d5          ; HARDCODED EXP amounts
                cmpi.b  #3,d1
                bmi.w   @Done
                moveq   #40,d5
                cmpi.b  #3,d1
                beq.w   @Done
                moveq   #30,d5
                cmpi.b  #4,d1
                beq.w   @Done
                moveq   #20,d5
                cmpi.b  #5,d1
                beq.w   @Done
                moveq   #10,d5
                cmpi.b  #6,d1
                beq.w   @Done
                moveq   #0,d5
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_GetKillExp


; =============== S U B R O U T I N E =======================================


SortTargets:
                
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

    ; End of function SortTargets


; =============== S U B R O U T I N E =======================================

; unused


OneSecondSleep:
                
                move.l  d0,-(sp)
                moveq   #60,d0
                jsr     (Sleep).w       
                move.l  (sp)+,d0
                rts

    ; End of function OneSecondSleep


; =============== S U B R O U T I N E =======================================

; unused


NopOnce:
                
                nop
                rts

    ; End of function NopOnce


; =============== S U B R O U T I N E =======================================

; unused


NopTwice:
                
                nop
                nop
                rts

    ; End of function NopTwice


; =============== S U B R O U T I N E =======================================

; unused


NopThrice:
                
                nop
                nop
                nop
                rts

    ; End of function NopThrice

