
; ASM FILE code\common\scripting\entity\getcombatantmapsprite-expanded.asm :

; =============== S U B R O U T I N E =======================================

; In: A6 = battle vars stack ???
; Out: D4 = map sprite ID

GetCombatantMapSprite:
                
                move.w  d0,-(sp)
                move.w  -4(a6),d0
                tst.b   d0
                bmi.s   @NotAlly
                bsr.s   GetAllyMapSprite
                bra.s   @Done
@NotAlly:
                
                move.w  d1,-(sp)
                jsr     GetEnemyID
                clr.w   d4
                move.b  EnemyMapSprites(pc,d1.w),d4
                move.w  (sp)+,d1
@Done:
                
                move.w  (sp)+,d0
                rts

    ; End of function GetCombatantMapSprite

