
; ASM FILE code\gameflow\battle\battlefield\getactionrange-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; Get max/min attack range for combatant d0.b -> d3.w, d4.w


GetAttackRange:
                
                movem.l d1-d2/a0,-(sp)
                moveq   #1,d3           ; default to range 1, 1
                moveq   #1,d4
                bsr.w   GetEquippedWeapon
                bpl.s   @WeaponRange
                
                ; Check special unarmed attack range
                moveq   #2,d2
                tst.b   d0
                bmi.s   @Enemy
                
                lea     table_UnarmedAttackRangesForClasses(pc), a0
                bsr.w   GetClass
                bra.s   @Continue
                
@Enemy:         lea     table_UnarmedAttackRangesForEnemies(pc), a0
                bsr.w   GetEnemy
@Continue:      jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                
                ; Get special unarmed attack range
                move.b  (a0)+,d4
                move.b  (a0),d3
                bra.s   @Done
                
@WeaponRange:   bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
                
@Done:          movem.l (sp)+,d1-d2/a0
                rts

    ; End of function GetAttackRange


; =============== S U B R O U T I N E =======================================

; Get max, min cast range for spell d1.b -> d3.b, d4.b


GetSpellRange:
                
                move.l  a0,-(sp)
                jsr     GetSpellDefinitionAddress
                move.b  SPELLDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  SPELLDEF_OFFSET_MIN_RANGE(a0),d4
                movea.l (sp)+,a0
                rts

    ; End of function GetSpellRange


; =============== S U B R O U T I N E =======================================

; Get max, min use range for item d1.b -> d3.b, d4.b


GetItemRange:
                
                move.l  a0,-(sp)
                jsr     GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
                movea.l (sp)+,a0
                rts

    ; End of function GetItemRange

