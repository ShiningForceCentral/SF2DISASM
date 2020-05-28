
; ASM FILE code\common\scripting\entity\getentityportaitandspeechsound.asm :
; 0x45634..0x4567A : Get entity portrait and speech sound IDs function

; =============== S U B R O U T I N E =======================================

sub_45634:
                
                clr.w   d0
                rts

    ; End of function sub_45634


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
; Out: D1 = portrait index
;      D2 = speech sound index

GetEntityPortaitAndSpeechSound:
                
                movem.l d0/a0/a5,-(sp)
                andi.w  #CHAR_MASK_IDX,d0
                clr.w   d1
                clr.w   d2
                bsr.w   GetEntityAddressFromCharacter
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a5),d0 ; D0 = map sprite index
                lea     SpriteDialogProperties(pc), a0
@FindMapSprite_Loop:
                
                cmp.b   (a0),d0         ; loop until we find entry matching a given map sprite
                bne.s   @NotFound       
                move.b  SPRITEDIALOGDEF_OFFSET_PORTRAIT(a0),d1 ; Found matching sprite...
                ext.w   d1              ;  return portrait and speech sound indexes -> D1, D2
                move.b  SPRITEDIALOGDEF_OFFSET_SPEECHSOUND(a0),d2
                bra.w   @Done
@NotFound:
                
                adda.w  #SPRITEDIALOGDEF_ENTRY_SIZE,a0 ; evaluate next entry
                cmpi.w  #CODE_TERMINATOR_WORD,(a0) ; As long as we haven't reached end of table...
                bne.s   @FindMapSprite_Loop ;  keep searching.
                move.w  #PORTRAIT_DEFAULT,d1 ;  Otherwise, return default portrait and sound
                move.w  #SFX_DIALOG_BLEEP_6,d2
@Done:
                
                movem.l (sp)+,d0/a0/a5
                rts

    ; End of function GetEntityPortaitAndSpeechSound

