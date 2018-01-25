
; ASM FILE data\maps\entries\map08\mapsetups\s5.asm :
; 0x562E0..0x563A2 : 
ms_map8_Section5:
		dc.b $F
		dc.b $13
		dc.b 1
		dc.b $70
		dc.w sub_562F2-ms_map8_Section5
		dc.b $10
		dc.b $13
		dc.b 1
		dc.b $70
		dc.w sub_562F2-ms_map8_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w return_56312-ms_map8_Section5

; =============== S U B R O U T I N E =======================================

sub_562F2:
		trap    #CHECK_FLAG
		dc.w $2DB               ; set after you open the tree in Ribble with the wooden plank
		beq.s   loc_562FC
		moveq   #0,d6
		bra.s   return_56312
loc_562FC:
		lea     cs_56314(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2DB               ; set after you open the tree in Ribble with the wooden plank
		moveq   #$70,d0 
		jsr     sub_4F542       ; remove wooden panel from items ?
		move.w  #$FFFF,d6
return_56312:
		rts

	; End of function sub_562F2

cs_56314:       hideText
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setQuake 2
		csWait 60
		setActscript $0,eas_Jump
		setActscriptWait $7,eas_Jump
		entityActions $0
		 moveDown 2
		endActions
		entityActionsWait $7
		 moveDown 2
		endActions
		setFacing $0,UP
		setFacing $7,UP
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks 32,17,2,2,15,19
		csWait 30
		setQuake 0
		csWait 30
		setQuake 2
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks 34,17,2,2,15,19
		csWait 30
		setQuake 0
		csWait 30
		setQuake 2
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks 32,14,2,2,15,19
		csWait 30
		setQuake 0
		csWait 30
		followEntity $7,$0,$2
		csc_end
