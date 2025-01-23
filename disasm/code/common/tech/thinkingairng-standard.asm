
; ASM FILE code\common\tech\thinkingairng-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; Modify the lower byte of RANDOM_SEED_COPY.
;
; Out: d7.w

GenerateRandomValueSigned:
                
                lea     ((RANDOM_SEED_COPY-$1000000)).l,a0
                clr.w   d7
                move.b  (a0),d7
                ext.w   d7
                mulu.w  #541,d7
                addi.w  #12345,d7
                andi.w  #BYTE_MASK,d7
                move.b  d7,(a0)
                rts

    ; End of function GenerateRandomValueSigned


; =============== S U B R O U T I N E =======================================

; Return 0, or a random number in the range 2, d6.w-1
;
; Execution takes a variable amount of time, simulating "thinking" by the AI.
; A copy of RANDOM_SEED is updated during text symbol parsing and diamond menu execution.

GenerateRandomNumberUnderD6:
                
                move.l  a0,-(sp)
                cmpi.b  #1,d6
                ble.s   @Zero           ; return 0 if d6.w enters in the range -128, 1
                
@Loop:          bsr.s   GenerateRandomValueSigned
                cmp.b   d6,d7           ; return random number in the range 2, d6.w-1
                bhs.s   @Loop
                bra.s   @Done
                
@Zero:          clr.b   d7
@Done:          movea.l (sp)+,a0
                rts

    ; End of function GenerateRandomNumberUnderD6

