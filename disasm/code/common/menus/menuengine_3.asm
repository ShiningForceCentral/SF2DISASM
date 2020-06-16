
; ASM FILE code\common\menus\menuengine_3.asm :
; 0x15772..0x1607C : Menu engine

; =============== S U B R O U T I N E =======================================

CreateLandEffectWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                move.w  #WINDOW_LANDEFFECT_DEST,d1
                jsr     (CreateWindow).w
                addq.w  #1,d0
                move.w  d0,((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                bsr.w   DrawLandEffectWindow
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$201,d1
                move.w  #4,d2
                cmpi.w  #WINDOW_FIGHTERMINISTATUS_MAX_WIDTH,((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w
                blt.s   loc_157A6
                move.w  #$101,d1
loc_157A6:
                
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function CreateLandEffectWindow


; =============== S U B R O U T I N E =======================================

HideLandEffectWindow:
                
                tst.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                beq.w   return_157E6
                movem.l d0-a2,-(sp)
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #WINDOW_LANDEFFECT_DEST,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                clr.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a2
return_157E6:
                
                rts

    ; End of function HideLandEffectWindow


; =============== S U B R O U T I N E =======================================

sub_157E8:
                
                tst.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                beq.w   return_15810
                movem.l d0-a2,-(sp)
                bsr.w   DrawLandEffectWindow
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                bne.s   loc_1580C
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
loc_1580C:
                
                movem.l (sp)+,d0-a2
return_15810:
                
                rts

    ; End of function sub_157E8


; =============== S U B R O U T I N E =======================================

DrawLandEffectWindow:
                
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,d3
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                bsr.w   CopyWindowTilesToRam
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetLandEffectSetting
                move.w  d1,d0
                mulu.w  #$F,d0
                moveq   #$FFFFFFF0,d1
                moveq   #2,d7
                movea.l d3,a1
                adda.w  #WINDOW_LANDEFFECT_TEXT_VALUE_OFFSET,a1
                bsr.w   WriteTilesFromNumber
                move.b  #$25,1(a1) 
                moveq   #$FFFFFFF0,d1
                moveq   #WINDOW_LANDEFFECT_TEXT_HEADER_LENGTH,d7
                movea.l d3,a1
                adda.w  #WINDOW_LANDEFFECT_TEXT_HEADER_OFFSET,a1
                lea     aLandEffect(pc), a0
                nop
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function DrawLandEffectWindow

aLandEffect:    dc.b 'LAND',$B,'EFFECT',0

; =============== S U B R O U T I N E =======================================

; related to battlefield options

sub_1586E:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a1,-(sp)
                link    a6,#-$10
                move.b  ((MESSAGE_SPEED-$1000000)).w,-$A(a6)
                move.b  ((DISPLAY_BATTLE_MESSAGES-$1000000)).w,-8(a6)
                move.w  #$1309,d0
                move.w  #$71C,d1
                jsr     (CreateWindow).l
                move.w  d0,-6(a6)
                move.l  a1,-4(a6)
                bsr.w   CopyBattlefieldOptionsMenuLayout
                move.w  -6(a6),d0
                move.w  #$712,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                lea     AlphabetHighlightTiles(pc), a0
                lea     ($B800).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (EnableDmaQueueProcessing).w
                jsr     (WaitForWindowMovementEnd).l
                clr.w   d4
                bsr.w   sub_15A20
                moveq   #$14,d6
loc_158D6:
                
                bsr.w   sub_159A0
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_158E8
                addq.w  #1,d3
                bsr.w   sub_15A3E
loc_158E8:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_158F6
                subq.w  #1,d3
                bsr.w   sub_15A3E
loc_158F6:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_15906
                eori.w  #1,d4
                bsr.w   sub_15A20
loc_15906:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_15916
                eori.w  #1,d4
                bsr.w   sub_15A20
loc_15916:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15940
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_1594C
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_1594C
                jsr     (WaitForVInt).w
                subq.w  #1,d6
                bne.s   loc_1593E
                moveq   #$14,d6
loc_1593E:
                
                bra.s   loc_158D6
loc_15940:
                
                move.b  -$A(a6),((MESSAGE_SPEED-$1000000)).w
                move.b  -8(a6),((DISPLAY_BATTLE_MESSAGES-$1000000)).w
loc_1594C:
                
                move.w  -6(a6),d0
                move.w  #$71E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                bsr.w   sub_1598C
                jsr     (WaitForWindowMovementEnd).l
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                unlk    a6
                movem.l (sp)+,d0-a1
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function sub_1586E


; =============== S U B R O U T I N E =======================================

CopyBattlefieldOptionsMenuLayout:
                
                lea     BattleConfigWindowLayout(pc), a0
                movea.l -4(a6),a1
                move.w  #$156,d7
                jmp     (CopyBytes).w   

    ; End of function CopyBattlefieldOptionsMenuLayout


; =============== S U B R O U T I N E =======================================

sub_1598C:
                
                lea     (SPRITE_08).l,a0
                moveq   #3,d7
loc_15994:
                
                move.w  #1,(a0)
                addq.l  #8,a0
                dbf     d7,loc_15994
                rts

    ; End of function sub_1598C


; =============== S U B R O U T I N E =======================================

sub_159A0:
                
                tst.w   ((HIDE_WINDOWS-$1000000)).w
                bne.s   sub_1598C
                movem.w d3-d4/d7,-(sp)
                lea     (SPRITE_08).l,a0
                lea     word_15A00(pc), a1
                clr.w   d3
                move.b  ((MESSAGE_SPEED-$1000000)).w,d3
                lsl.w   #4,d3
                tst.w   d4
                bne.s   loc_159CA
                cmpi.w  #7,d6
                bge.s   loc_159CA
                move.w  #$FF00,d3
loc_159CA:
                
                move.w  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.w  (a1)+,(a0)
                add.w   d3,(a0)+
                clr.w   d3
                move.b  ((DISPLAY_BATTLE_MESSAGES-$1000000)).w,d3
                lsl.w   #6,d3
                tst.w   d4
                beq.s   loc_159E8
                cmpi.w  #7,d6
                bge.s   loc_159E8
                move.w  #$FF00,d3
loc_159E8:
                
                moveq   #2,d7
loc_159EA:
                
                move.w  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.w  (a1)+,(a0)
                add.w   d3,(a0)+
                dbf     d7,loc_159EA
                bsr.w   sub_101E6
                movem.w (sp)+,d3-d4/d7
                rts

    ; End of function sub_159A0

word_15A00:     dc.w $124               ; unknown sprite definitions
                dc.b 5
                dc.b 9
                dc.w $C5C8
                dc.w $E4
                dc.w $144
                dc.b 9
                dc.b $A
                dc.w $C5C0
                dc.w $C4
                dc.w $144
                dc.b 5
                dc.b $B
                dc.w $C5C2
                dc.w $DC
                dc.w $144
                dc.b 9
                dc.b $10
                dc.w $C5C2
                dc.w $EC

; =============== S U B R O U T I N E =======================================

sub_15A20:
                
                clr.w   d3
                tst.w   d4
                bne.s   loc_15A30
                move.b  ((MESSAGE_SPEED-$1000000)).w,d3
                andi.w  #3,d3
                bra.s   byte_15A38
loc_15A30:
                
                move.b  ((DISPLAY_BATTLE_MESSAGES-$1000000)).w,d3
                andi.w  #1,d3
byte_15A38:
                
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function sub_15A20


; =============== S U B R O U T I N E =======================================

sub_15A3E:
                
                tst.w   d4
                bne.s   loc_15A4C
                andi.w  #3,d3
                move.b  d3,((MESSAGE_SPEED-$1000000)).w
                bra.s   byte_15A54
loc_15A4C:
                
                andi.w  #1,d3
                move.b  d3,((DISPLAY_BATTLE_MESSAGES-$1000000)).w
byte_15A54:
                
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function sub_15A3E

BattleConfigWindowLayout:
                incbin "data/graphics/tech/windowlayouts/battleconfigwindowlayout.bin"

; =============== S U B R O U T I N E =======================================

NameCharacter:
                
                movem.l d0-a2,-(sp)
                link    a6,#-$20
                move.w  d0,-$14(a6)
                lea     AlphabetHighlightTiles(pc), a0
                lea     ($B800).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  #WINDOW_NAMECHARACTER_ALPHABET_SIZE,d0
                move.w  #WINDOW_NAMECHARACTER_ALPHABET_DEST,d1
                jsr     (CreateWindow).w
                move.w  d0,-$12(a6)
                move.l  a1,-$C(a6)
                move.w  #WINDOW_NAMECHARACTER_ENTRY_SIZE,d0
                move.w  #WINDOW_NAMECHARACTER_ENTRY_DEST,d1
                jsr     (CreateWindow).w
                move.w  d0,-$10(a6)
                move.l  a1,-8(a6)
                move.w  #WINDOW_NAMECHARACTER_PORTRAIT_SIZE,d0
                move.w  #WINDOW_NAMECHARACTER_PORTRAIT_DEST,d1
                jsr     (CreateWindow).w
                move.w  d0,-$E(a6)
                addq.w  #1,d0
                move.w  d0,((PORTRAIT_WINDOW_INDEX-$1000000)).w
                move.l  a1,-4(a6)
                move.w  -$14(a6),d0
                bsr.w   GetCombatantPortrait
                move.w  d0,-$16(a6)
                bsr.w   sub_1604A
                move.w  -$16(a6),d0
                bsr.w   LoadPortrait    
                move.w  -$10(a6),d0
                move.w  #WINDOW_NAMECHARACTER_ENTRY_POSITION,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  -$12(a6),d0
                move.w  #WINDOW_NAMECHARACTER_ALPHABET_POSITION,d1
                jsr     (MoveWindowWithSfx).w
                move.w  -$E(a6),d0
                move.w  #WINDOW_NAMECHARACTER_PORTRAIT_POSITION,d1
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                jsr     sub_15CC4(pc)
                nop
                move.w  -$14(a6),d0
                lea     (byte_FF8805).l,a0
                tst.b   (a0)
                beq.s   @Skip           ; skip copying name if entered string is null (and keep default name)
                jsr     j_CopyCharacterNameToRam
@Skip:
                
                bsr.w   sub_15FD8
                move.w  -$12(a6),d0
                move.w  #WINDOW_NAMECHARACTER_ALPHABET_DEST,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  -$10(a6),d0
                move.w  #WINDOW_NAMECHARACTER_ENTRY_DEST,d1
                jsr     (MoveWindowWithSfx).w
                move.w  -$E(a6),d0
                move.w  #WINDOW_NAMECHARACTER_PORTRAIT_DEST,d1
                jsr     (MoveWindowWithSfx).w
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  -$12(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  -$10(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  -$E(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                unlk    a6
                movem.l (sp)+,d0-a2
                rts

    ; End of function NameCharacter


; =============== S U B R O U T I N E =======================================

sub_15CC4:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)
                clr.w   ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                clr.w   -$18(a6)
                clr.w   d0
                moveq   #$14,d1
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
                
                bsr.w   sub_15F24
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
                mulu.w  #$38,d2 
                add.w   d2,d0
                lea     word_160B6(pc), a0
                move.w  (a0,d0.w),d0
                tst.b   d0
                bpl.s   loc_15D64
                subi.b  #$20,d0 
loc_15D64:
                
                bsr.w   loc_15DC2
                move.b  d0,-1(a0)
                clr.b   (a0)
                addq.w  #1,-$18(a6)
loc_15D72:
                
                bsr.w   sub_16026
                move.w  -$10(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                jsr     (WaitForVInt).w
                moveq   #$14,d1
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,-$18(a6)
                bne.s   loc_15D96
                move.w  #$1704,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
loc_15D96:
                
                bra.w   loc_15CDC
loc_15D9A:
                
                cmpi.b  #$17,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                beq.w   loc_15F22
                cmpi.b  #$13,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                bne.s   loc_15D46
loc_15DAC:
                
                bsr.w   loc_15DC2
                tst.w   -$18(a6)
                beq.w   loc_15CDC
                clr.b   -2(a0)
                bsr.w   loc_15DC2
                bra.s   loc_15D72
loc_15DC2:
                
                lea     (byte_FF8805).l,a0
                clr.w   -$18(a6)
loc_15DCC:
                
                move.b  (a0)+,d2
                tst.b   d2
                beq.s   return_15DD8
                addq.w  #1,-$18(a6)
                bra.s   loc_15DCC
return_15DD8:
                
                rts
byte_15DDA:
                
                sndCom  SFX_VALIDATION
                bra.s   loc_15DAC
loc_15DE0:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,-$18(a6)
                bne.w   loc_15DFE
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.w   loc_15D22
                cmpi.b  #$13,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                bne.w   loc_15D22
loc_15DFE:
                
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                addq.b  #1,d0
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bge.s   loc_15E16
                cmpi.b  #$1A,d0         ; HARDCODED stuff ?
                bne.s   loc_15E14
                moveq   #0,d0
loc_15E14:
                
                bra.s   loc_15E2E
loc_15E16:
                
                cmpi.b  #$12,d0
                bne.s   loc_15E1E
                moveq   #$13,d0
loc_15E1E:
                
                cmpi.b  #$14,d0
                bne.s   loc_15E26
                moveq   #$17,d0
loc_15E26:
                
                cmpi.b  #$18,d0
                bne.s   loc_15E2E
                moveq   #0,d0
loc_15E2E:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15D22
loc_15E3A:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,-$18(a6)
                bne.w   loc_15E58
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.w   loc_15D22
                cmpi.b  #$17,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                bne.w   loc_15D22
loc_15E58:
                
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                subq.b  #1,d0
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bge.s   loc_15E70
                cmpi.b  #$FF,d0
                bne.s   loc_15E6E
                moveq   #$19,d0
loc_15E6E:
                
                bra.s   loc_15E88
loc_15E70:
                
                cmpi.b  #$16,d0
                bne.s   loc_15E78
                moveq   #$13,d0
loc_15E78:
                
                cmpi.b  #$12,d0
                bne.s   loc_15E80
                moveq   #$11,d0
loc_15E80:
                
                cmpi.b  #$FF,d0
                bne.s   loc_15E88
                moveq   #$17,d0
loc_15E88:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15D22
loc_15E94:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,-$18(a6)
                beq.w   loc_15D22
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d0
                subq.b  #2,d0
                cmpi.b  #$FE,d0
                bne.s   loc_15EAC
                moveq   #4,d0
loc_15EAC:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bsr.s   sub_15EE0
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15D22
loc_15EBA:
                
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,-$18(a6)
                beq.w   loc_15D22
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d0
                addq.b  #2,d0
                cmpi.b  #6,d0
                bne.s   loc_15ED2
                moveq   #0,d0
loc_15ED2:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                bsr.s   sub_15EE0
                bra.w   loc_15D22

    ; End of function sub_15CC4


; =============== S U B R O U T I N E =======================================

sub_15EE0:
                
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.s   return_15F20
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                cmpi.b  #$12,d0         ; HARDCODED stuff ?
                bne.s   loc_15EF4
                moveq   #$13,d0
loc_15EF4:
                
                cmpi.b  #$14,d0
                bne.s   loc_15EFC
                moveq   #$13,d0
loc_15EFC:
                
                cmpi.b  #$15,d0
                bne.s   loc_15F04
                moveq   #$13,d0
loc_15F04:
                
                cmpi.b  #$16,d0
                bne.s   loc_15F0C
                moveq   #$17,d0
loc_15F0C:
                
                cmpi.b  #$18,d0
                bne.s   loc_15F14
                moveq   #$17,d0
loc_15F14:
                
                cmpi.b  #$19,d0
                bne.s   loc_15F1C
                moveq   #$17,d0
loc_15F1C:
                
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
return_15F20:
                
                rts

    ; End of function sub_15EE0


; START OF FUNCTION CHUNK FOR sub_15CC4

loc_15F22:
                
                clr.w   d1

; END OF FUNCTION CHUNK FOR sub_15CC4


; =============== S U B R O U T I N E =======================================

sub_15F24:
                
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                beq.s   loc_15F2C
                moveq   #1,d1
loc_15F2C:
                
                lea     (SPRITE_08).l,a0
                cmpi.w  #7,d1
                bge.s   loc_15F50
                move.w  #1,(a0)
                move.w  #1,6(a0)
                move.w  #1,8(a0)
                move.w  #1,$E(a0)
                bra.s   loc_15F90
loc_15F50:
                
                clr.w   d0
                move.b  ((BATTLE_ENTITY_CHOSEN_X-$1000000)).w,d0
                lsl.w   #3,d0
                addi.w  #$94,d0 
                move.w  d0,6(a0)
                clr.w   d0
                move.b  ((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w,d0
                lsl.w   #3,d0
                addi.w  #$DC,d0 
                move.w  d0,(a0)
                move.w  -$18(a6),d0
                cmpi.w  #ALLYNAME_MAX_DISPLAYED_LENGTH,d0
                bge.s   loc_15F84
                lsl.w   #3,d0
                addi.w  #$D8,d0 
                move.w  d0,$E(a0)
                bra.s   loc_15F8A
loc_15F84:
                
                move.w  #1,$E(a0)
loc_15F8A:
                
                move.w  #$C9,8(a0) 
loc_15F90:
                
                move.b  #5,2(a0)
                move.w  #$C5C8,4(a0)
                cmpi.b  #$13,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                blt.s   loc_15FB8
                cmpi.b  #4,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                bne.s   loc_15FB8
                move.b  #$D,2(a0)
                move.w  #$C5C0,4(a0)
loc_15FB8:
                
                clr.b   $A(a0)
                move.w  #$C5C3,$C(a0)
                subq.w  #1,d1
                bne.s   loc_15FC8
                moveq   #$14,d1
loc_15FC8:
                
                move.b  #9,3(a0)
                move.b  #$10,$B(a0)
                bra.w   sub_101E6

    ; End of function sub_15F24


; =============== S U B R O U T I N E =======================================

sub_15FD8:
                
                lea     NameEntryWindowLayout(pc), a0
                movea.l -8(a6),a1
                move.w  #$2A,d7 
                jsr     (CopyBytes).w   
                lea     (byte_FF8805).l,a0
                move.w  -$14(a6),d0
                jsr     j_GetCombatantName
                tst.w   -$1A(a6)
                beq.s   loc_1601E
                moveq   #$A,d7
                lea     $26(a1),a1
                move.l  #$C020C020,(a1)
                move.l  #$C020C020,4(a1)
                move.w  #$C020,8(a1)
                moveq   #$FFFFFFF2,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
loc_1601E:
                
                move.w  #$FFFF,-$1A(a6)
                rts

    ; End of function sub_15FD8


; =============== S U B R O U T I N E =======================================

sub_16026:
                
                lea     NameEntryWindowLayout(pc), a0
                movea.l -8(a6),a1
                move.w  #$2A,d7 
                jsr     (CopyBytes).w   
                lea     (byte_FF8805).l,a0
                moveq   #$A,d7
                lea     WINDOW_NAMECHARACTER_ENTRY_NAME_OFFSET(a1),a1
                moveq   #$FFFFFFF2,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function sub_16026


; =============== S U B R O U T I N E =======================================

sub_1604A:
                
                lea     AlphabetTopBorderWindowLayout(pc), a0
                movea.l -$C(a6),a1
                move.w  #$366,d7
                jsr     (CopyBytes).w   
                lea     NameEntryWindowLayout(pc), a0
                movea.l -8(a6),a1
                move.w  #$2A,d7 
                jsr     (CopyBytes).w   
                lea     WindowBorderTiles(pc), a0
                movea.l -4(a6),a1
                move.w  #$A0,d7 
                jsr     (CopyBytes).w   
                rts

    ; End of function sub_1604A

