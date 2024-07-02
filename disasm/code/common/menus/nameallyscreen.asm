
; ASM FILE code\common\menus\nameallyscreen.asm :
; 0x15BB0..0x1607C : Menu engine, part 8 : Name ally screen functions

; =============== S U B R O U T I N E =======================================

; In: D0 = ally index

var_26 = -26
nameEntryCount = -24
portraitIndex = -22
ally = -20
alphabetWindowSlot = -18
entryWindowSlot = -16
portraitWindowSlot = -14
alphabetWindowLayoutEndAddress = -12
entryWindowLayoutEndAddress = -8
portraitWindowLayoutEndAddress = -4

NameAlly:
                
                movem.l d0-a2,-(sp)
                link    a6,#-32
                move.w  d0,ally(a6)
                lea     tiles_AlphabetHighlight(pc), a0
                lea     ($B800).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  #WINDOW_NAMEALLY_ALPHABET_SIZE,d0
                move.w  #WINDOW_NAMEALLY_ALPHABET_DEST,d1
                jsr     (CreateWindow).w
                move.w  d0,alphabetWindowSlot(a6)
                move.l  a1,alphabetWindowLayoutEndAddress(a6)
                move.w  #WINDOW_NAMEALLY_ENTRY_SIZE,d0
                move.w  #WINDOW_NAMEALLY_ENTRY_DEST,d1
                jsr     (CreateWindow).w
                move.w  d0,entryWindowSlot(a6)
                move.l  a1,entryWindowLayoutEndAddress(a6)
                move.w  #WINDOW_NAMEALLY_PORTRAIT_SIZE,d0
                move.w  #WINDOW_NAMEALLY_PORTRAIT_DEST,d1
                jsr     (CreateWindow).w
                move.w  d0,portraitWindowSlot(a6)
                addq.w  #1,d0
                move.w  d0,((PORTRAIT_WINDOW_INDEX-$1000000)).w
                move.l  a1,portraitWindowLayoutEndAddress(a6)
                move.w  ally(a6),d0
                bsr.w   GetCombatantPortrait
                move.w  d0,portraitIndex(a6)
                bsr.w   sub_1604A
                move.w  portraitIndex(a6),d0
                bsr.w   LoadPortrait    
                move.w  entryWindowSlot(a6),d0
                move.w  #WINDOW_NAMEALLY_ENTRY_POSITION,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  alphabetWindowSlot(a6),d0
                move.w  #WINDOW_NAMEALLY_ALPHABET_POSITION,d1
                jsr     (MoveWindowWithSfx).w
                move.w  portraitWindowSlot(a6),d0
                move.w  #WINDOW_NAMEALLY_PORTRAIT_POSITION,d1
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                jsr     NavigateAlphabetWindow(pc)
                nop
                move.w  ally(a6),d0
                lea     (TEMP_NAME_ENTRY_SPACE).l,a0
                tst.b   (a0)
                beq.s   @Skip           ; skip copying name if entered string is null (and keep default name)
                jsr     j_LoadAllyName
@Skip:
                
                bsr.w   OpenNameEntryWindow
                move.w  alphabetWindowSlot(a6),d0
                move.w  #WINDOW_NAMEALLY_ALPHABET_DEST,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  entryWindowSlot(a6),d0
                move.w  #WINDOW_NAMEALLY_ENTRY_DEST,d1
                jsr     (MoveWindowWithSfx).w
                move.w  portraitWindowSlot(a6),d0
                move.w  #WINDOW_NAMEALLY_PORTRAIT_DEST,d1
                jsr     (MoveWindowWithSfx).w
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  alphabetWindowSlot(a6),d0
                jsr     (DeleteWindow).w
                move.w  entryWindowSlot(a6),d0
                jsr     (DeleteWindow).w
                move.w  portraitWindowSlot(a6),d0
                jsr     (DeleteWindow).w
                unlk    a6
                movem.l (sp)+,d0-a2
                rts

    ; End of function NameAlly


; =============== S U B R O U T I N E =======================================

var_26 = -26
nameEntryCount = -24
portraitIndex = -22
ally = -20
alphabetWindowSlot = -18
entryWindowSlot = -16
portraitWindowSlot = -14
alphabetWindowLayoutEndAddress = -12
entryWindowLayoutEndAddress = -8
portraitWindowLayoutEndAddress = -4

NavigateAlphabetWindow:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)
                clr.w   ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                clr.w   nameEntryCount(a6)
                clr.w   d0
                moveq   #20,d1
loc_15CDC:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15DE0
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15E3A
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15EBA
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15E94
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_15DDA
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_15D2C
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_15D2C
loc_15D22:
                
                bsr.w   LoadAlphabetHighlightSprites
                jsr     (WaitForVInt).w
                bra.s   loc_15CDC
byte_15D2C:
                
                sndCom  SFX_VALIDATION
                clr.w   d0
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                cmpi.w  #$13,d0
                blt.s   loc_15D46
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                beq.w   loc_15D9A
loc_15D46:
                
                add.w   d0,d0
                clr.w   d2
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d2
                mulu.w  #56,d2
                add.w   d2,d0
                lea     AlphabetStart(pc), a0
                move.w  (a0,d0.w),d0
                tst.b   d0
                bpl.s   loc_15D64
                subi.b  #32,d0
loc_15D64:
                
                bsr.w   loc_15DC2
                move.b  d0,-1(a0)
                clr.b   (a0)
                addq.w  #1,nameEntryCount(a6)
loc_15D72:
                
                bsr.w   LoadNameEntryWindowLayout
                move.w  entryWindowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                jsr     (WaitForVInt).w
                moveq   #20,d1
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,nameEntryCount(a6)
                bne.s   loc_15D96
                move.w  #$1704,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
loc_15D96:
                
                bra.w   loc_15CDC
loc_15D9A:
                
                cmpi.b  #23,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                beq.w   loc_15F22
                cmpi.b  #19,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                bne.s   loc_15D46
loc_15DAC:
                
                bsr.w   loc_15DC2
                tst.w   nameEntryCount(a6)
                beq.w   loc_15CDC
                clr.b   -2(a0)
                bsr.w   loc_15DC2
                bra.s   loc_15D72
loc_15DC2:
                
                lea     (TEMP_NAME_ENTRY_SPACE).l,a0
                clr.w   nameEntryCount(a6)
loc_15DCC:
                
                move.b  (a0)+,d2
                tst.b   d2
                beq.s   return_15DD8
                addq.w  #1,nameEntryCount(a6)
                bra.s   loc_15DCC
return_15DD8:
                
                rts
byte_15DDA:
                
                sndCom  SFX_VALIDATION
                bra.s   loc_15DAC
loc_15DE0:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,nameEntryCount(a6)
                bne.w   loc_15DFE
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.w   loc_15D22
                cmpi.b  #19,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                bne.w   loc_15D22
loc_15DFE:
                
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                addq.b  #1,d0
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bge.s   loc_15E16
                cmpi.b  #26,d0
                bne.s   loc_15E14
                moveq   #0,d0
loc_15E14:
                
                bra.s   loc_15E2E
loc_15E16:
                
                cmpi.b  #18,d0
                bne.s   loc_15E1E
                moveq   #19,d0
loc_15E1E:
                
                cmpi.b  #20,d0
                bne.s   loc_15E26
                moveq   #23,d0
loc_15E26:
                
                cmpi.b  #24,d0
                bne.s   loc_15E2E
                moveq   #0,d0
loc_15E2E:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15D22
loc_15E3A:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,nameEntryCount(a6)
                bne.w   loc_15E58
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.w   loc_15D22
                cmpi.b  #23,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                bne.w   loc_15D22
loc_15E58:
                
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                subq.b  #1,d0
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bge.s   loc_15E70
                cmpi.b  #-1,d0
                bne.s   loc_15E6E
                moveq   #25,d0
loc_15E6E:
                
                bra.s   loc_15E88
loc_15E70:
                
                cmpi.b  #22,d0
                bne.s   loc_15E78
                moveq   #19,d0
loc_15E78:
                
                cmpi.b  #18,d0
                bne.s   loc_15E80
                moveq   #17,d0
loc_15E80:
                
                cmpi.b  #-1,d0
                bne.s   loc_15E88
                moveq   #23,d0
loc_15E88:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15D22
loc_15E94:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,nameEntryCount(a6)
                beq.w   loc_15D22
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d0
                subq.b  #2,d0
                cmpi.b  #-2,d0
                bne.s   loc_15EAC
                moveq   #4,d0
loc_15EAC:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bsr.s   WrapCursorLocationBottomToTop
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15D22
loc_15EBA:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,nameEntryCount(a6)
                beq.w   loc_15D22
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d0
                addq.b  #2,d0
                cmpi.b  #6,d0
                bne.s   loc_15ED2
                moveq   #0,d0
loc_15ED2:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                bsr.s   WrapCursorLocationBottomToTop
                bra.w   loc_15D22

    ; End of function NavigateAlphabetWindow


; =============== S U B R O U T I N E =======================================


WrapCursorLocationBottomToTop:
                
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.s   return_15F20
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                cmpi.b  #18,d0
                bne.s   loc_15EF4
                moveq   #19,d0
loc_15EF4:
                
                cmpi.b  #20,d0
                bne.s   loc_15EFC
                moveq   #19,d0
loc_15EFC:
                
                cmpi.b  #21,d0
                bne.s   loc_15F04
                moveq   #19,d0
loc_15F04:
                
                cmpi.b  #22,d0
                bne.s   loc_15F0C
                moveq   #23,d0
loc_15F0C:
                
                cmpi.b  #24,d0
                bne.s   loc_15F14
                moveq   #23,d0
loc_15F14:
                
                cmpi.b  #25,d0
                bne.s   loc_15F1C
                moveq   #23,d0
loc_15F1C:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
return_15F20:
                
                rts

    ; End of function WrapCursorLocationBottomToTop


; START OF FUNCTION CHUNK FOR NavigateAlphabetWindow

loc_15F22:
                
                clr.w   d1

; END OF FUNCTION CHUNK FOR NavigateAlphabetWindow


; =============== S U B R O U T I N E =======================================

; In: d1.w = blinking frame timer

var_26 = -26
nameEntryCount = -24
portraitIndex = -22
ally = -20
alphabetWindowSlot = -18
entryWindowSlot = -16
portraitWindowSlot = -14
alphabetWindowLayoutEndAddress = -12
entryWindowLayoutEndAddress = -8
portraitWindowLayoutEndAddress = -4

LoadAlphabetHighlightSprites:
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   @loc_1
                
                moveq   #1,d1
@loc_1:
                
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                cmpi.w  #7,d1
                bge.s   @loc_2
                
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                move.w  #1,NEXTVDPSPRITE_OFFSET_Y(a0)
                move.w  #1,NEXTVDPSPRITE_OFFSET_X(a0)
                bra.s   @loc_5
@loc_2:
                
                clr.w   d0
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                lsl.w   #3,d0
                addi.w  #148,d0
                move.w  d0,VDPSPRITE_OFFSET_X(a0)
                clr.w   d0
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d0
                lsl.w   #3,d0
                addi.w  #220,d0
                move.w  d0,(a0)
                move.w  nameEntryCount(a6),d0
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,d0
                bge.s   @loc_3
                
                lsl.w   #3,d0
                addi.w  #216,d0
                move.w  d0,NEXTVDPSPRITE_OFFSET_X(a0)
                bra.s   @loc_4
@loc_3:
                
                move.w  #1,NEXTVDPSPRITE_OFFSET_X(a0)
@loc_4:
                
                move.w  #201,NEXTVDPSPRITE_OFFSET_Y(a0)
@loc_5:
                
                move.b  #5,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_MENUTILE9|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                cmpi.b  #19,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                blt.s   @loc_6
                
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.s   @loc_6
                
                move.b  #VDPSPRITESIZE_V1|VDPSPRITESIZE_H1|$D,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_MENUTILE1|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
@loc_6:
                
                clr.b   NEXTVDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_MENUTILE4|VDPTILE_PALETTE3|VDPTILE_PRIORITY,NEXTVDPSPRITE_OFFSET_TILE(a0)
                subq.w  #1,d1
                bne.s   @loc_7
                
                moveq   #20,d1
@loc_7:
                
                move.b  #9,VDPSPRITE_OFFSET_LINK(a0)
                move.b  #16,NEXTVDPSPRITE_OFFSET_LINK(a0)
                bra.w   LinkHighlightSprites

    ; End of function LoadAlphabetHighlightSprites


; =============== S U B R O U T I N E =======================================

var_26 = -26
nameEntryCount = -24
portraitIndex = -22
ally = -20
alphabetWindowSlot = -18
entryWindowSlot = -16
portraitWindowSlot = -14
alphabetWindowLayoutEndAddress = -12
entryWindowLayoutEndAddress = -8
portraitWindowLayoutEndAddress = -4

OpenNameEntryWindow:
                
                lea     layout_NameEntryWindow(pc), a0
                movea.l entryWindowLayoutEndAddress(a6),a1
                move.w  #42,d7
                jsr     (CopyBytes).w   
                lea     (TEMP_NAME_ENTRY_SPACE).l,a0
                move.w  ally(a6),d0
                jsr     j_GetCombatantName
                tst.w   var_26(a6)
                beq.s   loc_1601E
                
                moveq   #10,d7
                lea     38(a1),a1
                move.l  #$C020C020,(a1)
                move.l  #$C020C020,4(a1)
                move.w  #$C020,8(a1)
                moveq   #-14,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
loc_1601E:
                
                move.w  #-1,var_26(a6)
                rts

    ; End of function OpenNameEntryWindow


; =============== S U B R O U T I N E =======================================

var_26 = -26
nameEntryCount = -24
portraitIndex = -22
ally = -20
alphabetWindowSlot = -18
entryWindowSlot = -16
portraitWindowSlot = -14
alphabetWindowLayoutEndAddress = -12
entryWindowLayoutEndAddress = -8
portraitWindowLayoutEndAddress = -4

LoadNameEntryWindowLayout:
                
                lea     layout_NameEntryWindow(pc), a0
                movea.l entryWindowLayoutEndAddress(a6),a1
                move.w  #42,d7
                jsr     (CopyBytes).w   
                lea     (TEMP_NAME_ENTRY_SPACE).l,a0
                moveq   #10,d7
                lea     WINDOW_NAMEALLY_OFFSET_ENTRY(a1),a1
                moveq   #-14,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function LoadNameEntryWindowLayout


; =============== S U B R O U T I N E =======================================

var_26 = -26
nameEntryCount = -24
portraitIndex = -22
ally = -20
alphabetWindowSlot = -18
entryWindowSlot = -16
portraitWindowSlot = -14
alphabetWindowLayoutEndAddress = -12
entryWindowLayoutEndAddress = -8
portraitWindowLayoutEndAddress = -4

sub_1604A:
                
                lea     layout_AlphabetWindow(pc), a0
                movea.l alphabetWindowLayoutEndAddress(a6),a1
                move.w  #870,d7
                jsr     (CopyBytes).w   
                lea     layout_NameEntryWindow(pc), a0
                movea.l entryWindowLayoutEndAddress(a6),a1
                move.w  #42,d7
                jsr     (CopyBytes).w   
                lea     tiles_WindowBorder(pc), a0
                movea.l portraitWindowLayoutEndAddress(a6),a1
                move.w  #160,d7
                jsr     (CopyBytes).w   
                rts

    ; End of function sub_1604A

