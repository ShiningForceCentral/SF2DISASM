
; ASM FILE code\gameflow\battle\battlefield\battlefieldengine_2.asm :
; 0xC27A..0xC306 : Battlefield engine

; =============== S U B R O U T I N E =======================================

; Check for muddle 2'd units to control whether or not they take an action,
;  and to prevent them from killing Bowie or bosses.
; 
; In:  d0 = character index of attacker
;      d1 = character index of defender
; Out: d3 = 0 or 1
; 
; If d3=1 upon return, then no action is taken by the attacker.
; 
; Return 1 if...
;         ally attacker and defender is Bowie
;         enemy attacker attacking the first enemy (usually the boss)
;         50/50 odds to return 1 if attacker targets itself
; Return 0 otherwise.


DetermineMuddleBattleaction:
                
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

    ; End of function DetermineMuddleBattleaction


; =============== S U B R O U T I N E =======================================

; Out: a2, a3 = pointers to total movecosts and movable grid arrays
;      a4 = pointer to battle terrain array
;      a5 = pointer to move costs table
;      d0.w = move value (MOV*2)
;      d3.w, d4.w = moving combatant X, Y
;        


InitializeMovementArrays:
                
                movem.l d1-d2/d5-a1,-(sp)
                bsr.w   PopulateMovecostsTable
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a5
                jsr     GetCombatantX
                move.w  d1,d3
                jsr     GetCombatantY
                move.w  d1,d4
                jsr     GetCurrentMov
                move.w  d1,d0
                add.w   d0,d0
                movem.l (sp)+,d1-d2/d5-a1
                rts

    ; End of function InitializeMovementArrays

