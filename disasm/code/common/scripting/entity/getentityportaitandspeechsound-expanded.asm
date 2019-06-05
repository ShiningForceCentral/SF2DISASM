
; ASM FILE code\common\scripting\entity\getentityportaitandspeechsound-expanded.asm :
; Alternate GetEntityPortaitAndSpeechSound function to be included in expanded ROM

; =============== S U B R O U T I N E =======================================

; Unused function ?

sub_45634:
                
                clr.w   d0
                rts

	; End of function sub_45634


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
; Out: D1 = portrait index
;      D2 = speech sound index

GetEntityPortaitAndSpeechSound_Ally:
                
                movem.l d0/a0/a5,-(sp)
                bra     GetEntityPortaitAndSpeechSound_FindMapSprite
                
GetEntityPortaitAndSpeechSound:
				
                movem.l d0/a0/a5,-(sp)
                clr.w   d2
                bsr     GetEntityAddressFromCharacter
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a5),d0			; D0 = map sprite index
GetEntityPortaitAndSpeechSound_FindMapSprite:
                
                lea     SpriteDialogProperties(pc), a0
@FindMapSprite_Loop:
                
                cmp.b   (a0),d0							; loop until we find entry matching a given map sprite
                beq     @Found
                adda.w  #SPRITEDIALOGDEF_ENTRY_SIZE,a0	; evaluate next entry
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)		; As long as we haven't reached end of table...
                bne     @FindMapSprite_Loop				;  keep searching.
                
                move.w  #PORTRAIT_DEFAULT,d1			;  Otherwise, return default portrait and sound
                move.w  #SFX_DIALOG_BLEEP_6,d2
				bra     @Done
@Found:
				
                move.b  SPRITEDIALOGDEF_OFFSET_PORTRAIT(a0),d1		; Found matching sprite...
                ext.w   d1
                move.b  SPRITEDIALOGDEF_OFFSET_SPEECHSOUND(a0),d2	;  return portrait and speech sound indexes -> D1, D2
@Done:
                
                movem.l (sp)+,d0/a0/a5
                rts

	; End of function GetEntityPortaitAndSpeechSound

