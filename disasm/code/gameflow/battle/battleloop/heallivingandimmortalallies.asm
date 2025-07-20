
; ASM FILE code\gameflow\battle\battleloop\heallivingandimmortalallies.asm :
; 0x23BFC..0x23C58 : Battle loop function

; =============== S U B R O U T I N E =======================================


HealLivingAndImmortalAllies:
                
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

    ; End of function HealLivingAndImmortalAllies

