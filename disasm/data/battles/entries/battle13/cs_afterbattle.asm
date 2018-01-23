
; ASM FILE data\battles\entries\battle13\cs_afterbattle.asm :
; 0x4ACF8..0x4ADA6 : Cutscene after battle 13
abcs_battle13:  textCursor $9BF
		playSound $FD
		loadMapFadeIn 13,11,8
		loadMapEntities ce_4AD96
		setActscript $0,$FF,eas_Init
		setPos $7,15,13,RIGHT
		customActscript $A,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		playSound MUSIC_TOWN
		fadeInB
		csWait 50
		nextSingleText $0,$7    ; "{NAME;10}, are you OK?  {NAME;10}!{W1}"
		csWait 50
		setActscript $A,$FF,eas_Init
		setActscript $A,$FF,eas_Jump
		entityShakeHead $A
		nextSingleText $C0,$A   ; "Squawk!  They knocked me{N}senseless.{W1}"
		csWait 5
		setActscript $A,$0,eas_461B6
		csWait 60
		nextText $C0,$A         ; "Where are the devils?{N}{LEADER}, did you defeat{N}them?{W2}"
		setFacing $A,UP
		nextSingleText $C0,$A   ; "Nobody in Bedoe can fight{N}like that.  Thank you.{W1}"
		setFacing $A,LEFT
		nextSingleText $0,$7    ; "He's a great fighter.{N}Volcanon doesn't know how{N}good he is!{W1}"
		nextText $C0,$A         ; "He'll learn.{W2}"
		nextSingleText $C0,$A   ; "Let's go see the mayor and{N}get a raft!{W1}"
		setFacing $A,UP
		nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}{NAME;10} the BDMN with him.{W1}{CLEAR}"
		setF $4B                ; Luke is a follower
		mapSysEvent $D,$10,$C,$3
		csc_end
ce_4AD96:       mainEntity 16,12,DOWN
		entity 16,13,DOWN,10,eas_Init
		dc.w $FFFF
