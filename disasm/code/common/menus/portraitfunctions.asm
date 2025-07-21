
; ASM FILE code\common\menus\portraitfunctions.asm :
; 0x154F6..0x156A8 : Portrait functions

; =============== S U B R O U T I N E =======================================

; Close princess Elis's eyes when unconscious


ClosePortraitEyes:
                
                clr.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                jsr     (WaitForVInt).w
                move.w  d0,-(sp)
                btst    #0,d0
                bne.s   loc_1550A
                clr.w   d1
                bra.s   loc_1550C
loc_1550A:
                
                moveq   #1,d1
loc_1550C:
                
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                move.w  (sp)+,d0
                btst    #1,d0
                bne.s   loc_15524
                clr.w   d1
                bra.s   loc_15526
loc_15524:
                
                moveq   #1,d1
loc_15526:
                
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                rts

    ; End of function ClosePortraitEyes


; =============== S U B R O U T I N E =======================================


VInt_PerformPortraitBlinking:
                
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                beq.w   @Return
                tst.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                beq.w   @Return
                
                lea     ((BLINK_COUNTER-$1000000)).w,a0
                subq.w  #1,(a0)
                cmpi.w  #3,(a0)
                bne.s   @loc_1
                
                moveq   #1,d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
@loc_1:
                
                tst.w   (a0)
                bne.s   @loc_2
                clr.w   d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #120,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #30,d7
                move.w  d7,(a0)
@loc_2:
                
                lea     ((word_FFB07C-$1000000)).w,a0
                tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bne.s   @loc_3
                cmpi.w  #5,(a0)
                ble.s   @loc_5
                bra.s   @Return
@loc_3:
                
                subq.w  #1,(a0)
                cmpi.w  #5,(a0)
                bne.s   @loc_4
                moveq   #1,d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
@loc_4:
                
                tst.w   (a0)
                bne.s   @Return
@loc_5:
                
                clr.w   d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILES_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$A,d7
                move.w  d7,(a0)
@Return:
                
                rts

    ; End of function VInt_PerformPortraitBlinking


; =============== S U B R O U T I N E =======================================

; In: d1.w = 0 to use original tiles, 1 to use alternate tiles
;     d7.w = tiles number


UpdatePortrait:
                
                bne.s   @Continue       ; skip if tiles number = 0
                rts
@Continue:
                
                move.w  d1,-(sp)
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$101,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                subq.w  #1,d7
@Loop:
                
                move.w  d7,-(sp)
                clr.w   d0
                clr.w   d5
                clr.w   d6
                move.b  (a2)+,d5
                move.b  (a2)+,d6
                lsl.w   #3,d6
                add.w   d5,d6
                move.b  (a2)+,d5
                move.b  (a2)+,d0
                lsl.w   #3,d0
                add.w   d5,d0
                
                ; Use alternate tiles?
                tst.w   d1
                bne.s   @UseAlternateTiles
                move.w  d6,d0
@UseAlternateTiles:
                
                or.w    ((PORTRAIT_VDPTILES-$1000000)).w,d0
                tst.b   ((PORTRAIT_IS_MIRRORED_TOGGLE-$1000000)).w
                beq.s   @NotMirrored
                
                ; Mirror portrait
                eori.w  #7,d6
                subq.l  #2,d6
                ori.w   #$800,d0
@NotMirrored:
                
                add.w   d6,d6
                move.w  d0,(a1,d6.w)
                move.w  (sp)+,d7
                dbf     d7,@Loop
                
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                rts

    ; End of function UpdatePortrait


; =============== S U B R O U T I N E =======================================

; In: d0.w = portrait index


LoadPortrait:
                
                movem.l d0-a3,-(sp)
                getPointer p_pt_Portraits, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,d0
                move.w  d0,((BLINK_TILES_NUMBER-$1000000)).w
                beq.s   loc_1564E
                subq.w  #1,d0
                lea     ((BLINK_DATA-$1000000)).w,a1
loc_15648:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_15648
loc_1564E:
                
                move.w  (a0)+,d0
                move.w  d0,((MOUTH_TILES_NUMBER-$1000000)).w
                beq.s   loc_15662
                subq.w  #1,d0
                lea     ((MOUTH_DATA-$1000000)).w,a1
loc_1565C:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_1565C
loc_15662:
                
                lea     (PALETTE_2_CURRENT).l,a1
                lea     (PALLETE_2_BASE).l,a2
                lea     ((PALETTE_2_COPY-$1000000)).w,a3
                moveq   #7,d7
loc_15674:
                
                move.l  (a0),(a1)+
                move.l  (a0),(a2)+
                move.l  (a0)+,(a3)+
                dbf     d7,loc_15674
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                addq.b  #6,((INPUT_REPEAT_DELAYER-$1000000)).w ; Allow hold input to be applied directly. ... why ?
                movea.l a1,a0
                lea     ($F800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (ApplyVIntCramDma).w
                movem.l (sp)+,d0-a3
                rts

    ; End of function LoadPortrait

