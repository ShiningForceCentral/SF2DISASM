
; ASM FILE code\common\scripting\entity\getallymapsprite.asm :
; 0x449C6..0x44A5E : Get ally map sprite index function

; =============== S U B R O U T I N E =======================================

; Get combatant D0's map sprite index -> D4


GetAllyMapSprite:
                
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0 ; HARDCODED number of allies
                blt.s   @CheckIfCurrentlyInBattle
                move.w  d0,d4
                bra.w   @Return         ; return if combatant is not an ally
@CheckIfCurrentlyInBattle:
                
                movem.w d1,-(sp)
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   @CheckIfRohde
                
                ; Check if ally is alive
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   @CheckIfRohde
                move.w  #MAPSPRITE_BLUE_FLAME,d4
                bra.w   @Done           ; return blue flame sprite if ally is not alive, and we're not currently in battle
@CheckIfRohde:
                
                cmpi.b  #ALLY_ROHDE,d0  ; Rhode !
                bne.s   @GetMapSpriteForClass
                chkFlg  11              ; Rohde joined
                bne.s   @GetMapSpriteForClass
                move.w  #MAPSPRITE_NPC_ROHDE,d4
                bra.w   @Done           ; Rhode hasn't joined yet, so use his NPC sprite
@GetMapSpriteForClass:
                
                move.w  d0,d4           ; start handling sprites based on class
                andi.w  #ALLY_MASK_INDEX,d4
                move.b  tbl_AllyMapSprites(pc,d4.w),d4
                jsr     j_GetClass
                cmpi.b  #CLASS_HERO,d1  ; HARDCODED class indexes
                beq.w   @Done           ; if HERO, use index as is from the table
                cmpi.b  #CLASS_SDMN,d1
                bne.s   @NotHeroOrSdmn  
                subq.w  #1,d4           ; else if SDMN, use index minus 1
                bra.w   @Done
@NotHeroOrSdmn:
                
                cmpi.b  #CLASS_BDBT,d1  ; if class is one of the following:
                                        ;     BDBT, WFBR, BWNT, PHNX, NINJ, MNST, RBT, GLM, RDBN
                bge.w   @Done           ;     ...we're done
                cmpi.b  #CLASS_BDMN,d1
                blt.s   @SpecialClasses 
                cmpi.b  #CLASS_TORT,d1
                bgt.s   @SpecialClasses 
                subq.w  #1,d4           ; else if one of these:
                                        ;     BDMN, WFMN, RNGR, PHNK, THIF, TORT
                bra.w   @Done           ;     ...subtract 1
@SpecialClasses:
                
                cmpi.b  #CLASS_ACHR,d1  ; at this point, we're down to classes for which a special promotion exists
                bgt.s   @IsPromoted     ; if class is listed above ACHR, they must be promoted
                subq.w  #2,d4
                bra.w   @Done           ; else, subtract 2
@IsPromoted:
                
                btst    #0,d1
                beq.s   @Done           ; if class index is even, it must be a special class, so we're done
                subq.w  #1,d4           ; else, subtract 1
                bra.w   *+4
@Done:
                
                move.w  (sp)+,d1
@Return:
                
                rts

    ; End of function GetAllyMapSprite

