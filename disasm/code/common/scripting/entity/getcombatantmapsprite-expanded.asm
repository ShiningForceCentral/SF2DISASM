
; ASM FILE code\common\scripting\entity\getcombatantmapsprite-expanded.asm :
; Get combatant map sprite index functions -- included when patch Force_Members_Expansion is enabled

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; Out: D4 = map sprite index

                module

GetAllyMapSprite:
                move.w  d0,d4                           ; map sprite index = combatant index
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bhs.s   @Return                         ; return if combatant is not an ally
                
                ; Check if currently in battle
                move.l  d1,-(sp)
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   @CheckIfRohde
                
                ; Check if ally is alive
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   @CheckIfRohde
                move.w  #MAPSPRITE_BLUE_FLAME,d4
                bra.s   @Done                           ; return blue flame sprite if ally is not alive, and we're not currently in battle
                
@CheckIfRohde:
                cmpi.b  #ALLY_ROHDE,d0
                bne.s   @GetClassType
                chkFlg  $B                              ; check if Rohde has joined
                bne.s   @GetClassType
                move.w  #MAPSPRITE_NPC_ROHDE,d4         ; Rhode hasn't joined yet, so use his NPC sprite
                bra.s   @Done
                
; Get regular map sprite index for the purpose of displaying its associated portrait in menus
GetAllyMapSprite_Regular:
                move.w  d0,d4
                move.l  d1,-(sp)
                
@GetClassType:
                move.l  a0,-(sp)
                lea     tbl_ClassTypes,a0               ; 0,1,2,255 = Base, Promo, Special, Red Baron
                jsr     GetClass                        ; class index -> D1
                move.b  (a0,d1.w),d1                    ; use class type index as offset into sprites table entry
                tst.b   d1
                bpl.s   @NotRedBaron
                moveq   #CLASSTYPE_SPECIAL,d1           ; handle Red Baron as a special class
                
@NotRedBaron:                 
                add.w   d0,d4                           ; effectively multiply combatant index by 3
                add.w   d0,d4                           ;     (i.e., the expanded sprites table entry size)
                add.w   d1,d4
                move.b  tbl_AllyMapSprites(pc,d4.w),d4  ; map sprite index for the given class type -> D4
                movea.l (sp)+,a0
                
@Done:
                move.l  (sp)+,d1
                
@Return:
                rts

    ; End of function GetAllyMapSprite
                
                modend


; =============== S U B R O U T I N E =======================================

; In: A6 = battle vars stack
; Out: D4 = map sprite index

GetCombatantMapSprite:
                move.w  d0,-(sp)
                move.w  -4(a6),d0
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

