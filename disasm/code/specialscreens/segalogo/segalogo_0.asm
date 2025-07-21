
; ASM FILE code\specialscreens\segalogo\segalogo_0.asm :
; 0x2804C..0x28FBC : SEGA logo functions

; =============== S U B R O U T I N E =======================================

; Out: d0.w = -1 if pressing start, 0 if not


DisplaySegaLogo:
                
                 
                sndCom  SOUND_COMMAND_INIT_DRIVER
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (DisableDisplayAndInterrupts).w
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
                lea     tiles_SegaLogo(pc), a0
                lea     ($2000).w,a1
                move.w  #$C00,d0
                move.w  #2,d1
                jsr     (ApplyImmediateVramDmaOnCompressedTiles).w
                lea     palette_SegaLogo(pc), a0
                lea     (PALETTE_1_CURRENT).l,a1
                lea     (PALETTE_1_BASE).l,a2
                moveq   #7,d7
@LoadPalette_Loop:
                
                move.l  (a0),(a1)+
                move.l  (a0)+,(a2)+
                dbf     d7,@LoadPalette_Loop
                
                jsr     (ApplyVIntCramDma).w
                jsr     (EnableDmaQueueProcessing).w
                jsr     (EnableDisplayAndInterrupts).w
                
                move.l  #table_ConfigurationModeInputSequence,((CONFIGURATION_MODE_OR_GAME_STAFF_POINTER-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_CheckConfigurationModeCheat
                
                move.l  #table_DebugModeInputSequence,((ENTITY_WALKING_PARAMETERS-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_CheckDebugModeCheat
                
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                bsr.w   CalculateRomChecksum
                lea     table_28BB8(pc), a0
                nop
                bsr.w   sub_28B12
                moveq   #20,d0
                jsr     (Sleep).w       
                bsr.w   sub_28B12
                move.l  #$D80405,(SPRITE_TRADEMARK).l
                move.l  #$62014A,(SPRITE_TRADEMARK_VDPTILE).l
                moveq   #10,d0
                jsr     (Sleep).w       
                move.w  #40,d0
@Continue:
                
                lea     SegaLogoColors+4(pc,d0.w),a0 ; lea     segaLogoColors(pc,d0.w),a0
                movem.l d0,-(sp)
                lea     (PALETTE_1_BASE_02).l,a1
                lea     (PALETTE_1_CURRENT_02).l,a2
                moveq   #$A,d0
                bsr.w   LoadSegaLogoPalette
                jsr     (DuplicatePalettes).w
                jsr     (EnableDmaQueueProcessing).w
                move.w  #3,d0
                jsr     (Sleep).w       
                movem.l (sp)+,d0
                subq.w  #2,d0
                bpl.s   @CheckInput_Start
                move.w  #60,d0
@WaitForInput_Start:
                
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   DisplaySegaLogo_Quit
                subq.w  #1,d0
                bne.s   @WaitForInput_Start
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_CheckConfigurationModeCheat
@Done:
                
                jsr     (FadeOutToBlack).w
                clr.w   d0
                rts
@CheckInput_Start:
                
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @Continue       ; keep going if not pressing start
DisplaySegaLogo_Quit:
                
                move.l  #$D80405,(SPRITE_TRADEMARK).l
                move.l  #$62014A,(SPRITE_TRADEMARK_VDPTILE).l
                jsr     (FadeOutToBlack).w
                moveq   #-1,d0
                rts

    ; End of function DisplaySegaLogo

SegaLogoColors: incbin "data/graphics/tech/segalogocolors.bin"
palette_SegaLogo:
                incbin "data/graphics/tech/segalogopalette.bin"
tiles_SegaLogo: incbin "data/graphics/tech/segalogotiles.bin"

; =============== S U B R O U T I N E =======================================


sub_28B12:
                
                cmpi.b  #-1,(a0)
                beq.w   loc_28B64
                
                moveq   #3,d7
                lea     (SPRITE_03).l,a1
                lea     table_28BB0(pc), a2
loc_28B26:
                
                clr.w   d0
                move.b  (a0)+,d0
                addi.w  #$F0,d0 
                move.w  d0,VDPSPRITE_OFFSET_X(a1)
                clr.w   d0
                move.b  (a0)+,d0
                neg.w   d0
                addi.w  #$E0,d0 
                move.w  d0,(a1)
                clr.w   d0
                move.b  (a0)+,d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                addi.w  #$100,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a1)
                move.w  (a2)+,VDPSPRITE_OFFSET_SIZE(a1)
                subq.w  #8,a1
                dbf     d7,loc_28B26
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.s   loc_28B68
                bra.s   sub_28B12
loc_28B64:
                
                addq.w  #1,a0
                rts
loc_28B68:
                
                lea     table_28F31(pc), a0
                nop
                moveq   #3,d7
                lea     (SPRITE_03).l,a1
                lea     table_28BB0(pc), a2
loc_28B7A:
                
                clr.w   d0
                move.b  (a0)+,d0
                addi.w  #$F0,d0 
                move.w  d0,VDPSPRITE_OFFSET_X(a1)
                clr.w   d0
                move.b  (a0)+,d0
                neg.w   d0
                addi.w  #$E0,d0 
                move.w  d0,(a1)
                clr.w   d0
                move.b  (a0)+,d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                addi.w  #$100,d0
                move.w  d0,VDPSPRITE_OFFSET_TILE(a1)
                move.w  (a2)+,VDPSPRITE_OFFSET_SIZE(a1)
                subq.w  #8,a1
                dbf     d7,loc_28B7A
                addq.l  #4,sp
                bra.w   DisplaySegaLogo_Quit

    ; End of function sub_28B12

table_28BB0:    dc.w $F04
                dc.w $F03
                dc.w $F02
                dc.w $F01
table_28BB8:    dc.b $D0
                dc.b $D
                dc.b 4
                dc.b $D0
                dc.b 0
                dc.b 5
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $D0
                dc.b $D
                dc.b 4
                dc.b $D0
                dc.b 0
                dc.b 5
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $CC
                dc.b $C
                dc.b 4
                dc.b $D0
                dc.b 0
                dc.b 5
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $C8
                dc.b $A
                dc.b 4
                dc.b $D0
                dc.b 0
                dc.b 5
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $C4
                dc.b 8
                dc.b 4
                dc.b $D0
                dc.b 0
                dc.b 1
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $C0
                dc.b 4
                dc.b 0
                dc.b $D0
                dc.b 0
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $BC
                dc.b 8
                dc.b 8
                dc.b $D0
                dc.b 0
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $B8
                dc.b $A
                dc.b 8
                dc.b $D0
                dc.b 0
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $B4
                dc.b $C
                dc.b 8
                dc.b $D0
                dc.b 0
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $B0
                dc.b $D
                dc.b 8
                dc.b $D0
                dc.b 0
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $AC
                dc.b $E
                dc.b 8
                dc.b $D0
                dc.b 0
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $A8
                dc.b $F
                dc.b 8
                dc.b $D0
                dc.b $A
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $A4
                dc.b $F
                dc.b 8
                dc.b $CC
                dc.b $C
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $A0
                dc.b $10
                dc.b 0
                dc.b $C8
                dc.b $D
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $9C
                dc.b $F
                dc.b 4
                dc.b $C4
                dc.b $E
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $98
                dc.b $F
                dc.b 4
                dc.b $C0
                dc.b $F
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $94
                dc.b $E
                dc.b 4
                dc.b $BC
                dc.b $F
                dc.b 9
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $90
                dc.b $D
                dc.b 4
                dc.b $B8
                dc.b $10
                dc.b 1
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $8C
                dc.b $C
                dc.b 4
                dc.b $B4
                dc.b $F
                dc.b 5
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $88
                dc.b $A
                dc.b 4
                dc.b $B0
                dc.b $F
                dc.b 5
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $84
                dc.b 8
                dc.b 4
                dc.b $AC
                dc.b $E
                dc.b 5
                dc.b $D0
                dc.b 0
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $80
                dc.b 4
                dc.b 0
                dc.b $A8
                dc.b $D
                dc.b 5
                dc.b $CC
                dc.b $10
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $7C
                dc.b 8
                dc.b 8
                dc.b $A4
                dc.b $C
                dc.b 5
                dc.b $C8
                dc.b $F
                dc.b 6
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $78
                dc.b $A
                dc.b 8
                dc.b $A0
                dc.b $A
                dc.b 5
                dc.b $C4
                dc.b $F
                dc.b 6
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $74
                dc.b $C
                dc.b 8
                dc.b $9C
                dc.b 8
                dc.b 5
                dc.b $C0
                dc.b $E
                dc.b 6
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $70
                dc.b $D
                dc.b 8
                dc.b $98
                dc.b 4
                dc.b 1
                dc.b $BC
                dc.b $D
                dc.b 6
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $6C
                dc.b $E
                dc.b 8
                dc.b $94
                dc.b 8
                dc.b 9
                dc.b $B8
                dc.b $C
                dc.b 6
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $68
                dc.b $F
                dc.b 8
                dc.b $90
                dc.b $A
                dc.b 9
                dc.b $B4
                dc.b $A
                dc.b 6
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $64
                dc.b $F
                dc.b 8
                dc.b $8C
                dc.b $C
                dc.b 9
                dc.b $B0
                dc.b 8
                dc.b 6
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $60
                dc.b $10
                dc.b 0
                dc.b $88
                dc.b $D
                dc.b 9
                dc.b $AC
                dc.b 4
                dc.b 2
                dc.b $D0
                dc.b 0
                dc.b 3
                dc.b $5C
                dc.b $F
                dc.b 4
                dc.b $84
                dc.b $E
                dc.b 9
                dc.b $A8
                dc.b 8
                dc.b $A
                dc.b $CC
                dc.b $C
                dc.b 7
                dc.b $58
                dc.b $F
                dc.b 4
                dc.b $80
                dc.b $F
                dc.b 9
                dc.b $A4
                dc.b $A
                dc.b $A
                dc.b $C8
                dc.b $A
                dc.b 7
                dc.b $54
                dc.b $E
                dc.b 4
                dc.b $7C
                dc.b $F
                dc.b 9
                dc.b $A0
                dc.b $C
                dc.b $A
                dc.b $C4
                dc.b 8
                dc.b 7
                dc.b $50
                dc.b $D
                dc.b 4
                dc.b $78
                dc.b $10
                dc.b 1
                dc.b $9C
                dc.b $D
                dc.b $A
                dc.b $C0
                dc.b 4
                dc.b 3
                dc.b $4C
                dc.b $C
                dc.b 4
                dc.b $74
                dc.b $F
                dc.b 5
                dc.b $98
                dc.b $E
                dc.b $A
                dc.b $BC
                dc.b 8
                dc.b $B
                dc.b $48
                dc.b $A
                dc.b 4
                dc.b $70
                dc.b $F
                dc.b 5
                dc.b $94
                dc.b $F
                dc.b $A
                dc.b $B8
                dc.b $A
                dc.b $B
                dc.b $44
                dc.b 8
                dc.b 4
                dc.b $6C
                dc.b $E
                dc.b 5
                dc.b $90
                dc.b $F
                dc.b $A
                dc.b $B4
                dc.b $C
                dc.b $B
                dc.b $40
                dc.b 4
                dc.b 0
                dc.b $68
                dc.b $D
                dc.b 5
                dc.b $8C
                dc.b $10
                dc.b 2
                dc.b $B0
                dc.b $D
                dc.b $B
                dc.b $3C
                dc.b 8
                dc.b 8
                dc.b $64
                dc.b $C
                dc.b 5
                dc.b $88
                dc.b $F
                dc.b 6
                dc.b $AC
                dc.b $E
                dc.b $B
                dc.b $38
                dc.b $A
                dc.b 8
                dc.b $60
                dc.b $A
                dc.b 5
                dc.b $84
                dc.b $F
                dc.b 6
                dc.b $A8
                dc.b $F
                dc.b $B
                dc.b $34
                dc.b $C
                dc.b 8
                dc.b $5C
                dc.b 8
                dc.b 5
                dc.b $80
                dc.b $E
                dc.b 6
                dc.b $A4
                dc.b $F
                dc.b $B
                dc.b $30
                dc.b $D
                dc.b 8
                dc.b $58
                dc.b 4
                dc.b 1
                dc.b $7C
                dc.b $D
                dc.b 6
                dc.b $A0
                dc.b $10
                dc.b 3
                dc.b $2C
                dc.b $E
                dc.b 8
                dc.b $54
                dc.b 8
                dc.b 9
                dc.b $78
                dc.b $C
                dc.b 6
                dc.b $9C
                dc.b $F
                dc.b 7
                dc.b $28
                dc.b $F
                dc.b 8
                dc.b $50
                dc.b $A
                dc.b 9
                dc.b $74
                dc.b $A
                dc.b 6
                dc.b $98
                dc.b $F
                dc.b 7
                dc.b $24
                dc.b $F
                dc.b 8
                dc.b $4C
                dc.b $C
                dc.b 9
                dc.b $70
                dc.b 8
                dc.b 6
                dc.b $94
                dc.b $E
                dc.b 7
                dc.b $20
                dc.b $10
                dc.b 0
                dc.b $48
                dc.b $D
                dc.b 9
                dc.b $6C
                dc.b 4
                dc.b 2
                dc.b $90
                dc.b $D
                dc.b 7
                dc.b $1C
                dc.b $F
                dc.b 4
                dc.b $44
                dc.b $E
                dc.b 9
                dc.b $68
                dc.b 8
                dc.b $A
                dc.b $8C
                dc.b $C
                dc.b 7
                dc.b $18
                dc.b $F
                dc.b 4
                dc.b $40
                dc.b $F
                dc.b 9
                dc.b $64
                dc.b $A
                dc.b $A
                dc.b $88
                dc.b $A
                dc.b 7
                dc.b $14
                dc.b $E
                dc.b 4
                dc.b $3C
                dc.b $F
                dc.b 9
                dc.b $60
                dc.b $C
                dc.b $A
                dc.b $84
                dc.b 8
                dc.b 7
                dc.b $10
                dc.b $D
                dc.b 4
                dc.b $38
                dc.b $10
                dc.b 1
                dc.b $5C
                dc.b $D
                dc.b $A
                dc.b $80
                dc.b 4
                dc.b 3
                dc.b $C
                dc.b $C
                dc.b 4
                dc.b $34
                dc.b $F
                dc.b 5
                dc.b $58
                dc.b $E
                dc.b $A
                dc.b $7C
                dc.b 8
                dc.b $B
                dc.b 8
                dc.b $A
                dc.b 4
                dc.b $30
                dc.b $F
                dc.b 5
                dc.b $54
                dc.b $F
                dc.b $A
                dc.b $78
                dc.b $A
                dc.b $B
                dc.b 4
                dc.b 8
                dc.b 4
                dc.b $2C
                dc.b $E
                dc.b 5
                dc.b $50
                dc.b $F
                dc.b $A
                dc.b $74
                dc.b $C
                dc.b $B
                dc.b 0
                dc.b 4
                dc.b 4
                dc.b $28
                dc.b $D
                dc.b 1
                dc.b $4C
                dc.b $10
                dc.b 2
                dc.b $70
                dc.b $D
                dc.b $B
                dc.b 0
                dc.b 4
                dc.b 4
                dc.b $24
                dc.b $C
                dc.b 9
                dc.b $48
                dc.b $F
                dc.b 6
                dc.b $6C
                dc.b $E
                dc.b $B
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $20
                dc.b $A
                dc.b 9
                dc.b $44
                dc.b $F
                dc.b 6
                dc.b $68
                dc.b $F
                dc.b $B
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $1C
                dc.b 8
                dc.b 9
                dc.b $40
                dc.b $E
                dc.b 6
                dc.b $64
                dc.b $F
                dc.b $B
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $18
                dc.b 4
                dc.b 9
                dc.b $3C
                dc.b $D
                dc.b 6
                dc.b $60
                dc.b $10
                dc.b 3
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $16
                dc.b 4
                dc.b 9
                dc.b $38
                dc.b $C
                dc.b 6
                dc.b $5C
                dc.b $F
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $16
                dc.b 4
                dc.b 9
                dc.b $34
                dc.b $A
                dc.b 6
                dc.b $58
                dc.b $F
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $16
                dc.b 4
                dc.b 9
                dc.b $30
                dc.b 8
                dc.b 2
                dc.b $54
                dc.b $E
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 8
                dc.b $15
                dc.b 4
                dc.b 9
                dc.b $2E
                dc.b 4
                dc.b $A
                dc.b $50
                dc.b $D
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 8
                dc.b $15
                dc.b 4
                dc.b 9
                dc.b $2E
                dc.b 4
                dc.b $A
                dc.b $4C
                dc.b $C
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 8
                dc.b $15
                dc.b 4
                dc.b 9
                dc.b $2E
                dc.b 4
                dc.b $A
                dc.b $48
                dc.b $A
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 8
                dc.b $15
                dc.b 4
                dc.b 9
                dc.b $2E
                dc.b 4
                dc.b $A
                dc.b $44
                dc.b 8
                dc.b 3
                dc.b 0
                dc.b 4
                dc.b 8
                dc.b $13
                dc.b 4
                dc.b 9
                dc.b $2A
                dc.b 4
                dc.b $A
                dc.b $3D
                dc.b 4
                dc.b $B
                dc.b $FF
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $14
                dc.b 4
                dc.b 1
                dc.b $2B
                dc.b 4
                dc.b 6
                dc.b $3E
                dc.b 8
                dc.b 7
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b $15
                dc.b 6
                dc.b 1
                dc.b $2C
                dc.b 8
                dc.b 6
                dc.b $3F
                dc.b $A
                dc.b 7
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b $15
                dc.b 7
                dc.b 1
                dc.b $2D
                dc.b 9
                dc.b 6
                dc.b $40
                dc.b $B
                dc.b 7
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $15
                dc.b 6
                dc.b 1
                dc.b $2D
                dc.b 8
                dc.b 6
                dc.b $41
                dc.b $A
                dc.b 7
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b $15
                dc.b 4
                dc.b 1
                dc.b $2B
                dc.b 4
                dc.b 6
                dc.b $42
                dc.b 8
                dc.b 7
                dc.b 0
                dc.b 5
                dc.b 0
                dc.b $15
                dc.b 5
                dc.b 1
                dc.b $2B
                dc.b 4
                dc.b 6
                dc.b $43
                dc.b 4
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $15
                dc.b 4
                dc.b 1
                dc.b $2B
                dc.b 5
                dc.b 2
                dc.b $42
                dc.b 6
                dc.b 7
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b $15
                dc.b 4
                dc.b 1
                dc.b $2B
                dc.b 4
                dc.b 2
                dc.b $43
                dc.b 4
                dc.b 7
table_28F31:    dc.b 0
                dc.b 4
                dc.b 0
                dc.b $15
                dc.b 4
                dc.b 1
                dc.b $2B
                dc.b 4
                dc.b 2
                dc.b $42
                dc.b 4
                dc.b 3
                dc.b $FF
                dc.b $41
                dc.b $FA
                dc.b $F2
                dc.b $6A
                dc.b $60
                dc.b 4
                dc.b $41
                dc.b $FA
                dc.b $F2
                dc.b $A6
                dc.b $43
                dc.b $F9
                dc.b 0
                dc.b $FF
                dc.b $D0
                dc.b $80
                dc.b $45
                dc.b $F9
                dc.b 0
                dc.b $FF
                dc.b $D0
                dc.b 0
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


CalculateRomChecksum:
                
                jsr     (WaitForVInt).w
                btst    #INPUT_BIT_START,((PLAYER_2_INPUT-$1000000)).w
                beq.s   @Return         ; execute only if P2 START pressed
                lea     (RomEndAddress).w,a0
                move.l  (a0),d1
                addq.l  #1,d1           ; 0x200000
                movea.l #$200,a0
                sub.l   a0,d1           ; 0x1FFE00 ?
                asr.l   #1,d1           ; 0xFFF80 ?
                move.w  d1,d2
                subq.w  #1,d2           ; FFF7F ?
                swap    d1
                moveq   #0,d0
@Loop:
                
                add.w   (a0)+,d0        ; sum stored in a RAM word
                dbf     d2,@Loop        
                dbf     d1,@Loop        
                
                move.w  d0,((ROM_CHECKSUM-$1000000)).w
@Return:
                
                rts

    ; End of function CalculateRomChecksum


; =============== S U B R O U T I N E =======================================


VInt_CheckConfigurationModeCheat:
                
                movea.l ((CONFIGURATION_MODE_OR_GAME_STAFF_POINTER-$1000000)).w,a0
                cmpi.b  #-1,(a0)
                bne.s   CheckConfigurationModeInputSequence

    ; End of function VInt_CheckConfigurationModeCheat


; =============== S U B R O U T I N E =======================================


VInt_ActivateConfigurationModeCheat:
                
                move.b  #-1,((CONFIGURATION_MODE_TOGGLE-$1000000)).w
                sndCom  MUSIC_ITEM
                rts

    ; End of function VInt_ActivateConfigurationModeCheat


; =============== S U B R O U T I N E =======================================


CheckConfigurationModeInputSequence:
                
                move.b  (a0),d0
                cmp.b   ((PLAYER_1_INPUT-$1000000)).w,d0
                bne.s   @Return
                addq.l  #1,((CONFIGURATION_MODE_OR_GAME_STAFF_POINTER-$1000000)).w
@Return:
                
                rts

    ; End of function CheckConfigurationModeInputSequence

