
; ASM FILE code\common\scripting\entity\getallymapsprite-standard.asm :
; Get ally map sprite index function

; =============== S U B R O U T I N E =======================================

; Get mapsprite index for combatant d0.w -> d4.w

GetAllyMapSprite:
                
                move.w  d0,d4                           ; map sprite index = combatant index
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bhs.s   @Return                         ; return if combatant is not an ally
                
                ; Check if currently in battle
                movem.l d1-d2/a0,-(sp)
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s   @CheckJoined
                
                ; Check if ally is alive
                jsr     GetCurrentHP
                bne.s   @CheckJoined
                move.w  #MAPSPRITE_BLUE_FLAME,d4
                bra.s   @Done                           ; return blue flame sprite if ally is not alive, and we're not currently in battle
                
@CheckJoined:   lea     tbl_AllyMapSpritesIfNotJoined(pc), a0
                move.w  d0,d1
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @RegularSprite
                jsr     CheckFlag                       ; check if ally has joined the Force
                bne.s   @RegularSprite
                move.b  (a0),d4                         ; if not, return alternate mapsprite
                bra.s   @Done
                
@RegularSprite: jsr     GetClassType
                add.w   d0,d4                           ; effectively multiply combatant index by 3
                add.w   d0,d4                           ;     (i.e., the expanded sprites table entry size)
                add.w   d1,d4
                move.b  tbl_AllyMapSprites(pc,d4.w),d4  ; map sprite index for the given class type -> d4.w
                
@Done:          movem.l (sp)+,d1-d2/a0
@Return:        rts

    ; End of function GetAllyMapSprite

