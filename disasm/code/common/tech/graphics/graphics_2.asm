
; ASM FILE code\common\tech\graphics\graphics_2.asm :
; 0x1942..0x19C8 : Graphics functions, part 2

; =============== S U B R O U T I N E =======================================

; something with clearing/resetting sprite info when transitioning to battlescene?


sub_1942:
                
                movem.l d0-d2/d7-a1,-(sp)
                lea     (SPRITE_00_LINK).l,a1
                clr.w   d1
                moveq   #2,d0
                bsr.w   sub_196C        
                bsr.w   sub_196C        
                bsr.w   sub_198C        
                clr.w   d2
                move.b  d2,(a1,d1.w)
                move.w  d2,d1
                lsl.w   #3,d1
                movem.l (sp)+,d0-d2/d7-a1
                rts

    ; End of function sub_1942


; =============== S U B R O U T I N E =======================================

; related to the battlescene


sub_196C:
                
                lea     (BATTLESCENE_BATTLESPRITE_TOGGLE).l,a0
                moveq   #$3E,d7 
                moveq   #1,d2
loc_1976:
                
                cmp.b   (a0)+,d0
                bne.s   loc_1982
                move.b  d2,(a1,d1.w)
                move.w  d2,d1
                lsl.w   #3,d1
loc_1982:
                
                addq.w  #1,d2
                dbf     d7,loc_1976
                
                subq.w  #1,d0
                rts

    ; End of function sub_196C


; =============== S U B R O U T I N E =======================================

; related to the battlescene


sub_198C:
                
                lea     (BATTLESCENE_BATTLESPRITE_TOGGLE).l,a0
                moveq   #62,d7
                moveq   #1,d2
loc_1996:
                
                cmp.b   (a0)+,d0
                bne.s   loc_19A8
                move.b  d2,(a1,d1.w)
                move.w  d2,d1
                lsl.w   #3,d1
                bclr    #7,1(a1,d1.w)
loc_19A8:
                
                addq.w  #1,d2
                dbf     d7,loc_1996
                
                rts

    ; End of function sub_198C


; =============== S U B R O U T I N E =======================================

; clear table related to sprites


sub_19B0:
                
                movem.l d0/a0,-(sp)
                moveq   #63,d0
                lea     (byte_FFAFA0).l,a0
@Loop:
                
                clr.b   (a0)+
                dbf     d0,@Loop
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function sub_19B0

