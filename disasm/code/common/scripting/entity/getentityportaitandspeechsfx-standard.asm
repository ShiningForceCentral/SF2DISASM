
; ASM FILE code\common\scripting\entity\getentityportaitandspeechsfx-standard.asm :
; Standard reimplementation of entity portrait and speech sfx getter function.

; =============== S U B R O U T I N E =======================================

; Get portrait and speech sfx for character entity d0.w -> d1.w, d2.w

GetEntityPortaitAndSpeechSfx:
                
                movem.l d0/a0/a5,-(sp)
                andi.w  #COMBATANT_MASK_ALL,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                blo.s   @Ally
                
                clr.w   d2
                bsr.w   GetEntityAddressFromCharacter       ; -> a5
            if (EXPANDED_MAPSPRITES=1)
                move.w  ENTITYDEF_OFFSET_MAPSPRITE(a5),d0   ; entity's map sprite index -> D0
                lea     table_MapspriteDialogueProperties(pc), a0
                
@Loop:          cmp.w   (a0),d0                                ; loop until we find entry matching the given map sprite
            else
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a5),d0   ; entity's map sprite index -> D0
                lea     table_MapspriteDialogueProperties(pc), a0
                
@Loop:          cmp.b   (a0),d0                                ; loop until we find entry matching the given map sprite
            endif
                beq.s   @Found
                adda.w  #MAPSPRITEDIALOGUEDEF_ENTRY_SIZE,a0
                cmpi.w  #TERMINATOR_WORD,(a0)
                bne.s   @Loop                                ; keep searching as long as we haven't reached end of table
                
                ; Return default portrait and speech sfx is map sprite is not found
                move.w  #PORTRAIT_DEFAULT,d1
                move.w  #SFX_DIALOG_BLEEP_6,d2
                bra.s   @Done
                
@Found:         move.b  MAPSPRITEDIALOGUEDEF_OFFSET_PORTRAIT(a0),d1  ; return portrait and speech sfx indexes -> D1, D2
                ext.w   d1
                move.b  MAPSPRITEDIALOGUEDEF_OFFSET_SPEECHSFX(a0),d2
                bra.s   @Done
                
@Ally:          jsr     GetClassType        ; Get class type for ally d0.w -> d1.w
                
                ; Calculate offset to ally entries
                move.w  d0,d2
                add.w   d0,d2
                add.w   d0,d2
                add.w   d2,d2
                
                ; Calculate offset to ally entry for class type
                add.w   d1,d1
                add.w   d1,d2
                
                move.b  table_AllyDialogueProperties(pc,d2.w),d1
                ext.w   d1
                move.b  table_AllyDialogueProperties+1(pc,d2.w),d2
                
@Done:          movem.l (sp)+,d0/a0/a5
                rts

    ; End of function GetEntityPortaitAndSpeechSfx
