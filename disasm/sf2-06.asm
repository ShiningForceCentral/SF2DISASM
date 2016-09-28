
; GAME SECTION 06 :
; Fonts, Menu Tiles, Text Decoding Functions, SEGA Logo, Game Staff, Conf/Debug modes, End Kiss Sequence, Script Huffman Trees, Scriptbanks

; FREE SPACE : 6681 bytes.


p_pt_ScriptBanks:   dc.l pt_TextBanks

; =============== S U B R O U T I N E =======================================

j_InitDecoder:
										
										jmp     InitDecoder(pc) 

	; End of function j_InitDecoder


; =============== S U B R O U T I N E =======================================

j_HuffmanDecode:
										
										jmp     HuffmanDecode(pc)

	; End of function j_HuffmanDecode

p_VariableWidthFont:dc.l VariableWidthFont
p_MenuTiles_Uncompressed:
										dc.l MenuTiles_Uncompressed
p_MenuTiles_Item:   dc.l MenuTiles_Item
p_MenuTiles_BattleField:
										dc.l MenuTiles_BattleField
p_Menutiles_Church: dc.l MenuTiles_Church
p_MenuTiles_Shop:   dc.l MenuTiles_Shop
p_MenuTiles_Caravan:dc.l MenuTiles_Caravan
p_MenuTiles_Depot:  dc.l MenuTiles_Depot
p_MenuTiles_YesNo:  dc.l MenuTiles_YesNo
p_plt_WitchChoice:  dc.l plt_WitchChoice
p_WitchBubbleAnimation:
										dc.l WitchBubbleAnimation
p_SpeechBalloonTiles:
										dc.l SpeechBalloonTiles

; =============== S U B R O U T I N E =======================================

j_DisplaySegaLogo:
										
										jmp     DisplaySegaLogo(pc)

	; End of function j_DisplaySegaLogo

p_GameStaff:        dc.l GameStaff

; =============== S U B R O U T I N E =======================================

j_EndKissPictureSequence:
										
										jmp     EndKissPictureSequence(pc)

	; End of function j_EndKissPictureSequence


; =============== S U B R O U T I N E =======================================

j_LoadTitleScreenFont:
										
										jmp     LoadTitleScreenFont(pc)

	; End of function j_LoadTitleScreenFont


; =============== S U B R O U T I N E =======================================

DisplaySegaLogo:
										
										trap    #TRAP_SOUNDCOM
										dc.w SOUND_COMMAND_INIT_DRIVER
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_CLEAR
										jsr     (DisableDisplayAndVInt).w
										jsr     (ClearVsramAndSprites).w
										move.w  #$8C81,d0
										jsr     (SetVdpReg).w   
										move.w  #$9000,d0
										jsr     (SetVdpReg).w   
										move.w  #$8230,d0
										jsr     (SetVdpReg).w   
										move.w  #$8406,d0
										jsr     (SetVdpReg).w   
										move.w  #$8B03,d0
										jsr     (SetVdpReg).w   
										lea     SegaLogo(pc), a0
										lea     ($2000).w,a1
										move.w  #$C00,d0
										move.w  #2,d1
										jsr     (DmaTilesViaFF8804).w
										lea     SegaLogoPalette(pc), a0
										lea     (PALETTE_1).l,a1
										lea     (FFD080_Palette1bis).l,a2
										moveq   #7,d7
loc_280AA:
										
										move.l  (a0),(a1)+
										move.l  (a0)+,(a2)+
										dbf     d7,loc_280AA
										jsr     (StoreVdpCommandster).w
										jsr     (Set_FFDE94_bit3).w
										jsr     (EnableDisplayAndInterrupts).w
										move.l  #InputSequence_ConfigurationMode,((CONFIGURATION_MODE_SEQUENCE_POINTER-$1000000)).w
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_CheckConfigurationModeCheat
										move.l  #InputSequence_DebugMode,((dword_FFB1A0-$1000000)).w
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_CheckDebugModeCheat
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((unk_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										bsr.w   sub_28F62
										lea     byte_28BB8(pc), a0
										nop
										bsr.w   sub_28B12
										moveq   #$14,d0
										jsr     (Sleep).w       
										bsr.w   sub_28B12
										move.l  #$D80405,(dword_FFDCA0).l
										move.l  #$62014A,(dword_FFDCA4).l
										moveq   #$A,d0
										jsr     (Sleep).w       
										move.w  #$28,d0 
loc_2812E:
										
										lea     SegaLogoColors+4(pc,d0.w),a0
																						; lea     segaLogoColors(pc,d0.w),a0
										movem.l d0,-(sp)
										lea     (dword_FFD084).l,a1
										lea     (dword_FFD004).l,a2
										moveq   #$A,d0
										bsr.w   LoadSegaLogoPalette
										jsr     (DuplicatePalettes).w
										jsr     (Set_FFDE94_bit3).w
										move.w  #3,d0
										jsr     (Sleep).w       
										movem.l (sp)+,d0
										subq.w  #2,d0
										bpl.s   CheckStartButtonAtSegaLogo
										move.w  #$3C,d0 
loc_28164:
										
										jsr     (WaitForVInt).w 
										btst    #7,((RAM_Input_Player1_StateA-$1000000)).w
										bne.w   loc_2818E
										subq.w  #1,d0
										bne.s   loc_28164
										trap    #TRAP_VINTFUNCTIONS
										dc.w VINTS_REMOVE
										dc.l VInt_CheckConfigurationModeCheat
										jsr     (FadeOutToBlack).w
										clr.w   d0
										rts

	; End of function DisplaySegaLogo


; =============== S U B R O U T I N E =======================================

CheckStartButtonAtSegaLogo:
										
										btst    #7,((RAM_Input_Player1_StateA-$1000000)).w
										beq.s   loc_2812E       
loc_2818E:
										
										move.l  #$D80405,(dword_FFDCA0).l
										move.l  #$62014A,(dword_FFDCA4).l
										jsr     (FadeOutToBlack).w
										moveq   #$FFFFFFFF,d0
										rts

	; End of function CheckStartButtonAtSegaLogo

SegaLogoColors:     incbin "graphics/technical/segalogocolors.bin"
SegaLogoPalette:    incbin "graphics/technical/segalogopalette.bin"
SegaLogo:           incbin "graphics/technical/segalogo.bin"

; =============== S U B R O U T I N E =======================================

sub_28B12:
										
										cmpi.b  #$FF,(a0)
										beq.w   loc_28B64
										moveq   #3,d7
										lea     (byte_FFDC98).l,a1
										lea     word_28BB0(pc), a2
loc_28B26:
										
										clr.w   d0
										move.b  (a0)+,d0
										addi.w  #$F0,d0 
										move.w  d0,6(a1)
										clr.w   d0
										move.b  (a0)+,d0
										neg.w   d0
										addi.w  #$E0,d0 
										move.w  d0,(a1)
										clr.w   d0
										move.b  (a0)+,d0
										lsl.w   #4,d0
										addi.w  #$100,d0
										move.w  d0,4(a1)
										move.w  (a2)+,2(a1)
										subq.w  #8,a1
										dbf     d7,loc_28B26
										jsr     (WaitForVInt).w 
										btst    #7,((RAM_Input_Player1_StateA-$1000000)).w
										bne.s   loc_28B68
										bra.s   sub_28B12
loc_28B64:
										
										addq.w  #1,a0
										rts
loc_28B68:
										
										lea     byte_28F31(pc), a0
										nop
										moveq   #3,d7
										lea     (byte_FFDC98).l,a1
										lea     word_28BB0(pc), a2
loc_28B7A:
										
										clr.w   d0
										move.b  (a0)+,d0
										addi.w  #$F0,d0 
										move.w  d0,6(a1)
										clr.w   d0
										move.b  (a0)+,d0
										neg.w   d0
										addi.w  #$E0,d0 
										move.w  d0,(a1)
										clr.w   d0
										move.b  (a0)+,d0
										lsl.w   #4,d0
										addi.w  #$100,d0
										move.w  d0,4(a1)
										move.w  (a2)+,2(a1)
										subq.w  #8,a1
										dbf     d7,loc_28B7A
										addq.l  #4,sp
										bra.w   loc_2818E

	; End of function sub_28B12

word_28BB0:         dc.w $F04
										dc.w $F03
										dc.w $F02
										dc.w $F01
byte_28BB8:         dc.b $D0
										dc.b  $D
										dc.b   4
										dc.b $D0 
										dc.b   0
										dc.b   5
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $D0 
										dc.b  $D
										dc.b   4
										dc.b $D0 
										dc.b   0
										dc.b   5
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $CC 
										dc.b  $C
										dc.b   4
										dc.b $D0 
										dc.b   0
										dc.b   5
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $C8 
										dc.b  $A
										dc.b   4
										dc.b $D0 
										dc.b   0
										dc.b   5
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $C4 
										dc.b   8
										dc.b   4
										dc.b $D0 
										dc.b   0
										dc.b   1
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $C0 
										dc.b   4
										dc.b   0
										dc.b $D0 
										dc.b   0
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $BC 
										dc.b   8
										dc.b   8
										dc.b $D0 
										dc.b   0
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $B8 
										dc.b  $A
										dc.b   8
										dc.b $D0 
										dc.b   0
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $B4 
										dc.b  $C
										dc.b   8
										dc.b $D0 
										dc.b   0
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $B0 
										dc.b  $D
										dc.b   8
										dc.b $D0 
										dc.b   0
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $AC 
										dc.b  $E
										dc.b   8
										dc.b $D0 
										dc.b   0
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $A8 
										dc.b  $F
										dc.b   8
										dc.b $D0 
										dc.b  $A
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $A4 
										dc.b  $F
										dc.b   8
										dc.b $CC 
										dc.b  $C
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $A0 
										dc.b $10
										dc.b   0
										dc.b $C8 
										dc.b  $D
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $9C 
										dc.b  $F
										dc.b   4
										dc.b $C4 
										dc.b  $E
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $98 
										dc.b  $F
										dc.b   4
										dc.b $C0 
										dc.b  $F
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $94 
										dc.b  $E
										dc.b   4
										dc.b $BC 
										dc.b  $F
										dc.b   9
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $90 
										dc.b  $D
										dc.b   4
										dc.b $B8 
										dc.b $10
										dc.b   1
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $8C 
										dc.b  $C
										dc.b   4
										dc.b $B4 
										dc.b  $F
										dc.b   5
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $88 
										dc.b  $A
										dc.b   4
										dc.b $B0 
										dc.b  $F
										dc.b   5
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $84 
										dc.b   8
										dc.b   4
										dc.b $AC 
										dc.b  $E
										dc.b   5
										dc.b $D0 
										dc.b   0
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $80 
										dc.b   4
										dc.b   0
										dc.b $A8 
										dc.b  $D
										dc.b   5
										dc.b $CC 
										dc.b $10
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $7C 
										dc.b   8
										dc.b   8
										dc.b $A4 
										dc.b  $C
										dc.b   5
										dc.b $C8 
										dc.b  $F
										dc.b   6
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $78 
										dc.b  $A
										dc.b   8
										dc.b $A0 
										dc.b  $A
										dc.b   5
										dc.b $C4 
										dc.b  $F
										dc.b   6
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $74 
										dc.b  $C
										dc.b   8
										dc.b $9C 
										dc.b   8
										dc.b   5
										dc.b $C0 
										dc.b  $E
										dc.b   6
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $70 
										dc.b  $D
										dc.b   8
										dc.b $98 
										dc.b   4
										dc.b   1
										dc.b $BC 
										dc.b  $D
										dc.b   6
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $6C 
										dc.b  $E
										dc.b   8
										dc.b $94 
										dc.b   8
										dc.b   9
										dc.b $B8 
										dc.b  $C
										dc.b   6
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $68 
										dc.b  $F
										dc.b   8
										dc.b $90 
										dc.b  $A
										dc.b   9
										dc.b $B4 
										dc.b  $A
										dc.b   6
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $64 
										dc.b  $F
										dc.b   8
										dc.b $8C 
										dc.b  $C
										dc.b   9
										dc.b $B0 
										dc.b   8
										dc.b   6
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $60 
										dc.b $10
										dc.b   0
										dc.b $88 
										dc.b  $D
										dc.b   9
										dc.b $AC 
										dc.b   4
										dc.b   2
										dc.b $D0 
										dc.b   0
										dc.b   3
										dc.b $5C 
										dc.b  $F
										dc.b   4
										dc.b $84 
										dc.b  $E
										dc.b   9
										dc.b $A8 
										dc.b   8
										dc.b  $A
										dc.b $CC 
										dc.b  $C
										dc.b   7
										dc.b $58 
										dc.b  $F
										dc.b   4
										dc.b $80 
										dc.b  $F
										dc.b   9
										dc.b $A4 
										dc.b  $A
										dc.b  $A
										dc.b $C8 
										dc.b  $A
										dc.b   7
										dc.b $54 
										dc.b  $E
										dc.b   4
										dc.b $7C 
										dc.b  $F
										dc.b   9
										dc.b $A0 
										dc.b  $C
										dc.b  $A
										dc.b $C4 
										dc.b   8
										dc.b   7
										dc.b $50 
										dc.b  $D
										dc.b   4
										dc.b $78 
										dc.b $10
										dc.b   1
										dc.b $9C 
										dc.b  $D
										dc.b  $A
										dc.b $C0 
										dc.b   4
										dc.b   3
										dc.b $4C 
										dc.b  $C
										dc.b   4
										dc.b $74 
										dc.b  $F
										dc.b   5
										dc.b $98 
										dc.b  $E
										dc.b  $A
										dc.b $BC 
										dc.b   8
										dc.b  $B
										dc.b $48 
										dc.b  $A
										dc.b   4
										dc.b $70 
										dc.b  $F
										dc.b   5
										dc.b $94 
										dc.b  $F
										dc.b  $A
										dc.b $B8 
										dc.b  $A
										dc.b  $B
										dc.b $44 
										dc.b   8
										dc.b   4
										dc.b $6C 
										dc.b  $E
										dc.b   5
										dc.b $90 
										dc.b  $F
										dc.b  $A
										dc.b $B4 
										dc.b  $C
										dc.b  $B
										dc.b $40 
										dc.b   4
										dc.b   0
										dc.b $68 
										dc.b  $D
										dc.b   5
										dc.b $8C 
										dc.b $10
										dc.b   2
										dc.b $B0 
										dc.b  $D
										dc.b  $B
										dc.b $3C 
										dc.b   8
										dc.b   8
										dc.b $64 
										dc.b  $C
										dc.b   5
										dc.b $88 
										dc.b  $F
										dc.b   6
										dc.b $AC 
										dc.b  $E
										dc.b  $B
										dc.b $38 
										dc.b  $A
										dc.b   8
										dc.b $60 
										dc.b  $A
										dc.b   5
										dc.b $84 
										dc.b  $F
										dc.b   6
										dc.b $A8 
										dc.b  $F
										dc.b  $B
										dc.b $34 
										dc.b  $C
										dc.b   8
										dc.b $5C 
										dc.b   8
										dc.b   5
										dc.b $80 
										dc.b  $E
										dc.b   6
										dc.b $A4 
										dc.b  $F
										dc.b  $B
										dc.b $30 
										dc.b  $D
										dc.b   8
										dc.b $58 
										dc.b   4
										dc.b   1
										dc.b $7C 
										dc.b  $D
										dc.b   6
										dc.b $A0 
										dc.b $10
										dc.b   3
										dc.b $2C 
										dc.b  $E
										dc.b   8
										dc.b $54 
										dc.b   8
										dc.b   9
										dc.b $78 
										dc.b  $C
										dc.b   6
										dc.b $9C 
										dc.b  $F
										dc.b   7
										dc.b $28 
										dc.b  $F
										dc.b   8
										dc.b $50 
										dc.b  $A
										dc.b   9
										dc.b $74 
										dc.b  $A
										dc.b   6
										dc.b $98 
										dc.b  $F
										dc.b   7
										dc.b $24 
										dc.b  $F
										dc.b   8
										dc.b $4C 
										dc.b  $C
										dc.b   9
										dc.b $70 
										dc.b   8
										dc.b   6
										dc.b $94 
										dc.b  $E
										dc.b   7
										dc.b $20
										dc.b $10
										dc.b   0
										dc.b $48 
										dc.b  $D
										dc.b   9
										dc.b $6C 
										dc.b   4
										dc.b   2
										dc.b $90 
										dc.b  $D
										dc.b   7
										dc.b $1C
										dc.b  $F
										dc.b   4
										dc.b $44 
										dc.b  $E
										dc.b   9
										dc.b $68 
										dc.b   8
										dc.b  $A
										dc.b $8C 
										dc.b  $C
										dc.b   7
										dc.b $18
										dc.b  $F
										dc.b   4
										dc.b $40 
										dc.b  $F
										dc.b   9
										dc.b $64 
										dc.b  $A
										dc.b  $A
										dc.b $88 
										dc.b  $A
										dc.b   7
										dc.b $14
										dc.b  $E
										dc.b   4
										dc.b $3C 
										dc.b  $F
										dc.b   9
										dc.b $60 
										dc.b  $C
										dc.b  $A
										dc.b $84 
										dc.b   8
										dc.b   7
										dc.b $10
										dc.b  $D
										dc.b   4
										dc.b $38 
										dc.b $10
										dc.b   1
										dc.b $5C 
										dc.b  $D
										dc.b  $A
										dc.b $80 
										dc.b   4
										dc.b   3
										dc.b  $C
										dc.b  $C
										dc.b   4
										dc.b $34 
										dc.b  $F
										dc.b   5
										dc.b $58 
										dc.b  $E
										dc.b  $A
										dc.b $7C 
										dc.b   8
										dc.b  $B
										dc.b   8
										dc.b  $A
										dc.b   4
										dc.b $30 
										dc.b  $F
										dc.b   5
										dc.b $54 
										dc.b  $F
										dc.b  $A
										dc.b $78 
										dc.b  $A
										dc.b  $B
										dc.b   4
										dc.b   8
										dc.b   4
										dc.b $2C 
										dc.b  $E
										dc.b   5
										dc.b $50 
										dc.b  $F
										dc.b  $A
										dc.b $74 
										dc.b  $C
										dc.b  $B
										dc.b   0
										dc.b   4
										dc.b   4
										dc.b $28 
										dc.b  $D
										dc.b   1
										dc.b $4C 
										dc.b $10
										dc.b   2
										dc.b $70 
										dc.b  $D
										dc.b  $B
										dc.b   0
										dc.b   4
										dc.b   4
										dc.b $24 
										dc.b  $C
										dc.b   9
										dc.b $48 
										dc.b  $F
										dc.b   6
										dc.b $6C 
										dc.b  $E
										dc.b  $B
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $20
										dc.b  $A
										dc.b   9
										dc.b $44 
										dc.b  $F
										dc.b   6
										dc.b $68 
										dc.b  $F
										dc.b  $B
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $1C
										dc.b   8
										dc.b   9
										dc.b $40 
										dc.b  $E
										dc.b   6
										dc.b $64 
										dc.b  $F
										dc.b  $B
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $18
										dc.b   4
										dc.b   9
										dc.b $3C 
										dc.b  $D
										dc.b   6
										dc.b $60 
										dc.b $10
										dc.b   3
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $16
										dc.b   4
										dc.b   9
										dc.b $38 
										dc.b  $C
										dc.b   6
										dc.b $5C 
										dc.b  $F
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $16
										dc.b   4
										dc.b   9
										dc.b $34 
										dc.b  $A
										dc.b   6
										dc.b $58 
										dc.b  $F
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $16
										dc.b   4
										dc.b   9
										dc.b $30 
										dc.b   8
										dc.b   2
										dc.b $54 
										dc.b  $E
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   8
										dc.b $15
										dc.b   4
										dc.b   9
										dc.b $2E 
										dc.b   4
										dc.b  $A
										dc.b $50 
										dc.b  $D
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   8
										dc.b $15
										dc.b   4
										dc.b   9
										dc.b $2E 
										dc.b   4
										dc.b  $A
										dc.b $4C 
										dc.b  $C
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   8
										dc.b $15
										dc.b   4
										dc.b   9
										dc.b $2E 
										dc.b   4
										dc.b  $A
										dc.b $48 
										dc.b  $A
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   8
										dc.b $15
										dc.b   4
										dc.b   9
										dc.b $2E 
										dc.b   4
										dc.b  $A
										dc.b $44 
										dc.b   8
										dc.b   3
										dc.b   0
										dc.b   4
										dc.b   8
										dc.b $13
										dc.b   4
										dc.b   9
										dc.b $2A 
										dc.b   4
										dc.b  $A
										dc.b $3D 
										dc.b   4
										dc.b  $B
										dc.b $FF
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $14
										dc.b   4
										dc.b   1
										dc.b $2B 
										dc.b   4
										dc.b   6
										dc.b $3E 
										dc.b   8
										dc.b   7
										dc.b   0
										dc.b   5
										dc.b   0
										dc.b $15
										dc.b   6
										dc.b   1
										dc.b $2C 
										dc.b   8
										dc.b   6
										dc.b $3F 
										dc.b  $A
										dc.b   7
										dc.b   0
										dc.b   5
										dc.b   0
										dc.b $15
										dc.b   7
										dc.b   1
										dc.b $2D 
										dc.b   9
										dc.b   6
										dc.b $40 
										dc.b  $B
										dc.b   7
										dc.b   0
										dc.b   6
										dc.b   0
										dc.b $15
										dc.b   6
										dc.b   1
										dc.b $2D 
										dc.b   8
										dc.b   6
										dc.b $41 
										dc.b  $A
										dc.b   7
										dc.b   0
										dc.b   5
										dc.b   0
										dc.b $15
										dc.b   4
										dc.b   1
										dc.b $2B 
										dc.b   4
										dc.b   6
										dc.b $42 
										dc.b   8
										dc.b   7
										dc.b   0
										dc.b   5
										dc.b   0
										dc.b $15
										dc.b   5
										dc.b   1
										dc.b $2B 
										dc.b   4
										dc.b   6
										dc.b $43 
										dc.b   4
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $15
										dc.b   4
										dc.b   1
										dc.b $2B 
										dc.b   5
										dc.b   2
										dc.b $42 
										dc.b   6
										dc.b   7
										dc.b   0
										dc.b   4
										dc.b   0
										dc.b $15
										dc.b   4
										dc.b   1
										dc.b $2B 
										dc.b   4
										dc.b   2
										dc.b $43 
										dc.b   4
										dc.b   7
byte_28F31:         dc.b 0
										dc.b   4
										dc.b   0
										dc.b $15
										dc.b   4
										dc.b   1
										dc.b $2B 
										dc.b   4
										dc.b   2
										dc.b $42 
										dc.b   4
										dc.b   3
										dc.b $FF
										dc.b $41 
										dc.b $FA 
										dc.b $F2 
										dc.b $6A 
										dc.b $60 
										dc.b   4
										dc.b $41 
										dc.b $FA 
										dc.b $F2 
										dc.b $A6 
										dc.b $43 
										dc.b $F9 
										dc.b   0
										dc.b $FF
										dc.b $D0 
										dc.b $80 
										dc.b $45 
										dc.b $F9 
										dc.b   0
										dc.b $FF
										dc.b $D0 
										dc.b   0
										dc.b $70 
										dc.b $2F 

; =============== S U B R O U T I N E =======================================

LoadSegaLogoPalette:
										
										move.w  (a0)+,(a1)+
										move.w  #0,(a2)+
										dbf     d0,LoadSegaLogoPalette
										rts

	; End of function LoadSegaLogoPalette


; =============== S U B R O U T I N E =======================================

sub_28F62:
										
										jsr     (WaitForVInt).w 
										btst    #7,((RAM_Input_Player2_StateA-$1000000)).w
										beq.s   return_28F96
										lea     ($1A4).w,a0
										move.l  (a0),d1
										addq.l  #1,d1
										movea.l #$200,a0
										sub.l   a0,d1
										asr.l   #1,d1
										move.w  d1,d2
										subq.w  #1,d2
										swap    d1
										moveq   #0,d0
loc_28F88:
										
										add.w   (a0)+,d0
										dbf     d2,loc_28F88
										dbf     d1,loc_28F88
										move.w  d0,((dword_FFB0A4-$1000000)).w
return_28F96:
										
										rts

	; End of function sub_28F62


; =============== S U B R O U T I N E =======================================

VInt_CheckConfigurationModeCheat:
										
										movea.l ((CONFIGURATION_MODE_SEQUENCE_POINTER-$1000000)).w,a0
										cmpi.b  #$FF,(a0)
										bne.s   loc_28FAE
										move.b  #$FF,((CONFIGURATION_MODE_ACTIVATED-$1000000)).w
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_ITEM
										rts
loc_28FAE:
										
										move.b  (a0),d0
										cmp.b   ((RAM_Input_Player1_StateA-$1000000)).w,d0
										bne.s   return_28FBA
										addq.l  #1,((CONFIGURATION_MODE_SEQUENCE_POINTER-$1000000)).w
return_28FBA:
										
										rts

	; End of function VInt_CheckConfigurationModeCheat

InputSequence_ConfigurationMode:
										incbin "data/technical/configurationmodeinputsequence.bin"

; =============== S U B R O U T I N E =======================================

VInt_CheckDebugModeCheat:
										
										movea.l ((dword_FFB1A0-$1000000)).w,a0
										cmpi.b  #$FF,(a0)
										bne.s   loc_28FE2
										move.b  #$FF,((RAM_DebugModeActivated-$1000000)).w
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_CURSED_ITEM
										rts
loc_28FE2:
										
										move.b  (a0),d0
										cmp.b   ((RAM_Input_Player1_StateA-$1000000)).w,d0
										bne.s   return_28FEE
										addq.l  #1,((dword_FFB1A0-$1000000)).w
return_28FEE:
										
										rts

	; End of function VInt_CheckDebugModeCheat

InputSequence_DebugMode:
										incbin "data/technical/debugmodeinputsequence.bin"
VariableWidthFont:  incbin "graphics/technical/fonts/variablewidthfont.bin"
MenuTiles_Uncompressed:
										incbin "graphics/technical/menus/menutiles.bin"
MenuTiles_Item:     incbin "graphics/technical/menus/menutilesitem.bin"
MenuTiles_BattleField:
										incbin "graphics/technical/menus/menutilesbattlefield.bin"
MenuTiles_Church:   incbin "graphics/technical/menus/menutileschurch.bin"
MenuTiles_Shop:     incbin "graphics/technical/menus/menutilesshop.bin"
MenuTiles_Caravan:  incbin "graphics/technical/menus/menutilescaravan.bin"
MenuTiles_Depot:    incbin "graphics/technical/menus/menutilesdepot.bin"
MenuTiles_YesNo:    incbin "graphics/technical/menus/menutilesyesno.bin"
plt_WitchChoice:    incbin "graphics/specialscreens/witchscreen/witchchoicepalette.bin"
WitchBubbleAnimation:
										incbin "graphics/specialscreens/witchscreen/witchbubbleanimation.bin"
SpeechBalloonTiles: incbin "graphics/specialscreens/witchscreen/speechballoontiles.bin"

; =============== S U B R O U T I N E =======================================

EndKissPictureSequence:
										
										movea.l (p_endKissPicture).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										jsr     (LoadTileData).w
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($C800).l,a1
										bsr.w   sub_2C642
										move.w  #$168,d0
										jsr     (Sleep).w       ; wait for 6 seconds
										lea     (FFD080_Palette1bis).l,a0
										moveq   #7,d7
loc_2C5A6:
										
										clr.l   (a0)+
										dbf     d7,loc_2C5A6
										lea     (FFD080_Palette1bis).l,a0
										clr.b   (byte_FFDFAB).l
										jsr     (sub_19C8).w    
										move.w  #$366,d0        ; wait for 14 seconds
										jsr     (Sleep).w       
										lea     (FFD080_Palette1bis).l,a0
										moveq   #$1F,d7
loc_2C5CC:
										
										clr.l   (a0)+
										dbf     d7,loc_2C5CC
										lea     (FFD080_Palette1bis).l,a0
										clr.b   (byte_FFDFAB).l
										jsr     (sub_19C8).w    
										rts

	; End of function EndKissPictureSequence


; =============== S U B R O U T I N E =======================================

sub_2C5E4:
										
										movem.l d0-a3,-(sp)
										lea     (PALETTE_1).l,a0
										lea     (FFD080_Palette1bis).l,a1
										move.w  #$80,d7 
										jsr     (CopyBytes).w   
										lea     (FFD080_Palette1bis).l,a0
										moveq   #7,d7
loc_2C604:
										
										move.l  (a0),d0
										lsr.l   #1,d0
										andi.l  #$EEE0EEE,d0
										move.l  d0,(a0)+
										dbf     d7,loc_2C604
										lea     (PALETTE3_BIS).l,a0
										moveq   #$F,d7
loc_2C61C:
										
										move.l  (a0),d0
										lsr.l   #1,d0
										andi.l  #$EEE0EEE,d0
										move.l  d0,(a0)+
										dbf     d7,loc_2C61C
										lea     (FFD080_Palette1bis).l,a0
										clr.b   (byte_FFDFAB).l
										jsr     (sub_19C8).w    
										movem.l (sp)+,d0-a3
										rts

	; End of function sub_2C5E4


; =============== S U B R O U T I N E =======================================

sub_2C642:
										
										move.w  #$BFF,d7
										lea     (RAM_Start).l,a2
loc_2C64C:
										
										clr.l   (a2)+
										dbf     d7,loc_2C64C
										lea     (RAM_Start).l,a2
										lea     byte_2C6FC(pc), a3
										moveq   #$3F,d7 
loc_2C65E:
										
										moveq   #0,d6
loc_2C660:
										
										move.w  #$FF,d5
loc_2C664:
										
										move.w  d7,d0
										move.w  d5,d2
										andi.w  #$3F,d2 
										move.b  (a3,d2.w),d2
										add.w   d2,d0
										andi.w  #$3F,d0 
										move.b  (a3,d0.w),d0
										move.w  d0,d1
										move.w  d5,d2
										lsl.w   #5,d2
										lsr.w   #1,d0
										add.w   d2,d0
										move.b  (a0,d0.w),d2
										btst    #0,d1
										bne.s   loc_2C69A
										andi.b  #$F0,d2
										andi.b  #$F,(a2,d0.w)
										bra.s   loc_2C6A4
loc_2C69A:
										
										andi.b  #$F,d2
										andi.b  #$F0,(a2,d0.w)
loc_2C6A4:
										
										or.b    d2,(a2,d0.w)
										dbf     d5,loc_2C664
										dbf     d6,loc_2C660
										movem.l d0-a3,-(sp)
										lea     (RAM_Start).l,a0
										move.w  #$600,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgainbis).w
										jsr     (SetFFDE94b3andWait).w
										movem.l (sp)+,d0-a3
										movem.l d0-a3,-(sp)
										lea     $C00(a1),a1
										lea     (byte_FF0C00).l,a0
										move.w  #$600,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgainbis).w
										jsr     (SetFFDE94b3andWait).w
										movem.l (sp)+,d0-a3
										cmpi.w  #$10,d7
										bne.s   loc_2C6F6
										bsr.w   sub_2C5E4
loc_2C6F6:
										
										dbf     d7,loc_2C65E
										rts

	; End of function sub_2C642

byte_2C6FC:         dc.b $13
										dc.b   9
										dc.b $1D
										dc.b $33 
										dc.b   7
										dc.b $3C 
										dc.b $28 
										dc.b $30 
										dc.b $19
										dc.b $26 
										dc.b $29 
										dc.b   3
										dc.b $22 
										dc.b  $A
										dc.b $15
										dc.b $34 
										dc.b   6
										dc.b $23 
										dc.b   4
										dc.b $18
										dc.b $2A 
										dc.b  $E
										dc.b $25 
										dc.b $1B
										dc.b $2E 
										dc.b $3F 
										dc.b $10
										dc.b $12
										dc.b $1F
										dc.b $20
										dc.b $27 
										dc.b   0
										dc.b $3D 
										dc.b  $B
										dc.b $2D 
										dc.b $3B 
										dc.b $38 
										dc.b $21 
										dc.b $24 
										dc.b $3E 
										dc.b  $C
										dc.b $1C
										dc.b $3A 
										dc.b  $F
										dc.b   8
										dc.b $32 
										dc.b $2B 
										dc.b $37 
										dc.b $35 
										dc.b $2F 
										dc.b $36 
										dc.b $31 
										dc.b   2
										dc.b  $D
										dc.b   5
										dc.b $14
										dc.b $39 
										dc.b $11
										dc.b $1A
										dc.b $2C 
										dc.b $16
										dc.b $17
										dc.b   1
										dc.b $1E

; =============== S U B R O U T I N E =======================================

LoadTitleScreenFont:
										
										lea     StaticWidthFont(pc), a0
										lea     (FF6802_LOADING_SPACE).l,a1
										jsr     (LoadTileData).w
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($B000).l,a1
										move.w  #$800,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgain).w
										lea     (byte_FFE000).l,a0
										move.w  #$6200,d0
										move.w  #$3FF,d7
loc_2C76E:
										
										move.w  #0,(a0)+
										addq.w  #1,d0
										dbf     d7,loc_2C76E
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgain).w
										lea     TitleScreenPalettes(pc), a0
										lea     (PALETTE_4).l,a1
										moveq   #$20,d7 
										jsr     (CopyBytes).w   
										rts

	; End of function LoadTitleScreenFont

UnusedCloudTiles:   incbin "graphics/technical/unusedcloudtiles.bin"
																						; no reference to that ? looks like compressed tiles but no idea of what they represent (32x8 tiles)
StaticWidthFont:    incbin "graphics/technical/fonts/staticwidthfont.bin"
																						; used for title screen
TitleScreenPalettes:incbin "graphics/specialscreens/titlescreen/titlescreenpalettes.bin"

; =============== S U B R O U T I N E =======================================

; Initialise Huffman decoder
; - clear Huffman (script) data
; - set starting tree

InitDecoder:
										
										move.b  #$FE,(DECODED_TEXT_SYMBOL).l
										clr.w   (STRING_BIT_COUNTER).l
										clr.w   (STRING_BYTE).l
										rts

	; End of function InitDecoder


; =============== S U B R O U T I N E =======================================

HuffmanDecode:
										
										movem.l d1-d7/a1-a3,-(sp)
										lea     (STRING_BIT_COUNTER).l,a3
										move.w  (a3),d6         ; huffman length : current progress in reading current barrel
										move.w  -2(a3),d7       ; huffman barrel : current compressed string byte to read
										clr.w   d1
										move.b  2(a3),d1        ; Get last decoded text symbol -> huffman tree to use
										add.w   d1,d1
										lea     TextBankTreeOffsets(pc), a1
										move.w  (a1,d1.w),d1    ; get tree offset
										lea     TextBankTreeData(pc), a1
										adda.w  d1,a1
										movea.l a1,a2           ; a1 = a2 = current tree start address
										clr.w   d3              ; clear Huffman tree bit counter
										clr.w   d5              ; clear skipped symbols counter
loc_2E150:
										
										dbf     d3,loc_2E158    
										moveq   #7,d3
										move.b  (a1)+,d2        ; Load next Huffman tree byte
loc_2E158:
										
										add.b   d2,d2           ; Get next Huffman tree bit into Carry
										bcs.s   loc_2E182       ; C = 1 --> Leaf node, go get symbol
																						; C = 0 --> Non-leaf node, read next string bit
																						; 
										dbf     d6,loc_2E164    
										moveq   #7,d6
										move.b  (a0)+,d7        ; Load next compressed string byte
loc_2E164:
										
										add.b   d7,d7           ; Get next compressed string bit into Carry
										bcc.s   loc_2E150       ; C = 0 --> Travel left, go get next Huffman tree bit
																						; C = 1 --> Travel right, count left side symbols to skip
										clr.w   d4              ; Clear non-leaf node counter
loc_2E16A:
										
										dbf     d3,loc_2E172    ; count left sub-tree symbols to skip
										moveq   #7,d3
										move.b  (a1)+,d2        ; Load next huffman tree byte
loc_2E172:
										
										add.b   d2,d2           ; Get next Huffman tree bit into Carry
										bcs.s   loc_2E17A       ; C = 1 --> leaf-node, go add one symbol to skip
																						; C = 0 --> non-leaf node, add one node to read
										addq.w  #1,d4           ; increment non-leaf node counter
										bra.s   loc_2E16A       
loc_2E17A:
										
										subq.w  #1,d5           ; increment skipped symbols counter
										dbf     d4,loc_2E16A    ; Continue until all nodes in left subtree exhausted
										bra.s   loc_2E150       ; Examine next tree node
loc_2E182:
										
										move.b  -1(a2,d5.w),d0  ; Load decoded symbol
										move.w  d6,(a3)         ; save current string bit counter
										move.w  d7,-2(a3)       ; save current string byte
										move.b  d0,2(a3)        ; save decoded symbol
										movem.l (sp)+,d1-d7/a1-a3
										rts

	; End of function HuffmanDecode

TextBankTreeOffsets:incbin "scripting/textbanks/huffmantreeoffsets.bin"
TextBankTreeData:   incbin "scripting/textbanks/huffmantrees.bin"
TextBank00:         incbin "scripting/textbanks/textbank00.bin"
TextBank01:         incbin "scripting/textbanks/textbank01.bin"
TextBank02:         incbin "scripting/textbanks/textbank02.bin"
TextBank03:         incbin "scripting/textbanks/textbank03.bin"
TextBank04:         incbin "scripting/textbanks/textbank04.bin"
TextBank05:         incbin "scripting/textbanks/textbank05.bin"
TextBank06:         incbin "scripting/textbanks/textbank06.bin"
TextBank07:         incbin "scripting/textbanks/textbank07.bin"
TextBank08:         incbin "scripting/textbanks/textbank08.bin"
TextBank09:         incbin "scripting/textbanks/textbank09.bin"
TextBank10:         incbin "scripting/textbanks/textbank10.bin"
TextBank11:         incbin "scripting/textbanks/textbank11.bin"
TextBank12:         incbin "scripting/textbanks/textbank12.bin"
TextBank13:         incbin "scripting/textbanks/textbank13.bin"
TextBank14:         incbin "scripting/textbanks/textbank14.bin"
TextBank15:         incbin "scripting/textbanks/textbank15.bin"
TextBank16:         incbin "scripting/textbanks/textbank16.bin"
										align 2                 ; added align $2 to make sure we're on an even address
pt_TextBanks:       dc.l TextBank00
										dc.l TextBank01
										dc.l TextBank02
										dc.l TextBank03
										dc.l TextBank04
										dc.l TextBank05
										dc.l TextBank06
										dc.l TextBank07
										dc.l TextBank08
										dc.l TextBank09
										dc.l TextBank10
										dc.l TextBank11
										dc.l TextBank12
										dc.l TextBank13
										dc.l TextBank14
										dc.l TextBank15
										dc.l TextBank16
GameStaff:          incbin "scripting/gamestaff.bin"
										align $4000
