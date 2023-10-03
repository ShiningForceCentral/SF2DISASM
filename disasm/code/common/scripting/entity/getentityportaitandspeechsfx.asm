
; ASM FILE code\common\scripting\entity\getentityportaitandspeechsfx.asm :
; 0x45638..0x4567A : Get entity portrait and speech sfx indexes function

; =============== S U B R O U T I N E =======================================

; Get portrait and speech sfx for character entity d0.w -> d1.w, d2.w


GetEntityPortaitAndSpeechSfx:
                
                movem.l d0/a0/a5,-(sp)
                andi.w  #COMBATANT_MASK_ALL,d0
                clr.w   d1
                clr.w   d2
                bsr.w   GetEntityAddressFromCharacter
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a5),d0 ; entity's map sprite index -> D0
                lea     table_MapspriteDialogueProperties(pc), a0
@FindMapsprite_Loop:
                
                cmp.b   (a0),d0         ; loop until we find entry matching the given map sprite
                bne.s   @NotFound
                
                ; Found map sprite, so return portrait and speech sfx indexes -> D1, D2
                move.b  MAPSPRITEDIALOGUEDEF_OFFSET_PORTRAIT(a0),d1
                ext.w   d1
                move.b  MAPSPRITEDIALOGUEDEF_OFFSET_SPEECHSFX(a0),d2
                bra.w   @Done
@NotFound:
                
                adda.w  #MAPSPRITEDIALOGUEDEF_ENTRY_SIZE,a0
                cmpi.w  #-1,(a0)
                bne.s   @FindMapsprite_Loop ; keep searching as long as we haven't reached end of table
                
                ; Otherwise, return default portrait and sfx
                move.w  #PORTRAIT_DEFAULT,d1
                move.w  #SFX_DIALOG_BLEEP_6,d2
@Done:
                
                movem.l (sp)+,d0/a0/a5
                rts

    ; End of function GetEntityPortaitAndSpeechSfx

