
; ASM FILE data\battles\entries\battle39\cs_beforebattle.asm :
; 0x4E3D2..0x4E4DC : Cutscene before battle 39
bbcs_39:        textCursor $BD5
		loadMapFadeIn 66,3,5
		loadMapEntities ce_4E4AC
		setActscript $0,$FF,eas_Init
		setPos $7,9,8,DOWN
		setPos $1F,7,8,DOWN
		setPos $1E,8,8,DOWN
		jumpIfFlagClear $4C,cs_4E40C; Zynk is a follower
		setPos $1A,8,7,DOWN
cs_4E40C:       jumpIfFlagClear $47,cs_4E41A; Lemon is a follower
		setPos $1C,63,62,DOWN
cs_4E41A:       fadeInB
		cameraSpeed $30
		setCamDest 3,18
		nextText $0,$80         ; "I just heard that Geshp{N}lost.{W2}"
		nextSingleText $0,$80   ; "All greater devils have been{N}defeated except for Odd Eye.{W1}"
		entityActions $80,$FF
		 moveDown 1
		endActions
		nextText $0,$80         ; "This is a good chance for us{N}to become greater devils!{W2}"
		nextSingleText $0,$80   ; "I'm sure Zeon will promote{N}us if we can get the jewel.{W1}"
		setActscript $81,$0,eas_Jump
		setActscript $82,$0,eas_Jump
		setActscript $83,$0,eas_Jump
		setActscript $84,$FF,eas_Jump
		csWait 50
		entityActions $83,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$83   ; "Look over there!{W1}"
		entityActions $84,$FF
		 moveUp 1
		endActions
		setFacing $80,UP
		setCamDest 3,5
		csWait 60
		setCamDest 3,18
		nextSingleText $0,$83   ; "They're coming!{W1}"
		customActscript $80,$FF
		ac_setSpeed 6168        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $80,$FF
		 moveDown 3
		endActions
		setFacing $80,UP
		nextSingleText $0,$80   ; "Excellent!{N}Welcome to your graveyard!{W1}"
		csc_end
ce_4E4AC:       mainEntity 8,9,DOWN
		entity 8,20,DOWN,97,eas_Init
		entity 7,23,UP,138,eas_Init
		entity 9,23,UP,148,eas_Init
		entity 6,23,UP,129,eas_Init
		entity 10,23,UP,95,eas_Init
		dc.w $FFFF
