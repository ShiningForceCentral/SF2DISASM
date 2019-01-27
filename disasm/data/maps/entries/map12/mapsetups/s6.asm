
; ASM FILE data\maps\entries\map12\mapsetups\s6.asm :
; 0x57D04..0x57E36 : 

; =============== S U B R O U T I N E =======================================

ms_map12_InitFunction:
		
		 
		chkFlg $2D5             ; set after telling Rohde that you're going to get the Caravan
		bne.s   byte_57D10      
		lea     cs_57D22(pc), a0
		trap    #6
byte_57D10:
		chkFlg $206             ; Battle 18 completed
		beq.s   return_57D20
		move.w  #$80,d0 
		jsr     MoveEntityOutOfMap
return_57D20:
		rts

	; End of function ms_map12_InitFunction

cs_57D22:       textCursor $C7D
		cameraSpeed $30
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setPos $0,12,31,UP
		setPos $7,13,31,UP
		setPos $1F,11,31,UP
		fadeInB
		entityActions $0
		 moveUp 5
		endActions
		entityActions $7
		 moveUp 5
		endActions
		entityActionsWait $1F
		 moveUp 5
		endActions
		nextSingleText $0,$80   ; "Stop!{W1}"
		csWait 10
		setActscript $0,eas_Jump
		setActscript $7,eas_Jump
		setActscriptWait $1F,eas_Jump
		setActscript $0,eas_Jump
		setActscript $7,eas_Jump
		setActscriptWait $1F,eas_Jump
		csWait 30
		csWait 5
		setActscript $0,eas_461B6
		csWait 5
		setActscript $7,eas_461E4
		csWait 5
		setActscript $1F,eas_461B6
		csWait 80
		entityActionsWait $7
		 moveUp 1
		endActions
		setFacing $0,UP
		setFacing $1F,UP
		nextSingleText $80,$7   ; "Who said that?{W1}"
		setCamDest 7,5
		nextSingleText $80,$7   ; "Wow, what a huge guy!{W1}"
		csWait 30
		nextSingleText $0,$80   ; "Leave here!{N}I'll attack you if you don't!{W1}"
		setCamDest 7,21
		entityActionsWait $7
		 moveDown 1
		endActions
		setFacing $0,RIGHT
		setFacing $1F,RIGHT
		setFacing $7,LEFT
		nextText $80,$7         ; "Attack us?!  {LEADER},{N}let's get out of here!{W2}"
		nextSingleText $80,$7   ; "We don't want to fight him!{W1}"
		csWait 20
		nod $0
		nextSingleText $80,$7   ; "OK, hurry!{W1}"
		entityActions $0
		 moveDown 5
		endActions
		entityActions $7
		 moveDown 5
		endActions
		entityActionsWait $1F
		 moveDown 5
		endActions
		warp $44,$37,$2C,$3
		csc_end
