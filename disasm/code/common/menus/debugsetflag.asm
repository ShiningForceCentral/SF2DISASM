
; ASM FILE code\common\menus\debugsetflag.asm :
; 0x163BC..0x1650C : Debug : Set flag prompt

; =============== S U B R O U T I N E =======================================

flag = -8
windowSlot = -6
windowLayoutEndAddress = -4

DebugSetFlag:
                
                movem.l d0-a1,-(sp)
                link    a6,#-16
                move.w  d0,flag(a6)
                move.w  #$703,d0
                move.w  #$2001,d1
                jsr     (CreateWindow).l
                move.w  d0,windowSlot(a6)
                move.l  a1,windowLayoutEndAddress(a6)
                bsr.s   WriteNumberPromptDigits
                move.w  windowSlot(a6),d0
                move.w  #$1801,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
loc_163F6:
                
                bsr.w   WriteDebugFlagSetterWindowLayout
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16416
                moveq   #1,d3
                bsr.w   sub_164E8
loc_16416:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16424
                moveq   #-1,d3
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
                move.w  flag(a6),d1
                jsr     j_SetFlag
                bra.s   loc_1645E
byte_16474:
                
                sndCom  SFX_VALIDATION
                move.w  flag(a6),d1
                jsr     j_ClearFlag
                bra.s   loc_1645E
loc_16484:
                
                move.w  windowSlot(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).l
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function DebugSetFlag


; =============== S U B R O U T I N E =======================================

flag = -8
windowSlot = -6
windowLayoutEndAddress = -4

WriteDebugFlagSetterWindowLayout:
                
                movea.l windowLayoutEndAddress(a6),a1
                move.w  #$703,d0
                bsr.w   alt_WriteWindowTiles
                movea.l windowLayoutEndAddress(a6),a1
                adda.w  #$10,a1
                move.w  flag(a6),d0
                ext.l   d0
                moveq   #-14,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromNumber
                addq.l  #2,a1
                move.w  flag(a6),d1
                jsr     j_CheckFlag
                bne.s   loc_164E2
                move.w  #VDPTILE_NUMBER_0|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
                bra.s   return_164E6
loc_164E2:
                
                move.w  #VDPTILE_NUMBER_1|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
return_164E6:
                
                rts

    ; End of function WriteDebugFlagSetterWindowLayout


; =============== S U B R O U T I N E =======================================

flag = -8
windowSlot = -6
windowLayoutEndAddress = -4

sub_164E8:
                
                move.w  flag(a6),d0
                add.w   d3,d0
                cmpi.w  #0,d0
                bge.s   loc_164F8
                move.w  #0,d0
loc_164F8:
                
                cmpi.w  #$3FF,d0
                blt.s   loc_16502
                move.w  #$3FF,d0
loc_16502:
                
                move.w  d0,flag(a6)
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function sub_164E8

