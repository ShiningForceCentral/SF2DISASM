
; ASM FILE code\specialscreens\witch\witchmainmenu.asm :
; 0x16658..0x169AE : Witch main menu

; =============== S U B R O U T I N E =======================================

; In: d0.w = window slot
;     d1.w = 
;     d2.w = 
; 
; Out: d0.w = -1 if pressed B

var_12 = -12
var_10 = -10
var_8 = -8
windowSlot = -6
var_4 = -4

ExecuteWitchMainMenu:
                
                movem.l d1-a1,-(sp)
                link    a6,#-16
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d0
                move.w  d2,var_12(a6)
                beq.w   loc_16756
                move.w  d1,var_10(a6)
                move.w  #10,var_8(a6)
                movem.w d0,-(sp)
                move.w  #$1C0C,d0
                move.w  #$2001,d1
                jsr     (CreateWindow).l
                move.w  d0,windowSlot(a6)
                move.l  a1,var_4(a6)
                getPointer p_palette_WitchChoice, a0
                lea     (PALETTE_2_CURRENT).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                bsr.w   sub_1679E
                move.w  windowSlot(a6),d0
                move.w  #$202,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0
loc_166C2:
                
                bsr.w   sub_1679E
                movem.w d0,-(sp)
                move.w  windowSlot(a6),d0
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
                moveq   #-1,d3
                bsr.w   sub_1678A
loc_166F8:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16706
                moveq   #1,d3
                bsr.w   sub_1678A
loc_16706:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16714
                moveq   #-1,d3
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
                
                move.w  #-1,d0
byte_1675A:
                
                sndCom  SFX_VALIDATION
                movem.w d0,-(sp)
                move.w  windowSlot(a6),d0
                move.w  #$2001,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).l
                movem.w (sp)+,d0
                unlk    a6
                movem.l (sp)+,d1-a1
                rts

    ; End of function ExecuteWitchMainMenu


; =============== S U B R O U T I N E =======================================

var_12 = -12
var_10 = -10
var_8 = -8
windowSlot = -6
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
windowSlot = -6
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
windowSlot = -6
var_4 = -4

DrawWitchMenuBubble:
                
                module
                getPointer p_table_WitchBubbleAnimation, a0
                movea.l var_4(a6),a1
                cmp.b   d0,d3
                bne.s   @loc_3
                move.w  var_8(a6),d7
                cmpi.w  #5,d7
                blt.s   @loc_1
                addi.w  #$50,d2 
@loc_1:
                
                cmpi.w  #$A,d7
                blt.s   @loc_2
                addi.w  #$50,d2 
@loc_2:
                
                cmpi.w  #$F,d7
                blt.s   @loc_3
                subi.w  #$50,d2 
@loc_3:
                
                adda.w  d2,a0
                adda.w  d1,a1
                movem.l a1,-(sp)
                moveq   #4,d7
@loc_4:
                
                moveq   #7,d5
@loc_5:
                
                move.w  (a0)+,(a1)
                addi.w  #-$5D00,(a1)+
                dbf     d5,@loc_5
                
                lea     $28(a1),a1
                dbf     d7,@loc_4
                
                movem.l (sp)+,a1
                cmpi.w  #2,d3
                blt.s   @Page0_FileOptions
                addq.l  #2,a1
@Page0_FileOptions:
                
                move.w  var_10(a6),d1
                bne.w   @Page1_NewFileNames
                adda.w  #$72,a1 
                lsl.w   #INDEX_SHIFT_COUNT,d3
                movea.l @pt_s_WitchMenu(pc,d3.w),a0
                moveq   #5,d7
                bsr.w   WriteBubbleText
                rts
@pt_s_WitchMenu:
                
                dc.l @aStart            
                dc.l @aCont_            
                dc.l @aDel_             
                dc.l @aCopy             
@aStart:
                
                dc.b 'START',0
@aCont_:
                
                dc.b 'CONT.',0
@aDel_:
                
                dc.b 'DEL.',0
@aCopy:
                
                dc.b 'COPY',0
@Page1_NewFileNames:
                
                subq.w  #1,d1
                bne.w   @Page2_LoadedFileNames
                adda.w  #$72,a1 
                lsl.w   #INDEX_SHIFT_COUNT,d3
                movea.l @pt_s_DataMenu(pc,d3.w),a0
                moveq   #5,d7
                bsr.w   WriteBubbleText
                rts
@pt_s_DataMenu:
                
                dc.l @aData1            
                dc.l @aData1            
                dc.l @aData2            
                dc.l @aData2            
@aData1:
                
                dc.b 'DATA1',0
@aData2:
                
                dc.b 'DATA2',0
@Page2_LoadedFileNames:
                
                subq.w  #1,d1           ; related to with menu bubble
                bne.w   @Page3_Difficulties
                movem.l d7-a1,-(sp)
                lea     (SAVE1_DATA).l,a0
                cmpi.w  #2,d3
                blt.s   @loc_17
                lea     (SAVE2_DATA).l,a0
@loc_17:
                
                lea     (FF8804_LOADING_SPACE).l,a1
                moveq   #9,d7
@CopyName_Loop:
                
                move.b  (a0),(a1)+
                addq.l  #2,a0
                dbf     d7,@CopyName_Loop
                
                movem.l (sp)+,d7-a1
                adda.w  #$72,a1 
                move.l  a1,-(sp)
                lsl.w   #2,d3
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #5,d7
                bsr.w   WriteBubbleText
                movea.l (sp)+,a1
                cmpi.b  #0,(byte_FF8809).l
                beq.s   @Return
                move.b  #$2D,9(a1) 
                adda.w  #$38,a1 
                lsl.w   #2,d3
                lea     (TARGETS_REACHABLE_BY_ITEM_NUMBER).l,a0
                moveq   #4,d7
                bsr.w   WriteBubbleText
@Return:
                
                rts
@Page3_Difficulties:
                
                adda.w  #$72,a1 
                lsl.w   #INDEX_SHIFT_COUNT,d3
                movea.l pt_s_DifficultyMenu(pc,d3.w),a0
                moveq   #5,d7
                bsr.w   WriteBubbleText
                rts

    ; End of function DrawWitchMenuBubble

                modend
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


WriteBubbleText:
                
                movem.w d0,-(sp)
                movem.l d7/a1,-(sp)
                moveq   #-56,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,d7/a1
                subq.w  #1,d7
@Loop:
                
                andi.w  #$9FFF,(a1,d1.w)
                ori.w   #$2000,(a1,d1.w)
                andi.w  #$9FFF,(a1)
                ori.w   #$2000,(a1)+
                dbf     d7,@Loop
                
                movem.w (sp)+,d0
                rts

    ; End of function WriteBubbleText

