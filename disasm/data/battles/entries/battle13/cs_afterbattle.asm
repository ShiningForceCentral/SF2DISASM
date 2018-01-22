
; ASM FILE data\battles\entries\battle13\cs_afterbattle.asm :
; 0x4ACF8..0x4ADA6 : Cutscene after battle 13
abcs_battle13:  textCursor $9BF
		playSound $FD
		loadMapFadeIn $D,$B,$8
		loadMapEntities ce_4AD96
		setActscript $0,$FF,eas_Init
		entityPosDir $7,$F,$D,$0
		customActscript $A,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound MUSIC_TOWN
		fadeInB
		csWait $32
		nextSingleText $0,$7    ; "{NAME;10}, are you OK?  {NAME;10}!{W1}"
		csWait $32
		setActscript $A,$FF,eas_Init
		setActscript $A,$FF,eas_Jump
		entityShakeHead $A
		nextSingleText $C0,$A   ; "Squawk!  They knocked me{N}senseless.{W1}"
		csWait $5
		setActscript $A,$0,eas_461B6
		csWait $3C
		nextText $C0,$A         ; "Where are the devils?{N}{LEADER}, did you defeat{N}them?{W2}"
		setFacing $A,$1
		nextSingleText $C0,$A   ; "Nobody in Bedoe can fight{N}like that.  Thank you.{W1}"
		setFacing $A,$2
		nextSingleText $0,$7    ; "He's a great fighter.{N}Volcanon doesn't know how{N}good he is!{W1}"
		nextText $C0,$A         ; "He'll learn.{W2}"
		nextSingleText $C0,$A   ; "Let's go see the mayor and{N}get a raft!{W1}"
		setFacing $A,$1
		nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}{NAME;10} the BDMN with him.{W1}{CLEAR}"
		setF $4B                ; Luke is a follower
		mapSysEvent $D,$10,$C,$3
		csc_end
ce_4AD96:       dc.w $10
		dc.w $C
		dc.w 3
		dc.b $10
		dc.b $D
		dc.b 3
		dc.b $A
		dc.l eas_Init           
		dc.w $FFFF
