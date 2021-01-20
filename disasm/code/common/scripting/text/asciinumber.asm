
; ASM FILE code\common\scripting\text\asciinumber.asm :
; 0x14A6..0x150E : ASCII number function

; =============== S U B R O U T I N E =======================================


WriteAsciiNumber:
                
                movem.l d5-d7/a5-a6,-(sp)
                lea     PowersOfTen(pc), a5
                lea     ((LOADED_NUMBER-$1000000)).w,a6
                moveq   #9,d5
loc_14B4:
                
                move.w  #$2F,d6 
loc_14B8:
                
                addq.w  #1,d6
                sub.l   (a5),d0
                bcc.s   loc_14B8
                move.b  d6,(a6)+
                add.l   (a5)+,d0
                dbf     d5,loc_14B4
                lea     ((LOADED_NUMBER-$1000000)).w,a6
                moveq   #8,d6
loc_14CC:
                
                cmpi.b  #$30,(a6) 
                bne.w   loc_14DC
                move.b  #$20,(a6)+ 
                dbf     d6,loc_14CC
loc_14DC:
                
                movem.l (sp)+,d5-d7/a5-a6
                rts

    ; End of function WriteAsciiNumber

PowersOfTen:    dc.l 1000000000
                dc.l 100000000
                dc.l 10000000
                dc.l 1000000
                dc.l 100000
                dc.l 10000
                dc.l 1000
                dc.l 100
                dc.l 10
                dc.l 1

; =============== S U B R O U T I N E =======================================


nullsub_150A:
                
                rts

    ; End of function nullsub_150A


; =============== S U B R O U T I N E =======================================


nullsub_150C:
                
                rts

    ; End of function nullsub_150C

