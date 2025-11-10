
; ASM FILE code\gameflow\battle\battleloop-standard\activateenemies.asm :
;

; =============== S U B R O U T I N E =======================================

; If any regions were newly-triggered, iterate through all enemies activate
;   AI linked to those regions.
;
; In: d3.w = newly-triggered regions bitfield
;
; Optimization:
;   - Update now runs only when the newly-triggered bitfield is nonzero,
;       avoiding unnecessary work when nothing changed.


ActivateEnemies:
                
                andi.w  #AI_TRIGGER_REGIONS_MASK,d3
                beq.s   @Return         ; skip if activated regions did not change
                
                ; Update enemies currently on the field
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@Loop:          jsr     GetCombatantX
                bmi.s   @Next
                
                jsr     GetCurrentHp
                beq.s   @Next
                
                jsr     GetActivationBitfield
                move.w  d1,d4
                bsr.s   UpdateEnemyActivationBitfield
@Next:          addq.w  #1,d0
                dbf     d7,@Loop
                
@Return:        rts

    ; End of function ActivateEnemies


; =============== S U B R O U T I N E =======================================

; In: d0.w = enemy combatant index
;     d3.w = newly (or previously if spawning) regions bitfield
;     d4.w = AI activation bitfield

;
; Out: CCR carry-bit set if no update took place (relevant when spawning enemies)


UpdateEnemyActivationBitfield:
                
                ; Are associated regions triggered for this AI?
                jsr     GetTriggerRegions     ; -> d1.w, d2.w
                btst    d1,d3
                beq.s   @CheckRegion2
                
                ; Activate AI for region #1
                ori.w   #AIBITFIELD_PRIMARY_ACTIVE,d4
                bra.s   @Activate
                
@CheckRegion2:  btst    d2,d3
                beq.s   @NoUpdate
                
                ; Activate AI for region #2
                ori.w   #AIBITFIELD_PRIMARY_ACTIVE|AIBITFIELD_SECONDARY_ACTIVE,d4
@Activate:      move.w  d4,d1
                jmp     SetActivationBitfield
                
@NoUpdate:      ori     #1,ccr
                rts

    ; End of function UpdateEnemyActivationBitfield

