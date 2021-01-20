
; ASM FILE code\common\scripting\text\decoding.asm :
; 0x2E10E..0x2E196 : Text decoding functions

; =============== S U B R O U T I N E =======================================

; Initialise Huffman decoder
; - clear Huffman (script) data
; - set starting tree


InitDecoder:
                
                move.b  #$FE,(DECODED_TEXT_SYMBOL).l
                clr.w   (STRING_BIT_COUNTER).l
                clr.w   (STRING_BYTE).l
                rts

    ; End of function InitDecoder


; =============== S U B R O U T I N E =======================================


HuffmanDecode:
                
                movem.l d1-d7/a1-a3,-(sp)
                lea     (STRING_BIT_COUNTER).l,a3
                move.w  (a3),d6         ; huffman length : current progress in reading current barrel
                move.w  -2(a3),d7       ; huffman barrel : current compressed string byte to read
                clr.w   d1
                move.b  2(a3),d1        ; Get last decoded text symbol -> huffman tree to use
                add.w   d1,d1
                lea     TextBankTreeOffsets(pc), a1
                move.w  (a1,d1.w),d1    ; get tree offset
                lea     TextBankTreeData(pc), a1
                adda.w  d1,a1
                movea.l a1,a2           ; a1 = a2 = current tree start address
                clr.w   d3              ; clear Huffman tree bit counter
                clr.w   d5              ; clear skipped symbols counter
loc_2E150:
                
                dbf     d3,loc_2E158    
                moveq   #7,d3
                move.b  (a1)+,d2        ; Load next Huffman tree byte
loc_2E158:
                
                add.b   d2,d2           ; Get next Huffman tree bit into Carry
                bcs.s   loc_2E182       ; C = 1 --> Leaf node, go get symbol
                                        ; C = 0 --> Non-leaf node, read next string bit
                                        ; 
                dbf     d6,loc_2E164    
                moveq   #7,d6
                move.b  (a0)+,d7        ; Load next compressed string byte
loc_2E164:
                
                add.b   d7,d7           ; Get next compressed string bit into Carry
                bcc.s   loc_2E150       ; C = 0 --> Travel left, go get next Huffman tree bit
                                        ; C = 1 --> Travel right, count left side symbols to skip
                clr.w   d4              ; Clear non-leaf node counter
loc_2E16A:
                
                dbf     d3,loc_2E172    ; count left sub-tree symbols to skip
                moveq   #7,d3
                move.b  (a1)+,d2        ; Load next huffman tree byte
loc_2E172:
                
                add.b   d2,d2           ; Get next Huffman tree bit into Carry
                bcs.s   loc_2E17A       ; C = 1 --> leaf-node, go add one symbol to skip
                                        ; C = 0 --> non-leaf node, add one node to read
                addq.w  #1,d4           ; increment non-leaf node counter
                bra.s   loc_2E16A       
loc_2E17A:
                
                subq.w  #1,d5           ; increment skipped symbols counter
                dbf     d4,loc_2E16A    ; Continue until all nodes in left subtree exhausted
                bra.s   loc_2E150       ; Examine next tree node
loc_2E182:
                
                move.b  -1(a2,d5.w),d0  ; Load decoded symbol
                move.w  d6,(a3)         ; save current string bit counter
                move.w  d7,-2(a3)       ; save current string byte
                move.b  d0,2(a3)        ; save decoded symbol
                movem.l (sp)+,d1-d7/a1-a3
                rts

    ; End of function HuffmanDecode

