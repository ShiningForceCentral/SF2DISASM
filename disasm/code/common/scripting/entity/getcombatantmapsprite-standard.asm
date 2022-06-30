
; ASM FILE code\common\scripting\entity\getcombatantmapsprite-standard.asm :
; Standard reimplementation of combatant mapsprite getter functions.

; =============== S U B R O U T I N E =======================================

; Get mapsprite index for combatant d0.w -> d4.w

GetAllyMapSprite:
                
                move.w  d0,d4                           ; map sprite index = combatant index
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bhs.s   @Return                         ; return if combatant is not an ally
                
                ; Check if currently in battle
                move.l  d1,-(sp)
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   @CheckRohde
                
                ; Check if ally is alive
                jsr     GetCurrentHP
                bne.s   @CheckRohde
                move.w  #MAPSPRITE_BLUE_FLAME,d4
                bra.s   @Done                           ; return blue flame sprite if ally is not alive, and we're not currently in battle
@CheckRohde:
                
                cmpi.b  #ALLY_ROHDE,d0
                bne.s   @GetRegularSprite
                chkFlg  11                              ; check if Rohde has joined
                bne.s   @GetRegularSprite
                move.w  #MAPSPRITE_NPC_ROHDE,d4         ; Rhode hasn't joined yet, so use his NPC sprite
                bra.s   @Done
@GetRegularSprite:
                
                jsr     GetClassType
                add.w   d0,d4                           ; effectively multiply combatant index by 3
                add.w   d0,d4                           ;     (i.e., the expanded sprites table entry size)
                add.w   d1,d4
                move.b  tbl_AllyMapSprites(pc,d4.w),d4  ; map sprite index for the given class type -> d4.w
@Done:
                
                move.l  (sp)+,d1
@Return:
                
                rts

    ; End of function GetAllyMapSprite


; =============== S U B R O U T I N E =======================================

; In: a6 = battle vars stack
; Out: d4.w = map sprite index

battleEntity    = -4

GetCombatantMapSprite:
                
                move.w  d0,-(sp)
                move.w  battleEntity(a6),d0
                tst.b   d0
                bmi.s   @Enemy
                bsr.s   GetAllyMapSprite
                bra.s   @Done
@Enemy:
                
                move.w  d1,-(sp)
                jsr     GetEnemyIndex
                clr.w   d4
                move.b  tbl_EnemyMapSprites(pc,d1.w),d4
                move.w  (sp)+,d1
@Done:
                
                move.w  (sp)+,d0
                rts

    ; End of function GetCombatantMapSprite
