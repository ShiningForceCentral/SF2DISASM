
; ASM FILE code\common\scripting\entity\getcombatantmapsprite-standard.asm :
; Get combatant map sprite index function

; =============== S U B R O U T I N E =======================================

; In: a6 = battle vars stack
; Out: d4.w = map sprite index

battleEntity    = -4

GetCombatantMapsprite:
                
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                tst.b   d0
                bmi.s   @Enemy
                bsr.w   GetAllyMapsprite
                bra.s   @Done
                
@Enemy:         move.w  d1,-(sp)
                jsr     GetEnemy
                add.w   d1,d1
                lea     table_EnemyMapsprites(pc),a0
                move.w  (a0,d1.w),d4
                move.w  (sp)+,d1
                
@Done:          move.w  (sp)+,d0
                rts

    ; End of function GetCombatantMapsprite
