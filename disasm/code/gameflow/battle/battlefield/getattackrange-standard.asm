
; ASM FILE code\gameflow\battle\battlefield\getattackrange-standard.asm :
; Standard reimplementation of attack range getter function.

; =============== S U B R O U T I N E =======================================

; Get max/min attack range for combatant d0.b -> d3.w, d4.w


GetAttackRange:
                
                movem.l d1-d2/a0,-(sp)
                clr.w   d3
                clr.w   d4
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
                bcc.s   @Special
                
                ; Get default unarmed attack range
                moveq   #1,d3
                moveq   #1,d4
                bra.s   @Done
                
@Special:       move.b  (a0)+,d4
                move.b  (a0),d3
                bra.s   @Done
                
@WeaponRange:   bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
                
@Done:          movem.l (sp)+,d1-d2/a0
                rts

    ; End of function GetAttackRange

