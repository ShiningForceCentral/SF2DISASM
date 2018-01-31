
; ASM FILE data\battles\entries\battle26\cs_afterbattle.asm :
; 0x4BCAA..0x4BE6A : Cutscene after battle 26
abcs_battle26:  textCursor $A4D
		loadMapFadeIn 72,13,11
		loadMapEntities ce_4BE4A
		setActscriptWait $0,eas_Init
		customActscriptWait $13
		 ac_setAnimCounter $0   ;   
		 ac_setFlip $1          ;   
		 ac_updateSprite        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setActscriptWait $7,eas_Init
		setPos $7,17,14,RIGHT
		setActscriptWait $1F,eas_Init
		setPos $1F,18,16,UP
		setPos $1E,19,17,UP
		setPriority $13,$0
		setPriority $80,$FFFF
		fadeInB
		entityActionsWait $7
		 moveDown 2
		endActions
		setFacing $7,RIGHT
		nextSingleText $0,$7    ; "Is he alright?{W1}"
		nextSingleText $0,$1F   ; "We have to save him before{N}he is possessed by an evil...{W1}"
		entityFlashWhite $1F,$3C
		flashScreenWhite $1E
		setCamDest 13,9
		animEntityFX $80,4
		setPos $80,18,13,DOWN
		animEntityFX $80,5
		setFacing $7,UP
		entityActionsWait $80
		 moveUp 3
		endActions
		customActscriptWait $80
		 ac_setSpeed 64,64      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setActscript $80,eas_4509E
		csWait 200
		setActscriptWait $80,eas_Die
		setCamDest 13,11
		customActscriptWait $13
		 ac_setAnimCounter $0   ;   
		 ac_setFlip $0          ;   
		 ac_updateSprite        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setFacing $13,DOWN
		headshake $13
		nextSingleText $C0,$13  ; "What happened?{W2}"
		entityActionsWait $13
		 moveUp 1
		endActions
		setActscriptWait $13,eas_Jump
		nextSingleText $C0,$13  ; "Ah...I was almost possessed{N}by that devil.{W1}"
		entityActionsWait $13
		 moveDown 2
		endActions
		nextSingleText $C0,$13  ; "Thank you.{N}How can I repay you for{N}your kindness?{W1}"
		nextText $0,$1F         ; "Are you OK now?  Good.{W2}"
		nextSingleText $0,$1F   ; "May I ask you, where were{N}you going in such a wounded{N}state?{W1}"
		nextText $C0,$13        ; "Pacalon, my country.  We{N}are fighting against the{N}devils.{W2}"
		nextText $C0,$13        ; "But, no country in North{N}Parmecia has enough power{N}to resist them.{W2}"
		nextSingleText $C0,$13  ; "So, I was heading south to{N}find some allies.{W1}"
		entityActionsWait $7
		 moveUp 1
		endActions
		setFacing $7,RIGHT
		nextSingleText $0,$7    ; "You don't have to go any{N}further.{W1}"
		setFacing $13,LEFT
		nextSingleText $C0,$13  ; "Then, you're from South{N}Parmecia?{W1}"
		nextSingleText $0,$1F   ; "Yes, Granseal.{W1}"
		setFacing $13,DOWN
		nextSingleText $C0,$13  ; "Oh, how lucky!  Please{N}come with me to Pacalon!{W1}"
		nod $13
		nextSingleText $0,$7    ; "But, we have to go to{N}Tristan.{W1}"
		setFacing $13,LEFT
		nextText $C0,$13        ; "Oh, please...I can't return{N}to Pacalon without allies.{W2}"
		nextText $C0,$13        ; "Maybe, when you're done...{W2}"
		nextSingleText $C0,$13  ; "OK, I'll go with you.{W1}"
		join $13
		nextSingleText $0,$1F   ; "But, you're injured{N}Mr. {NAME;19}.{W1}"
		setFacing $13,DOWN
		nextSingleText $C0,$13  ; "No problem.  I don't know{N}why, but I'm much better.{W1}"
		setActscript $13,eas_RotateRight
		csWait 40
		setActscriptWait $13,eas_Jump
		setFacing $13,DOWN
		setActscriptWait $13,eas_Jump
		setActscriptWait $13,eas_Init
		startEntity $13
		nextSingleText $C0,$13  ; "Let's go to Pacalon.{W1}"
		addNewFollower $13
		csc_end
ce_4BE4A:       mainEntity 19,16,UP
		entity 17,14,DOWN,7,eas_Init
		entity 18,14,DOWN,19,eas_Init
		entity 63,63,UP,106,eas_Init
		dc.w $FFFF
