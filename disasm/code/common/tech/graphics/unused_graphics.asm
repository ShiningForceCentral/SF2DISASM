
; ASM FILE code\common\tech\graphics\unused_graphics.asm :
; 0x18C2..0x1942 : Unused graphics functions

; =============== S U B R O U T I N E =======================================


sub_18C2:
                
                movem.l d0-d2,-(sp)
                ext.l   d6
                move.w  d6,d0
                moveq   #$13,d2
                lsr.w   #1,d0
                move.w  d0,d7
loc_18D0:
                
                move.w  d7,d1
                mulu.w  d1,d1
                lsr.w   #1,d0
                cmp.l   d1,d6
                beq.w   loc_18E8
                blt.s   loc_18E2
                add.w   d0,d7
                bra.s   loc_18E4
loc_18E2:
                
                sub.w   d0,d7
loc_18E4:
                
                dbf     d2,loc_18D0
loc_18E8:
                
                movem.l (sp)+,d0-d2
                rts

    ; End of function sub_18C2


; =============== S U B R O U T I N E =======================================

; unused


sub_18EE:
                
                movem.l d0-d2,-(sp)
                move.w  d6,d0
                move.w  d7,d1
                muls.w  d6,d6
                muls.w  d7,d7
                add.w   d7,d6
                bsr.s   sub_18C2
                move.w  d7,d6
                move.w  d1,d7
                bge.s   loc_1906
                neg.w   d7
loc_1906:
                
                lsl.w   #6,d7
                divs.w  d6,d7
                move.b  sub_1942(pc,d7.w),d7
                andi.w  #BYTE_MASK,d7
                movem.l d0,-(sp)
                muls.w  d1,d0
                movem.l (sp)+,d0
                blt.s   loc_192E
                tst.w   d1
                bge.s   loc_1928
                addi.w  #$40,d7 
                bra.s   loc_192C
loc_1928:
                
                addi.w  #$C0,d7 
loc_192C:
                
                bra.s   loc_193C
loc_192E:
                
                subi.w  #$40,d7 
                neg.w   d7
                tst.w   d1
                bge.s   loc_193C
                addi.w  #$80,d7 
loc_193C:
                
                movem.l (sp)+,d0-d2
                rts

    ; End of function sub_18EE

