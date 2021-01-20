
; ASM FILE code\common\menus\menuengine_11.asm :
; 0x16658..0x16A62 : Menu engine

; =============== S U B R O U T I N E =======================================

var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
var_4 = -4

WitchMainMenu:
                
                movem.l d1-a1,-(sp)
                link    a6,#-16
                andi.w  #$F,d0
                move.w  d2,var_12(a6)
                beq.w   loc_16756
                move.w  d1,var_10(a6)
                move.w  #$A,var_8(a6)
                movem.w d0,-(sp)
                move.w  #$1C0C,d0
                move.w  #$2001,d1
                jsr     (CreateWindow).l
                move.w  d0,var_6(a6)
                move.l  a1,var_4(a6)
                movea.l (p_plt_WitchChoice).l,a0
                lea     (PALETTE_2_CURRENT).l,a1
                move.w  #$20,d7 
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                bsr.w   sub_1679E
                move.w  var_6(a6),d0
                move.w  #$202,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0
loc_166C2:
                
                bsr.w   sub_1679E
                movem.w d0,-(sp)
                move.w  var_6(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                movem.w (sp)+,d0
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_166EA
                moveq   #1,d3
                bsr.w   sub_1678A
loc_166EA:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_166F8
                moveq   #$FFFFFFFF,d3
                bsr.w   sub_1678A
loc_166F8:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16706
                moveq   #1,d3
                bsr.w   sub_1678A
loc_16706:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16714
                moveq   #$FFFFFFFF,d3
                bsr.w   sub_1678A
loc_16714:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_16756
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_1675A
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_1675A
                movem.l d6-d7,-(sp)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                movem.l (sp)+,d6-d7
                jsr     (WaitForVInt).w
                subq.w  #1,var_8(a6)
                bne.s   loc_16752
                move.w  #$14,var_8(a6)
loc_16752:
                
                bra.w   loc_166C2
loc_16756:
                
                move.w  #$FFFF,d0
byte_1675A:
                
                sndCom  SFX_VALIDATION
                movem.w d0,-(sp)
                move.w  var_6(a6),d0
                move.w  #$2001,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                move.w  var_6(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                movem.w (sp)+,d0
                unlk    a6
                movem.l (sp)+,d1-a1
                rts

    ; End of function WitchMainMenu


; =============== S U B R O U T I N E =======================================

var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
var_4 = -4

sub_1678A:
                
                 
                sndCom  SFX_MENU_SELECTION
                add.w   d3,d0
                andi.w  #3,d0
                move.w  var_12(a6),d1
                btst    d0,d1
                beq.s   sub_1678A
                rts

    ; End of function sub_1678A


; =============== S U B R O U T I N E =======================================

var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
var_4 = -4

sub_1679E:
                
                movea.l var_4(a6),a0
                move.w  #$A7,d7 
loc_167A6:
                
                clr.l   (a0)+
                dbf     d7,loc_167A6
                move.w  var_12(a6),d6
                btst    #0,d6
                beq.s   loc_167C6
                move.w  #0,d3
                move.w  #0,d2
                move.w  #$188,d1
                bsr.w   DrawWitchMenuBubble
loc_167C6:
                
                btst    #1,d6
                beq.s   loc_167DC
                move.w  #1,d3
                move.w  #$F0,d2 
                move.w  #4,d1
                bsr.w   DrawWitchMenuBubble
loc_167DC:
                
                btst    #2,d6
                beq.s   loc_167F2
                move.w  #2,d3
                move.w  #$1E0,d2
                move.w  #$24,d1 
                bsr.w   DrawWitchMenuBubble
loc_167F2:
                
                btst    #3,d6
                beq.s   return_16808
                move.w  #3,d3
                move.w  #$2D0,d2
                move.w  #$1B0,d1
                bsr.w   DrawWitchMenuBubble
return_16808:
                
                rts

    ; End of function sub_1679E


; =============== S U B R O U T I N E =======================================

var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
var_4 = -4

DrawWitchMenuBubble:
                
                movea.l (p_WitchBubbleAnimation).l,a0
                movea.l var_4(a6),a1
                cmp.b   d0,d3
                bne.s   loc_1683A
                move.w  var_8(a6),d7
                cmpi.w  #5,d7
                blt.s   loc_16826
                addi.w  #$50,d2 
loc_16826:
                
                cmpi.w  #$A,d7
                blt.s   loc_16830
                addi.w  #$50,d2 
loc_16830:
                
                cmpi.w  #$F,d7
                blt.s   loc_1683A
                subi.w  #$50,d2 
loc_1683A:
                
                adda.w  d2,a0
                adda.w  d1,a1
                movem.l a1,-(sp)
                moveq   #4,d7
loc_16844:
                
                moveq   #7,d5
loc_16846:
                
                move.w  (a0)+,(a1)
                addi.w  #-$5D00,(a1)+
                dbf     d5,loc_16846
                lea     $28(a1),a1
                dbf     d7,loc_16844
                movem.l (sp)+,a1
                cmpi.w  #2,d3
                blt.s   loc_16864
                addq.l  #2,a1
loc_16864:
                
                move.w  var_10(a6),d1
                bne.w   loc_168A4
                adda.w  #$72,a1 
                lsl.w   #2,d3
                movea.l pt_s_WitchMenu(pc,d3.w),a0
                moveq   #5,d7
                bsr.w   sub_1697C
                rts
pt_s_WitchMenu:
                
                dc.l aStart             
                dc.l aCont_             
                dc.l aDel_              
                dc.l aCopy              
aStart:
                
                dc.b 'START',0
aCont_:
                
                dc.b 'CONT.',0
aDel_:
                
                dc.b 'DEL.',0
aCopy:
                
                dc.b 'COPY',0
loc_168A4:
                
                subq.w  #1,d1
                bne.w   sub_168D8
                adda.w  #$72,a1 
                lsl.w   #2,d3
                movea.l pt_s_DataMenu(pc,d3.w),a0
                moveq   #5,d7
                bsr.w   sub_1697C
                rts

    ; End of function DrawWitchMenuBubble

pt_s_DataMenu:  dc.l aData1             
                dc.l aData1             
                dc.l aData2             
                dc.l aData2             
aData1:         dc.b 'DATA1',0
aData2:         dc.b 'DATA2',0

; =============== S U B R O U T I N E =======================================


sub_168D8:
                
                subq.w  #1,d1
                bne.w   sub_16942
                movem.l d7-a1,-(sp)
                lea     (SAVE1_DATA).l,a0
                cmpi.w  #2,d3
                blt.s   loc_168F4
                lea     (SAVE2_DATA).l,a0
loc_168F4:
                
                lea     (FF8804_LOADING_SPACE).l,a1
                moveq   #9,d7
loc_168FC:
                
                move.b  (a0),(a1)+
                addq.l  #2,a0
                dbf     d7,loc_168FC
                movem.l (sp)+,d7-a1
                adda.w  #$72,a1 
                move.l  a1,-(sp)
                lsl.w   #2,d3
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #5,d7
                bsr.w   sub_1697C
                movea.l (sp)+,a1
                cmpi.b  #0,(byte_FF8809).l
                beq.s   return_16940
                move.b  #$2D,9(a1) 
                adda.w  #$38,a1 
                lsl.w   #2,d3
                lea     (byte_FF8808).l,a0
                moveq   #4,d7
                bsr.w   sub_1697C
return_16940:
                
                rts

    ; End of function sub_168D8


; =============== S U B R O U T I N E =======================================


sub_16942:
                
                adda.w  #$72,a1 
                lsl.w   #2,d3
                movea.l pt_s_DifficultyMenu(pc,d3.w),a0
                moveq   #5,d7
                bsr.w   sub_1697C
                rts

    ; End of function sub_16942

pt_s_DifficultyMenu:
                dc.l aNorm_             
                dc.l aHard              
                dc.l aSuper             
                dc.l aOuch              
aNorm_:         dc.b 'NORM.',0
aHard:          dc.b 'HARD',0
aSuper:         dc.b 'SUPER',0
aOuch:          dc.b 'OUCH!',0
                dc.b $FF

; =============== S U B R O U T I N E =======================================


sub_1697C:
                
                movem.w d0,-(sp)
                movem.l d7/a1,-(sp)
                moveq   #-56,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,d7/a1
                subq.w  #1,d7
loc_16990:
                
                andi.w  #$9FFF,(a1,d1.w)
                ori.w   #$2000,(a1,d1.w)
                andi.w  #$9FFF,(a1)
                ori.w   #$2000,(a1)+
                dbf     d7,loc_16990
                movem.w (sp)+,d0
                rts

    ; End of function sub_1697C


; =============== S U B R O U T I N E =======================================


sub_169AE:
                
                movem.l d0-a1,-(sp)
                tst.w   (word_FFB08C).l
                bne.s   loc_16A2A
                movem.w d0,-(sp)
                move.w  #$A03,d0
                move.w  #$F60B,d1
                jsr     (CreateWindow).l
                addq.w  #1,d0
                move.w  d0,(word_FFB08C).l
                move.w  #$A03,d0
                bsr.w   sub_1018E       
                movem.w (sp)+,d0
                jsr     j_GetCurrentHP
                move.w  d1,d2
                jsr     j_GetCombatantName
                move.w  d7,d0
                addq.w  #1,d0
                andi.w  #$E,d0
                move.w  #$1E,d1
                sub.w   d0,d1
                adda.w  d1,a1
                moveq   #-16,d1
                moveq   #10,d7
                tst.w   d2
                bne.s   loc_16A0C
                bsr.w   WriteTilesFromAsciiWithOrangeFont
                bra.s   loc_16A10
loc_16A0C:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont
loc_16A10:
                
                move.w  (word_FFB08C).l,d0
                subq.w  #1,d0
                move.w  #$10B,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
loc_16A2A:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_169AE


; =============== S U B R O U T I N E =======================================


sub_16A30:
                
                movem.l d0-d1/a0-a1,-(sp)
                move.w  (word_FFB08C).l,d0
                beq.s   loc_16A5C
                subq.w  #1,d0
                move.w  #$F60B,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                jsr     (ClearWindowAndUpdateEndPointer).l
                clr.w   (word_FFB08C).l
loc_16A5C:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function sub_16A30

