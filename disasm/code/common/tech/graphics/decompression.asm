
; ASM FILE code\common\tech\graphics\decompression.asm :
; 0x1A84..0x20E6 : Graphics decompression and loading functions

; =============== S U B R O U T I N E =======================================

; Basic tile decompression.  In: a0 = Source, a1 = Destination

var_32 = -32

LoadBasicCompressedData:
                
                movem.l d1-d2/a0-a3,-(sp)
                movea.l a1,a3
                moveq   #-1,d0
                add.w   d0,d0
                bra.s   loc_1A92
loc_1A90:
                
                move.w  (a0)+,(a1)+
loc_1A92:
                
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcs.w   loc_1B2A
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
loc_1AA2:
                
                add.w   d0,d0
                bcs.w   loc_1B26
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
                add.w   d0,d0
                bcs.w   loc_1B26
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
                add.w   d0,d0
                bcs.w   loc_1B26
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
                add.w   d0,d0
                bcs.w   loc_1B26
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
                add.w   d0,d0
                bcs.w   loc_1B26
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
                add.w   d0,d0
                bcs.w   loc_1B26
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
                add.w   d0,d0
                bcs.w   loc_1B26
                add.w   d0,d0
                bcs.w   loc_1B10
                move.l  (a0)+,(a1)+
                add.w   d0,d0
                bcs.w   loc_1B26
                move.w  (a0)+,(a1)+
                add.w   d0,d0
                bra.s   loc_1A92
loc_1B10:
                
                beq.w   loc_1A90
                move.w  (a0)+,(a1)+
                move.w  (a0)+,d1
                bne.w   loc_1B2E
loc_1B1C:
                
                move.l  a1,d0
                movem.l (sp)+,d1-d2/a0-a3
                sub.l   a1,d0
                rts
loc_1B26:
                
                beq.w   loc_1A92
loc_1B2A:
                
                move.w  (a0)+,d1
                beq.s   loc_1B1C
loc_1B2E:
                
                moveq   #$1F,d2
                and.w   d1,d2
                sub.w   d2,d1
                cmpi.w  #$20,d1 
                beq.w   loc_1B72
                ror.w   #4,d1
                movea.l a1,a2
                suba.w  d1,a2
                bclr    #0,d2
                bne.s   loc_1B4A
                move.w  (a2)+,(a1)+
loc_1B4A:
                
                jmp     loc_1B4E(pc,d2.w)
loc_1B4E:
                
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                move.l  (a2)+,(a1)+
                bra.w   loc_1AA2
loc_1B72:
                
                move.w  -2(a1),d1
                swap    d1
                move.w  -2(a1),d1
                bclr    #0,d2
                bne.s   loc_1B84
                move.w  d1,(a1)+
loc_1B84:
                
                jmp     loc_1B88(pc,d2.w)
loc_1B88:
                
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                bra.w   loc_1AA2
                movem.l d0-a2/a5,-(sp)
                link    a6,#-32
                lea     var_32(a6),a5
                moveq   #1,d3
                move.l  d3,(a5)+
                move.l  #$20003,(a5)+
                move.l  #$40005,(a5)+
                move.l  #$60007,(a5)+
                move.l  #$80009,(a5)+
                move.l  #$A000B,(a5)+
                move.l  #$C000D,(a5)+
                move.l  #$E000F,(a5)+
                lea     var_32(a6),a5
                clr.w   d3
loc_1BEC:
                
                moveq   #3,d4
loc_1BEE:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                dbf     d3,loc_1BF8
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1BF8:
                
                add.w   d0,d0
                bcc.w   loc_1C76
                dbf     d3,loc_1C06
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1C06:
                
                add.w   d0,d0
                bcs.s   loc_1C22
                moveq   #0,d1
                dbf     d3,loc_1C14
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1C14:
                
                add.w   d0,d0
                addx.w  d1,d1
                bset    d1,d2
                dbf     d4,loc_1BEE
                
                bra.w   loc_1C7A
loc_1C22:
                
                dbf     d3,loc_1C2A
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1C2A:
                
                add.w   d0,d0
                bcs.s   loc_1C38
                addq.w  #4,d2
                dbf     d4,loc_1BEE
                
                bra.w   loc_1C7A
loc_1C38:
                
                dbf     d3,loc_1C40
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1C40:
                
                add.w   d0,d0
                bcs.s   loc_1C4E
                addq.b  #8,d2
                dbf     d4,loc_1BEE
                
                bra.w   loc_1C7A
loc_1C4E:
                
                subq.w  #4,d3
                bcc.s   loc_1C6E
                addq.w  #4,d3
                rol.l   d3,d0
                move.w  (a0)+,d0
                subq.w  #4,d3
                neg.w   d3
                rol.l   d3,d0
                neg.w   d3
                addi.w  #$10,d3
                move.l  d0,d1
                swap    d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                bra.s   loc_1C74
loc_1C6E:
                
                moveq   #$F,d1
                rol.w   #4,d0
                and.w   d0,d1
loc_1C74:
                
                add.b   d1,d2
loc_1C76:
                
                dbf     d4,loc_1BEE
loc_1C7A:
                
                move.w  d2,(a1)+
                moveq   #$F,d4
loc_1C7E:
                
                add.w   d2,d2
                bcc.s   loc_1CD2
                subi.w  #$B,d3
                bcc.s   loc_1CA8
                addi.w  #$B,d3
                rol.l   d3,d0
                move.w  (a0)+,d0
                subi.w  #$B,d3
                neg.w   d3
                rol.l   d3,d0
                neg.w   d3
                addi.w  #$10,d3
                move.l  d0,d1
                swap    d1
                andi.w  #$7FF,d1
                bra.s   loc_1CB0
loc_1CA8:
                
                move.w  #$7FF,d1
                ror.w   #5,d0
                and.w   d0,d1
loc_1CB0:
                
                beq.w   loc_1E3E
                lsl.w   #5,d1
                moveq   #-1,d5
loc_1CB8:
                
                dbf     d3,loc_1CC0
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1CC0:
                
                add.w   d0,d0
                dbcs    d5,loc_1CB8
                
                addi.w  #$20,d5 
                add.w   d5,d1
                move.w  d1,(a1)+
                bra.w   loc_1E36
loc_1CD2:
                
                moveq   #3,d6
loc_1CD4:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d7
                dbf     d3,loc_1CDE
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1CDE:
                
                add.w   d0,d0
                bcs.s   loc_1D08
                dbf     d3,loc_1CEA
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1CEA:
                
                add.w   d0,d0
                bcs.s   loc_1CF8
                add.w   (a5),d7
                dbf     d6,loc_1CD4
                
                bra.w   loc_1E34
loc_1CF8:
                
                move.l  (a5),d5
                add.w   d5,d7
                swap    d5
                move.l  d5,(a5)
                dbf     d6,loc_1CD4
                
                bra.w   loc_1E34
loc_1D08:
                
                dbf     d3,loc_1D10
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1D10:
                
                add.w   d0,d0
                bcs.s   loc_1D4E
                dbf     d3,loc_1D1C
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1D1C:
                
                add.w   d0,d0
                bcs.s   loc_1D34
                move.w  4(a5),d5
                add.w   d5,d7
                move.l  (a5),2(a5)
                move.w  d5,(a5)
                dbf     d6,loc_1CD4
                
                bra.w   loc_1E34
loc_1D34:
                
                move.l  4(a5),d5
                add.w   d5,d7
                move.l  (a5),2(a5)
                move.w  d5,(a5)
                swap    d5
                move.w  d5,6(a5)
                dbf     d6,loc_1CD4
                
                bra.w   loc_1E34
loc_1D4E:
                
                dbf     d3,loc_1D56
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1D56:
                
                add.w   d0,d0
                bcs.s   loc_1D74
                move.w  8(a5),d5
                add.w   d5,d7
                move.l  4(a5),6(a5)
                move.l  (a5),2(a5)
                move.w  d5,(a5)
                dbf     d6,loc_1CD4
                
                bra.w   loc_1E34
loc_1D74:
                
                subq.w  #2,d3
                bcc.s   loc_1D94
                addq.w  #2,d3
                rol.l   d3,d0
                move.w  (a0)+,d0
                subq.w  #2,d3
                neg.w   d3
                rol.l   d3,d0
                neg.w   d3
                addi.w  #$10,d3
                move.l  d0,d1
                swap    d1
                andi.w  #3,d1
                bra.s   loc_1D9A
loc_1D94:
                
                moveq   #3,d1
                rol.w   #2,d0
                and.w   d0,d1
loc_1D9A:
                
                subq.w  #3,d1
                bcc.s   loc_1DA6
                addq.w  #8,d1
                move.w  d1,d5
                bra.w   loc_1E18
loc_1DA6:
                
                subq.w  #2,d3
                bcc.s   loc_1DC6
                addq.w  #2,d3
                rol.l   d3,d0
                move.w  (a0)+,d0
                subq.w  #2,d3
                neg.w   d3
                rol.l   d3,d0
                neg.w   d3
                addi.w  #$10,d3
                move.l  d0,d1
                swap    d1
                andi.w  #3,d1
                bra.s   loc_1DCC
loc_1DC6:
                
                moveq   #3,d1
                rol.w   #2,d0
                and.w   d0,d1
loc_1DCC:
                
                subq.w  #3,d1
                bcc.s   loc_1DD8
                moveq   #$B,d5
                add.w   d1,d5
                bra.w   loc_1E18
loc_1DD8:
                
                subq.w  #2,d3
                bcc.s   loc_1DF8
                addq.w  #2,d3
                rol.l   d3,d0
                move.w  (a0)+,d0
                subq.w  #2,d3
                neg.w   d3
                rol.l   d3,d0
                neg.w   d3
                addi.w  #$10,d3
                move.l  d0,d1
                swap    d1
                andi.w  #3,d1
                bra.s   loc_1DFE
loc_1DF8:
                
                moveq   #3,d1
                rol.w   #2,d0
                and.w   d0,d1
loc_1DFE:
                
                subq.w  #3,d1
                bcc.s   loc_1E0A
                moveq   #$E,d5
                add.w   d1,d5
                bra.w   loc_1E18
loc_1E0A:
                
                moveq   #7,d5
                dbf     d3,loc_1E14
                
                moveq   #$F,d3
                move.w  (a0)+,d0
loc_1E14:
                
                add.w   d0,d0
                addx.w  d5,d5
loc_1E18:
                
                move.w  d5,d1
                add.w   d1,d1
                lea     (a5,d1.w),a2
                move.w  (a2),d1
                add.w   d1,d7
                bra.s   loc_1E2A
loc_1E26:
                
                move.w  -(a2),2(a2)
loc_1E2A:
                
                dbf     d5,loc_1E26
                
                move.w  d1,(a2)
                dbf     d6,loc_1CD4
loc_1E34:
                
                move.w  d7,(a1)+
loc_1E36:
                
                dbf     d4,loc_1C7E
                
                bra.w   loc_1BEC
loc_1E3E:
                
                move.w  d1,(a1)+
                unlk    a6
                movem.l (sp)+,d0-a2/a5
                rts

    ; End of function LoadBasicCompressedData


; =============== S U B R O U T I N E =======================================

; Stack decompression.  In: a0 = Source, a1 = Destination

history = -32

LoadStackCompressedData:
                
                movem.l d1-a5,-(sp)
                link    a6,#-32         ; push d1-a6 to stack
                lea     history(a6),a5  ; allocates $20 bytes of value history stack
                moveq   #3,d6
                movea.l d6,a4           ; a4 = 00000003
                subq.w  #1,d6
                movea.l d6,a3           ; a3 = 00000002
                subq.w  #1,d6           ; d6 = 00000001
                moveq   #0,d4           ; d4 = 00000000
                move.l  #$40005,(a5)+
                move.l  #$60007,(a5)+
                move.l  #$80009,(a5)+
                move.l  #$A000B,(a5)+
                move.l  #$C000D,(a5)+
                move.l  #$E000F,(a5)+   ; stack area : 
                                        ; 00 04 00 05 00 06 00 07 00 08 00 09
                                        ; 00 0A 00 0B 00 0C 00 0D 00 0E 00 0F
                                        ; initial value history stack
                lea     history(a6),a5
                move.w  #$8000,d0       ; init data word with only first bit set
                                        ; to get next data word and addx 1
loc_1E8C:
                
                moveq   #3,d3           ; start of loop to update command stack d2
loc_1E8E:
                
                add.w   d0,d0           ; new loop iteration, test next bit
                bcs.s   loc_1E9C        
loc_1E92:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d2 ; bit sequence 0 --> d2 = xxx0
                dbf     d3,loc_1E8E     ; loop 4 times
                
                bra.w   loc_1F24        
loc_1E9C:
                
                bne.s   loc_1EA4        ; next bit was 1
                move.w  (a0)+,d0        ; no more bits set, get next data word
                addx.w  d0,d0           ; test first bit, add previous carry
                bcc.s   loc_1E92        
loc_1EA4:
                
                add.w   d0,d0           ; test next bit
                bcs.s   loc_1EC0        
loc_1EA8:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d2 ; next bit was 0, d2 4-bit-shifted
                moveq   #0,d1           ; d1 = 0
                add.w   d0,d0           ; test next bit
                bne.s   loc_1EB4        
                move.w  (a0)+,d0        ; get next word
                addx.w  d0,d0           ; add previous carry, put first bit in extend for next addx
loc_1EB4:
                
                addx.w  d1,d1           ; d1 = 0 or 1 depending on parsed bit
                bset    d1,d2           ; d2 = xxx1 or xxx2 if next bit was 1
                dbf     d3,loc_1E8E     
                
                bra.w   loc_1F24        
loc_1EC0:
                
                bne.s   loc_1EC8        ; next bit was 1
                move.w  (a0)+,d0        ; get next word
                addx.w  d0,d0           ; test first bit, add previous carry
                bcc.s   loc_1EA8        
loc_1EC8:
                
                add.w   d0,d0           ; test next bit
                bcs.s   loc_1ED8        
loc_1ECC:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d2 ; bit sequence 110 --> d2 = xxx4
                addq.w  #4,d2           ; d2 = xxx4
                dbf     d3,loc_1E8E     
                
                bra.w   loc_1F24        
loc_1ED8:
                
                bne.s   loc_1EE0        ; next bit was 1
                move.w  (a0)+,d0        ; no more bits set, get next word
                addx.w  d0,d0           ; test first bit, add previous carry
                bcc.s   loc_1ECC        
loc_1EE0:
                
                add.w   d0,d0           ; more bits set, test next bit
                bcs.s   loc_1EF0        
loc_1EE4:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d2 ; bit sequence 1110 --> d2 = xxx8
                addq.b  #8,d2           ; d2 = xxx8
                dbf     d3,loc_1E8E     
                
                bra.w   loc_1F24        
loc_1EF0:
                
                bne.s   loc_1EF8        ; bit sequence 1111 --> d2 = xxxy
                move.w  (a0)+,d0        ; no more bits set, get next word
                addx.w  d0,d0           ; test first bit, add previous carry
                bcc.s   loc_1EE4        
loc_1EF8:
                
                add.w   d0,d0           ; next bit was 1, test next bit
                bne.s   loc_1F00        
                move.w  (a0)+,d0        ; no more bits set, get next word
                addx.w  d0,d0           ; add previous carry, put first bit in extend for next addx
loc_1F00:
                
                addx.w  d2,d2           ; d2 1-bit-shift left + last bit
                add.w   d0,d0           ; test next bit
                bne.s   loc_1F0A        
                move.w  (a0)+,d0        ; no more set bits, get next word
                addx.w  d0,d0           ; add previous carry, put first bit in extend for next addx
loc_1F0A:
                
                addx.w  d2,d2           ; d2 1-bit-shifted left + last bit
                add.w   d0,d0           ; test next bit
                bne.s   loc_1F14        
                move.w  (a0)+,d0        ; no more bits set, get next word
                addx.w  d0,d0           ; put first bit in extend for next addx
loc_1F14:
                
                addx.w  d2,d2           ; d2 1-bit-shifted left + last bit
                add.w   d0,d0           ; test next bit
                bne.s   loc_1F1E        
                move.w  (a0)+,d0        ; not more bits set, get next word
                addx.w  d0,d0           ; put first bit in extend for next addx
loc_1F1E:
                
                addx.w  d2,d2           ; d2 1-bit-shifted left + last bit
                dbf     d3,loc_1E8E     
loc_1F24:
                
                moveq   #-1,d1          ; d3 = 0, loop end, d2 is set
                add.w   d1,d1           ; d1 = -2 and carry set
                addx.w  d2,d2           ; test next d2 bit and add 1
                bcs.w   loc_204C        
loc_1F2E:
                
                moveq   #3,d3           ; start of loop for literal value from history stack
loc_1F30:
                
                lsl.w   #NIBBLE_SHIFT_COUNT,d7 ; shift d7 (destination word)
                add.w   d0,d0           ; test next compressed data bit
                bcs.s   loc_1F58        
loc_1F36:
                
                add.w   d0,d0           ; bit sequence 0..., test next bit
                bcs.s   loc_1F44
loc_1F3A:
                
                add.w   d4,d7           ; bit sequence 00, d7 = xxx0
                dbf     d3,loc_1F30     
                
                bra.w   loc_2040        
loc_1F44:
                
                bne.s   word_1F4C       
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_1F3A        
word_1F4C:
                
                dc.w $CD44              ; bit sequence 01, d7 = xxx1
                                        ;  exg     d6,d4
                add.w    d4,d7           
                dbf     d3,loc_1F30     
                
                bra.w   loc_2040        
loc_1F58:
                
                bne.s   loc_1F60        ; bit sequence 1...
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_1F36        
loc_1F60:
                
                add.w   d0,d0
                bcs.s   loc_1F8E        
loc_1F64:
                
                add.w   d0,d0           ; bit sequence 10...
                bcs.s   loc_1F76        
loc_1F68:
                
                exg     d6,a3           ; bit sequence 100, d7 = xxx2
                dc.w $CD44              ; exg     d6,d4
                add.w    d4,d7           
                dbf     d3,loc_1F30     
                
                bra.w   loc_2040        
loc_1F76:
                
                bne.s   word_1F7E       ; bit sequence 101
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_1F68        
word_1F7E:
                
                dc.w $C94B              ; bit sequence 101, d7 = xxx3
                                        ; exg     a4,a3
                exg        d6,a3           
                dc.w $CD44              ; exg     d6,d4
                add.w    d4,d7           
                dbf     d3,loc_1F30     
                
                bra.w   loc_2040        
loc_1F8E:
                
                bne.s   loc_1F96        ; bit sequence 11...
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_1F64        
loc_1F96:
                
                add.w   d0,d0
                bcs.s   loc_1FB0        
loc_1F9A:
                
                move.w  (a5),d5         ; bit sequence 110, d7 = xxx4
                move.w  a4,(a5)
                movea.l a3,a4
                movea.l d6,a3
                move.l  d4,d6
                move.l  d5,d4
                add.w   d4,d7
                dbf     d3,loc_1F30     
                
                bra.w   loc_2040        
loc_1FB0:
                
                bne.s   loc_1FB8        ; bit sequence 111...
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_1F9A        
loc_1FB8:
                
                move.w  #$4000,d5
loc_1FBC:
                
                add.w   d0,d0
                bne.s   loc_1FC4        
                move.w  (a0)+,d0
                addx.w  d0,d0
loc_1FC4:
                
                addx.w  d5,d5           ; get first 2 bits
                bcc.s   loc_1FBC
                subq.w  #3,d5
                bcc.s   loc_1FD2        
                addq.w  #4,d5           ; 00, 01 or 10 ==> 1, 2 or 3
                bra.w   loc_2014
loc_1FD2:
                
                move.w  #$4000,d5       ; first 2 bits = 11
loc_1FD6:
                
                add.w   d0,d0
                bne.s   loc_1FDE        
                move.w  (a0)+,d0
                addx.w  d0,d0
loc_1FDE:
                
                addx.w  d5,d5           ; get next 2 bits
                bcc.s   loc_1FD6
                subq.w  #3,d5
                bcc.s   loc_1FEC        
                addq.w  #7,d5           ; 1100, 1101 or 1110 ==> 4, 5 or 6
                bra.w   loc_2014
loc_1FEC:
                
                move.w  #$4000,d5       ; sequence 11 11 ...
loc_1FF0:
                
                add.w   d0,d0
                bne.s   loc_1FF8        
                move.w  (a0)+,d0
                addx.w  d0,d0
loc_1FF8:
                
                addx.w  d5,d5           ; get next 2 bits
                bcc.s   loc_1FF0
                subq.w  #3,d5
                bcc.s   loc_2008        
                addi.w  #$A,d5          ; 111100, 111101 or 111110 ==> 7, 8 or 9
                bra.w   loc_2014
loc_2008:
                
                moveq   #5,d5           ; sequence 11 11 11 ...
                add.w   d0,d0
                bne.s   loc_2012        
                move.w  (a0)+,d0
                addx.w  d0,d0
loc_2012:
                
                addx.w  d5,d5           ; get next bit ==> A or B
loc_2014:
                
                move.w  d5,d1
                add.w   d1,d1
                lea     (a5,d1.w),a2
                move.w  (a2),d1
                add.w   d1,d7
                lsr.w   #1,d5
                bcc.s   loc_2028
                move.w  -(a2),2(a2)
loc_2028:
                
                bra.s   loc_202E
loc_202A:
                
                move.l  -(a2),2(a2)     ; update history
loc_202E:
                
                dbf     d5,loc_202A     
                
                move.w  a4,(a2)
                movea.l a3,a4
                movea.l d6,a3
                move.l  d4,d6
                move.w  d1,d4
                dbf     d3,loc_1F30     
loc_2040:
                
                move.w  d7,(a1)+        ; output 4-value word
loc_2042:
                
                add.w   d2,d2
                bcc.w   loc_1F2E        
                beq.w   loc_1E8C        
loc_204C:
                
                add.w   d0,d0           ; d2 bit = 1, section copy
                bne.w   loc_2064
                move.w  (a0)+,d0
                ror.w   #5,d0           ; specific way to manage offset coming from a new word
                move.w  #$7FF,d1
                and.w   d0,d1
                eor.w   d1,d0
                ori.w   #$400,d0
                bra.s   loc_2082
loc_2064:
                
                moveq   #9,d5
                moveq   #0,d1
loc_2068:
                
                addx.w  d1,d1
                add.w   d0,d0           ; put next 10 bits in d1 : 
                                        ; relative offset of section to copy,
                                        ; in words back from current output position
                dbeq    d5,loc_2068
                
                beq.s   loc_2076
                addx.w  d1,d1           ; 11th bit
                bra.s   loc_2082
loc_2076:
                
                swap    d1
                move.w  (a0)+,d1        ; epic way to manage offset ending in a second word ?
                addx.l  d1,d1
                rol.l   d5,d1
                move.w  d1,d0
                swap    d1
loc_2082:
                
                movea.l a1,a2
                add.w   d1,d1
                beq.w   loc_20DA        ; if section copy bits = 00000000000, end subroutine
                suba.w  d1,a2           ; copy section from d1 before current output position
                subq.w  #2,d1
                beq.s   loc_20B0        
loc_2090:
                
                move.l  (a2)+,(a1)+     ; copy two words, repeat as long as next bit sequence = 00
                add.w   d0,d0
                bcs.s   loc_20A6        
loc_2096:
                
                add.w   d0,d0           ; next bit was 0
                bcc.s   loc_2090        
                bne.s   loc_20A2        
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_2090        
loc_20A2:
                
                move.w  (a2)+,(a1)+     ; bit sequence 01 : copy one last word
                bra.s   loc_2042
loc_20A6:
                
                bne.s   loc_20AE        ; next bit was 1 : end of copy
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_2096        
loc_20AE:
                
                bra.s   loc_2042
loc_20B0:
                
                move.w  (a2),d1         ; offset is just one word backwards, so repeat last word in a quicker way
                swap    d1
                move.w  (a2),d1
loc_20B6:
                
                move.l  d1,(a1)+        ; copy same word twice as long as next bit sequence = 00
                add.w   d0,d0
                bcs.s   loc_20CE
loc_20BC:
                
                add.w   d0,d0
                bcc.s   loc_20B6        
                bne.s   loc_20C8        
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_20B6        
loc_20C8:
                
                move.w  d1,(a1)+        ; copy same word one last time
                bra.w   loc_2042
loc_20CE:
                
                bne.s   loc_20D6
                move.w  (a0)+,d0
                addx.w  d0,d0
                bcc.s   loc_20BC
loc_20D6:
                
                bra.w   loc_2042
loc_20DA:
                
                move.l  a1,d0
                unlk    a6
                movem.l (sp)+,d1-a5
                sub.l   a1,d0
                rts

    ; End of function LoadStackCompressedData

