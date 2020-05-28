
; ASM FILE code\common\scripting\entity\getallymapsprite.asm :
; 0x449C6..0x44A5E : Get ally map sprite ID function

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant ID
; Out: D4 = map sprite ID

GetAllyMapSprite:
                
                cmpi.w  #COM_ALLIES_NUM,d0 ; HARDCODED number of allies
                blt.s   @IsAlly
                move.w  d0,d4           ; Combatant must be an ally.
                bra.w   @Return         ;  Otherwise, return
@IsAlly:
                
                movem.w d1,-(sp)
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w 
                                                        ; check if we're currently in battle
                bne.s   @IsAliveOrInBattle
                jsr     j_GetCurrentHP
                tst.w   d1              ; check if character is alive
                bne.s   @IsAliveOrInBattle
                move.w  #MAPSPRITE_BLUE_FLAME,d4 ; Character is dead and we're out of battle...
                bra.w   @Done           ;  so they appear as a blue flame, and we're done !
@IsAliveOrInBattle:
                
                cmpi.b  #ALLY_ROHDE,d0  ; Rhode !
                bne.s   @NotRhode       
                chkFlg  $B              ; Rohde joined
                bne.s   @NotRhode       
                move.w  #MAPSPRITE_NPC_ROHDE,d4 ; Rhode hasn't joined yet...
                bra.w   @Done           ;  so use his NPC sprite
@NotRhode:
                
                move.w  d0,d4           ; start handling sprite IDs based on class
                andi.w  #ALLY_MASK_IDX,d4
                move.b  AllyMapSprites(pc,d4.w),d4 ; sprite IDs for each force character in battle
                jsr     j_GetClass      
                cmpi.b  #CLASS_HERO,d1  ; If HERO...
                beq.w   @Done           ;  use value as defined in the table.
                cmpi.b  #CLASS_SDMN,d1
                bne.s   @NotHeroOrSdmn  
                subq.w  #1,d4           ;  Else if SDMN, subtract 1
                bra.w   @Done
@NotHeroOrSdmn:
                
                cmpi.b  #CLASS_BDBT,d1  ; If class is one of the following:
                                        ;  BDBT, WFBR, BWNT, PHNX, NINJ, MNST, RBT, GLM, RDBN
                bge.w   @Done           ;  ...we're done.
                cmpi.b  #CLASS_BDMN,d1
                blt.s   @SpecialClasses 
                cmpi.b  #CLASS_TORT,d1
                bgt.s   @SpecialClasses 
                subq.w  #1,d4           ;  Else if one of these:
                                        ;  BDMN, WFMN, RNGR, PHNK, THIF, TORT
                bra.w   @Done           ;  ...subtract 1
@SpecialClasses:
                
                cmpi.b  #CLASS_ACHR,d1  ; at this point, we're down to classes for which a special promotion exists
                bgt.s   @IsPromoted     ; If class is listed above ACHR, they must be promoted.
                subq.w  #2,d4           ;  Else, subtract 2
                bra.w   @Done
@IsPromoted:
                
                btst    #0,d1           ; If class ID is even...
                beq.s   @Done           ;  it must be a special class, so we're done.
                subq.w  #1,d4           ;  Else, subtract 1
                bra.w   *+4
@Done:
                
                move.w  (sp)+,d1
@Return:
                
                rts

    ; End of function GetAllyMapSprite

