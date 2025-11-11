
; ASM FILE code\gameflow\battle\ai\command\attack\adjusttargetpriority.asm :
; 0xCE36..0xCE96 : Adjust target priority function

; =============== S U B R O U T I N E =======================================

; Add an extra 0..4 to priority score based on attacker's movetype
;   and defender's class, applicable only if the attacker is an ally.
; 
; In: d0.b = defender index
;     d1.b = defender's remaining HP after taking max potential damage
;     d4.b = attacker index
;     d7.b = defender index from previous turn
; 
; Out: d6.w = adjusted priority score
; 
; Note: Does not apply to enemy attackers, even though it apparently should.
;   (Enemies do not have a class).


AdjustTargetPriority:
                
                movem.l d0-d5/d7-a6,-(sp)
                clr.w   d5
                move.b  d0,d5           ; d5.b = copy of defender index
                move.w  d4,d0
            if (STANDARD_BUILD&FIX_ATTACK_PRIORITY_ADJUSTMENT=1)
                tst.b   d0              ; apply adjustment to enemy attackers rather than ally
                bpl.s   @Done
            else
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   @Continue
                bra.w   @Done
            endif
@Continue:
                
                bsr.w   IsCombatantConfused
                tst.b   d1
                beq.s   @loc2           ; continue if attacker is not inflicted with Muddle 2
                bra.w   @Done
@loc2:
                
                cmpi.b  #ALLY_SARAH,d7  ; HARDCODED ally index
                bne.s   @GetAttackerMovetype
                
                lea     (table_PriorityAdjustments_Mage).l,a4
                bra.w   @GetDefenderClass
@GetAttackerMovetype:
                
                clr.l   d0
                move.b  d4,d0           ; d0.b = attacker index
                jsr     GetMovetype     
                clr.l   d3
                move.b  d1,d3
                lea     (pt_AttackPriorityAdjustmentsForMovetype).l,a4
                lsl.l   #INDEX_SHIFT_COUNT,d3
                movea.l (a4,d3.l),a4
@GetDefenderClass:
                
                clr.w   d0
                move.b  d5,d0           ; d0.b = defender index
                bsr.w   GetClass        
                clr.w   d2
                move.b  (a4,d1.w),d2
                add.w   d2,d6           ; d6.w = priority of the action
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AdjustTargetPriority

