
; ASM FILE code\common\scripting\text\textfunctions_1.asm :
; 0x6260..0x666E : Text functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = string index


DisplayText:
                
                module
                movem.l d0-a6,-(sp)
                move.w  d0,-(sp)
                bsr.w   CreateDialogueWindow
                move.w  (sp)+,d0
                move.b  #1,((CURRENTLY_TYPEWRITING-$1000000)).w ; "Currently typewriting"
                movem.w d0,-(sp)        ; save string #
                lsr.w   #6,d0
                andi.b  #$FC,d0         ; string # -> bank pointer offset
                movea.l (p_pt_TextBanks).l,a0 ; load script bank pointer
                movea.l (a0,d0.w),a0
                movem.w (sp)+,d0        ; restore string #
                andi.w  #BYTE_MASK,d0   ; restrict to range 0-255
                moveq   #0,d7
                bra.s   @FindString     
@GotoNextString_Loop:
                
                move.b  (a0),d7         ; first string byte : string length
                adda.l  d7,a0
                addq.l  #1,a0
@FindString:
                
                dbf     d0,@GotoNextString_Loop ; loop until wanted string reached
                
                clr.l   ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w 
                                                        ; get ready
                clr.b   ((DIALOGUE_REGULAR_TILE_TOGGLE-$1000000)).w
                move.b  (a0)+,((COMPRESSED_STRING_LENGTH-$1000000)).w 
                                                        ; keep length of current string
loc_62A8:
                
                move.l  #DIALOGUE_NAME_INDEX_1,((CURRENT_DIALOGUE_NAME_INDEX_POINTER-$1000000)).w
                move.b  #1,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
                cmpi.b  #1,((COMPRESSED_STRING_LENGTH-$1000000)).w ; check length
                beq.w   loc_62FE
                jsr     j_InitializeHuffmanDecoder ; initialize decoder
                move.l  a0,((COMPRESSED_STRING_POINTER-$1000000)).w ; keep string pointer
loc_62CA:
                
                bsr.w   GetNextTextSymbol
                cmpi.b  #$FE,d0
                beq.s   loc_62FE
                cmpi.b  #$EE,d0
                bcc.w   ParseSpecialTextSymbol ; if symbol >= $EE
                bset    #0,((DIALOGUE_REGULAR_TILE_TOGGLE-$1000000)).w
                bne.s   loc_62F2
                cmpi.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                beq.s   loc_62F2
                move.b  #-1,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
loc_62F2:
                
                bsr.s   ApplyAutomaticNewline
                bsr.w   SymbolsToGraphics
                bsr.w   HandleDialogueTypewriting
                bra.s   loc_62CA
loc_62FE:
                
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                movem.l (sp)+,d0-a6
                rts

    ; End of function DisplayText

                modend

; =============== S U B R O U T I N E =======================================


ApplyAutomaticNewline:
                
                cmpi.b  #204,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                bls.s   return_634C
                bsr.w   ClearNextLineOfDialoguePixels ; line end reached
                move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                addi.b  #16,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
                cmpi.w  #VDPTILE_SCREEN_BLACK_BAR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(SPRITE_00_VDPTILE).l
                beq.s   loc_6332
                cmpi.b  #32,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
                bra.s   loc_6338
loc_6332:
                
                cmpi.b  #48,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
loc_6338:
                
                bcs.s   return_634C

    ; End of function ApplyAutomaticNewline


; =============== S U B R O U T I N E =======================================


NewDialogueLine:
                
                movem.l d0,-(sp)
                bsr.w   sub_6AD2
                movem.l (sp)+,d0
                subi.b  #16,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
return_634C:
                
                rts

    ; End of function NewDialogueLine


; =============== S U B R O U T I N E =======================================


GetNextTextSymbol:
                
                tst.l   ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
                bne.w   @Continue
                
                movea.l ((COMPRESSED_STRING_POINTER-$1000000)).w,a0
                jsr     j_HuffmanDecode
                move.l  a0,((COMPRESSED_STRING_POINTER-$1000000)).w
                rts
@Continue:
                
                movea.l ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w,a1
                clr.w   d0
                move.b  (a1)+,d0
                move.b  (a1),d1
                move.l  a1,((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
                lea     table_AsciiToTextSymbolMap(pc), a1
                move.b  (a1,d0.w),d0
                tst.b   d1
                bne.s   @Return
                clr.l   ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
@Return:
                
                rts

    ; End of function GetNextTextSymbol


; =============== S U B R O U T I N E =======================================


ParseSpecialTextSymbol:
                
                module
                cmpi.b  #$EE,d0         ; regular tile
                beq.w   @regularTile
                cmpi.b  #$F3,d0         ; leader
                beq.w   symbol_leader
                cmpi.b  #$F0,d0         ; delay 2
                beq.w   @delay2
                cmpi.b  #$EF,d0         ; line
                beq.w   @line
                cmpi.b  #$F7,d0         ; wait 2
                beq.w   @wait2
                cmpi.b  #$F2,d0         ; name
                beq.w   symbol_name
                cmpi.b  #$F4,d0         ; item
                beq.w   symbol_item
                cmpi.b  #$F1,d0         ; number
                beq.w   symbol_number
                cmpi.b  #$F6,d0         ; class
                beq.w   symbol_class
                cmpi.b  #$FA,d0         ; wait 1
                beq.w   symbol_wait1
                cmpi.b  #$F8,d0         ; delay 1
                beq.w   symbol_delay1
                cmpi.b  #$F9,d0         ; delay 3
                beq.w   symbol_delay3
                cmpi.b  #$F5,d0         ; spell
                beq.w   symbol_spell
                cmpi.b  #$FB,d0         ; clear
                beq.w   symbol_clear
                cmpi.b  #$FD,d0         ; color #
                beq.w   symbol_color
                cmpi.b  #$FC,d0         ; name #
                beq.w   symbol_player
                bra.w   loc_62CA
@regularTile:
                
                move.b  #1,((DIALOGUE_REGULAR_TILE_TOGGLE-$1000000)).w
                bra.w   loc_62CA
@delay2:
                
                move.w  #119,d0
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                movem.w d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bsr.w   Sleep           
                movem.w (sp)+,d0
                move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
                bra.w   loc_62CA
@line:
                
                bsr.w   ClearNextLineOfDialoguePixels
                move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                addi.b  #$10,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
                cmpi.w  #VDPTILE_SCREEN_BLACK_BAR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(SPRITE_00_VDPTILE).l
                beq.s   loc_6456
                cmpi.b  #$20,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
                bra.s   loc_645C
loc_6456:
                
                cmpi.b  #$30,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
loc_645C:
                
                bcs.s   loc_6462
                bsr.w   NewDialogueLine
loc_6462:
                
                bra.w   loc_62CA
@wait2:
                
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                move.w  d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                moveq   #20,d2
loc_6472:
                
                movem.l d6-d7,-(sp)
                move.w  #256,d6
                bsr.w   GenerateRandomNumber
                move.b  d7,((RANDOM_SEED_COPY-$1000000)).w
                movem.l (sp)+,d6-d7
                bsr.s   sub_64A8
                bsr.w   WaitForVInt
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A,d1
                beq.s   loc_6472
                sndCom  SFX_VALIDATION
                clr.w   d2
                bsr.s   sub_64A8
                move.w  (sp)+,d0
                move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
                bra.w   loc_62CA

    ; End of function ParseSpecialTextSymbol

                modend

; =============== S U B R O U T I N E =======================================


sub_64A8:
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   loc_64B0
                moveq   #1,d2
loc_64B0:
                
                cmpi.w  #VDPTILE_SCREEN_BLACK_BAR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(SPRITE_00_VDPTILE).l
                bne.s   loc_64C2
loc_64BA:
                
                lea     (SPRITE_07).l,a0
                bra.s   loc_64C8
loc_64C2:
                
                lea     (SPRITE_19).l,a0
loc_64C8:
                
                cmpi.w  #7,d2
                bge.s   loc_64DA
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                bra.s   loc_64E4
loc_64DA:
                
                move.w  #$168,VDPSPRITE_OFFSET_X(a0)
loc_64E0:
                
                move.w  #$148,(a0)
loc_64E4:
                
                clr.b   2(a0)
                move.w  #VDPTILE_V_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                subq.w  #1,d2
                bne.s   return_64F4
                moveq   #$14,d2
return_64F4:
                
                rts

    ; End of function sub_64A8


; =============== S U B R O U T I N E =======================================


UpdateForceAndGetFirstBattlePartyMemberIndex:
                
                jsr     j_UpdateForce
                clr.w   d0
                move.b  (BATTLE_PARTY_MEMBERS).l,d0
                rts

    ; End of function UpdateForceAndGetFirstBattlePartyMemberIndex


; START OF FUNCTION CHUNK FOR ParseSpecialTextSymbol

symbol_leader:
                
                bsr.s   UpdateForceAndGetFirstBattlePartyMemberIndex
                jsr     j_GetCombatantName
                moveq   #ALLYNAME_MAX_LENGTH,d7
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
symbol_player:
                
                bsr.w   GetNextTextSymbol
                jsr     j_GetCombatantName
                moveq   #ALLYNAME_MAX_LENGTH,d7
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
symbol_name:
                
                bsr.w   GetCurrentDialogueNameIndex
                move.w  d1,d0
                jsr     j_GetCombatantName
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
symbol_item:
                
                bsr.w   GetCurrentDialogueNameIndex
                jsr     j_GetItemName
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
symbol_number:
                
                move.l  ((DIALOGUE_NUMBER-$1000000)).w,d0
                jsr     (WriteAsciiNumber).w
                lea     ((DIALOGUE_STRING_TO_PRINT-$1000000)).w,a1
                move.l  a1,((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
                lea     ((LOADED_NUMBER-$1000000)).w,a0
                moveq   #9,d1
loc_6568:
                
                clr.w   d0
                move.b  (a0)+,d0
                cmpi.b  #32,d0
                beq.s   loc_6574
                move.b  d0,(a1)+
loc_6574:
                
                dbf     d1,loc_6568
                
                clr.b   (a1)
                bra.w   loc_62CA
symbol_class:
                
                bsr.w   GetCurrentDialogueNameIndex
            if (STANDARD_BUILD&FULL_CLASS_NAMES=1)
                jsr     GetFullClassName
            else
                jsr     j_GetClassName
            endif
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
symbol_wait1:
                
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                move.w  d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                moveq   #20,d2
loc_659C:
                
                movem.l d6-d7,-(sp)
                move.w  #256,d6
                bsr.w   GenerateRandomNumber
                move.b  d7,((RANDOM_SEED_COPY-$1000000)).w
                movem.l (sp)+,d6-d7
                bsr.w   WaitForVInt
loc_65B4:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A,d1
                beq.s   loc_659C
                move.w  (sp)+,d0
                move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
                bra.w   loc_62CA
symbol_delay1:
                
                move.w  #21,d0
loc_65CC:
                
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                movem.w d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
loc_65D8:
                
                tst.b   ((MOUTH_CONTROL_TOGGLE-$1000000)).w
                bne.s   loc_65EC
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A,d1
                bne.s   loc_65F0
                bsr.w   WaitForVInt
loc_65EC:
                
                dbf     d0,loc_65D8
loc_65F0:
                
                movem.w (sp)+,d0
                move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
                bra.w   loc_62CA
symbol_delay3:
                
                move.w  #119,d0
                bra.s   loc_65CC
symbol_spell:
                
                bsr.w   GetCurrentDialogueNameIndex
                jsr     j_GetSpellName
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
symbol_clear:
                
                bsr.w   ClearDialogueWindowLayout
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  d0,-(sp)
                bsr.w   GetWindowEntryAddress
                movea.l (a0),a1
                bsr.w   LoadDialogueWindowLayout
                move.w  (sp)+,d0
                move.w  #$8080,d1
                bsr.w   SetWindowDestination
                bsr.w   WaitForVInt
                bra.w   loc_62CA
symbol_color:
                
                bsr.w   GetNextTextSymbol
                move.b  d0,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
                bra.w   loc_62CA

; END OF FUNCTION CHUNK FOR ParseSpecialTextSymbol


; =============== S U B R O U T I N E =======================================

; Out: d1.w


GetCurrentDialogueNameIndex:
                
                movea.l ((CURRENT_DIALOGUE_NAME_INDEX_POINTER-$1000000)).w,a1
                move.w  (a1)+,d1
                move.l  a1,((CURRENT_DIALOGUE_NAME_INDEX_POINTER-$1000000)).w
                rts

    ; End of function GetCurrentDialogueNameIndex


; =============== S U B R O U T I N E =======================================

; Copy ASCII string of length D7 at A0 to RAM for dialogue textbox


CopyAsciiBytesForDialogueString:
                
                movea.l a0,a2
                subq.w  #1,d7
                lea     ((DIALOGUE_STRING_TO_PRINT-$1000000)).w,a1
                move.l  a1,((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
@Loop:
                
                move.b  (a2)+,(a1)+
                beq.w   @Return
                dbf     d7,@Loop
                
                clr.b   (a1)
@Return:
                
                rts

    ; End of function CopyAsciiBytesForDialogueString

