
; ASM FILE code\gameflow\battle\ai\iscombatantconfused.asm :
; 0xC3B0..0xC3DE : Is combatant afflicted with Muddle 2 checker function

; =============== S U B R O U T I N E =======================================

; Is combatant d0.w afflicted with with MUDDLE level 2?
; 
; Out: d1.w = 0 if not, else 1


IsCombatantConfused:
                
                movem.l d0/d2-a6,-(sp)
                bsr.w   GetStatusEffects
                move.w  d1,d2
                andi.w  #STATUSEFFECT_MUDDLE,d1
                tst.w   d1
                beq.s   @NotMuddled1
                move.w  d2,d1
                andi.w  #STATUSEFFECT_MUDDLE2,d1
                tst.w   d1
                beq.s   @NotMuddled2
                move.w  #1,d1
                bra.s   @BothMuddled1and2
@NotMuddled2:
                
                clr.w   d1
@BothMuddled1and2:
                
                bra.s   @Done
@NotMuddled1:
                
                clr.w   d1
@Done:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function IsCombatantConfused

