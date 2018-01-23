
; ASM FILE data\maps\entries\map52\mapsetups\s6.asm :
; 0x5C4D6..0x5C638 : 

; =============== S U B R O U T I N E =======================================

ms_map52_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2CA
		beq.s   return_5C4EC

	; End of function ms_map52_InitFunction


; =============== S U B R O U T I N E =======================================

sub_5C4DC:
		trap    #CHECK_FLAG
		dc.w $2C8
		bne.s   return_5C4EC
		lea     byte_5C622(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2C8               ; set after Peter delivers his lines after the cliffs before Bedoe battle
return_5C4EC:
		rts

	; End of function sub_5C4DC

byte_5C4EE:     textCursor $575
		cameraSpeed $30
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setEntityDest $0,5,23
		setEntityDest $7,4,22
		moveEntity $7,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$7    ; "Who are they?{W1}"
		setCamDest 16,4
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 5
		setActscript $82,$0,eas_461B6
		nextSingleText $0,$7    ; "They're looking for something.{W1}"
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 5
		setActscript $82,$0,eas_461B6
		moveEntity $83,$FF,$1,$6
		endMove $8080
		csWait 40
		nextSingleText $0,$83   ; "He's not here...not under{N}the cliff....{W1}"
		moveEntity $81,$FF,$1,$2
		moreMove $0,$1
		endMove $8080
		setFacing $80,LEFT
		nextText $0,$81         ; "There are marks of a battle{N}here and there!{W2}"
		nextSingleText $0,$81   ; "Against the birdmen of{N}Bedoe?{W1}"
		entityNod $80
		nextText $0,$80         ; "Could be...{W2}"
		nextSingleText $0,$80   ; "see those volcanic rocks?{W1}"
		csWait 5
		setActscript $81,$0,eas_461E4
		csWait 60
		nextText $0,$80         ; "Nobody but Volcanon can do{N}that!{W2}"
		setFacing $81,RIGHT
		nextSingleText $0,$80   ; "He has never before killed{N}birdmen, but...{W1}"
		moveEntity $83,$FF,$3,$1
		endMove $8080
		csWait 40
		customActscript $83,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $83,$FF,$3,$2
		moreMove $2,$1
		endMove $8080
		nextSingleText $0,$83   ; "Who's that?{W1}"
		setFacing $83,DOWN
		setCamDest 0,17
		setFacing $0,UP
		setFacing $7,DOWN
		csWait 50
		setCamDest 16,7
		setActscript $83,$FF,eas_Init
		setActscript $83,$FF,eas_46172
		moveEntity $83,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$83   ; "Stupid Polca kids!{W1}"
		moveEntity $80,$FF,$3,$2
		moreMove $2,$2
		moreMove $3,$1
		endMove $8080
		nextText $0,$80         ; "Polcan people are cowards that{N}live in peace.{W2}"
		setFacing $80,UP
		setFacing $83,UP
		nextSingleText $0,$80   ; "They shall never return{N}alive!{W1}"
		setStoryFlag $C         ; Battle 12 unlocked
		mapSysEvent $34,$0,$0,$0
		csc_end
byte_5C622:     setPos $7,22,8,RIGHT
		textCursor $9BD
		fadeInB
		nextText $0,$7          ; "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
		nextSingleText $0,$7    ; "Why do the devils want you?{W1}"
		csc_end
