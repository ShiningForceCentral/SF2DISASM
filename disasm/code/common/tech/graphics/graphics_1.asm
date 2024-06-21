
; ASM FILE code\common\tech\graphics\graphics_1.asm :
; 0x1770..0x183C : Graphics functions, part 1

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

; related to spellanimations


sub_179C:
                
                movem.l d0/d2/a0,-(sp)
                andi.w  #BYTE_MASK,d0
                move.w  d0,d2
                lsr.w   #6,d2
                lea     table_183C(pc), a0
                move.b  (a0,d2.w),d2
                andi.w  #$3F,d0 
                add.w   d0,d0
                lea     table_1840(pc), a0
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

; related to spellanimations


sub_17EC:
                
                movem.l d1/d3,-(sp)
                move.w  d1,d3
                lsr.w   #1,d3
                bsr.s   sub_179C        
                move.w  d1,d2
                muls.w  d3,d2
                asr.l   #BYTE_SHIFT_COUNT,d2
                asr.l   #7,d2
                swap    d1
                swap    d2
                muls.w  d3,d1
                asr.l   #BYTE_SHIFT_COUNT,d1
                asr.l   #7,d1
                move.w  d1,d2
                swap    d2
                movem.l (sp)+,d1/d3
                rts

    ; End of function sub_17EC


; =============== S U B R O U T I N E =======================================

; related to spellanimations


sub_1812:
                
                movem.l d1/d3,-(sp)
                move.l  d1,d3
                bsr.s   sub_179C        
                move.w  d1,d2
                lsr.w   #1,d3
                muls.w  d3,d2
                asr.l   #BYTE_SHIFT_COUNT,d2
                asr.l   #7,d2
                swap    d1
                swap    d2
                swap    d3
                lsr.w   #1,d3
                muls.w  d3,d1
                asr.l   #BYTE_SHIFT_COUNT,d1
                asr.l   #7,d1
                move.w  d1,d2
                swap    d2
                movem.l (sp)+,d1/d3
                rts

    ; End of function sub_1812

