
; ASM FILE code\common\windows\windowengine.asm :
; 0x47C6..0x4C68 : Window engine

; =============== S U B R O U T I N E =======================================


InitializeWindowProperties:
                
                move.l  a0,-(sp)
                move.w  d7,-(sp)
                lea     (WINDOW_ENTRIES).l,a0
                moveq   #WINDOW_ENTRIES_LONGWORD_COUNTER,d7
@Clear_Loop:
                
                clr.l   (a0)+
                dbf     d7,@Clear_Loop
                
                move.l  #WINDOW_TILE_LAYOUTS,((WINDOW_LAYOUTS_END_POINTER-$1000000)).w
                move.w  (sp)+,d7
                movea.l (sp)+,a0
                clr.b   ((WINDOW_IS_PRESENT-$1000000)).w
                compareToSavedByte #MAP_CURRENT, CURRENT_MAP
                beq.s   @Continue
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
@Continue:
                
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                clr.w   ((DIALOGUE_WINDOW_INDEX-$1000000)).w
                clr.w   ((TIMER_WINDOW_INDEX-$1000000)).w
                rts

    ; End of function InitializeWindowProperties


; =============== S U B R O U T I N E =======================================

; In: d0.w = width/height, d1.w = X/Y position
; Out: a1 = window layout end address, d0.w = window slot (-1 if no free slot available)


CreateWindow:
                
                move.l  a0,-(sp)
                movem.w d6-d7,-(sp)
                lea     (WINDOW_ENTRIES).l,a0
                clr.w   d6
                moveq   #WINDOW_ENTRIES_COUNTER,d7
FindFreeWindowSlot_Loop:
                
                tst.w   (a0)            ; get free window slot
                beq.s   @Found
                addq.w  #1,d6
                adda.w  #WINDOW_ENTRY_SIZE,a0
                dbf     d7,FindFreeWindowSlot_Loop
                
                moveq   #-1,d0          ; no window slot available
                bra.w   @Done
@Found:
                
                movea.l ((WINDOW_LAYOUTS_END_POINTER-$1000000)).w,a1
                cmpa.l  #WINDOW_TILE_LAYOUTS,a1
                bne.s   @Continue       
                bsr.w   CopyPlaneALayoutForWindows
@Continue:
                
                move.l  a1,(a0)+        ; window layout end
                move.w  d0,(a0)+        ; width height
                move.w  d1,(a0)+        ; X Y pos 3 times
                move.w  d1,(a0)+
                move.w  d1,(a0)+
                move.w  #$101,(a0)+     ; another X Y pos
                clr.w   (a0)+
                move.w  d0,d7
                lsr.w   #BYTE_SHIFT_COUNT,d7 ; get width
                andi.w  #BYTE_MASK,d0
                mulu.w  d7,d0
                add.w   d0,d0
                adda.w  d0,a1
                move.l  a1,((WINDOW_LAYOUTS_END_POINTER-$1000000)).w
                move.w  d6,d0
                movea.l -WINDOW_ENTRY_SIZE(a0),a1
@Done:
                
                movem.w (sp)+,d6-d7
                movea.l (sp)+,a0
                rts

    ; End of function CreateWindow


; =============== S U B R O U T I N E =======================================

; In: d0.w = Windows index, d1.w = Value ($8080->X/Y)
; Out: a0 = Window properties


SetWindowDestination:
                
                move.l  a0,-(sp)
                movem.w d0-d1,-(sp)
                bsr.w   GetWindowEntryAddress
                tst.l   (a0)
                beq.w   loc_4898
                move.w  WINDOWDEF_OFFSET_X(a0),d0
                cmp.w   WINDOWDEF_OFFSET_ANIM_DEST_X(a0),d0
                bne.w   loc_4898
                cmpi.w  #$8080,d1
                bne.s   loc_488A
                move.w  d0,d1
loc_488A:
                
                move.w  d1,WINDOWDEF_OFFSET_ANIM_ORIG_X(a0)
                move.w  d1,WINDOWDEF_OFFSET_ANIM_DEST_X(a0)
                move.w  #256,WINDOWDEF_OFFSET_ANIM_LENGTH(a0)
loc_4898:
                
                movem.w (sp)+,d0-d1
                movea.l (sp)+,a0
                rts

    ; End of function SetWindowDestination


; =============== S U B R O U T I N E =======================================


FixWindowsPositions:
                
                movem.w d0-d1/d7,-(sp)
                bsr.w   CopyPlaneALayoutForWindows
                clr.w   d0
                move.w  #$8080,d1
                moveq   #7,d7
@Loop:
                
                bsr.s   SetWindowDestination
                addq.w  #1,d0
                dbf     d7,@Loop
                
                movem.w (sp)+,d0-d1/d7
                rts

    ; End of function FixWindowsPositions


; =============== S U B R O U T I N E =======================================

; unused


sub_48BE:
            if (VANILLA_BUILD=1)
                move.l  a0,-(sp)
                move.w  d0,-(sp)
                bsr.w   GetWindowEntryAddress
                move.w  #1,$E(a0)
                move.w  (sp)+,d0
                movea.l (sp)+,a0
                rts
            endif

    ; End of function sub_48BE


; =============== S U B R O U T I N E =======================================


CopyPlaneALayoutForWindows:
                
                movem.l a0-a1,-(sp)
                move.w  d7,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     (PLANE_A_MAP_AND_WINDOWS_LAYOUT).l,a1
                move.w  #$800,d7
                bsr.w   CopyBytes       
                move.w  (sp)+,d7
                movem.l (sp)+,a0-a1
                rts

    ; End of function CopyPlaneALayoutForWindows


; =============== S U B R O U T I N E =======================================

; In: d0.w = window slot
;     d1.w = destination
;     d2.b = animation length


MoveWindowWithSfx:
                
                 
                sndCom  SFX_MENU_SWITCH

    ; End of function MoveWindowWithSfx


; =============== S U B R O U T I N E =======================================

; In: d0.w = window slot
;     d1.w = destination
;     d2.b = animation length


MoveWindow:
                
                tst.b   ((SPECIAL_TURBO_TOGGLE-$1000000)).w
                beq.s   loc_4900
                moveq   #1,d2
loc_4900:
                
                move.l  a0,-(sp)
                movem.w d0-d1,-(sp)
                bsr.w   GetWindowEntryAddress
                cmpi.w  #$8080,d1
                bne.s   loc_4914
                move.w  WINDOWDEF_OFFSET_X(a0),d1
loc_4914:
                
                move.w  WINDOWDEF_OFFSET_X(a0),WINDOWDEF_OFFSET_ANIM_ORIG_X(a0)
                move.w  d1,WINDOWDEF_OFFSET_ANIM_DEST_X(a0)
                move.b  d2,WINDOWDEF_OFFSET_ANIM_LENGTH(a0)
                clr.b   WINDOWDEF_OFFSET_ANIM_COUNTER(a0)
                movem.w (sp)+,d0-d1
                movea.l (sp)+,a0
                rts

    ; End of function MoveWindow


; =============== S U B R O U T I N E =======================================


DeleteWindow:
                
                movem.l d0-d4/a0-a1,-(sp)
                bsr.w   GetWindowEntryAddress
                clr.l   (a0)
                clr.l   d1
                lea     (WINDOW_ENTRIES).l,a0
                moveq   #WINDOW_ENTRIES_COUNTER,d0
                clr.w   d3
                clr.w   d4
@ClearWindow_Loop:
                
                move.l  (a0),d2
                cmp.l   d1,d2
                bls.s   @Next
                move.l  d2,d1
                move.b  WINDOWDEF_OFFSET_WIDTH(a0),d3
                move.b  WINDOWDEF_OFFSET_HEIGHT(a0),d4
@Next:
                
                lea     NEXT_WINDOWDEF(a0),a0
                dbf     d0,@ClearWindow_Loop
                
                tst.l   d1
                bne.s   @Continue
                move.l  #WINDOW_TILE_LAYOUTS,d1
                bra.s   @UpdateEndPointer
@Continue:
                
                mulu.w  d4,d3
                add.w   d3,d3
                ext.l   d3
                add.l   d3,d1
@UpdateEndPointer:
                
                move.l  d1,((WINDOW_LAYOUTS_END_POINTER-$1000000)).w
                movem.l (sp)+,d0-d4/a0-a1
                rts

    ; End of function DeleteWindow


; =============== S U B R O U T I N E =======================================


WaitForWindowMovementEnd:
                
                bsr.w   WaitForVInt
                tst.b   ((MOVING_WINDOWS_BITFIELD-$1000000)).w
                bne.s   WaitForWindowMovementEnd
                rts

    ; End of function WaitForWindowMovementEnd


; =============== S U B R O U T I N E =======================================


VInt_UpdateWindows:
                
                module
                cmpi.l  #WINDOW_TILE_LAYOUTS,((WINDOW_LAYOUTS_END_POINTER-$1000000)).w
                bne.s   loc_4994
                rts
loc_4994:
                
                clr.b   ((MOVING_WINDOWS_BITFIELD-$1000000)).w
                moveq   #WINDOW_ENTRIES_COUNTER,d7
                lea     (WINDOW_ENTRIES).l,a2
loc_49A0:
                
                tst.l   (a2)
                beq.w   @NextWindow
                move.b  WINDOWDEF_OFFSET_ANIM_LENGTH(a2),d0
                cmp.b   WINDOWDEF_OFFSET_ANIM_COUNTER(a2),d0
                beq.w   @NextWindow
                moveq   #WINDOW_ENTRIES_COUNTER,d0
                sub.w   d7,d0
                bset    d0,((MOVING_WINDOWS_BITFIELD-$1000000)).w
                movea.l (a2),a0
                move.w  WINDOWDEF_OFFSET_WIDTH(a2),d0
                move.w  WINDOWDEF_OFFSET_X(a2),d1
                bsr.w   sub_4B5C
@NextWindow:
                
                lea     NEXT_WINDOWDEF(a2),a2
                dbf     d7,loc_49A0
                
                moveq   #WINDOW_ENTRIES_COUNTER,d7
                lea     (WINDOW_ENTRIES).l,a2
loc_49D8:
                
                tst.l   (a2)
                beq.w   loc_4A72
                move.b  WINDOWDEF_OFFSET_ANIM_LENGTH(a2),d0
                cmp.b   WINDOWDEF_OFFSET_ANIM_COUNTER(a2),d0
                beq.w   loc_4A40
                movea.l (a2),a0
                move.w  WINDOWDEF_OFFSET_WIDTH(a2),d0
                move.w  WINDOWDEF_OFFSET_X(a2),d1
                addq.b  #1,WINDOWDEF_OFFSET_ANIM_COUNTER(a2)
                clr.w   d6
                move.b  WINDOWDEF_OFFSET_ANIM_LENGTH(a2),d6
                clr.w   d5
                move.b  WINDOWDEF_OFFSET_ANIM_COUNTER(a2),d5
                move.w  WINDOWDEF_OFFSET_ANIM_ORIG_X(a2),d3
                move.w  d3,d4
                asr.w   #BYTE_SHIFT_COUNT,d3
                ext.w   d4
                move.w  WINDOWDEF_OFFSET_ANIM_DEST_X(a2),d1
                move.w  d1,d2
                asr.w   #BYTE_SHIFT_COUNT,d1
                ext.w   d2
                sub.w   d3,d1
                muls.w  d5,d1
                divs.w  d6,d1
                add.w   d3,d1
                sub.w   d4,d2
                muls.w  d5,d2
                divs.w  d6,d2
                add.w   d4,d2
                lsl.w   #BYTE_SHIFT_COUNT,d1
                andi.w  #BYTE_MASK,d2
                or.w    d2,d1
                move.w  d1,WINDOWDEF_OFFSET_X(a2)
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   loc_4A40
                bsr.w   sub_4AC8
                bra.s   loc_4A72
loc_4A40:
                
                tst.b   $E(a2)
                beq.s   loc_4A5A
                clr.b   $E(a2)
                movea.l (a2),a0
                move.w  WINDOWDEF_OFFSET_WIDTH(a2),d0
                move.w  WINDOWDEF_OFFSET_X(a2),d1
                bsr.w   sub_4AC8
                bra.s   loc_4A72
loc_4A5A:
                
                tst.b   $F(a2)
                beq.s   loc_4A72
                clr.b   $F(a2)
                movea.l (a2),a0
                move.w  WINDOWDEF_OFFSET_WIDTH(a2),d0
                move.w  WINDOWDEF_OFFSET_X(a2),d1
                bsr.w   sub_4B5C
loc_4A72:
                
                lea     NEXT_WINDOWDEF(a2),a2
                dbf     d7,loc_49D8
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   loc_4A92
                tst.b   ((FIX_WINDOWS_POSITIONS_TOGGLE-$1000000)).w
                bne.s   loc_4A90
                bsr.w   CopyPlaneALayoutForWindows
                move.w  #-1,((FIX_WINDOWS_POSITIONS_TOGGLE-$1000000)).w
loc_4A90:
                
                bra.s   loc_4AA2
loc_4A92:
                
                tst.b   ((FIX_WINDOWS_POSITIONS_TOGGLE-$1000000)).w
                beq.s   loc_4AA2
                bsr.w   FixWindowsPositions
                move.w  #$FF,((FIX_WINDOWS_POSITIONS_TOGGLE-$1000000)).w
loc_4AA2:
                
                tst.b   ((UPDATE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   @Return
                
                ; Update VDP Plane A
                lea     (PLANE_A_MAP_AND_WINDOWS_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                clr.b   ((UPDATE_WINDOWS_TOGGLE-$1000000)).w
@Return:
                
                rts

    ; End of function VInt_UpdateWindows

                modend

; =============== S U B R O U T I N E =======================================


sub_4AC8:
                
                movem.l a0-a1,-(sp)
                movem.w d0-d3/d6-d7,-(sp)
                lea     (PLANE_A_MAP_AND_WINDOWS_LAYOUT).l,a1
                bsr.w   sub_4BEA
                move.w  d0,d1
                ext.w   d0
                subq.w  #1,d0
                bmi.w   loc_4B52
                asr.w   #BYTE_SHIFT_COUNT,d1
                subq.w  #1,d1
                bmi.w   loc_4B52
loc_4AEC:
                
                tst.w   d3
                bpl.s   loc_4AFA
                adda.w  d1,a0
                adda.w  d1,a0
                addq.w  #2,a0
                bra.w   loc_4B38
loc_4AFA:
                
                cmpi.w  #$1C,d3
                bge.w   loc_4B46
                movem.w d1-d2/d6,-(sp)
loc_4B06:
                
                tst.w   d2
                bmi.w   loc_4B1C
                cmpi.w  #$20,d2 
                bge.w   loc_4B1C
                move.w  (a0),d5
                beq.s   loc_4B1C
                move.w  d5,(a1,d6.w)
loc_4B1C:
                
                addq.w  #2,a0
                addq.w  #1,d2
                move.w  d6,d7
                addq.w  #2,d6
                eor.w   d6,d7
                btst    #6,d7
                beq.s   loc_4B30
                subi.w  #$40,d6 
loc_4B30:
                
                dbf     d1,loc_4B06
                
                movem.w (sp)+,d1-d2/d6
loc_4B38:
                
                addq.w  #1,d3
                addi.w  #$40,d6 
                bclr    #$B,d6
                dbf     d0,loc_4AEC
loc_4B46:
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   loc_4B52
                move.b  #-1,((UPDATE_WINDOWS_TOGGLE-$1000000)).w
loc_4B52:
                
                movem.w (sp)+,d0-d3/d6-d7
                movem.l (sp)+,a0-a1
                rts

    ; End of function sub_4AC8


; =============== S U B R O U T I N E =======================================


sub_4B5C:
                
                movem.l a0-a1,-(sp)
                movem.w d0-d1/d6-d7,-(sp)
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     (PLANE_A_MAP_AND_WINDOWS_LAYOUT).l,a1
                bsr.w   sub_4BEA
                move.w  d0,d1
                ext.w   d0
                subq.w  #1,d0
                bmi.w   loc_4BE0
                asr.w   #BYTE_SHIFT_COUNT,d1
                subq.w  #1,d1
                bmi.w   loc_4BE0
loc_4B86:
                
                tst.w   d3
                bmi.w   loc_4BC6
                cmpi.w  #$1C,d3
                bge.w   loc_4BD4
                movem.w d1-d2/d6,-(sp)
loc_4B98:
                
                tst.w   d2
                bmi.w   loc_4BAC
                cmpi.w  #$20,d2 
                bge.w   loc_4BAC
                move.w  (a0,d6.w),(a1,d6.w)
loc_4BAC:
                
                addq.w  #1,d2
                move.w  d6,d7
                addq.w  #2,d6
                eor.w   d6,d7
                btst    #6,d7
                beq.s   loc_4BBE
                subi.w  #$40,d6 
loc_4BBE:
                
                dbf     d1,loc_4B98
                
                movem.w (sp)+,d1-d2/d6
loc_4BC6:
                
                addq.w  #1,d3
                addi.w  #$40,d6 
                bclr    #$B,d6
                dbf     d0,loc_4B86
loc_4BD4:
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   loc_4BE0
                move.b  #-1,((UPDATE_WINDOWS_TOGGLE-$1000000)).w
loc_4BE0:
                
                movem.w (sp)+,d0-d1/d6-d7
                movem.l (sp)+,a0-a1
                rts

    ; End of function sub_4B5C


; =============== S U B R O U T I N E =======================================


sub_4BEA:
                
                move.w  d1,d6
                asr.w   #BYTE_SHIFT_COUNT,d1
                move.w  d1,d2
                andi.w  #$1F,d1
                ext.w   d6
                move.w  d6,d3
                asl.w   #5,d6
                add.w   d1,d6
                add.w   d6,d6
                cmpi.w  #VDPTILE_SCREEN_BLACK_BAR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(SPRITE_00_VDPTILE).l
                bne.s   @Return
                
                move.w  (VERTICAL_SCROLL_DATA).l,d1
                addq.w  #4,d1
                lsr.w   #3,d1
                lsl.w   #6,d1
                add.w   d1,d6
                andi.w  #$7FF,d6
                move.w  (HORIZONTAL_SCROLL_DATA).l,d1
                addq.w  #4,d1
                lsr.w   #3,d1
                add.w   d1,d1
                move.w  d6,d7
                sub.w   d1,d6
                eor.w   d6,d7
                btst    #6,d7
                beq.s   @Return
                
                addi.w  #$40,d6
@Return:
                
                rts

    ; End of function sub_4BEA


; =============== S U B R O U T I N E =======================================

; Get entry address for window d0.w -> a0


GetWindowEntryAddress:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                lea     (WINDOW_ENTRIES).l,a0
                adda.w  d0,a0
                rts

    ; End of function GetWindowEntryAddress


; =============== S U B R O U T I N E =======================================

; Get pointer to tile at coordinates d1.w in layout for window d0.w -> a1


GetWindowTileAddress:
                
                move.l  a0,-(sp)
                movem.w d0-d2,-(sp)
                bsr.s   GetWindowEntryAddress
                movea.l (a0)+,a1
                clr.w   d0
                
                ; Unpack coordinates
                move.b  (a0),d0
                clr.w   d2
                move.b  d1,d2           ; d2.w = y
                lsr.w   #BYTE_SHIFT_COUNT,d1 ; d1.w = x
                mulu.w  d2,d0
                add.w   d1,d0
                add.w   d0,d0
                adda.w  d0,a1           ; convert position to address
                movem.w (sp)+,d0-d2
                movea.l (sp)+,a0
                rts

    ; End of function GetWindowTileAddress

