
; ASM FILE code\common\tech\sram\sramfunctions.asm :
; 0x6E94..0x7034 : SRAM functions
SramCheckString:dc.b 'Taguchi New Supra'
                dc.b $FF

; =============== S U B R O U T I N E =======================================

; Out: D0, D1 = -1 if slot 1, or slot 2 failed checksum


CheckSram:
                
                movem.l d7-a1,-(sp)
                lea     SramCheckString(pc), a0
                lea     (SRAM_STRING).l,a1
                moveq   #$10,d7
@CheckSramString_Loop:
                
                cmpm.b  (a0)+,(a1)+
                lea     1(a1),a1
                dbne    d7,@CheckSramString_Loop
                bne.w   @InitSram
                
                ; is slot 2 occupied ?
                btst    #1,(SAVE_FLAGS).l
                bne.s   @ChecksumSlot2
                clr.w   d1
                bra.s   @Slot1
@ChecksumSlot2:
                
                lea     (SAVE2_DATA).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  #SAVE_SLOT_SIZE,d7
                bsr.w   CopyBytesFromSram
                cmp.b   (SAVE2_CHECKSUM).l,d0
                bne.s   @ClearSlot2
                moveq   #1,d1
                bra.s   @Slot1
@ClearSlot2:
                
                moveq   #$FFFFFFFF,d1
                bclr    #1,(SAVE_FLAGS).l
@Slot1:
                
                btst    #0,(SAVE_FLAGS).l
                bne.s   @ChecksumSlot1
                clr.w   d0
                bra.s   @Continue
@ChecksumSlot1:
                
                lea     (SAVE1_DATA).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  #SAVE_SLOT_SIZE,d7
                bsr.w   CopyBytesFromSram
                cmp.b   (SAVE1_CHECKSUM).l,d0
                bne.s   @ClearSlot1
                moveq   #1,d0
                bra.s   @Continue
@ClearSlot1:
                
                moveq   #$FFFFFFFF,d0
                bclr    #0,(SAVE_FLAGS).l
@Continue:
                
                bra.w   @Done
@InitSram:
                
                lea     (SRAM_START).l,a0
                move.w  #SRAM_COUNTER,d7
@ClearSram_Loop:
                
                clr.b   (a0)
                addq.l  #2,a0
                dbf     d7,@ClearSram_Loop
                
                lea     SramCheckString(pc), a0
                lea     (SRAM_STRING).l,a1
                moveq   #$11,d7
                bsr.w   CopyBytesToSram 
                clr.b   (SAVE_FLAGS).l  
                clr.w   d0
                clr.w   d1
@Done:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CheckSram


; =============== S U B R O U T I N E =======================================


SaveGame:
                
                movem.l d0-d1/d7-a2,-(sp)
                lea     (COMBATANT_ENTRIES).l,a0
                tst.b   d0
                bne.s   @Slot2
                lea     (SAVE1_DATA).l,a1
                lea     (SAVE1_CHECKSUM).l,a2
                clr.w   d1
                bra.s   @Continue
@Slot2:
                
                lea     (SAVE2_DATA).l,a1
                lea     (SAVE2_CHECKSUM).l,a2
                moveq   #1,d1
@Continue:
                
                move.w  #SAVE_SLOT_SIZE,d7
                bsr.w   CopyBytesToSram 
                move.b  d0,(a2)         ; d0 = save checksum
                bset    d1,(SAVE_FLAGS).l ; indicate busy save slot
                movem.l (sp)+,d0-d1/d7-a2
                rts

    ; End of function SaveGame


; =============== S U B R O U T I N E =======================================


LoadGame:
                
                movem.l d0-d1/d7-a2,-(sp)
                lea     (COMBATANT_ENTRIES).l,a1
                tst.b   d0
                bne.s   @Slot2
                lea     (SAVE1_DATA).l,a0
                clr.w   d1
                bra.s   @Continue
@Slot2:
                
                lea     (SAVE2_DATA).l,a0
                moveq   #1,d1
@Continue:
                
                move.w  #SAVE_SLOT_SIZE,d7
                bsr.w   CopyBytesFromSram
                movem.l (sp)+,d0-d1/d7-a2
                rts

    ; End of function LoadGame


; =============== S U B R O U T I N E =======================================


CopySave:
                
                move.w  d0,-(sp)
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
@Slot2:
                
                bclr    #1,(SAVE_FLAGS).l
@Return:
                
                rts

    ; End of function ClearSaveSlotFlag


; =============== S U B R O U T I N E =======================================

; In: A0 = source address
;     A1 = destination address
;     D7 = number of bytes to copy


CopyBytesToSram:
                
                movem.l d7-a1,-(sp)
                clr.w   d0
                subq.w  #1,d7
@Loop:
                
                move.b  (a0),(a1)
                add.b   (a0)+,d0
                addq.l  #2,a1
                dbf     d7,@Loop
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyBytesToSram


; =============== S U B R O U T I N E =======================================

; and calculate checksum


CopyBytesFromSram:
                
                movem.l d7-a1,-(sp)
                clr.w   d0
                subq.w  #1,d7
@Loop:
                
                move.b  (a0),(a1)+
                add.b   (a0),d0
                addq.l  #2,a0
                dbf     d7,@Loop
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyBytesFromSram

