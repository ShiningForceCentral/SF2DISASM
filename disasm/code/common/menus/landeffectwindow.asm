
; ASM FILE code\common\menus\landeffectwindow.asm :
; 0x15772..0x1586E : Menu engine, part 7 : Land effect window functions

; =============== S U B R O U T I N E =======================================


OpenLandEffectWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                move.w  #WINDOW_LANDEFFECT_DEST,d1
                jsr     (CreateWindow).w
                addq.w  #1,d0
                move.w  d0,((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                bsr.w   BuildLandEffectWindow
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$201,d1
                move.w  #4,d2
                cmpi.w  #WINDOW_MINISTATUS_MAX_WIDTH,((MINISTATUS_WINDOW_WIDTH-$1000000)).w
                blt.s   @Continue
                move.w  #$101,d1
@Continue:
                
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function OpenLandEffectWindow


; =============== S U B R O U T I N E =======================================


CloseLandEffectWindow:
                
                tst.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                beq.w   @Return
                movem.l d0-a2,-(sp)
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #WINDOW_LANDEFFECT_DEST,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (DeleteWindow).w
                clr.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a2
@Return:
                
                rts

    ; End of function CloseLandEffectWindow


; =============== S U B R O U T I N E =======================================


HideLandEffectWindow:
                
                tst.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                beq.w   @Return
                movem.l d0-a2,-(sp)
                bsr.w   BuildLandEffectWindow
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   @Done
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
@Done:
                
                movem.l (sp)+,d0-a2
@Return:
                
                rts

    ; End of function HideLandEffectWindow


; =============== S U B R O U T I N E =======================================


BuildLandEffectWindow:
                
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,d3
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                bsr.w   alt_WriteWindowTiles
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetLandEffectSetting
                move.w  d1,d0
                mulu.w  #15,d0
                moveq   #-16,d1
                moveq   #2,d7
                movea.l d3,a1
                adda.w  #WINDOW_LANDEFFECT_TEXT_VALUE_OFFSET,a1
                bsr.w   WriteTilesFromNumber
                move.b  #VDPTILE_PERCENT_SIGN,1(a1)
                moveq   #-16,d1
                moveq   #WINDOW_LANDEFFECT_TEXT_HEADER_LENGTH,d7
                movea.l d3,a1
                adda.w  #WINDOW_LANDEFFECT_TEXT_HEADER_OFFSET,a1
                lea     aLandEffect(pc), a0
                nop
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function BuildLandEffectWindow

aLandEffect:    dc.b 'LAND',$B,'EFFECT',0
