
; ASM FILE code\gameflow\battle\ai\command\attack\determinemuddledbattleaction.asm :
; 0xC27A..0xC2C8 : Determine battleaction for AI controlled combatant afflicted with Muddle 2

; =============== S U B R O U T I N E =======================================

; Check for muddle 2'd units to control whether or not they take an action,
;  and to prevent them from killing Bowie or bosses.
; 
; In: d0.w = attacker index
;     d1.w = defender index
; 
; Out: d3 = 0 or 1
; 
; If d3 = 1 upon return, then no action is taken by the attacker.
; 
; Return 1 if...
;   - ally attacker and defender is Bowie
;   - enemy attacker attacking the first enemy (usually the boss)
;   - 50/50 odds to return 1 if attacker targets itself
; 
; Return 0 otherwise


DetermineMuddledBattleaction:
                
                movem.l d0-d2/d4-a6,-(sp)
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                
                ; Ally attacker
                moveq   #1,d3
                cmpi.b  #COMBATANT_ALLIES_START,d1
                beq.w   @Done           ; return d3=1 if target is Bowie
                
                moveq   #0,d3
                cmp.b   d0,d1
                bne.w   @Done           ; return d3=0 if the attacker and defender are different
                
                moveq   #2,d0
                jsr     (GenerateRandomOrDebugNumber).w
                beq.w   @Done           ; random value with 50/50 chance of returning d3=0 or d3=1
                
                moveq   #1,d3
                bra.s   @Done
@Enemy:
                
                moveq   #1,d3
                cmpi.b  #COMBATANT_ENEMIES_START,d1
                beq.w   @Done
                
                moveq   #0,d3
                cmp.b   d0,d1
                bne.w   @Done
                
                moveq   #2,d0
                jsr     (GenerateRandomOrDebugNumber).w
                beq.w   @Done
                
                moveq   #1,d3
@Done:
                
                movem.l (sp)+,d0-d2/d4-a6
                rts

    ; End of function DetermineMuddledBattleaction

