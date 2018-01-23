
; ASM FILE data\battles\entries\battle26\cs_afterbattle.asm :
; 0x4BCAA..0x4BE6A : Cutscene after battle 26
abcs_battle26:  textCursor $A4D
		loadMapFadeIn 72,13,11
		loadMapEntities ce_4BE4A
		setActscript $0,$FF,eas_Init
		customActscript $13,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $7,$FF,eas_Init
		setPos $7,17,14,RIGHT
		setActscript $1F,$FF,eas_Init
		setPos $1F,18,16,UP
		setPos $1E,19,17,UP
		setPriority $13,$0
		setPriority $80,$FFFF
		fadeInB
		moveEntity $7,$FF,$3,$2
		endMove $8080
		setFacing $7,RIGHT
		nextSingleText $0,$7    ; "Is he alright?{W1}"
		nextSingleText $0,$1F   ; "We have to save him before{N}he is possessed by an evil...{W1}"
		entityFlashWhite $1F,$3C
		flashScreenWhite $1E
		setCamDest 13,9
		animEntityFadeInOut $80,$4
		setPos $80,18,13,DOWN
		animEntityFadeInOut $80,$5
		setFacing $7,UP
		moveEntity $80,$FF,$1,$3
		endMove $8080
		customActscript $80,$FF
		ac_setSpeed 16448       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $80,$0,eas_4509E
		csWait 200
		setActscript $80,$FF,eas_Die
		setCamDest 13,11
		customActscript $13,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $0           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $13,DOWN
		entityShakeHead $13
		nextSingleText $C0,$13  ; "What happened?{W2}"
		moveEntity $13,$FF,$1,$1
		endMove $8080
		setActscript $13,$FF,eas_Jump
		nextSingleText $C0,$13  ; "Ah...I was almost possessed{N}by that devil.{W1}"
		moveEntity $13,$FF,$3,$2
		endMove $8080
		nextSingleText $C0,$13  ; "Thank you.{N}How can I repay you for{N}your kindness?{W1}"
		nextText $0,$1F         ; "Are you OK now?  Good.{W2}"
		nextSingleText $0,$1F   ; "May I ask you, where were{N}you going in such a wounded{N}state?{W1}"
		nextText $C0,$13        ; "Pacalon, my country.  We{N}are fighting against the{N}devils.{W2}"
		nextText $C0,$13        ; "But, no country in North{N}Parmecia has enough power{N}to resist them.{W2}"
		nextSingleText $C0,$13  ; "So, I was heading south to{N}find some allies.{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setFacing $7,RIGHT
		nextSingleText $0,$7    ; "You don't have to go any{N}further.{W1}"
		setFacing $13,LEFT
		nextSingleText $C0,$13  ; "Then, you're from South{N}Parmecia?{W1}"
		nextSingleText $0,$1F   ; "Yes, Granseal.{W1}"
		setFacing $13,DOWN
		nextSingleText $C0,$13  ; "Oh, how lucky!  Please{N}come with me to Pacalon!{W1}"
		entityNod $13
		nextSingleText $0,$7    ; "But, we have to go to{N}Tristan.{W1}"
		setFacing $13,LEFT
		nextText $C0,$13        ; "Oh, please...I can't return{N}to Pacalon without allies.{W2}"
		nextText $C0,$13        ; "Maybe, when you're done...{W2}"
		nextSingleText $C0,$13  ; "OK, I'll go with you.{W1}"
		join $13
		nextSingleText $0,$1F   ; "But, you're injured{N}Mr. {NAME;19}.{W1}"
		setFacing $13,DOWN
		nextSingleText $C0,$13  ; "No problem.  I don't know{N}why, but I'm much better.{W1}"
		setActscript $13,$0,eas_RotateRight
		csWait 40
		setActscript $13,$FF,eas_Jump
		setFacing $13,DOWN
		setActscript $13,$FF,eas_Jump
		setActscript $13,$FF,eas_Init
		startEntity $13
		nextSingleText $C0,$13  ; "Let's go to Pacalon.{W1}"
		addNewFollower $13
		csc_end
ce_4BE4A:       mainEntity 19,16,UP
		entity 17,14,DOWN,7,eas_Init
		entity 18,14,DOWN,19,eas_Init
		entity 63,63,UP,106,eas_Init
		dc.w $FFFF
