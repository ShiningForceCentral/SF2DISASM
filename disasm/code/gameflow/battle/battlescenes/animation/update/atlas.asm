
; ASM FILE code\gameflow\battle\battlescenes\animation\update\atlas.asm :
; 0x1E134..0x1E2D4 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Atlas:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_20-$1000000)).w,a4
                bsr.s   sub_1E160
                lea     $C(a5),a5
                lea     $90(a4),a4
                bsr.s   sub_1E160
                subq.w  #1,((byte_FFB53A-$1000000)).w
                bne.s   loc_1E152
                clr.b   ((byte_FFB588-$1000000)).w
loc_1E152:
                
                bsr.w   sub_1B90C       
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Atlas


; =============== S U B R O U T I N E =======================================


sub_1E160:
                
                tst.w   (a5)
                beq.w   return_1E25C
                addq.w  #1,(a5)
                tst.w   8(a5)
                bne.s   loc_1E17C
                lea     ((byte_FFB532-$1000000)).w,a3
                lea     table_1E290(pc), a0
                move.w  #$10,d0
                bra.s   loc_1E188
loc_1E17C:
                
                lea     ((dword_FFB536-$1000000)).w,a3
                lea     table_1F7BE(pc), a0
                move.w  #$130,d0
loc_1E188:
                
                move.w  2(a5),d1
                bne.w   loc_1E1BC
                subq.w  #1,4(a5)
                bne.w   return_1E25C
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   4(a5)
                moveq   #$18,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d0
                moveq   #$30,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d2
                addi.w  #$10,d2
                bra.w   loc_1E268
loc_1E1BC:
                
                subq.w  #1,d1
                bne.w   loc_1E228
                move.w  (a3),d0
                add.w   4(a5),d0
                tst.w   d0
                bmi.s   loc_1E1D6
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E1E4
loc_1E1D6:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E1E4:
                
                move.w  d1,4(a5)
                add.w   6(a4),d0
                move.w  2(a3),d2
                add.w   6(a5),d2
                tst.w   d2
                bmi.s   loc_1E202
                move.w  d2,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d2
                bra.s   loc_1E210
loc_1E202:
                
                neg.w   d2
                move.w  d2,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d2
                neg.w   d2
loc_1E210:
                
                move.w  d1,6(a5)
                add.w   (a4),d2
                cmpi.w  #$C,(a5)
                bcs.s   loc_1E224
                addq.w  #1,2(a5)
                lea     $24(a0),a0
loc_1E224:
                
                bra.w   loc_1E268
loc_1E228:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1E25E
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                tst.w   d7
                bne.s   byte_1E240
                sndCom  SFX_HIT_1
                bra.s   loc_1E244
byte_1E240:
                
                sndCom  SFX_HIT_2
loc_1E244:
                
                bsr.w   sub_1B8FE
                clr.w   2(a5)
                move.w  #2,4(a5)
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,8(a5)
return_1E25C:
                
                rts
loc_1E25E:
                
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                moveq   #1,d0
                moveq   #1,d2
loc_1E268:
                
                move.l  a4,-(sp)
                moveq   #3,d1
loc_1E26C:
                
                moveq   #3,d3
loc_1E26E:
                
                move.w  d2,(a4)+
                move.w  #VDPGRAPHICDIMENSION_V4|VDPGRAPHICDIMENSION_H4,(a4)+
                move.w  (a0)+,(a4)+
                move.w  d0,(a4)+
                addi.w  #$20,d2 
                dbf     d3,loc_1E26E
                addi.w  #$20,d0 
                subi.w  #$80,d2 
                dbf     d1,loc_1E26C
                movea.l (sp)+,a4
                rts

    ; End of function sub_1E160

table_1E290:    dc.b $89
                dc.b $60
                dc.b $89
                dc.b $70
                dc.b $89
                dc.b $F0
                dc.b $8A
                dc.b 0
                dc.b $89
                dc.b $40
                dc.b $89
                dc.b $50
                dc.b $89
                dc.b $D0
                dc.b $89
                dc.b $E0
                dc.b $89
                dc.b $20
                dc.b $89
                dc.b $30
                dc.b $89
                dc.b $B0
                dc.b $89
                dc.b $C0
                dc.b $89
                dc.b 0
                dc.b $89
                dc.b $10
                dc.b $89
                dc.b $90
                dc.b $89
                dc.b $A0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                
                dc.b $8D
                dc.b $80
                dc.b $8D
                dc.b $90
                dc.b $8E
                dc.b $D0
                dc.b $8E
                dc.b $E0
                dc.b $8D
                dc.b $60
                dc.b $8D
                dc.b $70
                dc.b $8D
                dc.b $F0
                dc.b $8E
                dc.b $C0
                dc.b $8D
                dc.b $40
                dc.b $8D
                dc.b $50
                dc.b $8D
                dc.b $D0
                dc.b $8D
                dc.b $E0
                dc.b $8D
                dc.b $20
                dc.b $8D
                dc.b $30
                dc.b $8D
                dc.b $B0
                dc.b $8D
                dc.b $C0
