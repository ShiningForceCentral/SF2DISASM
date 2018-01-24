
; ASM FILE data\battles\entries\battle32\cs_afterbattle.asm :
; 0x4CDB4..0x4CF0C : Cutscene after battle 32
abcs_battle32:  textCursor $B25
		loadMapFadeIn 74,5,20
		loadMapEntities ce_4CEEC
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,11,25,UP
		setActscript $1F,$FF,eas_Init
		setPos $1F,9,25,UP
		setActscript $16,$FF,eas_Init
		setPos $16,11,26,UP
		setActscript $1E,$FF,eas_Init
		setPos $1E,10,26,UP
		setActscript $17,$FF,eas_Init
		setPos $17,10,22,DOWN
		fadeInB
		entityActions $7,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$7    ; "I can't believe it!{N}You might have been killed{N}by the devils.{W1}"
		nextSingleText $0,$1F   ; "Indeed!  Why did you{N}change your mind?{W1}"
		entityActions $17,$FF
		 moveDown 1
		endActions
		nextText $C0,$17        ; "I'm {NAME;23}, from Galam.{N}I was waiting for the chance{N}to escape from them.{W2}"
		nextSingleText $C0,$17  ; "I can't stand their wicked{N}ways!{W1}"
		entityActions $7,$FF
		 moveUp 1
		endActions
		setFacing $7,LEFT
		setFacing $17,RIGHT
		nextSingleText $0,$7    ; "You have the same opinion{N}of them as we do.{W1}"
		nextSingleText $C0,$17  ; "Please let me join you!{N}I could be a great help to{N}you.{W2}"
		setFacing $17,DOWN
		nextSingleText $C0,$17  ; "You need a professional{N}soldier like me.{W1}"
		nextSingleText $0,$1F   ; "Oh, we welcome you.{W1}"
		setActscript $7,$FF,eas_46172
		entityActions $7,$FF
		 moveRight 1
		endActions
		nextSingleText $0,$7    ; "But, he was on the other{N}side just an minute ago.{W1}"
		entityActions $1F,$FF
		 moveUp 1
		endActions
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "I don't care, {NAME;7}.{N}He has seen the error of his{N}ways.{W1}"
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "{LEADER}, don't you want{N}{NAME;23} to join our{N}force?{W1}"
		entityNod $0
		join $17
		joinForceAI $17,$0      ; 0054 JOIN FORCE WITH AI
		entityActions $17,$FF
		 moveDown 1
		endActions
		nextSingleText $C0,$17  ; "Oh, thank you!{W2}"
		setActscript $17,$FF,eas_Jump
		setActscript $17,$FF,eas_Jump
		nextSingleText $C0,$17  ; "I'll try to do my best!{W1}"
		executeSubroutine csub_4CEE4
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		followEntity $16,$1E,$2
		followEntity $17,$16,$2
		csc_end

; =============== S U B R O U T I N E =======================================

csub_4CEE4:
		moveq   #$17,d0
		jmp     j_LeaveBattleParty

	; End of function csub_4CEE4

ce_4CEEC:       mainEntity 10,25,UP
		entity 11,25,UP,7,eas_Init
		entity 11,26,UP,22,eas_Init
		entity 10,22,DOWN,23,eas_Init
		dc.w $FFFF
