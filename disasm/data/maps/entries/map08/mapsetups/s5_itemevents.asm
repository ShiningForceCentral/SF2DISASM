
; ASM FILE data\maps\entries\map08\mapsetups\s5_itemevents.asm :
; 0x562E0..0x563A2 : 
ms_map8_Section5:
		msItemEvent 15, 19, UP, 112, Map8_ItemEvent0-ms_map8_Section5
		msItemEvent 16, 19, UP, 112, Map8_ItemEvent0-ms_map8_Section5
		msDefaultItemEvent return_56312-ms_map8_Section5

; =============== S U B R O U T I N E =======================================

Map8_ItemEvent0:
		
		 
		chkFlg  $2DB            ; set after you open the tree in Ribble with the wooden plank
		beq.s   byte_562FC
		moveq   #0,d6
		bra.s   return_56312
byte_562FC:
		script  cs_56314
		setFlg  $2DB            ; set after you open the tree in Ribble with the wooden plank
		moveq   #$70,d0 
		jsr     sub_4F542       ; remove wooden panel from items ?
		move.w  #$FFFF,d6
return_56312:
		rts

	; End of function Map8_ItemEvent0

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
