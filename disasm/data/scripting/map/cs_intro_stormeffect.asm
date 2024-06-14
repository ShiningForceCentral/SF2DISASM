
; ASM FILE data\scripting\map\cs_intro_stormeffect.asm :
; 0x48FE2..0x49058 : Storm Effect

; =============== S U B R O U T I N E =======================================


ApplyStormEffect:
                
                movem.l d0/a0-a1,-(sp)
                lea     (PALETTE_1_CURRENT).l,a0
                lea     ((PALETTE_1_COPY-$1000000)).w,a1
                moveq   #7,d0
loc_48FF2:
                
                move.l  (a0)+,(a1)+     ; save current palette 1
                dbf     d0,loc_48FF2    
                lea     palette_IntroStormEffect(pc), a0
                nop
                lea     (PALETTE_1_CURRENT).l,a1
                moveq   #7,d0
loc_49006:
                
                move.l  (a0)+,(a1)+     ; replace palette 1
                dbf     d0,loc_49006    
                jsr     (ApplyVIntCramDma).w
                moveq   #10,d0
                jsr     (Sleep).w       
                lea     ((PALETTE_1_COPY-$1000000)).w,a0
                lea     (PALETTE_1_CURRENT).l,a1
                moveq   #7,d0
loc_49022:
                
                move.l  (a0)+,(a1)+     ; restore original palette
                dbf     d0,loc_49022    
                jsr     (ApplyVIntCramDma).w
                moveq   #10,d0
                jsr     (Sleep).w       
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function ApplyStormEffect

palette_IntroStormEffect:
                dc.w 0
                dc.w $C40
                dc.w $E84
                dc.w $24
                dc.w $48
                dc.w $48C
                dc.w $688
                dc.w $AAC
                dc.w 0
                dc.w $222
                dc.w $666
                dc.w $AAA
                dc.w $20E
                dc.w $6AE
                dc.w $AEE
                dc.w $EEE
