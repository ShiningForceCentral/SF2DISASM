
; ASM FILE data\battles\entries\battle08\cs_afterbattle.asm :
; 0x4AA74..0x4ABFE : Cutscene after battle 8
abcs_battle08:  textCursor $9A4
		loadMapFadeIn 72,8,32
		loadMapEntities ce_4ABBE
		setActscript $0,$FF,eas_Init
		stopEntity $81
		customActscript $81,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		jumpIfFlagSet $6,cs_4AAB6; Kiwi joined
		setPos $6,63,63,DOWN
cs_4AAB6:       fadeInB
		nextSingleText $0,$80   ; "The game will be suspended.{N}OK?"
		setFacing $80,LEFT
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setFacing $80,UP
		moveEntity $80,$FF,$1,$1
		endMove $8080
		setFacing $80,RIGHT
		nextSingleText $0,$80   ; "....{W1}"
		setActscript $81,$FF,eas_Init
		entitySprite $81,$3B
		setFacing $81,LEFT
		nextSingleText $C0,$81  ; "{LEADER}, are you ready{N}for battle?{D3}"
		entitySprite $81,$CA
		setFacing $81,DOWN
		nextSingleText $C0,$81  ; "Do you need more preparations?"
		setActscript $81,$FF,eas_Init
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 120
		setFacing $81,LEFT
		startEntity $81
		nextSingleText $C0,$81  ; "Did you change your mind?{W2}"
		setFacing $81,DOWN
		nextSingleText $C0,$81  ; "Be careful.{D1}{N}Haste makes waste.{D1}"
		setActscript $80,$0,eas_BumpRight
		customActscript $81,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $81,$FF,eas_4618A
		csWait 8
		moveEntity $81,$FF,$0,$1
		endMove $8080
		setFacing $81,DOWN
		entityShakeHead $81
		nextText $0,$80         ; "{LEADER}, you had better{N}take a rest now.{D3}"
		nextSingleText $0,$80   ; "{LEADER}, to retreat is{N}sometimes a good strategy.{D3}"
		setFacing $81,LEFT
		nextText $C0,$81        ; "{LEADER}, are you ready?{D3}"
		nextText $C0,$81        ; "{LEADER}, you are going to{N}battle again."
		nextText $C0,$81        ; "{LEADER}, take it easy!{W1}"
		nextSingleText $C0,$81  ; "{LEADER}, take it easy!{W1}"
		setFacing $81,RIGHT
		csWait 20
		setFacing $6,RIGHT
		setCamDest 22,32
		csWait 30
		setCamDest 8,32
		moveEntity $80,$FF,$0,$1
		endMove $8080
		setActscript $80,$FF,eas_Jump
		nextText $0,$80         ; "{LEADER}, are you ready?{D3}"
		nextSingleText $0,$80   ; "Do you need more preparations?"
		setFacing $80,DOWN
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$80   ; "You changed your mind?{W2}"
		mapSysEvent $49,$3E,$31,$2
		csc_end
ce_4ABBE:       mainEntity 14,37,UP
		entity 14,35,UP,202,eas_Init
		entity 13,36,UP,1,eas_Init
		entity 12,35,UP,3,eas_Init
		entity 15,36,UP,4,eas_Init
		entity 16,35,UP,2,eas_Init
		entity 16,34,LEFT,6,eas_Init
		entity 14,34,DOWN,202,eas_Init
		dc.w $FFFF
