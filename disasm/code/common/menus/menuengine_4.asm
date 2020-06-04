
; ASM FILE code\common\menus\menuengine_4.asm :
; 0x1623A..0x16A62 : Menu engine
AlphabetHighlightTiles:
                incbin "data/graphics/tech/alphabethighlighttiles.bin"

; =============== S U B R O U T I N E =======================================

; In: D0 = default number
;     D1 = min number
;     D2 = max number
; 
; Out: D0 = chosen number

NumberPrompt:
                
                movem.l d1-a1,-(sp)
                link    a6,#-$10
                move.w  d0,-8(a6)
                move.w  d1,-$A(a6)
                move.w  d2,-$C(a6)
                move.w  #WINDOW_NUMBERPROMPT_SIZE,d0
                move.w  #WINDOW_NUMBERPROMPT_ORIGIN,d1
                jsr     (CreateWindow).l
                move.w  d0,-6(a6)
                move.l  a1,-4(a6)
                bsr.w   WritePromptNumberTiles
                move.w  -6(a6),d0
                move.w  #WINDOW_NUMBERPROMPT_DESTINATION,d1
                moveq   #WINDOW_NUMBERPROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
@Loop:
                
                bsr.w   WritePromptNumberTiles
                move.w  -6(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckInput_Left
                moveq   #1,d3           ; add 1
                bsr.w   ModifyPromptNumber
@CheckInput_Left:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckInput_Down
                moveq   #-1,d3          ; subtract 1
                bsr.w   ModifyPromptNumber
@CheckInput_Down:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckInput_Up
                moveq   #10,d3          ; add 10
                bsr.w   ModifyPromptNumber
@CheckInput_Up:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @CheckRemainingInputs
                moveq   #-10,d3         ; subtract 10
                bsr.w   ModifyPromptNumber
@CheckRemainingInputs:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   @ReturnDefaultNumber
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   @ReturnChosenNumber
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   @ReturnChosenNumber
                movem.l d6-d7,-(sp)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                movem.l (sp)+,d6-d7
                jsr     (WaitForVInt).w
                bra.s   @Loop
@ReturnDefaultNumber:
                
                move.w  #$FFFF,-8(a6)
@ReturnChosenNumber:
                
                move.w  -6(a6),d0
                move.w  #WINDOW_NUMBERPROMPT_ORIGIN,d1
                moveq   #WINDOW_NUMBERPROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                move.w  -8(a6),d0
                unlk    a6
                movem.l (sp)+,d1-a1
                rts

    ; End of function NumberPrompt


; =============== S U B R O U T I N E =======================================

; In: A6 = number prompt window stack

WritePromptNumberTiles:
                
                movea.l -4(a6),a1
                move.w  #WINDOW_NUMBERPROMPT_SIZE,d0
                bsr.w   CopyWindowTilesToRam
                movea.l -4(a6),a1
                adda.w  #WINDOW_NUMBERPROMPT_DIGITS_OFFSET,a1
                move.w  -8(a6),d0
                ext.l   d0
                moveq   #$FFFFFFF2,d1
                moveq   #WINDOW_NUMBERPROMPT_DIGITS_NUMBER,d7
                bra.w   WriteTilesFromNumber

    ; End of function WritePromptNumberTiles


; =============== S U B R O U T I N E =======================================

; In: A6 = number prompt window stack

ModifyPromptNumber:
                
                move.w  -8(a6),d0
                add.w   d3,d0
                cmp.w   -$C(a6),d0
                blt.s   @MaxNumber_Skip
                move.w  -$C(a6),d0
@MaxNumber_Skip:
                
                cmp.w   -$A(a6),d0
                bge.s   @MinNumber_Skip
                move.w  -$A(a6),d0
@MinNumber_Skip:
                
                move.w  d0,-8(a6)
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function ModifyPromptNumber


; =============== S U B R O U T I N E =======================================

DebugFlagSetter:
                
                movem.l d0-a1,-(sp)
                link    a6,#-$10
                move.w  d0,-8(a6)
                move.w  #$703,d0
                move.w  #$2001,d1
                jsr     (CreateWindow).l
                move.w  d0,-6(a6)
                move.l  a1,-4(a6)
                bsr.s   WritePromptNumberTiles
                move.w  -6(a6),d0
                move.w  #$1801,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
loc_163F6:
                
                bsr.w   sub_164AC
                move.w  -6(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16416
                moveq   #1,d3
                bsr.w   sub_164E8
loc_16416:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16424
                moveq   #$FFFFFFFF,d3
                bsr.w   sub_164E8
loc_16424:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16432
                moveq   #$A,d3
                bsr.w   sub_164E8
loc_16432:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16440
                moveq   #$FFFFFFF6,d3
                bsr.w   sub_164E8
loc_16440:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_16484
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_16464
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_16474
loc_1645E:
                
                jsr     (WaitForVInt).w
                bra.s   loc_163F6
byte_16464:
                
                sndCom  SFX_VALIDATION
                move.w  -8(a6),d1
                jsr     j_SetFlag
                bra.s   loc_1645E
byte_16474:
                
                sndCom  SFX_VALIDATION
                move.w  -8(a6),d1
                jsr     j_ClearFlag
                bra.s   loc_1645E
loc_16484:
                
                move.w  -6(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function DebugFlagSetter


; =============== S U B R O U T I N E =======================================

sub_164AC:
                
                movea.l -4(a6),a1
                move.w  #$703,d0
                bsr.w   CopyWindowTilesToRam
                movea.l -4(a6),a1
                adda.w  #$10,a1
                move.w  -8(a6),d0
                ext.l   d0
                moveq   #$FFFFFFF2,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromNumber
                addq.l  #2,a1
                move.w  -8(a6),d1
                jsr     j_CheckFlag
                bne.s   loc_164E2
                move.w  #$C030,(a1)
                bra.s   return_164E6
loc_164E2:
                
                move.w  #$C031,(a1)
return_164E6:
                
                rts

    ; End of function sub_164AC


; =============== S U B R O U T I N E =======================================

sub_164E8:
                
                move.w  -8(a6),d0
                add.w   d3,d0
                cmpi.w  #0,d0
                bge.s   loc_164F8
                move.w  #0,d0
loc_164F8:
                
                cmpi.w  #$3FF,d0
                blt.s   loc_16502
                move.w  #$3FF,d0
loc_16502:
                
                move.w  d0,-8(a6)
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function sub_164E8


; =============== S U B R O U T I N E =======================================

DisplayTimerWindow:
                
                movem.l d0-d1/a0-a1,-(sp)
                tst.w   ((TIMER_WINDOW_INDEX-$1000000)).w
                bne.s   loc_1654C
                move.w  #$804,d0        ; width height
                move.w  #$117,d1        ; X-Y screen pos
                jsr     (CreateWindow).l
                bsr.w   sub_165C0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                addq.w  #1,d0
                move.w  d0,((TIMER_WINDOW_INDEX-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateTimerWindow
                move.l  #$FFFFFFFF,((SPECIAL_BATTLE_TIME-$1000000)).w
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
loc_1654C:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function DisplayTimerWindow


; =============== S U B R O U T I N E =======================================

RemoveTimerWindow:
                
                movem.l d0-d1/a0-a1,-(sp)
                move.w  ((TIMER_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_16582
                subq.w  #1,d0
                move.w  #$2020,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                jsr     (ClearWindowAndUpdateEndPointer).l
                clr.w   ((TIMER_WINDOW_INDEX-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_UpdateTimerWindow
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
loc_16582:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function RemoveTimerWindow


; =============== S U B R O U T I N E =======================================

VInt_UpdateTimerWindow:
                
                movem.l d0-d1/a0-a1,-(sp)
                move.w  ((TIMER_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_165BA
                move.l  ((SECONDS_COUNTER-$1000000)).w,d1
                cmp.l   ((SPECIAL_BATTLE_TIME-$1000000)).w,d1
                beq.s   loc_165BA
                move.l  d1,((SPECIAL_BATTLE_TIME-$1000000)).w
                subq.w  #1,d0
                bsr.w   sub_165C0
                sndCom  SFX_MENU_SELECTION
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                bne.s   loc_165BA
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
loc_165BA:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function VInt_UpdateTimerWindow


; =============== S U B R O U T I N E =======================================

sub_165C0:
                
                move.w  d0,-(sp)
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                movem.l a1,-(sp)
                lea     TimerWindowLayout(pc), a0
                moveq   #$40,d7 
                jsr     (CopyBytes).w   
                movem.l (sp)+,a1
                adda.w  #$22,a1 
                move.l  ((SECONDS_COUNTER-$1000000)).w,d0
                divu.w  #$3C,d0 
                move.l  d0,-(sp)
                ext.l   d0
                cmpi.l  #$3E7,d0
                bcs.s   loc_165FA
                move.l  #$3E7,d0
loc_165FA:
                
                moveq   #$FFFFFFF0,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromNumber
                move.l  (sp)+,d0
                swap    d0
                ext.l   d0
                addi.w  #$64,d0 
                addq.l  #2,a1
                moveq   #2,d7
                bsr.w   WriteTilesFromNumber
                move.w  (sp)+,d0
                rts

    ; End of function sub_165C0

TimerWindowLayout:
                incbin "data/graphics/tech/windowlayouts/timerwindowwindowlayout.bin"

; =============== S U B R O U T I N E =======================================

WitchMainMenu:
                
                movem.l d1-a1,-(sp)
                link    a6,#-$10
                andi.w  #$F,d0
                move.w  d2,-$C(a6)
                beq.w   loc_16756
                move.w  d1,-$A(a6)
                move.w  #$A,-8(a6)
                movem.w d0,-(sp)
                move.w  #$1C0C,d0
                move.w  #$2001,d1
                jsr     (CreateWindow).l
                move.w  d0,-6(a6)
                move.l  a1,-4(a6)
                movea.l (p_plt_WitchChoice).l,a0
                lea     (PALETTE_2_CURRENT).l,a1
                move.w  #$20,d7 
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                bsr.w   sub_1679E
                move.w  -6(a6),d0
                move.w  #$202,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                movem.w (sp)+,d0
loc_166C2:
                
                bsr.w   sub_1679E
                movem.w d0,-(sp)
                move.w  -6(a6),d0
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
                subq.w  #1,-8(a6)
                bne.s   loc_16752
                move.w  #$14,-8(a6)
loc_16752:
                
                bra.w   loc_166C2
loc_16756:
                
                move.w  #$FFFF,d0
byte_1675A:
                
                sndCom  SFX_VALIDATION
                movem.w d0,-(sp)
                move.w  -6(a6),d0
                move.w  #$2001,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                movem.w (sp)+,d0
                unlk    a6
                movem.l (sp)+,d1-a1
                rts

    ; End of function WitchMainMenu


; =============== S U B R O U T I N E =======================================

sub_1678A:
                
                 
                sndCom  SFX_MENU_SELECTION
                add.w   d3,d0
                andi.w  #3,d0
                move.w  -$C(a6),d1
                btst    d0,d1
                beq.s   sub_1678A
                rts

    ; End of function sub_1678A


; =============== S U B R O U T I N E =======================================

sub_1679E:
                
                movea.l -4(a6),a0
                move.w  #$A7,d7 
loc_167A6:
                
                clr.l   (a0)+
                dbf     d7,loc_167A6
                move.w  -$C(a6),d6
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

DrawWitchMenuBubble:
                
                movea.l (p_WitchBubbleAnimation).l,a0
                movea.l -4(a6),a1
                cmp.b   d0,d3
                bne.s   loc_1683A
                move.w  -8(a6),d7
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
                
                move.w  -$A(a6),d1
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
                lea     (SAVE1_CHARACTER_DATA).l,a0
                cmpi.w  #2,d3
                blt.s   loc_168F4
                lea     (SAVE2_CHARACTER_DATA).l,a0
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
                moveq   #$FFFFFFC8,d1
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
                moveq   #$FFFFFFF0,d1
                moveq   #$A,d7
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

