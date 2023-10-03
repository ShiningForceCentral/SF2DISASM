
; ASM FILE code\common\tech\bytecopy.asm :
; 0x16D6..0x1700 : Byte-copy function

; =============== S U B R O U T I N E =======================================

; In: a0 = Source, a1 = Destination, d7.w = Length


CopyBytes:
                
                movem.l d7-a1,-(sp)
                cmpa.l  a0,a1
                bgt.w   @Decrement
                subq.w  #1,d7
@Increment_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@Increment_Loop
                
                movem.l (sp)+,d7-a1
                rts
@Decrement:
                
                adda.w  d7,a0
                adda.w  d7,a1
                subq.w  #1,d7
@Decrement_Loop:
                
                move.b  -(a0),-(a1)
                dbf     d7,@Decrement_Loop
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyBytes

