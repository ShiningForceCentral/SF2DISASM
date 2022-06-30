
; ASM FILE code\common\scripting\entity\getentityportaitandspeechsound-standard.asm :
; Standard reimplementation of entity portrait and speech sfx getter function.

; =============== S U B R O U T I N E =======================================

; Get portrait and speech sfx for character d0.w -> d1.w, d2.w

GetEntityPortaitAndSpeechSfx:
                
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                blo.s   GetAllyPortaitAndSpeechSfx
                
                movem.l d0/a0/a5,-(sp)
                clr.w   d2
                bsr.w   GetEntityAddressFromCharacter
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a5),d0   ; entity's map sprite index -> D0
                lea     tbl_SpriteDialogProperties(pc), a0
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


; =============== S U B R O U T I N E =======================================

; Get portrait and speech sfx for ally d0.w -> d1.w, d2.w

GetAllyPortaitAndSpeechSfx:
                
                jsr     GetClassType        ; Get class type for ally d0.w -> d1.w
                
                ; Calculate offset to ally entries
                move.w  d0,d2
                add.w   d0,d2
                add.w   d0,d2
                add.w   d2,d2
                
                ; Calculate offset to ally entry for class type
                add.w   d1,d1
                add.w   d1,d2
                
                move.b  tbl_AllyDialogProperties(pc,d2.w),d1
                ext.w   d1
                move.b  tbl_AllyDialogProperties+1(pc,d2.w),d2
                
                rts

	; End of function GetAllyPortaitAndSpeechSfx
