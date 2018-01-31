
; ASM FILE data\maps\entries\map15\mapsetups\s6.asm :
; 0x5D04C..0x5D1CA : 

; =============== S U B R O U T I N E =======================================

ms_map15_InitFunction:
		
		rts

	; End of function ms_map15_InitFunction

cs_5D04E:       textCursor $7D6
		setFacing $0,RIGHT
		setDest $7,24,17
		setFacing $7,RIGHT
		setPos $14,31,33,UP
		csWait 1
		setCamDest 26,22
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setPos $7,24,17,RIGHT
		setPos $1F,24,16,RIGHT
		setPos $0,24,18,RIGHT
		fly $14,$FFFF
		entityActions $14
		 moveUp 8
		endActions
		csWait 60
		setCamDest 26,20
		entityActions $14
		 moveLeft 3
		endActions
		setCamDest 20,20
		entityActions $14
		 moveUp 10
		endActions
		setCamDest 20,10
		entityActions $14
		 moveRight 4
		endActions
		setCamDest 27,10
		entityActions $14
		 moveDown 5
		endActions
		setCamDest 27,15
		entityActions $14
		 moveLeft 19
		endActions
		setCamDest 9,15
		entityActions $14
		 moveUp 10
		endActions
		setCamDest 9,5
		entityActions $14
		 moveRight 13
		endActions
		setCamDest 20,5
		entityActions $14
		 moveDown 7
		endActions
		setCamDest 20,12
		csWait 60
		setDest $14,26,18
		setFacing $14,LEFT
		nextSingleText $80,$14  ; "Excuse me, are you{N}{LEADER} of Granseal?{W1}"
		entityActionsWait $7
		 moveRight 2
		endActions
		setFacing $7,DOWN
		setFacing $14,UP
		nextSingleText $0,$7    ; "Yes, he's {LEADER},{N}but who are you?{W1}"
		nextSingleText $80,$14  ; "I'm {NAME;20} of Bedoe.{W1}"
		shiver $7
		nextSingleText $0,$7    ; "Bedoe?{W1}"
		nextSingleText $80,$14  ; "{LEADER} saved my life{N}there.{W1}"
		setActscriptWait $7,eas_Jump
		setActscriptWait $7,eas_Jump
		nextText $0,$7          ; "{LEADER} saved...{W2}"
		nextSingleText $0,$7    ; "Oh, yes!  I remember!{W1}"
		nextText $80,$14        ; "You remember me?{W2}"
		nextSingleText $80,$14  ; "Let me thank you.{N}May I go with you?{W1}"
		entityActionsWait $7
		 moveLeft 1
		 moveDown 1
		 faceRight 40
		endActions
		entityActionsWait $7
		 moveUp 1
		 moveRight 1
		 faceDown 40
		endActions
		entityActionsWait $7
		 moveLeft 1
		 moveDown 1
		 faceRight 40
		endActions
		setFacing $14,LEFT
		nextSingleText $0,$7    ; "You grew up quickly, huh?{W1}"
		nextSingleText $80,$14  ; "Yeah, I learned how to fight.{W1}"
		join $14
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $14,$0,$5
		fly $14,$0
		csc_end
