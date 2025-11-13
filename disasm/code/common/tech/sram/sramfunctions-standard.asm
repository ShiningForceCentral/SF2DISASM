
; ASM FILE code\common\tech\sram\sramfunctions-standard.asm :
; Standard reimplementation of SRAM functions.

                module
                
SramCheckString:dc.b 'SF2DISASMisGROOVY'
                align

; =============== S U B R O U T I N E =======================================

; Out: d0.w, d1.w = -1 if slot 1 or slot 2 failed checksum, respectively.


CheckSram:      movem.l d7-a1,-(sp)
                lea     SramCheckString(pc), a0
                lea     (SRAM_STRING).l,a1
                moveq   #SRAM_STRING_CHECK_COUNTER,d7
                
@CheckSramString_Loop:
                cmpm.b  (a0)+,(a1)+
                lea     1(a1),a1
                dbne    d7,@CheckSramString_Loop
                
                bne.s   @InitSram
                
                ; is slot 2 occupied ?
                btst    #1,(SAVE_FLAGS).l
                bne.s   @ChecksumSlot2
                clr.w   d1
                bra.s   @Slot1
                
@ChecksumSlot2: lea     (SAVE2_DATA).l,a0
                bsr.s   CalculateSaveSlotChecksum
                cmp.b   (SAVE2_CHECKSUM).l,d0
                bne.s   @ClearSlot2
                moveq   #1,d1
                bra.s   @Slot1
                
@ClearSlot2:    moveq   #-1,d1
                bclr    #1,(SAVE_FLAGS).l
                
@Slot1:         btst    #0,(SAVE_FLAGS).l
                bne.s   @ChecksumSlot1
                clr.w   d0
                bra.s   @Done
                
@ChecksumSlot1: lea     (SAVE1_DATA).l,a0
                bsr.s   CalculateSaveSlotChecksum
                cmp.b   (SAVE1_CHECKSUM).l,d0
                bne.s   @ClearSlot1
                moveq   #1,d0
                bra.s   @Done
                
@ClearSlot1:    moveq   #-1,d0
                bclr    #0,(SAVE_FLAGS).l
                bra.s   @Done
                
@InitSram:      lea     (SRAM_START).l,a0
                move.w  #SRAM_LONGS_COUNTER,d7
                moveq   #0,d0
                
@ClearSram_Loop:
                movep.l d0,0(a0)
                addq.w  #8,a0
                dbf     d7,@ClearSram_Loop
                
                lea     SramCheckString(pc), a0
                lea     (SRAM_STRING).l,a1
                moveq   #SRAM_STRING_WRITE_COUNTER,d7
@Loop:          setSavedByteWithPostIncrement (a0)+, a1
                dbf     d7,@Loop
                
                clr.b   (SAVE_FLAGS).l
            if (INITIAL_GAME_COMPLETED=1)
                bset    #7,(SAVE_FLAGS).l
            endif
                clr.w   d0
                clr.w   d1
@Done:          movem.l (sp)+,d7-a1
                rts

    ; End of function CheckSram

                modend

; =============== S U B R O U T I N E =======================================


CalculateSaveSlotChecksum:
                
                clr.w   d0
                move.w  #SAVE_SLOT_BYTES_COUNTER,d7
                
@Loop:          addFromSavedByteWithPostIncrement a0, d0
                dbf     d7,@Loop
                
                rts

    ; End of function CalculateSaveSlotChecksum


; =============== S U B R O U T I N E =======================================

; In: a0 = source address, a1 = destination address
; Out: d0.b = checksum


CopySavedData:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                clr.w   d0
                move.w  #SAVE_SLOT_BYTES_COUNTER,d7
                
@Loop:          move.b  (a0),(a1)
                add.b   (a0),d0
                addq.w  #2,a0
                addq.w  #2,a1
                dbf     d7,@Loop
                
                rts
            endif

    ; End of function CopySavedData


; =============== S U B R O U T I N E =======================================


CopySavedDataFromSram:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=0)
                clr.w   d0
                move.w  #SAVE_SLOT_BYTES_COUNTER,d7
                
@Loop:          move.b  (a0),(a1)+
                add.b   (a0),d0
                addq.w  #2,a0
                dbf    d7,@Loop
                
                rts
            endif

    ; End of function CopySavedDataFromSram


; =============== S U B R O U T I N E =======================================


CopySavedDataToSram:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=0)
                clr.w   d0
                move.w  #SAVE_SLOT_BYTES_COUNTER,d7
                
@Loop:          move.b  (a0),(a1)
                add.b   (a0)+,d0
                addq.w  #2,a1
                dbf     d7,@Loop
                
                rts
            endif

    ; End of function CopySavedDataToSram


; =============== S U B R O U T I N E =======================================


LoadGame:       movem.l d0-d1/d7-a2,-(sp)
                loadSavedDataAddress COMBATANT_DATA, a1
                tst.b   d0
                bne.s   @Slot2
                
                lea     (SAVE1_DATA).l,a0
                moveq   #0,d1
                bra.s   @Continue
                
@Slot2:         lea     (SAVE2_DATA).l,a0
                moveq   #1,d1
@Continue:
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   CopySavedData
            else
                bsr.s   CopySavedDataFromSram
            endif
                movem.l (sp)+,d0-d1/d7-a2
                rts

    ; End of function LoadGame


; =============== S U B R O U T I N E =======================================


SaveGame:       movem.l d0-d1/d7-a2,-(sp)
                loadSavedDataAddress COMBATANT_DATA, a0
                tst.b   d0
                bne.s   @Slot2
                lea     (SAVE1_DATA).l,a1
                lea     (SAVE1_CHECKSUM).l,a2
                moveq   #0,d1
                bra.s   @Continue
@Slot2:         lea     (SAVE2_DATA).l,a1
                lea     (SAVE2_CHECKSUM).l,a2
                moveq   #1,d1
@Continue:
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   CopySavedData
            else
                bsr.s   CopySavedDataToSram
            endif
                move.b  d0,(a2)             ; d0 = save checksum
                bset    d1,(SAVE_FLAGS).l   ; indicate busy save slot
                movem.l (sp)+,d0-d1/d7-a2
                rts

    ; End of function SaveGame


; =============== S U B R O U T I N E =======================================


CopySave:       move.w  d0,-(sp)
                bsr.s   LoadGame
                eori.w  #1,d0
                andi.w  #1,d0
                bsr.s   SaveGame
                move.w  (sp)+,d0
                rts

    ; End of function CopySave


; =============== S U B R O U T I N E =======================================


ClearSaveSlotFlag:
                
                tst.b   d0
                bne.s   @Slot2
                bclr    #0,(SAVE_FLAGS).l
                bra.s   @Return
@Slot2:         bclr    #1,(SAVE_FLAGS).l
@Return:        rts

    ; End of function ClearSaveSlotFlag

