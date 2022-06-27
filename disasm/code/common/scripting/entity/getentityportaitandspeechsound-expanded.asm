
; ASM FILE code\common\scripting\entity\getentityportaitandspeechsound-expanded.asm :
; Alternate GetEntityPortaitAndSpeechSfx function -- included when patch Force_Members_Expansion is enabled

; =============== S U B R O U T I N E =======================================

; In: D0 = character index
; Out: D1 = portrait index
;      D2 = speech sound index

                module

GetEntityPortaitAndSpeechSfx_Ally:
                movem.l d0/a0/a5,-(sp)
                bra.s   @FindMapSprite
                
GetEntityPortaitAndSpeechSfx:
                movem.l d0/a0/a5,-(sp)
                clr.w   d2
                bsr.w   GetEntityAddressFromCharacter
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a5),d0   ; entity's map sprite index -> D0
                
@FindMapSprite:
                lea     SpriteDialogProperties(pc), a0
                
@FindMapSprite_Loop:
                cmp.b   (a0),d0							    ; loop until we find entry matching the given map sprite
                beq.s   @MapSpriteFound
                adda.w  #SPRITEDIALOGDEF_ENTRY_SIZE,a0
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                bne.s   @FindMapSprite_Loop				    ; keep searching as long as we haven't reached end of table
                
                ; Return default portrait and speech sfx is map sprite is not found
                move.w  #PORTRAIT_DEFAULT,d1
                move.w  #SFX_DIALOG_BLEEP_6,d2
				bra.s   @Done
                
@MapSpriteFound:
                move.b  SPRITEDIALOGDEF_OFFSET_PORTRAIT(a0),d1  ; return portrait and speech sfx indexes -> D1, D2
                ext.w   d1
                move.b  SPRITEDIALOGDEF_OFFSET_SPEECHSFX(a0),d2
                
@Done:
                movem.l (sp)+,d0/a0/a5
                rts

	; End of function GetEntityPortaitAndSpeechSfx

                modend
