
; ASM FILE data\maps\entries\map06\mapsetups\s4.asm :
; 0x54D8A..0x54E4C : 

; =============== S U B R O U T I N E =======================================

ms_map6_AreaDescriptions:
		
		move.w  #$FF4,d3
		lea     word_54D9A(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map6_AreaDescriptions

word_54D9A:     dc.w $507
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $607
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $40E
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 2
		dc.w $50E
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 3
		dc.w $60E
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 4
		dc.w $1306
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 5
		dc.w $110D
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 6
		dc.w $100D
		dc.b 0
		dc.b 1
		dc.w sub_54DDE-word_54D9A
		dc.w $1D07
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 8
		dc.w $1411
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 9
		dc.w $1518
		dc.b 0
		dc.b 1
		dc.w sub_54E04-word_54D9A
		dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_54DDE:
		 
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   loc_54DEE
		move.w  #$FFB,d0
		jsr     (DisplayText).w 
		bra.s   return_54E02
loc_54DEE:
		clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
		move.w  #$1A8,d0
		jsr     (DisplayText).w 
		move.w  #$1B2,d0
		jsr     (DisplayText).w 
return_54E02:
		rts

	; End of function sub_54DDE


; =============== S U B R O U T I N E =======================================

sub_54E04:
		move.w  #$FFE,d0
		jsr     (DisplayText).w 
		jsr     j_YesNoPrompt
		tst.w   d0
		bne.s   return_54E4A
		ori.b   #0,d0
		sndCom SFX_FALLING
		moveq   #$32,d0 
		jsr     (Sleep).w       
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   loc_54E38
		sndCom SFX_BLO
		move.w  #$FFF,d0
		jsr     (DisplayText).w 
		bra.s   return_54E4A
loc_54E38:
		moveq   #$32,d0 
		jsr     (Sleep).w       
		sndCom SFX_BLO
		move.w  #$1000,d0
		jsr     (DisplayText).w 
return_54E4A:
		rts

	; End of function sub_54E04

