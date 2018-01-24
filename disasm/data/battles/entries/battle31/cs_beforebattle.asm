
; ASM FILE data\battles\entries\battle31\cs_beforebattle.asm :
; 0x4C994..0x4CBE2 : Cutscene before battle 31
bbcs_31:        textCursor $AFB
		loadMapFadeIn 2,16,2
		loadMapEntities ce_4CB92
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,20,3,DOWN
		setActscript $1F,$FF,eas_Init
		setPos $1F,22,3,DOWN
		setActscript $16,$FF,eas_Init
		setPos $16,21,3,DOWN
		animEntityFadeInOut $80,$6
		animEntityFadeInOut $81,$6
		setActscript $82,$0,eas_AnimSpeedx2
		playSound MUSIC_BATTLE_THEME_1
		fadeInB
		cameraSpeed $30
		nextSingleText $C0,$80  ; "Finally, you've left the{N}castle, Vicar {NAME;22}.{W1}"
		setCamDest 16,5
		animEntityFadeInOut $80,$7
		nextSingleText $0,$7    ; "Geshp!{W1}"
		nextSingleText $C0,$80  ; "So, you remember me. {W1}"
		setCamDest 16,2
		entityActions $1F,$FF
		 moveDown 1
		endActions
		nextSingleText $0,$1F   ; "What do you want?{W1}"
		nextText $C0,$80        ; "I have plans for you.{W2}"
		nextSingleText $C0,$80  ; "I'm very happy that you came{N}out of the castle.{W1}"
		nextSingleText $0,$1F   ; "Why?{W1}"
		nextText $C0,$80        ; "I have been waiting for{N}{NAME;22}.{W2}"
		nextText $C0,$80        ; "Vicar {NAME;22}, you locked{N}the gate of Moun, remember?{W2}"
		nextSingleText $C0,$80  ; "My faithful soldiers can't{N}enter Parmecia.{N}Now, you will open it!{W1}"
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "It's a trap!{W2}"
		entityActions $1F,$FF
		 moveUp 1
		endActions
		setCamDest 16,0
		setFacing $1F,LEFT
		nextSingleText $0,$1F   ; "{NAME;22}, run!{W1}"
		entityActions $16,$FF
		 moveUp 1
		endActions
		flashScreenWhite $2
		setPos $82,21,1,LEFT
		csWait 30
		setActscript $16,$FF,eas_Jump
		setActscript $16,$FF,eas_46172
		entityActions $16,$FF
		 moveDown 1
		endActions
		nextSingleText $C0,$80  ; "Ha, ha.  He can't.{W1}"
		setCamDest 16,6
		setFacing $80,DOWN
		nextSingleText $C0,$80  ; "Cameela!  Cameeeeeela!{W1}"
		nextSingleText $0,$7    ; "Cameela?!  We met her in{N}Pangoat Valley.{W1}"
		animEntityFadeInOut $81,$7
		nextSingleText $0,$81   ; "What?{W1}"
		nextText $C0,$80        ; "Ah, Cameela.  You're here.{W2}"
		nextSingleText $C0,$80  ; "Get the key for me!{W1}"
		nextSingleText $0,$81   ; "Geshp, you're as devious as{N}usual.{W1}"
		entityActions $80,$FF
		 moveDown 1
		endActions
		nextSingleText $C0,$80  ; "That I am.  Now, get the key!{W1}"
		nextSingleText $0,$81   ; "Me?!  Why?{W1}"
		stopEntity $80
		csWait 40
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_46172
		entityActions $80,$FF
		 moveUp 1
		endActions
		startEntity $80
		nextSingleText $C0,$80  ; "Cameela!{W1}"
		nextText $0,$81         ; "I hate you!{N}I won't help you.{W2}"
		nextText $0,$81         ; "You want the key?{N}You get it!{N}You can use my army.{W2}"
		nextSingleText $0,$81   ; "See you later.{W1}"
		animEntityFadeInOut $81,$6
		nextText $C0,$80        ; "That witch!{W2}"
		nextSingleText $C0,$80  ; "Cameela!  Cameela!!{W1}"
		nextSingleText $0,$7    ; "They're divided....{W1}"
		csWait 40
		entityShiver $80
		csWait 40
		setFacing $80,UP
		nextText $C0,$80        ; "I don't need your help,{N}Cameela!{W2}"
		nextSingleText $C0,$80  ; "Come on, devils!{N}Kill {LEADER} now!{W1}"
		setCamDest 16,13
		csWait 40
		setPos $83,19,18,UP
		setPos $84,21,19,UP
		setPos $85,22,18,UP
		setPos $86,23,15,UP
		setActscript $83,$0,eas_Jump
		setActscript $84,$0,eas_Jump
		setActscript $85,$0,eas_Jump
		setActscript $86,$FF,eas_Jump
		csWait 30
		setCamDest 16,6
		nextSingleText $C0,$80  ; "Bye, {LEADER}.{W1}"
		nextSingleText $0,$7    ; "You're not staying?{W1}"
		nextText $C0,$80        ; "I'm good at using my brains,{N}not my strength.{W2}"
		nextSingleText $C0,$80  ; "I'll return by the time{N}you're defeated.{W1}"
		animEntityFadeInOut $80,$6
		csc_end
ce_4CB92:       mainEntity 21,4,DOWN
		entity 20,3,DOWN,7,eas_Init
		entity 21,3,DOWN,22,eas_Init
		entity 21,8,UP,159,eas_Init
		entity 21,11,UP,156,eas_Init
		entity 63,63,LEFT,171,eas_Init
		entity 63,63,UP,141,eas_Init
		entity 63,63,UP,145,eas_Init
		entity 63,63,UP,86,eas_Init
		entity 63,63,UP,111,eas_Init
		dc.w $FFFF
