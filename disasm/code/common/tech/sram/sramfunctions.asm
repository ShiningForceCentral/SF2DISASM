
; ASM FILE code\common\tech\sram\sramfunctions.asm :
; 0x6E94..0x7034 : SRAM functions
SramCheckString:dc.b 'Taguchi New Supra'
                dc.b $FF

; =============== S U B R O U T I N E =======================================

CheckSram:
                
                movem.l d7-a1,-(sp)
                lea     SramCheckString(pc), a0
                lea     (SRAM_STRING).l,a1
                moveq   #$10,d7
loc_6EB6:
                
                cmpm.b  (a0)+,(a1)+
                lea     1(a1),a1
                dbne    d7,loc_6EB6
                bne.w   loc_6F38
                btst    #1,(SAVE_FLAGS).l
                bne.s   loc_6ED2
                clr.w   d1
                bra.s   loc_6EFC
loc_6ED2:
                
                lea     (SAVE2_CHARACTER_DATA).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
loc_6EDE:
                
                move.w  #$FB0,d7
                bsr.w   CopyBytesFromSram
                cmp.b   (SAVE2_CHECKSUM).l,d0
                bne.s   loc_6EF2
                moveq   #1,d1
                bra.s   loc_6EFC
loc_6EF2:
                
                moveq   #$FFFFFFFF,d1
                bclr    #1,(SAVE_FLAGS).l
loc_6EFC:
                
                btst    #0,(SAVE_FLAGS).l
                bne.s   loc_6F0A
                clr.w   d0
                bra.s   loc_6F34
loc_6F0A:
                
                lea     (SAVE1_CHARACTER_DATA).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  #$FB0,d7
                bsr.w   CopyBytesFromSram
                cmp.b   (SAVE1_CHECKSUM).l,d0
                bne.s   loc_6F2A
                moveq   #1,d0
                bra.s   loc_6F34
loc_6F2A:
                
                moveq   #$FFFFFFFF,d0
                bclr    #0,(SAVE_FLAGS).l
loc_6F34:
                
                bra.w   loc_6F64
loc_6F38:
                
                lea     (SRAM_START).l,a0
                move.w  #$1FFF,d7
loc_6F42:
                
                clr.b   (a0)
                addq.l  #2,a0
                dbf     d7,loc_6F42
                lea     SramCheckString(pc), a0
                lea     (SRAM_STRING).l,a1
                moveq   #$11,d7         ; copy string to sram ... again ?
loc_6F56:
                
                bsr.w   CopyBytesToSram 
                clr.b   (SAVE_FLAGS).l  
                clr.w   d0
                clr.w   d1
loc_6F64:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CheckSram


; =============== S U B R O U T I N E =======================================

SaveGame:
                
                movem.l d0-d1/d7-a2,-(sp)
                lea     (COMBATANT_ENTRIES).l,a0
                tst.b   d0
                bne.s   loc_6F88
                lea     (SAVE1_CHARACTER_DATA).l,a1
                lea     (SAVE1_CHECKSUM).l,a2
                clr.w   d1
                bra.s   loc_6F96
loc_6F88:
                
                lea     (SAVE2_CHARACTER_DATA).l,a1
                lea     (SAVE2_CHECKSUM).l,a2
                moveq   #1,d1
loc_6F96:
                
                move.w  #$FB0,d7
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
                bne.s   loc_6FC4
loc_6FBA:
                
                lea     (SAVE1_CHARACTER_DATA).l,a0
                clr.w   d1
                bra.s   loc_6FCC
loc_6FC4:
                
                lea     (SAVE2_CHARACTER_DATA).l,a0
                moveq   #1,d1
loc_6FCC:
                
                move.w  #$FB0,d7
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
                bne.s   loc_6FFA
                bclr    #0,(SAVE_FLAGS).l
                bra.s   return_7002
loc_6FFA:
                
                bclr    #1,(SAVE_FLAGS).l
return_7002:
                
                rts

    ; End of function ClearSaveSlotFlag


; =============== S U B R O U T I N E =======================================

; a0 = source address
; a1 = destination address
; d7 = number of bytes to copy

CopyBytesToSram:
                
                movem.l d7-a1,-(sp)
                clr.w   d0
                subq.w  #1,d7
loc_700C:
                
                move.b  (a0),(a1)
                add.b   (a0)+,d0
                addq.l  #2,a1
                dbf     d7,loc_700C
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyBytesToSram


; =============== S U B R O U T I N E =======================================

; and calculate checksum

CopyBytesFromSram:
                
                movem.l d7-a1,-(sp)
                clr.w   d0
                subq.w  #1,d7
loc_7024:
                
                move.b  (a0),(a1)+
                add.b   (a0),d0
                addq.l  #2,a0
                dbf     d7,loc_7024
loc_702E:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyBytesFromSram

