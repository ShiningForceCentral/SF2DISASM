
; ASM FILE code\common\tech\thinkingairng.asm :
; 0x1AD090..0x1AD0DC : Thinking AI RNG

; =============== S U B R O U T I N E =======================================

; Modify the lower byte of RANDOM_SEED_COPY.
; 
; Out: d7.w


GenerateRandomValueSigned:
                
                movem.l d0-d5/a0-a6,-(sp)
                lea     (RANDOM_SEED_COPY).l,a0
                clr.w   d7
                move.b  (a0),d7
                ext.w   d7
                mulu.w  #541,d7
                addi.w  #12345,d7
                andi.w  #BYTE_MASK,d7
                move.b  d7,(a0)
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function GenerateRandomValueSigned


; =============== S U B R O U T I N E =======================================

; Return 0, or a random number in the range 2, d6.w-1
; 
; Execution takes a variable amount of time, simulating "thinking" by the AI.
; A copy of RANDOM_SEED is updated during text symbol parsing and diamond menu execution.


GenerateRandomNumberUnderD6:
                
                movem.l d0-d5/a0-a6,-(sp)
                move.b  d6,d1
loc_1AD0BA:
                
                bsr.s   GenerateRandomValueSigned
                cmpi.b  #1,d1
                beq.s   loc_1AD0C4
                bpl.s   loc_1AD0C8
loc_1AD0C4:
                
                bra.w   loc_1AD0D4      
loc_1AD0C8:
                
                cmp.b   d1,d7           ; return random number in the range 2, d6.w-1
                bcs.s   loc_1AD0CE
                bra.s   loc_1AD0BA
loc_1AD0CE:
                
                movem.l (sp)+,d0-d5/a0-a6
                rts
loc_1AD0D4:
                
                clr.b   d7              ; return 0 if d6.w enters in the range -128, 1
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function GenerateRandomNumberUnderD6

