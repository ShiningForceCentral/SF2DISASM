
; ASM FILE data\battles\entries\battle33\cs_afterbattle.asm :
; 0x4D09A..0x4D342 : Cutscene after battle 33
abcs_battle33:  textCursor $B3C
		loadMapFadeIn 31,8,6
		loadMapEntities ce_4D322
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,13,11,UP
		setActscript $1F,$FF,eas_Init
		setPos $1F,12,9,DOWN
		setBlocks 3,39,1,1,16,8
		stopEntity $80
		setActscript $80,$FF,eas_46172
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait 4
		setActscript $80,$FF,eas_461AA
		moveEntity $1A,$0,$3,$1
		endMove $8080
		csWait 2
		setActscript $1A,$FF,eas_461AA
		setActscript $1A,$FF,eas_45F9C
		fadeInB
		nextSingleText $0,$1F   ; "There may be some survivors{N}somewhere.{W1}"
		csWait 5
		setActscript $0,$0,eas_461B6
		csWait 5
		setActscript $1F,$0,eas_461E4
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 120
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait 3
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait 3
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait 3
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait 3
		setActscript $80,$FF,eas_461AA
		setFacing $7,RIGHT
		setActscript $7,$FF,eas_Jump
		csWait 40
		moveEntity $7,$FF,$0,$3
		endMove $8080
		setFacing $7,UP
		setFacing $0,RIGHT
		setFacing $1F,RIGHT
		customActscript $80,$FF
		ac_setSpeed 6168        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait 8
		setActscript $80,$FF,eas_461AA
		csWait 50
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait 4
		setQuake 2
		setActscript $80,$FF,eas_461AA
		csWait 10
		setQuake 0
		csWait 40
		moveEntity $7,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$80   ; "Do not touch my rock!{W1}"
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_46172
		customActscript $7,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $7,$FF,$3,$2
		endMove $8080
		setCamDest 10,6
		customActscript $80,$FF
		ac_setSpeed 6168        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait 8
		setActscript $80,$FF,eas_461AA
		nextText $0,$80         ; "Did you defeat all those{N}devils?{W2}"
		nextSingleText $0,$80   ; "I was wondering why it became{N}quiet so suddenly.{W1}"
		moveEntity $1F,$0,$0,$3
		moreMove $1,$1
		endMove $8080
		moveEntity $0,$FF,$0,$4
		endMove $8080
		setFacing $1F,RIGHT
		setFacing $0,UP
		nextSingleText $0,$1F   ; "Are you a survivor?{N}Are you from Moun?{N}What's your name?{W1}"
		nextSingleText $0,$80   ; "I am {NAME;26}.{N}I am not from Moun.{W1}"
		nextSingleText $0,$1F   ; "Then, where are you from?{W1}"
		nextSingleText $0,$80   ; "The past.{W1}"
		nextSingleText $0,$1F   ; "What do you mean?{W1}"
		nextText $0,$80         ; "I cannot explain.{W2}"
		nextSingleText $0,$80   ; "I am what I am.{N}That is all that I am.{W1}"
		customActscript $80,$FF
		ac_setSpeed 10280       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $80,$FF,eas_JumpRight
		customActscript $80,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $80,$FF,eas_46172
		moveEntity $80,$0,$3,$1
		endMove $8080
		setPos $1A,16,8,DOWN
		setActscript $1A,$FF,eas_Init
		csWait 3
		setActscript $80,$FF,eas_461AA
		setQuake 2
		csWait 20
		setQuake 0
		nextText $0,$1F         ; "I've never seen anyone like{N}you.{W2}"
		nextSingleText $0,$1F   ; "Where are the people of{N}Moun?  Were there any{N}survivors?{W1}"
		nextSingleText $C0,$1A  ; "Some.{W1}"
		nextText $0,$1F         ; "That's good news.{W2}"
		nextSingleText $0,$1F   ; "And where are they?{W1}"
		nextSingleText $C0,$1A  ; "Down here.  Follow me.{W1}"
		setPos $1A,63,63,DOWN
		setActscript $7,$FF,eas_Jump
		csWait 30
		moveEntity $7,$FF,$1,$2
		endMove $8080
		setFacing $1F,DOWN
		nextText $0,$1F         ; "{LEADER}, hurry!{N}Follow {NAME;26}!{W2}"
		nextSingleText $0,$1F   ; "{NAME;26} knows where{N}they're hiding.{W1}"
		followEntity $1F,$0,$2
		followEntity $7,$1F,$2
		setF $341               ; set after the scene after you win the battle in Moun plays out
		csc_end
ce_4D322:       mainEntity 11,11,UP
		entity 13,11,UP,7,eas_Init
		entity 16,8,UP,179,eas_Init
		entity 16,8,DOWN,26,eas_Init
		dc.w $FFFF
