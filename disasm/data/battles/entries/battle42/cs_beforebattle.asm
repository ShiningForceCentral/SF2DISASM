
; ASM FILE data\battles\entries\battle42\cs_beforebattle.asm :
; 0x4ED8E..0x4EF04 : Cutscene before battle 42
bbcs_42:        textCursor $C10
		loadMapFadeIn 59,8,29
		loadMapEntities ce_4EEDC
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setPos $7,12,36,UP
		setActscriptWait $1F,eas_Init
		setPos $1F,14,36,UP
		setActscriptWait $1C,eas_Init
		setPos $1C,13,36,UP
		jumpIfFlagClear $4C,cs_4EDE8; Zynk is a follower
		setActscriptWait $1A,eas_Init
		setPos $1A,63,62,DOWN
cs_4EDE8:       stopEntity $81
		customActscriptWait $81
		 ac_setAnimCounter $0   ;   
		 ac_setFlip $1          ;   
		 ac_updateSprite        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		playSound MUSIC_WITCH
		fadeInFromBlackHalf
		cameraSpeed $30
		csWait 60
		entityActionsWait $7
		 moveUp 2
		endActions
		nextSingleText $0,$7    ; "I can't see!  Is anybody{N}there?{W1}"
		nextSingleText $C0,$80  ; "Welcome...{W1}"
		setActscript $0,eas_Jump
		setActscript $7,eas_Jump
		setActscript $1F,eas_Jump
		setActscriptWait $1C,eas_Jump
		entityActionsWait $1F
		 moveUp 3
		endActions
		nextSingleText $0,$1F   ; "King Galam?{W1}"
		nextSingleText $C0,$80  ; "Is it too dark?{N}Let there be light!{W1}"
		fadeInB
		nextSingleText $C0,$80  ; "Is that better?{W1}"
		entityActions $0
		 moveUp 2
		endActions
		entityActionsWait $1C
		 moveUp 2
		endActions
		shiver $1F
		nextSingleText $0,$1F   ; "King Galam!{W1}"
		entityActions $0
		 moveLeft 1
		endActions
		entityActionsWait $1C
		 moveUp 1
		endActions
		setFacing $0,UP
		entityActionsWait $1C
		 moveUp 1
		endActions
		nextSingleText $0,$1C   ; "Oh, Princess Elis is here!{W1}"
		setCamDest 8,13
		nextSingleText $C0,$80  ; "Nice to see you again,{N}Astral.  I see {NAME;28} is{N}with you.{W1}"
		nextSingleText $0,$1F   ; "Where's Zeon?{W1}"
		nextText $C0,$80        ; "He has not revived fully yet.{W2}"
		nextSingleText $C0,$80  ; "So I came to welcome you for{N}him.{W1}"
		nextSingleText $0,$7    ; "She isn't moving!{N}Is she dead?{W1}"
		setFacing $80,UP
		csWait 40
		setFacing $80,DOWN
		nextSingleText $C0,$80  ; "We haven't killed her yet.{N}She will be the first{N}sacrifice for King Zeon.{W1}"
		nextText $0,$1F         ; "What?!{W2}"
		nextSingleText $0,$1F   ; "Zeon said, you'd return her{N}in exchange for the jewel!{W1}"
		nextText $C0,$80        ; "Ha, ha, ha!  He lied.{W2}"
		nextText $C0,$80        ; "You killed our greater{N}devils.{N}I can't allow this to go on.{W2}"
		nextSingleText $C0,$80  ; "You shall never see Zeon!{N}I'll kill you before that!{W1}"
		setQuake 3
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $1E
		csWait 20
		setQuake 0
		csc_end
ce_4EEDC:       mainEntity 13,35,UP
		entity 12,36,UP,7,eas_Init
		entity 13,36,UP,28,eas_Init
		entity 13,18,DOWN,164,eas_Init
		entity 13,15,DOWN,204,eas_Init
		dc.w $FFFF
