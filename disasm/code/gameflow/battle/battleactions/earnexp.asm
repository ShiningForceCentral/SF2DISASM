
; ASM FILE code\gameflow\battle\battleactions\earnexp.asm :
; 0xA872..0xA9CC : EXP earning functions

; =============== S U B R O U T I N E =======================================


battlesceneScript_CalculateHealingExp:
                
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
                
                bsr.w   battlesceneScript_AddExpAndApplyHealingCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_CalculateHealingExp


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
                bsr.w   battlesceneScript_AddExpAndApplyPerActionCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_CalculateDamageExp


; =============== S U B R O U T I N E =======================================


battlesceneScript_AddStatusEffectSpellExp:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done
                moveq   #STATUSEFFECT_SPELL_EXP,d5
                bsr.w   battlesceneScript_AddExpAndApplyPerActionCap
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function battlesceneScript_AddStatusEffectSpellExp


; =============== S U B R O U T I N E =======================================


battlesceneScript_AddExpAndGoldForKill:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Skip           ; skip if actor is an enemy
                bsr.w   battlesceneScript_GetKillExp
                bsr.w   battlesceneScript_AddExpAndApplyPerActionCap
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


battlesceneScript_AddExpAndApplyPerActionCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #PER_ACTION_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
                ble.s   @Return
                move.w  #PER_ACTION_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
@Return:
                
                rts

    ; End of function battlesceneScript_AddExpAndApplyPerActionCap


; =============== S U B R O U T I N E =======================================


battlesceneScript_AddExpAndApplyHealingCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #HEALING_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
                ble.s   @Return
                move.w  #HEALING_EXP_CAP,((BATTLESCENE_EXP-$1000000)).w
@Return:
                
                rts

    ; End of function battlesceneScript_AddExpAndApplyHealingCap


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

