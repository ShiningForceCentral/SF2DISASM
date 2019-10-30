
; ASM FILE code\common\menus\menuengine_3.asm :
; 0x15772..0x16EA6 : Menu engine

; =============== S U B R O U T I N E =======================================

CreateLandEffectWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #$805,d0
                move.w  #$F801,d1
                jsr     (CreateWindow).w
                addq.w  #1,d0
                move.w  d0,((LAND_EFFECT_WINDOW_IDX-$1000000)).w
                bsr.w   DrawLandEffectWindow
                move.w  ((LAND_EFFECT_WINDOW_IDX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$201,d1
                move.w  #4,d2
                cmpi.w  #$16,((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w
                blt.s   loc_157A6
                move.w  #$101,d1
loc_157A6:
                
                jsr     (MoveWindowWithSFX).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

	; End of function CreateLandEffectWindow


; =============== S U B R O U T I N E =======================================

HideLandEffectWindow:
                
                tst.w   ((LAND_EFFECT_WINDOW_IDX-$1000000)).w
                beq.w   return_157E6
                movem.l d0-a2,-(sp)
                move.w  ((LAND_EFFECT_WINDOW_IDX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$F801,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSFX).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((LAND_EFFECT_WINDOW_IDX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (ClearWindowAndUpdateEndPtr).w
                clr.w   ((LAND_EFFECT_WINDOW_IDX-$1000000)).w
                movem.l (sp)+,d0-a2
return_157E6:
                
                rts

	; End of function HideLandEffectWindow


; =============== S U B R O U T I N E =======================================

sub_157E8:
                
                tst.w   ((LAND_EFFECT_WINDOW_IDX-$1000000)).w
                beq.w   return_15810
                movem.l d0-a2,-(sp)
                bsr.w   DrawLandEffectWindow
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                bne.s   loc_1580C
                move.w  ((LAND_EFFECT_WINDOW_IDX-$1000000)).w,d0
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
                
                move.w  ((LAND_EFFECT_WINDOW_IDX-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,d3
                move.w  #$805,d0
                bsr.w   CopyWindowTilesToRAM
                move.w  ((MOVING_BATTLE_ENTITY_IDX-$1000000)).w,d0
                jsr     j_GetMoveCost
                move.w  d1,d0
                mulu.w  #$F,d0
                moveq   #$FFFFFFF0,d1
                moveq   #2,d7
                movea.l d3,a1
                adda.w  #$38,a1 
                bsr.w   WriteTilesFromNumber
                move.b  #$25,1(a1) 
                moveq   #$FFFFFFF0,d1
                moveq   #$F,d7
                movea.l d3,a1
                adda.w  #$12,a1
                lea     aLandEffect(pc), a0
                nop
                bsr.w   WriteTilesFromASCII
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
                jsr     (MoveWindowWithSFX).l
                lea     unk_1623A(pc), a0
                lea     ($B800).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDMAOnCompressedTiles).w
                jsr     (EnableDMAQueueProcessing).w
                jsr     (WaitForWindowMovementEnd).l
                clr.w   d4
                bsr.w   sub_15A20
                moveq   #$14,d6
loc_158D6:
                
                bsr.w   sub_159A0
                btst    #INPUT_A_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_158E8
                addq.w  #1,d3
                bsr.w   sub_15A3E
loc_158E8:
                
                btst    #INPUT_A_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_158F6
                subq.w  #1,d3
                bsr.w   sub_15A3E
loc_158F6:
                
                btst    #INPUT_A_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_15906
                eori.w  #1,d4
                bsr.w   sub_15A20
loc_15906:
                
                btst    #INPUT_A_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_15916
                eori.w  #1,d4
                bsr.w   sub_15A20
loc_15916:
                
                btst    #INPUT_A_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15940
                btst    #INPUT_A_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_1594C
                btst    #INPUT_A_A,((CURRENT_PLAYER_INPUT-$1000000)).w
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
                jsr     (MoveWindowWithSFX).l
                bsr.w   sub_1598C
                jsr     (WaitForWindowMovementEnd).l
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPtr).l
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
                lea     unk_15A00(pc), a1
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

unk_15A00:      dc.b   1
                dc.b $24 
                dc.b   5
                dc.b   9
                dc.b $C5 
                dc.b $C8 
                dc.b   0
                dc.b $E4 
                dc.b   1
                dc.b $44 
                dc.b   9
                dc.b  $A
                dc.b $C5 
                dc.b $C0 
                dc.b   0
                dc.b $C4 
                dc.b   1
                dc.b $44 
                dc.b   5
                dc.b  $B
                dc.b $C5 
                dc.b $C2 
                dc.b   0
                dc.b $DC 
                dc.b   1
                dc.b $44 
                dc.b   9
                dc.b $10
                dc.b $C5 
                dc.b $C2 
                dc.b   0
                dc.b $EC 

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
                lea     unk_1623A(pc), a0
                lea     ($B800).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDMAOnCompressedTiles).w
                jsr     (WaitForDMAQueueProcessing).w
                move.w  #$1C07,d0
                move.w  #$21C,d1
                jsr     (CreateWindow).w
                move.w  d0,-$12(a6)
                move.l  a1,-$C(a6)
                move.w  #$903,d0
                move.w  #$2008,d1
                jsr     (CreateWindow).w
                move.w  d0,-$10(a6)
                move.l  a1,-8(a6)
                move.w  #$80A,d0
                move.w  #$F8F6,d1
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
                move.w  #$A08,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSFX).w
                move.w  -$12(a6),d0
                move.w  #$20B,d1
                jsr     (MoveWindowWithSFX).w
                move.w  -$E(a6),d0
                move.w  #$201,d1
                jsr     (MoveWindowWithSFX).w
                jsr     (WaitForWindowMovementEnd).w
                jsr     sub_15CC4(pc)
                nop
                move.w  -$14(a6),d0
                lea     (byte_FF8805).l,a0
                tst.b   (a0)
                beq.s   loc_15C72
                jsr     j_CopyCharNameToRAM
loc_15C72:
                
                bsr.w   sub_15FD8
                move.w  -$12(a6),d0
                move.w  #$21C,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSFX).w
                move.w  -$10(a6),d0
                move.w  #$2008,d1
                jsr     (MoveWindowWithSFX).w
                move.w  -$E(a6),d0
                move.w  #$F8F6,d1
                jsr     (MoveWindowWithSFX).w
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  -$12(a6),d0
                jsr     (ClearWindowAndUpdateEndPtr).w
                move.w  -$10(a6),d0
                jsr     (ClearWindowAndUpdateEndPtr).w
                move.w  -$E(a6),d0
                jsr     (ClearWindowAndUpdateEndPtr).w
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
                
                btst    #INPUT_A_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15DE0
                btst    #INPUT_A_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15E3A
                btst    #INPUT_A_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15EBA
                btst    #INPUT_A_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15E94
                btst    #INPUT_A_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_15DDA
                btst    #INPUT_A_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_15D2C
                btst    #INPUT_A_A,((CURRENT_PLAYER_INPUT-$1000000)).w
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
                lea     (AlphabetWindowLayout+1)(pc), a0
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
                cmpi.w  #7,-$18(a6)
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
                
                cmpi.w  #7,-$18(a6)
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
                
                cmpi.w  #7,-$18(a6)
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
                
                cmpi.w  #7,-$18(a6)
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
                
                cmpi.w  #7,-$18(a6)
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
                cmpi.w  #7,d0
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
                
                lea     AlphabetEndWindowLayout(pc), a0
                movea.l -8(a6),a1
                move.w  #$2A,d7 
                jsr     (CopyBytes).w   
                lea     (byte_FF8805).l,a0
                move.w  -$14(a6),d0
                jsr     j_GetCharName
                tst.w   -$1A(a6)
                beq.s   loc_1601E
                moveq   #$A,d7
                lea     $26(a1),a1
                move.l  #$C020C020,(a1)
                move.l  #$C020C020,4(a1)
                move.w  #$C020,8(a1)
                moveq   #$FFFFFFF2,d1
                bsr.w   WriteTilesFromASCII
loc_1601E:
                
                move.w  #$FFFF,-$1A(a6)
                rts

	; End of function sub_15FD8


; =============== S U B R O U T I N E =======================================

sub_16026:
                
                lea     AlphabetEndWindowLayout(pc), a0
                movea.l -8(a6),a1
                move.w  #$2A,d7 
                jsr     (CopyBytes).w   
                lea     (byte_FF8805).l,a0
                moveq   #$A,d7
                lea     $14(a1),a1
                moveq   #$FFFFFFF2,d1
                bsr.w   WriteTilesFromASCII
                rts

	; End of function sub_16026


; =============== S U B R O U T I N E =======================================

sub_1604A:
                
                lea     NameEntryWindowLayout(pc), a0
                movea.l -$C(a6),a1
                move.w  #$366,d7
                jsr     (CopyBytes).w   
                lea     AlphabetEndWindowLayout(pc), a0
                movea.l -8(a6),a1
                move.w  #$2A,d7 
                jsr     (CopyBytes).w   
                lea     WindowBorderTiles(pc), a0
                movea.l -4(a6),a1
                move.w  #$A0,d7 
                jsr     (CopyBytes).w   
                rts

	; End of function sub_1604A

NameEntryWindowLayout:
                incbin "data/graphics/tech/windowlayouts/nameentrywindowlayout.bin"
AlphabetWindowLayout:
                incbin "data/graphics/tech/windowlayouts/alphabetwindowlayout.bin"
AlphabetEndWindowLayout:
                incbin "data/graphics/tech/windowlayouts/alphabetendwindowlayout.bin"
unk_1623A:      dc.b $3D 
                dc.b $FF
                dc.b $80 
                dc.b   0
                dc.b   0
                dc.b $FC 
                dc.b   0
                dc.b $88 
                dc.b   0
                dc.b $A0 
                dc.b $80 
                dc.b $22 
                dc.b   0
                dc.b $80 
                dc.b   1
                dc.b   2
                dc.b $50 
                dc.b $2D 
                dc.b   3
                dc.b $50 
                dc.b $3D 
                dc.b   4
                dc.b $14
                dc.b  $F
                dc.b $FE 
                dc.b $BF 
                dc.b $E0 
                dc.b   5
                dc.b   1
                dc.b   4
                dc.b   0
                dc.b $80 
                dc.b   1
                dc.b   3
                dc.b   0
                dc.b $41 
                dc.b   0
                dc.b   0
                dc.b   0
                dc.b   0
                dc.b   8
                dc.b $82 
                dc.b   0
                dc.b $20
                dc.b   2
                dc.b   8
                dc.b $61 
                dc.b   0
                dc.b   1
                dc.b $41 
                dc.b   2
                dc.b $D0 
                dc.b $35 
                dc.b   4
                dc.b   4
                dc.b $40 
                dc.b   0
                dc.b   0
                dc.b   0
                dc.b   0
                dc.b $FE 
                dc.b   0
                dc.b $80 
                dc.b   0
                dc.b   0
                dc.b   0
                dc.b $20
                dc.b   0
                dc.b   0
                dc.b   0
                dc.b   0
                dc.b   4

; =============== S U B R O U T I N E =======================================

; In: D0 = default num
;     D1 = min num
;     D2 = max num
; Out: D0 = chosen num

NumberPrompt:
                
                movem.l d1-a1,-(sp)
                link    a6,#$FFF0
                move.w  d0,-WINDOW_NUMPROMPT_STACK_OFFSET_NUM(a6)
                move.w  d1,-WINDOW_NUMPROMPT_STACK_OFFSET_MINNUM(a6)
                move.w  d2,-WINDOW_NUMPROMPT_STACK_OFFSET_MAXNUM(a6)
                move.w  #$703,d0
                move.w  #$2001,d1
                jsr     (CreateWindow).l
                move.w  d0,-WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWIDX(a6)
                move.l  a1,-WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWTILESEND(a6)
                bsr.w   sub_16376
                move.w  -WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWIDX(a6),d0
                move.w  #$1801,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSFX).l
                jsr     (WaitForWindowMovementEnd).l
loc_162C6:
                
                bsr.w   sub_16376
                move.w  -WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWIDX(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                btst    #INPUT_A_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_162E6
                moveq   #1,d3
                bsr.w   ModifyPromptNumber
loc_162E6:
                
                btst    #INPUT_A_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_162F4
                moveq   #$FFFFFFFF,d3
                bsr.w   ModifyPromptNumber
loc_162F4:
                
                btst    #INPUT_A_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16302
                moveq   #$A,d3
                bsr.w   ModifyPromptNumber
loc_16302:
                
                btst    #INPUT_A_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16310
                moveq   #$FFFFFFF6,d3
                bsr.w   ModifyPromptNumber
loc_16310:
                
                btst    #INPUT_A_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_16344
                btst    #INPUT_A_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_1634A
                btst    #INPUT_A_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_1634A
                movem.l d6-d7,-(sp)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                movem.l (sp)+,d6-d7
                jsr     (WaitForVInt).w
                bra.s   loc_162C6       ; bra.s loc_162C6
loc_16344:
                
                move.w  #$FFFF,-WINDOW_NUMPROMPT_STACK_OFFSET_NUM(a6)
loc_1634A:
                
                move.w  -WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWIDX(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSFX).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  -WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWIDX(a6),d0
                jsr     (ClearWindowAndUpdateEndPtr).l
                move.w  -WINDOW_NUMPROMPT_STACK_OFFSET_NUM(a6),d0
                unlk    a6
                movem.l (sp)+,d1-a1
                rts

	; End of function NumberPrompt


; =============== S U B R O U T I N E =======================================

sub_16376:
                
                movea.l -4(a6),a1
                move.w  #$703,d0
                bsr.w   CopyWindowTilesToRAM
                movea.l -4(a6),a1
                adda.w  #$10,a1
                move.w  -8(a6),d0
                ext.l   d0
                moveq   #$FFFFFFF2,d1
                moveq   #5,d7
                bra.w   WriteTilesFromNumber

	; End of function sub_16376


; =============== S U B R O U T I N E =======================================

; In: A6 = prompt stack

ModifyPromptNumber:
                
                move.w  -8(a6),d0
                add.w   d3,d0
                cmp.w   -$C(a6),d0
                blt.s   loc_163A8
                move.w  -$C(a6),d0
loc_163A8:
                
                cmp.w   -$A(a6),d0
                bge.s   loc_163B2
                move.w  -$A(a6),d0
loc_163B2:
                
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
                bsr.s   sub_16376
                move.w  -6(a6),d0
                move.w  #$1801,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSFX).l
                jsr     (WaitForWindowMovementEnd).l
loc_163F6:
                
                bsr.w   sub_164AC
                move.w  -6(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                btst    #INPUT_A_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16416
                moveq   #1,d3
                bsr.w   sub_164E8
loc_16416:
                
                btst    #INPUT_A_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16424
                moveq   #$FFFFFFFF,d3
                bsr.w   sub_164E8
loc_16424:
                
                btst    #INPUT_A_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16432
                moveq   #$A,d3
                bsr.w   sub_164E8
loc_16432:
                
                btst    #INPUT_A_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16440
                moveq   #$FFFFFFF6,d3
                bsr.w   sub_164E8
loc_16440:
                
                btst    #INPUT_A_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_16484
                btst    #INPUT_A_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_16464
                btst    #INPUT_A_A,((CURRENT_PLAYER_INPUT-$1000000)).w
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
                jsr     (MoveWindowWithSFX).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPtr).l
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

	; End of function DebugFlagSetter


; =============== S U B R O U T I N E =======================================

sub_164AC:
                
                movea.l -4(a6),a1
                move.w  #$703,d0
                bsr.w   CopyWindowTilesToRAM
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
                jsr     (ClearWindowAndUpdateEndPtr).l
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
                jsr     (ApplyVIntCramDMA).w
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
                btst    #INPUT_A_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_166EA
                moveq   #1,d3
                bsr.w   sub_1678A
loc_166EA:
                
                btst    #INPUT_A_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_166F8
                moveq   #$FFFFFFFF,d3
                bsr.w   sub_1678A
loc_166F8:
                
                btst    #INPUT_A_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16706
                moveq   #1,d3
                bsr.w   sub_1678A
loc_16706:
                
                btst    #INPUT_A_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_16714
                moveq   #$FFFFFFFF,d3
                bsr.w   sub_1678A
loc_16714:
                
                btst    #INPUT_A_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_16756
                btst    #INPUT_A_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   byte_1675A
                btst    #INPUT_A_A,((CURRENT_PLAYER_INPUT-$1000000)).w
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
                jsr     (ClearWindowAndUpdateEndPtr).l
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
                bsr.w   WriteTilesFromASCII
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
                jsr     j_GetCharName
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
                bsr.w   sub_100C8       
                bra.s   loc_16A10
loc_16A0C:
                
                bsr.w   WriteTilesFromASCII
loc_16A10:
                
                move.w  (word_FFB08C).l,d0
                subq.w  #1,d0
                move.w  #$10B,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSFX).l
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
                jsr     (MoveWindowWithSFX).l
                jsr     (WaitForWindowMovementEnd).l
                jsr     (ClearWindowAndUpdateEndPtr).l
                clr.w   (word_FFB08C).l
loc_16A5C:
                
                movem.l (sp)+,d0-d1/a0-a1
                rts

	; End of function sub_16A30

MemberStatsWindowLayout:
                incbin "data/graphics/tech/windowlayouts/memberstatswindowslayout.bin"
