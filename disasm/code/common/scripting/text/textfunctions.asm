
; ASM FILE code\common\scripting\text\textfunctions.asm :
; 0x6260..0x6E94 : Text functions

; =============== S U B R O U T I N E =======================================

; d0 : string index


DisplayText:
                
                movem.l d0-a6,-(sp)
                move.w  d0,-(sp)
                bsr.w   sub_676E
                move.w  (sp)+,d0
                move.b  #1,((CURRENTLY_TYPEWRITING-$1000000)).w ; "Currently typewriting"
                movem.w d0,-(sp)        ; save string #
                lsr.w   #6,d0
                andi.b  #$FC,d0         ; string # -> bank pointer offset
                movea.l (p_pt_TextBanks).l,a0 ; load script bank pointer
                movea.l (a0,d0.w),a0
                movem.w (sp)+,d0        ; restore string #
                andi.w  #$FF,d0         ; restrict to range 0-255
                moveq   #0,d7
                bra.s   loc_6298        
GoToNextString:
                
                move.b  (a0),d7         ; first string byte : string length
                adda.l  d7,a0
                addq.l  #1,a0
loc_6298:
                
                dbf     d0,GoToNextString ; loop until wanted string reached
                clr.l   ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w 
                                                        ; get ready
                clr.b   ((byte_FFB6D8-$1000000)).w
                move.b  (a0)+,((COMPRESSED_STRING_LENGTH-$1000000)).w 
                                                        ; keep length of current string
loc_62A8:
                
                move.l  #TEXT_NAME_INDEX_1,((CURRENT_DIALOGUE_NAME_INDEX_ADDRESS-$1000000)).w
                move.b  #1,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
                cmpi.b  #1,((COMPRESSED_STRING_LENGTH-$1000000)).w ; check length
                beq.w   loc_62FE
                jsr     j_InitDecoder   ; initialize decoder
                move.l  a0,((COMPRESSED_STRING_POINTER-$1000000)).w ; keep string pointer
loc_62CA:
                
                bsr.w   GetNextTextSymbol
                cmpi.b  #$FE,d0
                beq.s   loc_62FE
                cmpi.b  #$EE,d0
                bcc.w   ParseSpecialTextSymbol ; if symbol >= $EE
                bset    #0,((byte_FFB6D8-$1000000)).w
                bne.s   loc_62F2
                cmpi.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                beq.s   loc_62F2
                move.b  #$FF,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
loc_62F2:
                
                bsr.s   sub_6308
                bsr.w   SymbolsToGraphics
                bsr.w   HandleDialogueTypewriting
                bra.s   loc_62CA
loc_62FE:
                
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                movem.l (sp)+,d0-a6
                rts

    ; End of function DisplayText


; =============== S U B R O U T I N E =======================================


sub_6308:
                
                cmpi.b  #$CC,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                bls.s   return_634C
                bsr.w   ClearNextLineOfDialoguePixels ; line end reached
                move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                addi.b  #$10,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                beq.s   loc_6332
                cmpi.b  #$20,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
                bra.s   loc_6338
loc_6332:
                
                cmpi.b  #$30,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
loc_6338:
                
                bcs.s   return_634C

    ; End of function sub_6308


; =============== S U B R O U T I N E =======================================


sub_633A:
                
                movem.l d0,-(sp)
                bsr.w   sub_6AD2
                movem.l (sp)+,d0
                subi.b  #$10,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
return_634C:
                
                rts

    ; End of function sub_633A


; =============== S U B R O U T I N E =======================================


GetNextTextSymbol:
                
                tst.l   ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
                bne.w   loc_6366
                movea.l ((COMPRESSED_STRING_POINTER-$1000000)).w,a0
                jsr     j_HuffmanDecode
                move.l  a0,((COMPRESSED_STRING_POINTER-$1000000)).w
                rts
loc_6366:
                
                movea.l ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w,a1
                clr.w   d0
                move.b  (a1)+,d0
                move.b  (a1),d1
                move.l  a1,((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
                lea     byte_666E(pc), a1
                move.b  (a1,d0.w),d0
                tst.b   d1
                bne.s   return_6384
                clr.l   ((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
return_6384:
                
                rts

    ; End of function GetNextTextSymbol


; =============== S U B R O U T I N E =======================================


ParseSpecialTextSymbol:
                
                cmpi.b  #$EE,d0         ; regular tile
                beq.w   loc_640A
                cmpi.b  #$F3,d0         ; leader
                beq.w   leader
                cmpi.b  #$F0,d0         ; delay 2
                beq.w   loc_6414
                cmpi.b  #$EF,d0         ; line
                beq.w   loc_6434
                cmpi.b  #$F7,d0         ; wait 2
                beq.w   loc_6466
                cmpi.b  #$F2,d0         ; name
                beq.w   name
                cmpi.b  #$F4,d0         ; item
                beq.w   item
                cmpi.b  #$F1,d0         ; number
                beq.w   number
                cmpi.b  #$F6,d0         ; class
                beq.w   class
                cmpi.b  #$FA,d0         ; wait 1
                beq.w   wait
                cmpi.b  #$F8,d0         ; delay 1
                beq.w   delay1
                cmpi.b  #$F9,d0         ; delay 3
                beq.w   delay3
                cmpi.b  #$F5,d0         ; spell
                beq.w   spell
                cmpi.b  #$FB,d0         ; clear
                beq.w   clear
                cmpi.b  #$FD,d0         ; color #
                beq.w   color
                cmpi.b  #$FC,d0         ; name #
                beq.w   player
                bra.w   loc_62CA
loc_640A:
                
                move.b  #1,((byte_FFB6D8-$1000000)).w
                bra.w   loc_62CA
loc_6414:
                
                move.w  #$77,d0 
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                movem.w d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bsr.w   Sleep           
                movem.w (sp)+,d0
                move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
                bra.w   loc_62CA
loc_6434:
                
                bsr.w   ClearNextLineOfDialoguePixels
                move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                addi.b  #$10,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                beq.s   loc_6456
                cmpi.b  #$20,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
                bra.s   loc_645C
loc_6456:
                
                cmpi.b  #$30,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
loc_645C:
                
                bcs.s   loc_6462
                bsr.w   sub_633A
loc_6462:
                
                bra.w   loc_62CA
loc_6466:
                
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                move.w  d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                moveq   #$14,d2
loc_6472:
                
                movem.l d6-d7,-(sp)
                move.w  #$100,d6
                bsr.w   GenerateRandomNumber
                move.b  d7,((RANDOM_WAITING_FOR_INPUT-$1000000)).w
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


; =============== S U B R O U T I N E =======================================


sub_64A8:
                
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                beq.s   loc_64B0
                moveq   #1,d2
loc_64B0:
                
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
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

leader:
                
                bsr.s   UpdateForceAndGetFirstBattlePartyMemberIndex
                jsr     j_GetCombatantName
                moveq   #ALLYNAME_MAX_LENGTH,d7
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
player:
                
                bsr.w   GetNextTextSymbol
                jsr     j_GetCombatantName
                moveq   #ALLYNAME_MAX_LENGTH,d7
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
name:
                
                bsr.w   sub_6648
                move.w  d1,d0
                jsr     j_GetCombatantName
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
item:
                
                bsr.w   sub_6648
                jsr     j_FindItemName
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
number:
                
                move.l  ((TEXT_NUMBER-$1000000)).w,d0
                jsr     (WriteAsciiNumber).w
                lea     ((DIALOGUE_STRING_TO_PRINT-$1000000)).w,a1
                move.l  a1,((CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS-$1000000)).w
                lea     ((LOADED_NUMBER-$1000000)).w,a0
                moveq   #9,d1
loc_6568:
                
                clr.w   d0
                move.b  (a0)+,d0
                cmpi.b  #$20,d0 
                beq.s   loc_6574
                move.b  d0,(a1)+
loc_6574:
                
                dbf     d1,loc_6568
                clr.b   (a1)
                bra.w   loc_62CA
class:
                
                bsr.w   sub_6648
                
                if (FULL_CLASS_NAMES=0)
                jsr     j_GetClassName
                else
                bsr.w   GetFullClassName
                endif
                
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
wait:
                
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                move.w  d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                moveq   #$14,d2
loc_659C:
                
                movem.l d6-d7,-(sp)
                move.w  #$100,d6
                bsr.w   GenerateRandomNumber
                move.b  d7,((RANDOM_WAITING_FOR_INPUT-$1000000)).w
                movem.l (sp)+,d6-d7
                bsr.w   WaitForVInt
loc_65B4:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A,d1
                beq.s   loc_659C
                move.w  (sp)+,d0
                move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
                bra.w   loc_62CA
delay1:
                
                move.w  #$15,d0
loc_65CC:
                
                move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
                movem.w d2,-(sp)
                clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
loc_65D8:
                
                tst.b   ((byte_FFB198-$1000000)).w
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
delay3:
                
                move.w  #$77,d0 
                bra.s   loc_65CC
spell:
                
                bsr.w   sub_6648
                jsr     j_FindSpellName
                bsr.w   CopyAsciiBytesForDialogueString
                bra.w   loc_62CA
clear:
                
                bsr.w   sub_6872
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  d0,-(sp)
                bsr.w   GetWindowInfo   
                movea.l (a0),a1
                bsr.w   sub_67E6
                move.w  (sp)+,d0
                move.w  #$8080,d1
                bsr.w   SetWindowDestination
                bsr.w   WaitForVInt
                bra.w   loc_62CA
color:
                
                bsr.w   GetNextTextSymbol
                move.b  d0,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
                bra.w   loc_62CA

; END OF FUNCTION CHUNK FOR ParseSpecialTextSymbol


; =============== S U B R O U T I N E =======================================


sub_6648:
                
                movea.l ((CURRENT_DIALOGUE_NAME_INDEX_ADDRESS-$1000000)).w,a1
                move.w  (a1)+,d1
                move.l  a1,((CURRENT_DIALOGUE_NAME_INDEX_ADDRESS-$1000000)).w
                rts

    ; End of function sub_6648


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

byte_666E:      dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b $44
                dc.b 1
                dc.b $4B
                dc.b 1
                dc.b $4C
                dc.b $4D
                dc.b $48
                dc.b $49
                dc.b $4A
                dc.b 1
                dc.b $4E
                dc.b $43
                dc.b $41
                dc.b $42
                dc.b $4F
                dc.b 2
                dc.b 3
                dc.b 4
                dc.b 5
                dc.b 6
                dc.b 7
                dc.b 8
                dc.b 9
                dc.b $A
                dc.b $B
                dc.b $50
                dc.b 1
                dc.b $49
                dc.b 1
                dc.b $4A
                dc.b $45
                dc.b 1
                dc.b $C
                dc.b $D
                dc.b $E
                dc.b $F
                dc.b $10
                dc.b $11
                dc.b $12
                dc.b $13
                dc.b $14
                dc.b $15
                dc.b $16
                dc.b $17
                dc.b $18
                dc.b $19
                dc.b $1A
                dc.b $1B
                dc.b $1C
                dc.b $1D
                dc.b $1E
                dc.b $1F
                dc.b $20
                dc.b $21
                dc.b $22
                dc.b $23
                dc.b $24
                dc.b $25
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b $40
                dc.b 1
                dc.b $26
                dc.b $27
                dc.b $28
                dc.b $29
                dc.b $2A
                dc.b $2B
                dc.b $2C
                dc.b $2D
                dc.b $2E
                dc.b $2F
                dc.b $30
                dc.b $31
                dc.b $32
                dc.b $33
                dc.b $34
                dc.b $35
                dc.b $36
                dc.b $37
                dc.b $38
                dc.b $39
                dc.b $3A
                dc.b $3B
                dc.b $3C
                dc.b $3D
                dc.b $3E
                dc.b $3F
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b $40
                dc.b 1
                dc.b $26
                dc.b $27
                dc.b $28
                dc.b $29
                dc.b $2A
                dc.b $2B
                dc.b $2C
                dc.b $2D
                dc.b $2E
                dc.b $2F
                dc.b $30
                dc.b $31
                dc.b $32
                dc.b $33
                dc.b $34
                dc.b $35
                dc.b $36
                dc.b $37
                dc.b $38
                dc.b $39
                dc.b $3A
                dc.b $3B
                dc.b $3C
                dc.b $3D
                dc.b $3E
                dc.b $3F
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b $40
                dc.b 1
                dc.b $42
                dc.b $49
                dc.b $4A
                dc.b $42
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1
                dc.b 1

; =============== S U B R O U T I N E =======================================


sub_676E:
                
                tst.w   ((TEXT_WINDOW_INDEX-$1000000)).w
                bne.w   return_67E4
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                bsr.w   sub_6872
                move.b  #1,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
loc_6784:
                
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6794
                move.w  #$1D08,d0
                bra.s   loc_6798
loc_6794:
                
                move.w  #$1D06,d0
loc_6798:
                
                move.w  #$21D,d1
                bsr.w   CreateWindow    
                addq.w  #1,d0
                move.w  d0,((TEXT_WINDOW_INDEX-$1000000)).w
                bsr.w   sub_67E6
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_67CE
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$213,d1
                move.w  #8,d2
                bsr.w   MoveWindow      
                moveq   #8,d0
                bsr.w   Sleep           
                bra.s   return_67E4
loc_67CE:
                
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$215,d1
                move.w  #1,d2
                bsr.w   MoveWindow      
loc_67E0:
                
                bsr.w   WaitForVInt
return_67E4:
                
                rts

    ; End of function sub_676E


; =============== S U B R O U T I N E =======================================


sub_67E6:
                
                cmpi.w  #VDPTILE_SCREEN_BLACK_BAR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(SPRITE_00_TILE_FLAGS).l 
                                                        ; check if we are on the map or in battle (by checking for presence of black bar sprites)
                bne.s   loc_67F6
                move.w  #WINDOW_DIALOGUE_TILELINECOUNTER_EVENT,d6
                bra.s   loc_67FA
loc_67F6:
                
                move.w  #WINDOW_DIALOGUE_TILELINECOUNTER_BATTLE,d6
loc_67FA:
                
                move.w  #VDPTILE_CORNER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                move.w  #VDPTILE_H_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d1
                move.w  #VDPTILE_CORNER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d2
                clr.w   d3
                bsr.w   CopyLineOfVdpTileOrderForDialogueWindowToRam
                move.w  #VDPTILE_V_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                move.w  #VDPTILE_MESSAGE_START|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d1
                move.w  #VDPTILE_V_BORDER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d2
                move.w  ((DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET-$1000000)).w,d4
                lsl.w   #5,d4
                add.w   d4,d1
                moveq   #1,d3
loc_6822:
                
                move.w  d1,-(sp)
                bsr.w   CopyLineOfVdpTileOrderForDialogueWindowToRam
                move.w  (sp)+,d1
                addi.w  #$20,d1 
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6844
loc_6838:
                
                cmpi.w  #$C700,d1
                blt.s   loc_6842
                subi.w  #$C0,d1 
loc_6842:
                
                bra.s   loc_684E
loc_6844:
                
                cmpi.w  #$C6C0,d1
                blt.s   loc_684E
                subi.w  #$80,d1 
loc_684E:
                
                dbf     d6,loc_6822
                move.w  #$D060,d0
                move.w  #$D061,d1
                move.w  #$D860,d2
                clr.w   d3

    ; End of function sub_67E6


; =============== S U B R O U T I N E =======================================

; In: A1 = address in RAM to copy VDP tile indexes
;     D0 = VDP tile index for left border of line
;     D1 = VDP tile index for first inner box tile of line
;     D2 = VDP tile index for right border of line
;     D3 = amount to add to D1 each time a tile is copied (0 for top and bottom border lines, 1 for inner box)


CopyLineOfVdpTileOrderForDialogueWindowToRam:
                
                move.w  d0,(a1)+
loc_6862:
                
                move.w  #WINDOW_DIALOGUE_WIDTHINTILES,d7
loc_6866:
                
                move.w  d1,(a1)+
                add.w   d3,d1
                dbf     d7,loc_6866
                move.w  d2,(a1)+
                rts

    ; End of function CopyLineOfVdpTileOrderForDialogueWindowToRam


; =============== S U B R O U T I N E =======================================


sub_6872:
                
                clr.w   ((DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET-$1000000)).w
                move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
loc_687C:
                
                move.b  #0,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
                lea     (FF6802_LOADING_SPACE).l,a0
                move.w  #$5FF,d7
loc_688C:
                
                move.l  #$FFFFFFFF,(a0)+
                dbf     d7,loc_688C
                clr.w   d0
                bra.w   loc_68FC

    ; End of function sub_6872


; =============== S U B R O U T I N E =======================================


HandleDialogueTypewriting:
                
                cmpi.b  #$7C,d0 
                beq.w   return_68FA
                cmpi.b  #$7D,d0 
loc_68A8:
                
                beq.w   return_68FA
                move.w  d0,-(sp)
                bsr.w   HandleBlinkingDialogueCursor
                move.w  (sp)+,d1
                clr.w   d0
                moveq   #3,d2
                sub.b   ((MESSAGE_SPEED-$1000000)).w,d2
                beq.s   loc_68C2
                subq.w  #1,d2
                bset    d2,d0
loc_68C2:
                
                cmpi.b  #1,d1
                beq.s   loc_68DE        ; skip playing speech sound if character is a space
                eori.b  #1,((SPEECH_SOUND_TOGGLE-$1000000)).w
                beq.s   loc_68DC
                move.w  d0,-(sp)
                move.w  ((SPEECH_SFX-$1000000)).w,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                move.w  (sp)+,d0
loc_68DC:
                
                bra.s   loc_68E2
loc_68DE:
                
                clr.b   ((SPEECH_SOUND_TOGGLE-$1000000)).w
loc_68E2:
                
                subq.w  #1,d0
                blt.s   return_68FA
loc_68E6:
                
                tst.b   ((byte_FFB198-$1000000)).w
                bne.s   loc_68F2
                tst.b   ((P1_INPUT-$1000000)).w
                bne.s   return_68FA
loc_68F2:
                
                bsr.w   WaitForVInt
                dbf     d0,loc_68E6
return_68FA:
                
                rts

    ; End of function HandleDialogueTypewriting


; START OF FUNCTION CHUNK FOR sub_6872

loc_68FC:
                
                bsr.w   WaitForVInt
loc_6900:
                
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($C800).l,a1
loc_690C:
                
                move.w  #$1B0,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                lea     (byte_FF6C02).l,a0
                lea     ($CC00).l,a1
                bsr.w   ApplyVIntVramDma
                lea     (byte_FF7002).l,a0
                lea     ($D000).l,a1
                bsr.w   ApplyVIntVramDma
                bsr.w   WaitForDmaQueueProcessing
                lea     (byte_FF7402).l,a0
                lea     ($D400).l,a1
                bsr.w   ApplyVIntVramDma
loc_694C:
                
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6976
                lea     (byte_FF7802).l,a0
                lea     ($D800).l,a1
                bsr.w   ApplyVIntVramDma
                lea     (byte_FF7C02).l,a0
                lea     ($DC00).l,a1
                bsr.w   ApplyVIntVramDma
loc_6976:
                
                bra.w   EnableDmaQueueProcessing

; END OF FUNCTION CHUNK FOR sub_6872


; =============== S U B R O U T I N E =======================================


HandleBlinkingDialogueCursor:
                
                move.w  ((DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET-$1000000)).w,d0
                lsl.w   #3,d0
                add.b   ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_699A
                cmpi.b  #$30,d0 
                blt.s   loc_6998
                subi.b  #$30,d0 
loc_6998:
                
                bra.s   loc_69A4
loc_699A:
                
                cmpi.b  #$20,d0 
                blt.s   loc_69A4
                subi.b  #$20,d0 
loc_69A4:
                
                cmpi.b  #$10,d0
                bge.w   loc_69D8
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($C800).l,a1
                move.w  #$1B0,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                lea     (byte_FF6C02).l,a0
                lea     ($CC00).l,a1
                bsr.w   ApplyVIntVramDma
                bra.w   WaitForDmaQueueProcessing
loc_69D8:
                
                cmpi.b  #$20,d0 
loc_69DC:
                
                bge.w   loc_6A0C
                lea     (byte_FF7002).l,a0
                lea     ($D000).l,a1
                move.w  #$1B0,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                lea     (byte_FF7402).l,a0
                lea     ($D400).l,a1
                bsr.w   ApplyVIntVramDma
                bra.w   WaitForDmaQueueProcessing
loc_6A0C:
                
                lea     (byte_FF7802).l,a0
                lea     ($D800).l,a1
                move.w  #$1B0,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                lea     (byte_FF7C02).l,a0
                lea     ($DC00).l,a1
                bsr.w   ApplyVIntVramDma
                bra.w   WaitForDmaQueueProcessing

    ; End of function HandleBlinkingDialogueCursor


; =============== S U B R O U T I N E =======================================


HideTextBox:
                
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                blt.s   return_6A7E
                move.w  #$21D,d1
loc_6A44:
                
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6A56
                moveq   #8,d2
                bsr.w   MoveWindow      
                bra.s   loc_6A68
loc_6A56:
                
                moveq   #1,d2
                bsr.w   MoveWindow      
                moveq   #1,d0
                move.w  #$8080,d1
                moveq   #1,d2
                bsr.w   MoveWindow      
loc_6A68:
                
                bsr.w   WaitForWindowMovementEnd
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                bsr.w   ClearWindowAndUpdateEndPointer
                clr.w   ((TEXT_WINDOW_INDEX-$1000000)).w
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
return_6A7E:
                
                rts

    ; End of function HideTextBox


; =============== S U B R O U T I N E =======================================


ClearNextLineOfDialoguePixels:
                
                move.w  d0,-(sp)
                move.w  ((DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET-$1000000)).w,d0
                addq.w  #2,d0
                cmpi.w  #6,d0
                bne.s   loc_6A90
                clr.w   d0
loc_6A90:
                
                lsl.w   #3,d0
                add.b   ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
loc_6A96:
                
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6AAC
                cmpi.b  #$30,d0 
                blt.s   loc_6AAA
                subi.b  #$30,d0 
loc_6AAA:
                
                bra.s   loc_6AB6
loc_6AAC:
                
                cmpi.b  #$20,d0 
                blt.s   loc_6AB6
                subi.b  #$20,d0 
loc_6AB6:
                
                lsl.w   #7,d0
                lea     (FF6802_LOADING_SPACE).l,a0
                adda.w  d0,a0
                move.w  #$1FF,d0
loc_6AC4:
                
                move.l  #$FFFFFFFF,(a0)+
                dbf     d0,loc_6AC4
                move.w  (sp)+,d0
                rts

    ; End of function ClearNextLineOfDialoguePixels


; =============== S U B R O U T I N E =======================================


sub_6AD2:
                
                bsr.w   sub_6AE0
                bsr.w   sub_6AE0
                bsr.w   WaitForVInt
                rts

    ; End of function sub_6AD2


; =============== S U B R O U T I N E =======================================


sub_6AE0:
                
                move.w  ((DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET-$1000000)).w,d0
                move.w  d0,-(sp)
                addq.w  #1,d0
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6AF8
                cmpi.w  #6,d0
                bra.s   loc_6AFC
loc_6AF8:
                
                cmpi.w  #4,d0
loc_6AFC:
                
                bne.s   loc_6B00
                clr.w   d0
loc_6B00:
                
                move.w  d0,((DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET-$1000000)).w
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  d0,-(sp)
                bsr.w   GetWindowInfo   
                movea.l (a0),a1
                bsr.w   sub_67E6
                move.w  (sp)+,d0
loc_6B18:
                
                move.w  #$8080,d1
                bsr.w   SetWindowDestination
                bsr.w   WaitForVInt
                move.w  (sp)+,d0
                lsl.w   #3,d0
                add.b   ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6B42
                cmpi.b  #$30,d0 
                blt.s   loc_6B40
                subi.b  #$30,d0 
loc_6B40:
                
                bra.s   loc_6B4C
loc_6B42:
                
                cmpi.b  #$20,d0 
                blt.s   loc_6B4C
                subi.b  #$20,d0 
loc_6B4C:
                
                lsl.w   #7,d0
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($C800).l,a1
                adda.w  d0,a0
                adda.w  d0,a1
                move.w  #$1B0,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                rts

    ; End of function sub_6AE0


; =============== S U B R O U T I N E =======================================


SymbolsToGraphics:
                
                movem.w d0-d2,-(sp)
                andi.w  #$FF,d0
                move.w  d0,d7
                move.b  ((USE_REGULAR_DIALOGUE_FONT-$1000000)).w,d1
                cmpi.b  #1,d1
                beq.s   loc_6B9E
                move.b  ((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w,d2
                movem.w d0-d2/d7,-(sp)
                bsr.s   DialogueGraphicsToRam
                movem.w (sp)+,d0-d2/d7
                addq.b  #1,d2
                move.b  d2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                bsr.s   DialogueGraphicsToRam
                addq.w  #1,d4
                bra.s   loc_6BA0
loc_6B9E:
                
                bsr.s   DialogueGraphicsToRam
loc_6BA0:
                
                movem.w (sp)+,d0-d2
                rts

    ; End of function SymbolsToGraphics


; =============== S U B R O U T I N E =======================================


DialogueGraphicsToRam:
                
                subq.w  #1,d7
                lsl.w   #5,d7
                movea.l (p_VariableWidthFont).l,a0
                adda.w  d7,a0
                move.w  (a0)+,d4
                andi.w  #$F,d4
                beq.s   loc_6BBC
                addq.w  #1,d4
loc_6BBC:
                
                bsr.s   sub_6BDE
                move.w  d6,d7
loc_6BC0:
                
                bsr.w   sub_6C3A
                addq.l  #4,a2
                addq.w  #1,d5
                cmpi.w  #8,d5
                bcs.s   loc_6BD4
                clr.w   d5
                adda.w  #$3E0,a2
loc_6BD4:
                
                dbf     d7,loc_6BC0
                add.b   d4,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
                rts

    ; End of function DialogueGraphicsToRam


; =============== S U B R O U T I N E =======================================


sub_6BDE:
                
                move.b  d1,d2
                lsl.b   #4,d2
                move.b  ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
                move.w  ((DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET-$1000000)).w,d3
                lsl.w   #3,d3
                add.b   d3,d0
                cmpi.w  #$C77C,(SPRITE_00_TILE_FLAGS).l
                bne.s   loc_6C04
                cmpi.b  #$30,d0 
                blt.s   loc_6C02
                subi.b  #$30,d0 
loc_6C02:
                
                bra.s   loc_6C0E
loc_6C04:
                
                cmpi.b  #$20,d0 
                blt.s   loc_6C0E
                subi.b  #$20,d0 
loc_6C0E:
                
                andi.w  #$F8,d0 
                lsl.w   #7,d0
                move.b  ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d3
                andi.w  #7,d3
                move.w  d3,d5
                lsl.w   #2,d3
                add.w   d3,d0
                move.b  ((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w,d3
                andi.w  #$F8,d3 
                lsl.w   #2,d3
                add.w   d3,d0
                lea     (FF6802_LOADING_SPACE).l,a2
                adda.w  d0,a2
                moveq   #$E,d6
                rts

    ; End of function sub_6BDE


; =============== S U B R O U T I N E =======================================


sub_6C3A:
                
                move.w  (a0)+,d0
                moveq   #$B,d6
loc_6C3E:
                
                lsl.w   #1,d0
                bcc.s   loc_6C80
                move.b  ((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w,d3
                andi.w  #7,d3
                addi.w  #$B,d3
                sub.w   d6,d3
                add.w   d3,d3
                move.w  rjt_6C5A(pc,d3.w),d3
                jmp     rjt_6C5A(pc,d3.w)
rjt_6C5A:
                
                dc.w sub_6C86-rjt_6C5A
                dc.w sub_6C8E-rjt_6C5A
                dc.w sub_6C96-rjt_6C5A
                dc.w sub_6CA2-rjt_6C5A
                dc.w sub_6CAE-rjt_6C5A
                dc.w sub_6CBA-rjt_6C5A
                dc.w sub_6CC6-rjt_6C5A
                dc.w sub_6CD2-rjt_6C5A
                dc.w sub_6CDE-rjt_6C5A
                dc.w sub_6CEA-rjt_6C5A
                dc.w sub_6CF6-rjt_6C5A
                dc.w sub_6D04-rjt_6C5A
                dc.w sub_6D12-rjt_6C5A
                dc.w sub_6D20-rjt_6C5A
                dc.w sub_6D2E-rjt_6C5A
                dc.w sub_6D3C-rjt_6C5A
                dc.w sub_6D4A-rjt_6C5A
                dc.w sub_6D58-rjt_6C5A
                dc.w sub_6D66-rjt_6C5A
loc_6C80:
                
                dbf     d6,loc_6C3E
                rts

    ; End of function sub_6C3A


; =============== S U B R O U T I N E =======================================


sub_6C86:
                
                andi.b  #$F,(a2)
                or.b    d2,(a2)
                bra.s   loc_6C80

    ; End of function sub_6C86


; =============== S U B R O U T I N E =======================================


sub_6C8E:
                
                andi.b  #$F0,(a2)
                or.b    d1,(a2)
                bra.s   loc_6C80

    ; End of function sub_6C8E


; =============== S U B R O U T I N E =======================================


sub_6C96:
                
                andi.b  #$F,1(a2)
                or.b    d2,1(a2)
                bra.s   loc_6C80

    ; End of function sub_6C96


; =============== S U B R O U T I N E =======================================


sub_6CA2:
                
                andi.b  #$F0,1(a2)
                or.b    d1,1(a2)
                bra.s   loc_6C80

    ; End of function sub_6CA2


; =============== S U B R O U T I N E =======================================


sub_6CAE:
                
                andi.b  #$F,2(a2)
                or.b    d2,2(a2)
                bra.s   loc_6C80

    ; End of function sub_6CAE


; =============== S U B R O U T I N E =======================================


sub_6CBA:
                
                andi.b  #$F0,2(a2)
                or.b    d1,2(a2)
                bra.s   loc_6C80

    ; End of function sub_6CBA


; =============== S U B R O U T I N E =======================================


sub_6CC6:
                
                andi.b  #$F,3(a2)
                or.b    d2,3(a2)
                bra.s   loc_6C80

    ; End of function sub_6CC6


; =============== S U B R O U T I N E =======================================


sub_6CD2:
                
                andi.b  #$F0,3(a2)
                or.b    d1,3(a2)
                bra.s   loc_6C80

    ; End of function sub_6CD2


; =============== S U B R O U T I N E =======================================


sub_6CDE:
                
                andi.b  #$F,$20(a2)
                or.b    d2,$20(a2)
                bra.s   loc_6C80

    ; End of function sub_6CDE


; =============== S U B R O U T I N E =======================================


sub_6CEA:
                
                andi.b  #$F0,$20(a2)
                or.b    d1,$20(a2)
                bra.s   loc_6C80

    ; End of function sub_6CEA


; =============== S U B R O U T I N E =======================================


sub_6CF6:
                
                andi.b  #$F,$21(a2)
                or.b    d2,$21(a2)
                bra.w   loc_6C80

    ; End of function sub_6CF6


; =============== S U B R O U T I N E =======================================


sub_6D04:
                
                andi.b  #$F0,$21(a2)
                or.b    d1,$21(a2)
loc_6D0E:
                
                bra.w   loc_6C80

    ; End of function sub_6D04


; =============== S U B R O U T I N E =======================================


sub_6D12:
                
                andi.b  #$F,$22(a2)
                or.b    d2,$22(a2)
                bra.w   loc_6C80

    ; End of function sub_6D12


; =============== S U B R O U T I N E =======================================


sub_6D20:
                
                andi.b  #$F0,$22(a2)
                or.b    d1,$22(a2)
                bra.w   loc_6C80

    ; End of function sub_6D20


; =============== S U B R O U T I N E =======================================


sub_6D2E:
                
                andi.b  #$F,$23(a2)
                or.b    d2,$23(a2)
                bra.w   loc_6C80

    ; End of function sub_6D2E


; =============== S U B R O U T I N E =======================================


sub_6D3C:
                
                andi.b  #$F0,$23(a2)
                or.b    d1,$23(a2)
                bra.w   loc_6C80

    ; End of function sub_6D3C


; =============== S U B R O U T I N E =======================================


sub_6D4A:
                
                andi.b  #$F,$40(a2)
                or.b    d2,$40(a2)
                bra.w   loc_6C80

    ; End of function sub_6D4A


; =============== S U B R O U T I N E =======================================


sub_6D58:
                
                andi.b  #$F0,$40(a2)
                or.b    d1,$40(a2)
                bra.w   loc_6C80

    ; End of function sub_6D58


; =============== S U B R O U T I N E =======================================


sub_6D66:
                
                andi.b  #$F,$41(a2)
                or.b    d2,$41(a2)
                bra.w   loc_6C80

    ; End of function sub_6D66

                dc.b 0                  ; unused layout ?
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $E
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $EC
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b $EC
                dc.b $BE
                dc.b $CB
                dc.b $11
                dc.b $EC
                dc.b $BC
                dc.b $B1
                dc.b $CC
                dc.b $EC
                dc.b $BB
                dc.b $1C
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $EE
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $11
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
                dc.b $EC
                dc.b $B1
                dc.b $CD
                dc.b $DD
