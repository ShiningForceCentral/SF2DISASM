
; ASM FILE code\gameflow\battle\battleloop\heallivingandimmortalallies.asm :
; 0x23BFC..0x23C58 : Battle loop function

; =============== S U B R O U T I N E =======================================


HealLivingAndImmortalAllies:
                
            if (STANDARD_BUILD=1)
                movem.l d0-d2/d7-a0,-(sp)
                clr.w   d0
                moveq   #0,d2
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                
@Loop:          lea     table_ImmortalAllies(pc), a0
                move.w  d0,d1
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcc.s   @Immortal
                jsr     GetCurrentHp
                beq.s   @Dead           ; skip healing if character is dead
@Immortal:      jsr     GetMaxHP
                jsr     SetCurrentHP
                jsr     GetMaxMP
                jsr     SetCurrentMP
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE,d1 ; cure all but lasting status effects
                jsr     SetStatusEffects
                jsr     UpdateCombatantStats
@Dead:          addq.w  #1,d0
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-d2/d7-a0
                rts
            else
                movem.l d0-d7,-(sp)
                clr.w   d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                cmpi.b  #ALLY_PETER,d0  ; HARDCODED ally indexes
                beq.w   @Immortal
                cmpi.b  #ALLY_LEMON,d0
                beq.w   @Immortal       ; always heal if character is immortal
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @Dead           ; skip healing if character is dead
@Immortal:
                
                jsr     j_GetMaxHp
                jsr     j_SetCurrentHp
                jsr     j_GetMaxMp
                jsr     j_SetCurrentMp
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE,d1 
                                                        ; cure all but lasting status effects
                jsr     j_SetStatusEffects
                jsr     j_UpdateCombatantStats
@Dead:
                
                addq.w  #1,d0
                dbf     d7,@Loop        
                
                movem.l (sp)+,d0-d7
                rts
            endif

    ; End of function HealLivingAndImmortalAllies

