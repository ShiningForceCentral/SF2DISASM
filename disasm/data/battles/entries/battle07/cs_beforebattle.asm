
; ASM FILE data\battles\entries\battle07\cs_beforebattle.asm :
; 0x49CE2..0x49F7E : Cutscene before battle 7
bbcs_07:        textCursor $935
		clearF $53              ; King + Minister are followers
		loadMapFadeIn 58,8,29
		loadMapEntities ce_49F36
		setActscript $0,$FF,eas_Init
		animEntityFadeInOut $85,$4
		fadeInB
		cameraSpeed $28
		nextSingleText $C0,$80  ; "Astral, you're so persistent!{W1}"
		setCamDest 8,15
		nextSingleText $0,$81   ; "King Galam, what do you{N}intend to do?{W1}"
		nextSingleText $C0,$80  ; "You wouldn't understand.{W1}"
		nextSingleText $0,$83   ; "Astral, save her!{W1}"
		setCamDest 8,13
		nextSingleText $0,$82   ; "Father!{W1}"
		moveEntity $82,$FF,$3,$1
		endMove $8080
		csWait 40
		setFacing $80,UP
		csWait 20
		setActscript $82,$FF,eas_Jump
		csWait 30
		setActscript $82,$FF,eas_46172
		moveEntity $82,$FF,$1,$1
		endMove $8080
		setFacing $80,DOWN
		setFacing $81,DOWN
		nextSingleText $0,$81   ; "King Granseal and{N}{LEADER}!{W1}"
		nextText $C0,$80        ; "Blast!{W2}"
		nextSingleText $C0,$80  ; "Give up now, King Granseal!{N}Do you want her to die?!{W1}"
		setCamDest 8,15
		setFacing $81,UP
		nextText $0,$81         ; "No!  You give up!{N}We've got reinforcements!{W2}"
		nextSingleText $0,$81   ; "Your great magic cannot{N}defeat all of our soldiers!{W1}"
		nextSingleText $C0,$80  ; "I'll kill you before they{N}have a chance to attack!{W1}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$81   ; "Just try it!{W1}"
		moveEntity $81,$FF,$1,$1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
		setQuake 2
		playSound SFX_LIGHTNING_1
		setActscript $81,$FF,eas_BumpUp
		setQuake 0
		csWait 50
		setActscript $80,$0,eas_BumpDown
		setQuake 3
		playSound SFX_LIGHTNING_2
		setActscript $81,$FF,eas_BumpUp
		setQuake 0
		setActscript $81,$0,eas_Jump
		entityNod $80
		setActscript $81,$FF,eas_BumpDown
		setQuake 2
		playSound SFX_DOOR_OPEN
		setActscript $80,$FF,eas_BumpUp
		setQuake 0
		csWait 40
		setActscript $80,$0,eas_BumpDown
		setQuake 3
		playSound SFX_HIT_2
		setActscript $81,$FF,eas_BumpUp
		setQuake 0
		setActscript $80,$0,eas_Jump
		entityNod $81
		setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		csWait 30
		moveEntity $80,$0,$1,$1
		endMove $8080
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextSingleText $C0,$80  ; "Astral...{W1}"
		nextSingleText $0,$81   ; "Gguuu....{W1}"
		stopEntity $80
		stopEntity $81
		customActscript $80,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $81,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $80,UP
		nextSingleText $C0,$80  ; "I've beaten you!{N}You've lost!{W1}"
		nextText $0,$81         ; "But, so have you!{N}Or had you not noticed?{W2}"
		nextSingleText $0,$81   ; "You cannot move.{N}Princess Elis, run away!{W1}"
		setCamDest 8,13
		nextSingleText $0,$82   ; "I'll try.{W1}"
		customActscript $82,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $82,$0,$3,$3
		endMove $8080
		csWait 10
		setPos $85,12,18,UP
		animEntityFadeInOut $85,$5
		waitIdle $82
		nextSingleText $0,$85   ; "Stop, my dear!{W1}"
		setActscript $82,$FF,eas_Jump
		nextSingleText $0,$82   ; "Oh!{W1}"
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setCamDest 8,15
		nextSingleText $C0,$80  ; "Hee, hee, hee...{N}I won't lose her now.{W1}"
		nextText $0,$81         ; "What should I do?{N}{LEADER}, can you hear{N}me?{W1}"
		nextSingleText $0,$81   ; "Save her.{W1}"
		entityShiver $80
		stopEntity $80
		nextSingleText $C0,$80  ; "I've no time to play with{N}these kids.{N}Devils!  I summon thee!{W1}"
		setPos $86,14,18,DOWN
		csWait 40
		setPos $87,15,18,DOWN
		setFacing $85,DOWN
		nextSingleText $0,$86   ; "Yeeeeee!{W1}"
		nextText $C0,$80        ; "Forget about Astral.{N}"
		nextText $C0,$80        ; "I'll kill him!{W2}"
		nextSingleText $C0,$80  ; "Eat them all up before{N}they reach her!{W1}"
		setActscript $85,$0,eas_Jump
		setActscript $86,$0,eas_Jump
		setActscript $87,$FF,eas_Jump
		csc_end
ce_49F36:       mainEntity 13,35,UP
		entity 13,17,DOWN,164,eas_Init
		entity 13,21,UP,209,eas_Init
		entity 12,14,DOWN,204,eas_Init
		entity 12,35,UP,203,eas_Init
		entity 14,35,UP,205,eas_Init
		entity 63,63,UP,131,eas_Init
		entity 63,63,DOWN,120,eas_Init
		entity 63,63,DOWN,67,eas_Init
		dc.w $FFFF
