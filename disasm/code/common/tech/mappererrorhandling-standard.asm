
; ASM FILE code\common\tech\mappererrorhandling-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; Display an explanatory error message on the screen in case the memory
;  mapper initialization failed, suggesting to the user to try patching the
;  ROM header with the string "SSF" if it's not already present.


MapperErrorHandling:
                
                jsr     (EnableDisplayAndInterrupts).w
                
                ; Start loading error message into Plane A layout
                lea     aMemoryMapping(pc), a0
                lea     ($FFFFC1C6).w,a1
                bsr.s   LoadMapperErrorString
                
                ; Is "SSF" string in header?
                lea     aSsf(pc), a0
                lea     (aSegaGenesis+5).w, a1  ; System ID string location
                moveq   #2,d0
@Loop:          cmpm.b  (a0)+,(a1)+
                dbne    d0,@Loop
                beq.s   @DmaLayout
                
                ; Continue loading error message if not
                lea     aPleaseTry(pc), a0
                lea     ($FFFFC306).w,a1
                bsr.s   LoadMapperErrorString
                lea     aAtAddress(pc), a0
                lea     ($FFFFC384).w,a1
                bsr.s   LoadMapperErrorString
                lea     aSsfString(pc), a0
                lea     ($FFFFC40C).w,a1
                bsr.s   LoadMapperErrorString
                lea     aToActivate(pc), a0
                lea     ($FFFFC488).w,a1
                bsr.s   LoadMapperErrorString
                lea     aMapperOn(pc), a0
                lea     ($FFFFC50A).w,a1
                bsr.s   LoadMapperErrorString
                
@DmaLayout:     lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                lea     (PALETTE_1_CURRENT).l,a0
                move.l  #$EEE,(a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                clr.l   (a0)+
                jsr     (ApplyVIntCramDma).w
                jsr     (WaitForDmaQueueProcessing).w
@InfiniteLoop:  bra.s   @InfiniteLoop

    ; End of function MapperError


; =============== S U B R O U T I N E =======================================


LoadMapperErrorString:
                
                clr.w   d0
@Loop:          move.b  (a0)+,d0
                beq.s   @Return
                move.w  d0,(a1)+
                bra.s   @Loop
@Return:        rts

    ; End of function LoadMapperErrorString

aMemoryMapping: dc.b '!! MEMORY MAPPING ERROR !!',0
aPleaseTry:     dc.b 'PLEASE TRY PATCHING HEADER',0
aAtAddress:     dc.b 'AT ADDRESS 0X105 WITH STRING',0
aSsfString:     dc.b '"SSF"   ( 0X535346 )',0
aToActivate:    dc.b 'TO ACTIVATE EXTENDED '
aSsf:           dc.b 'SSF',0
aMapperOn:      dc.b 'MAPPER ON THIS DEVICE.',0
