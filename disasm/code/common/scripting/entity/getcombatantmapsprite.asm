
; ASM FILE code\common\scripting\entity\getcombatantmapsprite.asm :
; 0x44A7C..0x44AA4 : Get combatant map sprite index function

; =============== S U B R O U T I N E =======================================

; In: A6 = battle vars stack ???
; 
; Out: D4 = map sprite index

battleEntity = -4

GetCombatantMapSprite:
                
                movem.w d0,-(sp)
                move.w  battleEntity(a6),d0
                tst.b   d0
                blt.s   @GetEnemyMapSprite
                bsr.w   GetAllyMapSprite
                bra.s   @Done
@GetEnemyMapSprite:
                
                move.w  d1,-(sp)
                jsr     j_GetEnemyIndex
                clr.w   d4
                move.b  tbl_EnemyMapSprites(pc,d1.w),d4
                move.w  (sp)+,d1
@Done:
                
                movem.w (sp)+,d0
                rts

    ; End of function GetCombatantMapSprite

