
; ASM FILE code\common\scripting\entity\getcombatantmapsprite.asm :
; 0x44A7C..0x44AA4 : Get combatant map sprite index function

; =============== S U B R O U T I N E =======================================

; In: a6 = battle vars stack
; Out: d4.w = map sprite index

battleEntity = -4

GetCombatantMapsprite:
                
                movem.w d0,-(sp)
                move.w  battleEntity(a6),d0
                tst.b   d0
                blt.s   @GetEnemyMapsprite
                bsr.w   GetAllyMapsprite
                bra.s   @Done
@GetEnemyMapsprite:
                
                move.w  d1,-(sp)
                jsr     j_GetEnemy
                clr.w   d4
                move.b  table_EnemyMapsprites(pc,d1.w),d4
                move.w  (sp)+,d1
@Done:
                
                movem.w (sp)+,d0
                rts

    ; End of function GetCombatantMapsprite

