
; ASM FILE data\battles\entries\battle06\cs_beforebattle.asm :
; 0x49BCA..0x49CE2 : Cutscene before battle 6
bbcs_06:        textCursor $926
		loadMapFadeIn 66,25,5
		loadMapEntities ce_49CBA
		setActscript $0,$FF,eas_Init
		setActscript $5,$FF,eas_Init
		setActscript $80,$FF,eas_Init
		setActscript $81,$FF,eas_Init
		setActscript $82,$FF,eas_Init
		playSound MUSIC_MAIN_THEME
		fadeInB
		nextSingleText $0,$81   ; "Halt!{W1}"
		setActscript $5,$0,eas_Jump
		setActscript $0,$FF,eas_Jump
		setCamDest 31,9
		nextSingleText $0,$81   ; "How did you get past the{N}Galam guards?{W1}"
		nextSingleText $0,$82   ; "No one is allowed to leave{N}'til we conquer Granseal!{W1}"
		nextSingleText $C0,$5   ; "I know...ah...but...{N}King Galam...left this{N}behind.{W1}"
		setFacing $81,DOWN
		entityShakeHead $82
		setFacing $81,LEFT
		nextSingleText $0,$81   ; "And you want to bring it to{N}him?  Hmmmm.  I don't know....{W1}"
		moveEntity $80,$FF,$1,$5
		endMove $8080
		setFacing $80,RIGHT
		nextSingleText $0,$80   ; "What's going on here?{W1}"
		setFacing $82,LEFT
		nextSingleText $0,$82   ; "They want to deliver a{N}package to the King.{W1}"
		setFacing $80,UP
		csWait 30
		setFacing $80,RIGHT
		nextText $0,$80         ; "To King Galam?  It sounds{N}important.{W2}"
		nextSingleText $0,$80   ; "But he has not rescinded{N}his orders yet....{N}I had better deliver it.{W1}"
		setFacing $80,UP
		nextSingleText $0,$80   ; "I'll get the package from{N}them.{W1}"
		nextSingleText $C0,$5   ; "I think we're in trouble!{W1}"
		setCameraEntity $80
		moveEntity $80,$FF,$2,$2
		moreMove $1,$4
		endMove $8080
		nextSingleText $0,$80   ; "Hand it over.{N}I'll deliver it to...?{N}You!!!{W1}"
		setCameraEntity $FFFF
		setActscript $80,$FF,eas_46172
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$80   ; "How did you escape from{N}jail?!{W1}"
		setActscript $80,$FF,eas_Init
		setFacing $80,DOWN
		nextSingleText $0,$80   ; "Hey, these are the Granseal{N}spies!{W1}"
		nextSingleText $C0,$5   ; "Oops!  That didn't work!{W1}"
		setStoryFlag $7         ; Battle 7 unlocked
		csc_end
ce_49CBA:       mainEntity 30,9,DOWN
		entity 29,8,DOWN,5,eas_Init
		entity 32,20,UP,66,eas_Init
		entity 36,13,LEFT,66,eas_Init
		entity 37,14,UP,120,eas_Init
		dc.w $FFFF
