
; ASM FILE code\gameflow\battle\battlefield\getattackrange.asm :
; 0xC306..0xC380 : Get Attack Range function

; =============== S U B R O U T I N E =======================================

; Get max, min attack range for combatant d0.b -> d3.w, d4.w


GetAttackRange:
                
                movem.l d0-d2/d5-a6,-(sp)
                jsr     GetEquippedWeapon
                cmpi.w  #-1,d1
                bne.s   @GetWeaponRange
                
                ; Get unarmed attack range
                clr.l   d3
                clr.l   d4
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @CheckEnemies
                jsr     GetClass        
                cmpi.w  #CLASS_BRGN,d1
                bne.s   @CheckEnemies
                move.w  #2,d3           ; HARDCODED Brass Gunner's unarmed attack range
                move.w  #1,d4
                bra.w   @Done
@CheckEnemies:
                
                jsr     GetEnemy        
                cmpi.b  #ENEMY_KRAKEN_ARM,d1
                bne.s   @CheckKrakenHead
                move.w  #2,d3           ; HARDCODED Kraken Arm's attack range
                move.w  #1,d4
                bra.w   @Done
@CheckKrakenHead:
                
                cmpi.b  #ENEMY_KRAKEN_HEAD,d1
                bne.s   @GetDefaultUnarmedEnemyRange
                move.w  #3,d3           ; HARDCODED Kraken Head's attack range
                move.w  #1,d4
                bra.w   @Done
@GetDefaultUnarmedEnemyRange:
                
                moveq   #1,d3
                moveq   #1,d4
                bra.s   @Done
@GetWeaponRange:
                
                jsr     GetItemDefAddress
                clr.w   d3
                clr.w   d4
                move.b  ITEMDEF_OFFSET_MAX_RANGE(a0),d3
                move.b  ITEMDEF_OFFSET_MIN_RANGE(a0),d4
@Done:
                
                movem.l (sp)+,d0-d2/d5-a6
                rts

    ; End of function GetAttackRange

