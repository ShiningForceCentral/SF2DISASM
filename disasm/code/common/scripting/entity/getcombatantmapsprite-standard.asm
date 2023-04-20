
; ASM FILE code\common\scripting\entity\getcombatantmapsprite-standard.asm :
; Standard reimplementation of combatant mapsprite getter functions.

; =============== S U B R O U T I N E =======================================

; In: a6 = battle vars stack
; Out: d4.w = map sprite index

battleEntity    = -4

GetCombatantMapSprite:
                
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                tst.b   d0
                bmi.s   @Enemy
                bsr.w   GetAllyMapSprite
                bra.s   @Done
                
@Enemy:         move.w  d1,-(sp)
                jsr     GetEnemyIndex
                add.w   d1,d1
                clr.w   d4
                move.w  tbl_EnemyMapSprites(pc,d1.w),d4
                move.w  (sp)+,d1
                
@Done:          move.w  (sp)+,d0
                rts

    ; End of function GetCombatantMapSprite
