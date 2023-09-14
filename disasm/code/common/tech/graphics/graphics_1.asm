
; ASM FILE code\common\tech\graphics\graphics_1.asm :
; 0x1770..0x18C2 : Graphics functions, part 1

; =============== S U B R O U T I N E =======================================

; In: d0.w = Number of sprites to initialize


InitializeSprites:
                
                movem.l d0-d1/a0,-(sp)
                lea     (SPRITE_TABLE).l,a0
                move.w  #1,d1
@Loop:
                
                move.w  #1,(a0)+
                move.w  d1,(a0)+
                move.w  #1,(a0)+
                move.w  #1,(a0)+
                addq.w  #1,d1
                dbf     d0,@Loop
                
                subq.l  #6,a0
                clr.w   (a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function InitializeSprites


; =============== S U B R O U T I N E =======================================

; related to spell animations


sub_179C:
                
                movem.l d0/d2/a0,-(sp)
                andi.w  #$FF,d0
                move.w  d0,d2
                lsr.w   #6,d2
                lea     byte_183C(pc), a0
                move.b  (a0,d2.w),d2
                andi.w  #$3F,d0 
                add.w   d0,d0
                lea     word_1840(pc), a0
                move.w  d0,d1
                lsr.b   #1,d2
                bcc.s   loc_17C6
                subi.w  #$80,d1 
                neg.w   d1
loc_17C6:
                
                move.w  (a0,d1.w),d1
                lsr.b   #1,d2
                bcc.s   loc_17D0
                neg.w   d1
loc_17D0:
                
                swap    d1
                lsr.b   #1,d2
                bcc.s   loc_17DC
                subi.w  #$80,d0 
                neg.w   d0
loc_17DC:
                
                move.w  (a0,d0.w),d1
                lsr.b   #1,d2
                bcc.s   loc_17E6
                neg.w   d1
loc_17E6:
                
                movem.l (sp)+,d0/d2/a0
                rts

    ; End of function sub_179C


; =============== S U B R O U T I N E =======================================


sub_17EC:
                
                movem.l d1/d3,-(sp)
                move.w  d1,d3
                lsr.w   #1,d3
                bsr.s   sub_179C        
                move.w  d1,d2
                muls.w  d3,d2
                asr.l   #8,d2
                asr.l   #7,d2
                swap    d1
                swap    d2
                muls.w  d3,d1
                asr.l   #8,d1
                asr.l   #7,d1
                move.w  d1,d2
                swap    d2
                movem.l (sp)+,d1/d3
                rts

    ; End of function sub_17EC


; =============== S U B R O U T I N E =======================================


sub_1812:
                
                movem.l d1/d3,-(sp)
                move.l  d1,d3
                bsr.s   sub_179C        
                move.w  d1,d2
                lsr.w   #1,d3
                muls.w  d3,d2
                asr.l   #8,d2
                asr.l   #7,d2
                swap    d1
                swap    d2
                swap    d3
                lsr.w   #1,d3
                muls.w  d3,d1
                asr.l   #8,d1
                asr.l   #7,d1
                move.w  d1,d2
                swap    d2
                movem.l (sp)+,d1/d3
                rts

    ; End of function sub_1812

byte_183C:      dc.b 6                  ; related to spell animations
                dc.b $B
                dc.b $C
                dc.b 1
word_1840:      dc.w 0
                dc.w 6
                dc.w $C
                dc.w $12
                dc.w $19
                dc.w $1F
                dc.w $25
                dc.w $2B
                dc.w $31
                dc.w $38
                dc.w $3E
                dc.w $44
                dc.w $4A
                dc.w $50
                dc.w $56
                dc.w $5C
                dc.w $61
                dc.w $67
                dc.w $6D
                dc.w $73
                dc.w $78
                dc.w $7E
                dc.w $83
                dc.w $88
                dc.w $8E
                dc.w $93
                dc.w $98
                dc.w $9D
                dc.w $A2
                dc.w $A7
                dc.w $AB
                dc.w $B0
                dc.w $B5
                dc.w $B9
                dc.w $BD
                dc.w $C1
                dc.w $C5
                dc.w $C9
                dc.w $CD
                dc.w $D1
                dc.w $D4
                dc.w $D8
                dc.w $DB
                dc.w $DE
                dc.w $E1
                dc.w $E4
                dc.w $E7
                dc.w $EA
                dc.w $EC
                dc.w $EE
                dc.w $F1
                dc.w $F3
                dc.w $F4
                dc.w $F6
                dc.w $F8
                dc.w $F9
                dc.w $FB
                dc.w $FC
                dc.w $FD
                dc.w $FE
                dc.w $FE
                dc.w $FF
                dc.w $FF
                dc.w $FF
                dc.w $100
