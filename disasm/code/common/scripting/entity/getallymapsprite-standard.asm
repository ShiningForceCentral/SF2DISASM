
; ASM FILE code\common\scripting\entity\getallymapsprite-standard.asm :
; Get ally map sprite index function

; =============== S U B R O U T I N E =======================================

; Get mapsprite index for combatant d0.w -> d4.w

GetAllyMapsprite:
                
                move.w  d0,d4                           ; map sprite index = combatant index
                
                ; Check if combatant is an ally
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bhs.s   @Return                         ; return if combatant is not an ally
                
                ; Check if we are currently in battle
                movem.l d1-d2/a0,-(sp)
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s   @CheckJoined
                
                ; Check if ally is alive
                jsr     GetCurrentHP
                bne.s   @CheckJoined
                move.w  #MAPSPRITE_BLUE_FLAME,d4
                bra.s   @Done                           ; return blue flame sprite if ally is not alive, and if we are not currently in battle
                
                ; Get alternate mapsprite if ally has not joined yet
@CheckJoined:   lea     table_AllyMapspritesIfNotJoined(pc), a0
                move.w  d0,d1
                moveq   #2,d2                           ; bytes offset to next entry
                jsr     (FindSpecialPropertyWordsAddressForObject).w
                bcs.s   @RegularSprite
                jsr     CheckFlag                       ; check if ally has joined the Force
                bne.s   @RegularSprite
                move.w  (a0),d4                         ; if not, return alternate mapsprite
                bra.s   @Done
                
                ; Get regular mapsprite for ally
@RegularSprite: jsr     GetClassType
                add.w   d0,d4                           ; effectively multiply combatant index by 3
                add.w   d0,d4                           ;     (i.e., the number of entries in the mapsprites table)
                add.w   d1,d4
                add.w   d4,d4                           ; and double it to handle word-sized entries
                move.w  table_AllyMapsprites(pc,d4.w),d4 ; map sprite index for the given class type -> d4.w
                
@Done:          movem.l (sp)+,d1-d2/a0
@Return:        rts

    ; End of function GetAllyMapsprite

