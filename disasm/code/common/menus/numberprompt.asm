
; ASM FILE code\common\menus\numberprompt.asm :
; 0x16282..0x163BC : Menu engine, part 9 : Number prompt functions

; =============== S U B R O U T I N E =======================================

; In: D0 = default number
;     D1 = min number
;     D2 = max number
; 
; Out: D0 = chosen number

numberMax = -12
numberMin = -10
numberEntry = -8
windowSlot = -6
windowLayoutEndAddress = -4

NumberPrompt:
                
                movem.l d1-a1,-(sp)
                link    a6,#-16
                move.w  d0,numberEntry(a6)
                move.w  d1,numberMin(a6)
                move.w  d2,numberMax(a6)
                move.w  #WINDOW_NUMBERPROMPT_SIZE,d0
                move.w  #WINDOW_NUMBERPROMPT_ORIGIN,d1
                jsr     (CreateWindow).l
                move.w  d0,windowSlot(a6)
                move.l  a1,windowLayoutEndAddress(a6)
                bsr.w   WriteNumberPromptDigits
                move.w  windowSlot(a6),d0
                move.w  #WINDOW_NUMBERPROMPT_DESTINATION,d1
                moveq   #WINDOW_NUMBERPROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
@Loop:
                
                bsr.w   WriteNumberPromptDigits
                move.w  windowSlot(a6),d0
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
                
                move.w  #-1,numberEntry(a6)
@ReturnChosenNumber:
                
                move.w  windowSlot(a6),d0
                move.w  #WINDOW_NUMBERPROMPT_ORIGIN,d1
                moveq   #WINDOW_NUMBERPROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).l
                move.w  numberEntry(a6),d0
                unlk    a6
                movem.l (sp)+,d1-a1
                rts

    ; End of function NumberPrompt


; =============== S U B R O U T I N E =======================================

; In: A6 = number prompt window stack

numberMax = -12
numberMin = -10
numberEntry = -8
windowSlot = -6
windowLayoutEndAddress = -4

WriteNumberPromptDigits:
                
                movea.l windowLayoutEndAddress(a6),a1
                move.w  #WINDOW_NUMBERPROMPT_SIZE,d0
                bsr.w   alt_WriteWindowTiles
                movea.l windowLayoutEndAddress(a6),a1
                adda.w  #WINDOW_NUMBERPROMPT_DIGITS_OFFSET,a1
                move.w  numberEntry(a6),d0
                ext.l   d0
                moveq   #$FFFFFFF2,d1
                moveq   #WINDOW_NUMBERPROMPT_DIGITS_NUMBER,d7
                bra.w   WriteTilesFromNumber

    ; End of function WriteNumberPromptDigits


; =============== S U B R O U T I N E =======================================

; In: A6 = number prompt window stack

numberMax = -12
numberMin = -10
numberEntry = -8
windowSlot = -6
windowLayoutEndAddress = -4

ModifyPromptNumber:
                
                move.w  numberEntry(a6),d0
                add.w   d3,d0
                cmp.w   numberMax(a6),d0
                blt.s   @MaxNumber_Skip
                move.w  numberMax(a6),d0
@MaxNumber_Skip:
                
                cmp.w   numberMin(a6),d0
                bge.s   @MinNumber_Skip
                move.w  numberMin(a6),d0
@MinNumber_Skip:
                
                move.w  d0,numberEntry(a6)
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function ModifyPromptNumber

