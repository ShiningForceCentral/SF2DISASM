
; GAME SECTION 10 :
; Backgrounds, invocation sprites, title screen

; FREE SPACE : 432 bytes.


p_pt_Backgrounds:   dc.l pt_Backgrounds
p_pt_InvocationSprites:
										dc.l pt_InvocationSprites

; =============== S U B R O U T I N E =======================================

titleScreen:
										
										jmp     *+4(pc)
										jsr     (DisableDisplayAndVInt).w
										jsr     (ClearVsramAndSprites).w
										move.w  #$8C00,d0
										jsr     (SetVdpReg).w   
										move.w  #$9000,d0
										jsr     (SetVdpReg).w   
										move.w  #$8230,d0
										jsr     (SetVdpReg).w   
										move.w  #$8407,d0
										jsr     (SetVdpReg).w   
										move.w  #$8B00,d0
										jsr     (SetVdpReg).w   
										lea     TitleScreenTiles(pc), a0
										lea     (FF6802_LOADING_SPACE).l,a1
										jsr     (LoadTileData).w
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($2000).w,a1
										move.w  #$1000,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgain).w
										lea     TitleScreenLayoutA(pc), a0
										lea     (byte_FFC000).l,a1
										move.w  #$700,d7
										jsr     (CopyBytes).w   
										lea     TitleScreenLayoutA(pc), a0
										lea     (byte_FFC358).l,a1
										moveq   #$10,d7
										jsr     (CopyBytes).w   
										lea     (byte_FFC398).l,a1
										jsr     (CopyBytes).w   
										lea     (byte_FFC480).l,a1
										moveq   #$40,d7 
										jsr     (CopyBytes).w   
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgain).w
										lea     TitleScreenLayoutB(pc), a0
										lea     (byte_FFDCA8).l,a1
										moveq   #$A,d7
loc_1000B8:
										
										moveq   #$1F,d6
										moveq   #0,d2
loc_1000BC:
										
										move.w  (a0),d1
										beq.w   loc_100104
										tst.w   d2
										beq.w   loc_1000DE
										move.w  -2(a0),d3
										addq.w  #1,d3
										cmp.w   d1,d3
										bne.w   loc_1000DE
										moveq   #0,d2
										addq.b  #4,-6(a1)
										bra.w   loc_100104
loc_1000DE:
										
										move.w  #$E,d0
										sub.w   d7,d0
										lsl.w   #3,d0
										addi.w  #$80,d0 
										move.w  d0,(a1)+
										addq.l  #2,a1
										ori.w   #$2000,d1
										move.w  d1,(a1)+
										move.w  #$1F,d0
										sub.w   d6,d0
										lsl.w   #3,d0
										addi.w  #$80,d0 
										move.w  d0,(a1)+
										moveq   #$FFFFFFFF,d2
loc_100104:
										
										addq.l  #2,a0
										dbf     d6,loc_1000BC
										dbf     d7,loc_1000B8
										lea     plt_TitleScreen(pc), a0
										lea     (FFD080_Palette1bis).l,a1
										move.w  #$80,d7 
										jsr     (CopyBytes).w   
										jsr     j_LoadTitleScreenFont
										move.l  #$AE0405,(dword_FFDCA0).l
										move.l  #$C062014E,(dword_FFDCA4).l
										jsr     (EnableDisplayAndInterrupts).w
										move.w  #$18,d6
										jsr     (ClearOtherVscrollStuff).w
										move.w  #$FFE8,d6
										jsr     (ClearVscrollStuff).w
										move.w  #0,d6
										jsr     (ClearOtherHscrollStuff).w
										move.w  #0,d6
										jsr     (ClearHscrollStuff).w
										jsr     (Set_FFDE94_bit3).w
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((unk_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #1,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #$64,d0 
										bsr.w   WaitForPlayer1InputStart
										moveq   #$20,d0 
										bsr.w   sub_100218
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((unk_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #2,((FADING_PALETTE_FLAGS-$1000000)).w
										moveq   #$10,d0
										bsr.w   sub_100218
										moveq   #$32,d0 
										bsr.w   WaitForPlayer1InputStart
										move.b  #1,((FADING_SETTING-$1000000)).w
										clr.w   ((unk_FFDFAA-$1000000)).w
										clr.b   ((FADING_POINTER-$1000000)).w
										move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
										move.b  #4,((FADING_PALETTE_FLAGS-$1000000)).w
										move.w  #$78,d0 
										bsr.w   WaitForPlayer1InputStart
										move.w  #$12C,d0
										bsr.w   WaitForPlayer1InputStart
										move.w  #$258,d0
										bsr.w   titleScreenEnd
										jsr     (FadeOutToWhite).w
										lea     (FFD080_Palette1bis).l,a0
										moveq   #$1F,d7
loc_1001EC:
										
										move.l  #$EEE0EEE,(a0)+
										dbf     d7,loc_1001EC
										moveq   #$1E,d0
										bsr.w   WaitForPlayer1InputStart
										jsr     (FadeOutToBlack).w
										clr.w   d0
										rts

	; End of function titleScreen


; =============== S U B R O U T I N E =======================================

; wait during d0 frames

WaitForPlayer1InputStart:
										
										jsr     (WaitForVInt).w 
										btst    #7,((RAM_Input_Player1_StateA-$1000000)).w
										bne.w   loc_10029E
										subq.w  #1,d0
										bne.s   WaitForPlayer1InputStart
										rts

	; End of function WaitForPlayer1InputStart


; =============== S U B R O U T I N E =======================================

sub_100218:
										
										btst    #0,((byte_FFDEA0-$1000000)).w
										bne.s   loc_10022C
										addq.w  #1,(FFD500_MaybeRelatedToVscroll).l
										subq.w  #1,(FFD502_MaybeRelatedToOtherVScrollStuff).l
loc_10022C:
										
										jsr     (StoreVdpCommandsbis).w
										jsr     (SetFFDE94b3andWait).w
										btst    #7,((RAM_Input_Player1_StateA-$1000000)).w
										bne.w   loc_10029E
										subq.w  #1,d0
										bne.s   sub_100218
										rts

	; End of function sub_100218


; =============== S U B R O U T I N E =======================================

titleScreenEnd:
										
										movem.w d0,-(sp)
										lea     TitleScreenLayoutA(pc), a0
										ext.l   d0
										divs.w  #$1E,d0
										swap    d0
										addq.w  #1,d0
										cmpi.w  #$A,d0
										ble.s   loc_100260
										lea     $480(a0),a0
loc_100260:
										
										lea     (byte_FFC480).l,a1
										moveq   #$40,d7 
										jsr     (CopyBytes).w   
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$380,d0
										moveq   #2,d1
										jsr     (BwahDMAstuffAgainbis).w
										jsr     (Set_FFDE94_bit3).w
										movem.w (sp)+,d0
										jsr     (WaitForVInt).w 
										btst    #7,((RAM_Input_Player1_StateA-$1000000)).w
										bne.w   loc_10029E
										subq.w  #1,d0
										bne.s   titleScreenEnd
										rts
loc_10029E:
										
										move.l  (sp)+,d0
										clr.w   d6
										jsr     (ClearOtherVscrollStuff).w
										jsr     (ClearVscrollStuff).w
										jsr     (ClearOtherHscrollStuff).w
										jsr     (ClearHscrollStuff).w
										jsr     (Set_FFDE94_bit3).w
										jsr     (FadeOutToBlack).w
										moveq   #$FFFFFFFF,d0
										rts

	; End of function titleScreenEnd

plt_TitleScreen:    incbin "graphics/specialscreens/titlescreen/titlepalettes.bin"
TitleScreenTiles:   incbin "graphics/specialscreens/titlescreen/titletiles.bin"
TitleScreenLayoutA: incbin "graphics/specialscreens/titlescreen/titlelayoutA.bin"
TitleScreenLayoutB: incbin "graphics/specialscreens/titlescreen/titlelayoutB.bin"
pt_Backgrounds:     dc.l Background00
										dc.l Background01
										dc.l Background02
										dc.l Background03
										dc.l Background04
										dc.l Background05
										dc.l Background06
										dc.l Background07
										dc.l Background08
										dc.l Background09
										dc.l Background10
										dc.l Background11
										dc.l Background12
										dc.l Background13
										dc.l Background14
										dc.l Background15
										dc.l Background16
										dc.l Background17
										dc.l Background18
										dc.l Background19
										dc.l Background20
										dc.l Background12
										dc.l Background12
										dc.l Background23
										dc.l Background24
										dc.l Background25
										dc.l Background26
										dc.l Background27
										dc.l Background28
										dc.l Background13
Background00:       incbin "graphics/battles/backgrounds/background00.bin"
Background01:       incbin "graphics/battles/backgrounds/background01.bin"
Background02:       incbin "graphics/battles/backgrounds/background02.bin"
Background03:       incbin "graphics/battles/backgrounds/background03.bin"
Background04:       incbin "graphics/battles/backgrounds/background04.bin"
Background05:       incbin "graphics/battles/backgrounds/background05.bin"
Background06:       incbin "graphics/battles/backgrounds/background06.bin"
Background07:       incbin "graphics/battles/backgrounds/background07.bin"
Background08:       incbin "graphics/battles/backgrounds/background08.bin"
Background09:       incbin "graphics/battles/backgrounds/background09.bin"
Background10:       incbin "graphics/battles/backgrounds/background10.bin"
Background11:       incbin "graphics/battles/backgrounds/background11.bin"
Background12:       incbin "graphics/battles/backgrounds/background12.bin"
Background13:       incbin "graphics/battles/backgrounds/background13.bin"
Background14:       incbin "graphics/battles/backgrounds/background14.bin"
Background15:       incbin "graphics/battles/backgrounds/background15.bin"
Background16:       incbin "graphics/battles/backgrounds/background16.bin"
Background17:       incbin "graphics/battles/backgrounds/background17.bin"
Background18:       incbin "graphics/battles/backgrounds/background18.bin"
Background19:       incbin "graphics/battles/backgrounds/background19.bin"
Background20:       incbin "graphics/battles/backgrounds/background20.bin"
Background23:       incbin "graphics/battles/backgrounds/background23.bin"
Background24:       incbin "graphics/battles/backgrounds/background24.bin"
Background25:       incbin "graphics/battles/backgrounds/background25.bin"
Background26:       incbin "graphics/battles/backgrounds/background26.bin"
Background27:       incbin "graphics/battles/backgrounds/background27.bin"
Background28:       incbin "graphics/battles/backgrounds/background28.bin"
pt_InvocationSprites:
										dc.l InvocationSpriteDao
										dc.l InvocationSpriteApollo
										dc.l InvocationSpriteNeptun
										dc.l InvocationSpriteAtlas
InvocationSpriteDao:incbin "graphics/battles/spells/invocations/dao.bin"
InvocationSpriteApollo:
										incbin "graphics/battles/spells/invocations/apollo.bin"
InvocationSpriteNeptun:
										incbin "graphics/battles/spells/invocations/neptun.bin"
InvocationSpriteAtlas:
										incbin "graphics/battles/spells/invocations/atlas.bin"
										align $8000
