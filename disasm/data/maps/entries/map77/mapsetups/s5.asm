
; ASM FILE data\maps\entries\map77\mapsetups\s5.asm :
; 0x50A8C..0x50AE6 : 
ms_map77_Section5:
		dc.b $2B
		dc.b $2A
		dc.b 2
		dc.b $73
		dc.w sub_50A9A-ms_map77_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w nullsub_168-ms_map77_Section5

; =============== S U B R O U T I N E =======================================

nullsub_168:
		rts

	; End of function nullsub_168


; =============== S U B R O U T I N E =======================================

sub_50A9A:
		move.w  #$73,((TEXT_NAME_INDEX_1-$1000000)).w 
		trap    #TEXTBOX
		dc.w $1A5               ; "{LEADER} uses the {ITEM}.{D3}"
		trap    #CHECK_FLAG
		dc.w $384               ; set after using the Dry Stone to open the way to the Dwarven Village
		bne.s   loc_50AB6
		trap    #SET_FLAG
		dc.w $384               ; set after using the Dry Stone to open the way to the Dwarven Village
		lea     cs_50ABE(pc), a0
		trap    #6
		bra.s   loc_50ABA
loc_50AB6:
		trap    #TEXTBOX
		dc.w $1A6               ; "But nothing happened.{D1}"
loc_50ABA:
		moveq   #$FFFFFFFF,d6
		rts

	; End of function sub_50A9A

cs_50ABE:       playSound SFX_BIG_DOOR_RUMBLE
		setQuake $1
		csWait $3C
		playSound SFX_BOOST
		flashScreenWhite $14
		setBlocks $1,$1,$1,$1,$2A,$2A
		flashScreenWhite $14
		csWait $3C
		setQuake $0
		csWait $3C
		csc_end
