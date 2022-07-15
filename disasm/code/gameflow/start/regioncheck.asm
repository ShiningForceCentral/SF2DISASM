
; ASM FILE code\gameflow\start\regioncheck.asm :
; 0x7EC6..0x7FA4 : Region check function

; =============== S U B R O U T I N E =======================================


CheckRegion:
                
                move.b  (HW_Info).l,d0  
                andi.b  #$C0,d0
                cmpi.b  #$80,d0
                beq.w   @Return
                bsr.w   EnableDisplayAndInterrupts
                lea     aDevelopedForUseOnlyWith(pc), a0
                lea     (byte_FFC286).l,a1
                bsr.w   LoadRegionCheckString
                lea     aNtscGenesys(pc), a0
                lea     (byte_FFC350).l,a1
                bsr.w   LoadRegionCheckString
                lea     aSystems_(pc), a0
                lea     (byte_FFC41A).l,a1
                bsr.w   LoadRegionCheckString
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                lea     (PALETTE_1_CURRENT).l,a0
                move.l  #$EEE,(a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                bsr.w   ApplyVIntCramDma
                bsr.w   WaitForDmaQueueProcessing
@InfiniteLoop:
                
                bra.s   @InfiniteLoop
@Return:
                
                rts

    ; End of function CheckRegion


; =============== S U B R O U T I N E =======================================


LoadRegionCheckString:
                
                clr.w   d0
                move.b  (a0)+,d0
                beq.s   @Return
                move.w  d0,(a1)+
                bra.s   LoadRegionCheckString
@Return:
                
                rts

    ; End of function LoadRegionCheckString

aDevelopedForUseOnlyWith:
                dc.b 'DEVELOPED FOR USE ONLY WITH',0
aNtscGenesys:   dc.b '  NTSC GENESYS',0
                dc.b $26
                dc.b 0
aPalAndFrenchSe:dc.b 'PAL AND FRENCH SECAM MEGA DRIVE',0
aSystems_:      dc.b 'SYSTEMS.',0
