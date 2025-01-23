
; ASM FILE code\gameflow\battle\battleloop-standard\heallivingandimmortalallies.asm :
;

; =============== S U B R O U T I N E =======================================


HealLivingAndImmortalAllies:
                
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
                
@Immortal:      jsr     GetMaxHp
                jsr     SetCurrentHp
                jsr     GetMaxMp
                jsr     SetCurrentMp
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_POISON|STATUSEFFECT_CURSE,d1 ; cure all but lasting status effects
                jsr     SetStatusEffects
                jsr     UpdateCombatantStats
                
@Dead:          addq.w  #1,d0
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-d2/d7-a0
                rts

    ; End of function HealLivingAndImmortalAllies

