
; ASM FILE code\specialscreens\witch\witchfunctions.asm :
; 0x7BDE..0x7E3A : Witch functions

; =============== S U B R O U T I N E =======================================


InitializeWitchSuspendVIntFunctions:
                
                move.b  #-1,((DEACTIVATE_WINDOW_HIDING-$1000000)).w
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
                bsr.w   InitializeDisplay
                bsr.w   DisableDisplayAndInterrupts
                clr.b   ((MOUTH_CONTROL_TOGGLE-$1000000)).w
                move.w  #SFX_DIALOG_BLEEP_4,((CURRENT_SPEECH_SFX-$1000000)).w
                bsr.w   BuildWitchScreen
                bsr.w   EnableDisplayAndInterrupts
                getPointer p_layout_Witch, a0
                lea     $700(a0),a0
                lea     (PLANE_B_WITCH_HEAD).l,a1
                move.w  #$707,d1
                bsr.w   Updatelayout_WitchZone
                bsr.w   QueueDmaForlayout_Witch
                bsr.w   FadeInFromBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                bsr.w   InitializeWindowProperties
                bsr.w   WaitForVInt
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_WitchBlink
                rts

    ; End of function InitializeWitchSuspendVIntFunctions


; =============== S U B R O U T I N E =======================================


BuildWitchScreen:
                
                jsr     (DisableDisplayAndInterrupts).w
                getPointer p_tiles_Witch, a0
                lea     (FF6802_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                bsr.w   LoadStackCompressedData
                movea.l (sp)+,a0
                lea     ($2000).w,a1
                move.w  #8192,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
                getPointer p_layout_Witch, a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #2048,d7
                bsr.w   CopyBytes       
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #1024,d0
                moveq   #2,d1
                bsr.w   ApplyImmediateVramDma
                getPointer p_palette_Witch, a0 ; Two palettes
                lea     (PALETTE_1_BASE).l,a1
                moveq   #CRAM_PALETTE_SIZE,d7 ; Palette 1
                bsr.w   CopyBytes       
                lea     NEXT_PALETTE(a0),a0
                lea     $60(a1),a1
                moveq   #CRAM_PALETTE_SIZE,d7 ; Palette 4
                bsr.w   CopyBytes       
                move.w  #30,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                rts

    ; End of function BuildWitchScreen


; =============== S U B R O U T I N E =======================================


Reinitializelayout_Witch:
                
                getPointer p_layout_Witch, a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #$800,d7
                bsr.w   CopyBytes       
                bra.w   QueueDmaForlayout_Witch

    ; End of function Reinitializelayout_Witch


; =============== S U B R O U T I N E =======================================


UpdateWitchHead:
                
                getPointer p_layout_Witch, a0
                lea     $700(a0),a0
                lea     (PLANE_B_WITCH_HEAD).l,a1
                move.w  #$707,d1
                bsr.w   Updatelayout_WitchZone

    ; End of function UpdateWitchHead


; =============== S U B R O U T I N E =======================================


QueueDmaForlayout_Witch:
                
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$220,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   WaitForDmaQueueProcessing
                rts

    ; End of function QueueDmaForlayout_Witch


; =============== S U B R O U T I N E =======================================

; In: d1.w = Width/Height


Updatelayout_WitchZone:
                
                movem.l d0-a1,-(sp)
                move.w  d1,d6
                move.w  d1,d7
                lsr.w   #BYTE_SHIFT_COUNT,d6
                ext.w   d7
                subq.w  #1,d6
                subq.w  #1,d7
@OuterLoop:
                
                movem.l d6/a1,-(sp)
@InnerLoop:
                
                move.w  (a0)+,(a1)+
                dbf     d6,@InnerLoop
                
                movem.l (sp)+,d6/a1
                lea     $40(a1),a1
                dbf     d7,@OuterLoop
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function Updatelayout_WitchZone


; =============== S U B R O U T I N E =======================================

var_2 = -2

VInt_WitchBlink:
                
                link    a6,#-2
                tst.b   ((BLINK_CONTROL_TOGGLE-$1000000)).w
                beq.w   loc_7E16
                clr.w   var_2(a6)
                lea     ((BLINK_COUNTER-$1000000)).w,a2
                subq.w  #1,(a2)
                cmpi.w  #3,(a2)
                bne.s   loc_7D8A
                
                getPointer p_layout_Witch, a0
                lea     $762(a0),a0
                lea     (byte_FFE21E).l,a1
                move.w  #$302,d1
                bsr.s   Updatelayout_WitchZone
                addq.w  #1,var_2(a6)
loc_7D8A:
                
                tst.w   (a2)
                bne.s   loc_7DB4
                
                getPointer p_layout_Witch, a0
                lea     $700(a0),a0
                lea     (PLANE_B_WITCH_HEAD).l,a1
                move.w  #$705,d1
                bsr.s   Updatelayout_WitchZone
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
                
                getPointer p_layout_Witch, a0
                lea     $780(a0),a0
                lea     (byte_FFE29E).l,a1
                move.w  #$301,d1
                bsr.w   Updatelayout_WitchZone
                addq.w  #1,var_2(a6)
loc_7DEA:
                
                tst.w   (a2)
                bne.s   loc_7E16
loc_7DEE:
                
                getPointer p_layout_Witch, a0
                lea     $77A(a0),a0
                lea     (byte_FFE29E).l,a1
                move.w  #$301,d1
                bsr.w   Updatelayout_WitchZone
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

