
; ASM FILE code\common\tech\sram\sramfunctions-standard.asm :
; Standard reimplementation of SRAM functions.

                module
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
combatantEntries = COMBATANT_ENTRIES-1
saveData1 = SAVE1_DATA-1
saveData2 = SAVE2_DATA-1
            else
combatantEntries = COMBATANT_ENTRIES
saveData1 = SAVE1_DATA
saveData2 = SAVE2_DATA
            endif
                
calculateSaveChecksum: macro
              if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   CalculateSaveSlotChecksum
              else
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a1
                move.w  #SAVE_SLOT_COUNTER,d7
                bsr.s   CopyBytesFromSram
              endif
            endm
                
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
                calculateSaveChecksum
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
                calculateSaveChecksum
                cmp.b   (SAVE1_CHECKSUM).l,d0
                bne.s   @ClearSlot1
                moveq   #1,d0
                bra.s   @Done
                
@ClearSlot1:    moveq   #-1,d0
                bclr    #0,(SAVE_FLAGS).l
                bra.s   @Done
                
@InitSram:      lea     (SRAM_START-1).l,a0
                move.w  #SRAM_COUNTER,d7
                
@ClearSram_Loop:
                clr.b   (a0)
                addq.w  #2,a0
                dbf     d7,@ClearSram_Loop
                
                lea     SramCheckString(pc), a0
                lea     (SRAM_STRING).l,a1
                moveq   #SRAM_STRING_WRITE_COUNTER,d7
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
@Loop:          move.b  (a0)+,(a1)
                addq.w  #2,a1
                dbf     d7,@Loop
            else
                bsr.s   CopyBytesToSram
            endif
                clr.b   (SAVE_FLAGS).l  
                clr.w   d0
                clr.w   d1
@Done:          movem.l (sp)+,d7-a1
                rts

    ; End of function CheckSram

                modend

; =============== S U B R O U T I N E =======================================


CalculateSaveSlotChecksum:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                clr.w   d0
                move.w  #SAVE_SLOT_COUNTER,d7
@Loop:          add.b   (a0),d0
                addq.w  #2,a0
                dbf     d7,@Loop
                rts
            endif

    ; End of function CalculateSaveSlotChecksum


; =============== S U B R O U T I N E =======================================

; In: a0 = source address, a1 = destination address
; Out: d0.b = checksum


CopySaveSlotData:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                clr.w   d0
                move.w  #SAVE_SLOT_COUNTER,d7
@Loop:          add.b   1(a0),d0
                move.w  (a0)+,(a1)+
                dbf     d7,@Loop
                rts
            endif

    ; End of function CopySaveSlotData


; =============== S U B R O U T I N E =======================================

; and calculate checksum


CopyBytesFromSram:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                movem.l d7-a1,-(sp)
                clr.w   d0
@Loop:          move.b  (a0),(a1)+
                add.b   (a0),d0
                addq.w  #2,a0
                dbf    d7,@Loop
                movem.l (sp)+,d7-a1
                rts
            endif

    ; End of function CopyBytesFromSram


; =============== S U B R O U T I N E =======================================

; In: a0 = source address, a1 = destination address, d7.w = number of bytes to copy
; Out: d0.b = checksum


CopyBytesToSram:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
            else
                movem.l d7-a1,-(sp)
                clr.w   d0
@Loop:          move.b  (a0),(a1)
                add.b   (a0)+,d0
                addq.w  #2,a1
                dbf     d7,@Loop
                movem.l (sp)+,d7-a1
                rts
            endif

    ; End of function CopyBytesToSram


; =============== S U B R O U T I N E =======================================


LoadGame:       movem.l d0-d1/d7-a2,-(sp)
                loadSavedDataAddress combatantEntries, a1
                tst.b   d0
                bne.s   @Slot2
                lea     (saveData1).l,a0
                moveq   #0,d1
                bra.s   @Continue
@Slot2:         lea     (saveData2).l,a0
                moveq   #1,d1
@Continue:
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   CopySaveSlotData
            else
                move.w  #SAVE_SLOT_COUNTER,d7
                bsr.s   CopyBytesFromSram
            endif
                movem.l (sp)+,d0-d1/d7-a2
                rts

    ; End of function LoadGame


; =============== S U B R O U T I N E =======================================


SaveGame:       movem.l d0-d1/d7-a2,-(sp)
                loadSavedDataAddress combatantEntries, a0
                tst.b   d0
                bne.s   @Slot2
                lea     (saveData1).l,a1
                lea     (SAVE1_CHECKSUM).l,a2
                moveq   #0,d1
                bra.s   @Continue
@Slot2:         lea     (saveData2).l,a1
                lea     (SAVE2_CHECKSUM).l,a2
                moveq   #1,d1
@Continue:
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   CopySaveSlotData
            else
                move.w  #SAVE_SLOT_COUNTER,d7
                bsr.s   CopyBytesToSram
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


; =============== S U B R O U T I N E =======================================

; Clear active saved data slot during system initialization if RELOCATED_SAVED_DATA_TO_SRAM is enabled.


InitializeSavedData:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                lea     (combatantEntries).l,a0
                move.w  #SAVE_SLOT_COUNTER,d0
@Loop:          clr.w   (a0)+
                dbf     d0,@Loop
                rts
            endif

    ; End of function ClearSavedData

