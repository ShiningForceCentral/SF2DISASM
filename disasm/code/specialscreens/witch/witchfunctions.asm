
; ASM FILE code\specialscreens\witch\witchfunctions.asm :
; 0x7BDE..0x7E3A : Witch functions

; =============== S U B R O U T I N E =======================================


InitWitchSuspendVIntFunctions:
                
                move.b  #$FF,((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (WaitForDmaQueueProcessing).w
                bsr.w   DisableDisplayAndInterrupts
                bsr.w   ClearVsramAndSprites
                bsr.w   EnableDisplayAndInterrupts
                bsr.w   InitDisplay
                bsr.w   DisableDisplayAndInterrupts
                clr.b   ((byte_FFB198-$1000000)).w
                move.w  #$48,((SPEECH_SFX-$1000000)).w 
                bsr.w   DisplayWitchScreen
                bsr.w   EnableDisplayAndInterrupts
                movea.l (p_WitchLayout).l,a0
                lea     $700(a0),a0
                lea     (PLANE_B_WITCH_HEAD).l,a1
                move.w  #$707,d1
                bsr.w   UpdateWitchLayoutZone
                bsr.w   QueueDmaForWitchLayout
                bsr.w   FadeInFromBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                bsr.w   InitWindowProperties
                bsr.w   WaitForVInt
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_WitchBlink
                rts

    ; End of function InitWitchSuspendVIntFunctions


; =============== S U B R O U T I N E =======================================


DisplayWitchScreen:
                
                jsr     (DisableDisplayAndInterrupts).w
                movea.l (p_WitchTiles).l,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                bsr.w   LoadCompressedData
                movea.l (sp)+,a0
                lea     ($2000).w,a1
                move.w  #$2000,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
                movea.l (p_WitchLayout).l,a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #$800,d7
                bsr.w   CopyBytes       
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
                movea.l (p_plt_Witch).l,a0 ; Two palettes
                lea     (PALETTE_1_BASE).l,a1
                moveq   #$20,d7 ; Palette 1
                bsr.w   CopyBytes       
                lea     $20(a0),a0
                lea     $60(a1),a1
                moveq   #$20,d7 ; Palette 4
                bsr.w   CopyBytes       
                move.w  #$1E,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                rts

    ; End of function DisplayWitchScreen


; =============== S U B R O U T I N E =======================================


sub_7CDC:
                
                movea.l (p_WitchLayout).l,a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #$800,d7
                bsr.w   CopyBytes       
                bra.w   QueueDmaForWitchLayout

    ; End of function sub_7CDC


; =============== S U B R O U T I N E =======================================


UpdateWitchHead:
                
                movea.l (p_WitchLayout).l,a0
                lea     $700(a0),a0
                lea     (PLANE_B_WITCH_HEAD).l,a1
                move.w  #$707,d1
                bsr.w   UpdateWitchLayoutZone

    ; End of function UpdateWitchHead


; =============== S U B R O U T I N E =======================================


QueueDmaForWitchLayout:
                
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$220,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   WaitForDmaQueueProcessing
                rts

    ; End of function QueueDmaForWitchLayout


; =============== S U B R O U T I N E =======================================

; D1=Width/Height


UpdateWitchLayoutZone:
                
                movem.l d0-a1,-(sp)
                move.w  d1,d6
                move.w  d1,d7
                lsr.w   #8,d6
                ext.w   d7
                subq.w  #1,d6
                subq.w  #1,d7
loc_7D38:
                
                movem.l d6/a1,-(sp)
loc_7D3C:
                
                move.w  (a0)+,(a1)+
                dbf     d6,loc_7D3C
                movem.l (sp)+,d6/a1
                lea     $40(a1),a1
                dbf     d7,loc_7D38
                movem.l (sp)+,d0-a1
                rts

    ; End of function UpdateWitchLayoutZone


; =============== S U B R O U T I N E =======================================

var_2 = -2

VInt_WitchBlink:
                
                link    a6,#-2
                tst.b   ((byte_FFB082-$1000000)).w
                beq.w   loc_7E16
                clr.w   var_2(a6)
                lea     ((BLINK_COUNTER-$1000000)).w,a2
                subq.w  #1,(a2)
                cmpi.w  #3,(a2)
                bne.s   loc_7D8A
                movea.l (p_WitchLayout).l,a0
                lea     $762(a0),a0
                lea     (byte_FFE21E).l,a1
                move.w  #$302,d1
                bsr.s   UpdateWitchLayoutZone
                addq.w  #1,var_2(a6)
loc_7D8A:
                
                tst.w   (a2)
                bne.s   loc_7DB4
                movea.l (p_WitchLayout).l,a0
                lea     $700(a0),a0
                lea     (PLANE_B_WITCH_HEAD).l,a1
                move.w  #$705,d1
                bsr.s   UpdateWitchLayoutZone
                addq.w  #1,var_2(a6)
                moveq   #$78,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$1E,d7         ; minimum frames between two blinks
                move.w  d7,(a2)
loc_7DB4:
                
                lea     ((word_FFB07C-$1000000)).w,a2
                tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bne.s   loc_7DC6
                cmpi.w  #5,(a2)
                ble.s   loc_7DEE
                bra.s   loc_7E16
loc_7DC6:
                
                subq.w  #1,(a2)
                cmpi.w  #5,(a2)
                bne.s   loc_7DEA
                movea.l (p_WitchLayout).l,a0
                lea     $780(a0),a0
                lea     (byte_FFE29E).l,a1
                move.w  #$301,d1
                bsr.w   UpdateWitchLayoutZone
                addq.w  #1,var_2(a6)
loc_7DEA:
                
                tst.w   (a2)
                bne.s   loc_7E16
loc_7DEE:
                
                movea.l (p_WitchLayout).l,a0
                lea     $77A(a0),a0
                lea     (byte_FFE29E).l,a1
                move.w  #$301,d1
                bsr.w   UpdateWitchLayoutZone
                addq.w  #1,var_2(a6)
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$A,d7
                move.w  d7,(a2)
loc_7E16:
                
                tst.w   var_2(a6)
                beq.s   loc_7E36
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$200,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
loc_7E36:
                
                unlk    a6
                rts

    ; End of function VInt_WitchBlink

