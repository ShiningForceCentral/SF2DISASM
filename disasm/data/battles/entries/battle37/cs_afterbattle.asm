
; ASM FILE data\battles\entries\battle37\cs_afterbattle.asm :
; 0x4DB94..0x4DDA4 : Cutscene after battle 37
abcs_battle37:  textCursor $B9C         ; Initial text line $B9C : "Sir Astral, he's...crying!{W1}"
		loadMapFadeIn $4D,$1F,$36
		loadMapEntities ce_4DD8C; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$21,$3B,$0
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$22,$39,$3
		setActscript $1E,$FF,eas_Init
		entityPosDir $1E,$25,$3B,$2
		jumpIfFlagClear $4C,cs_4DBEE; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4DBEE:       stopEntity $1C
		customActscript $1C,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csc53 $1F,$0            ; 0053 UNKNOWN
		csc53 $1C,$FFFF         ; 0053 UNKNOWN
		fadeInB
		moveEntity $7,$FF,$0,$1
		endMove $8080
		csWait $32
		setEntityDir $7,$1
		nextSingleText $0,$7    ; "Sir Astral, he's...crying!{W1}"
		nextSingleText $0,$1F   ; "Why would he be crying?{W1}"
		moveEntity $1F,$FF,$0,$1
		moreMove $3,$1
		endMove $8080
		csWait $1E
		setEntityDir $7,$0
		nextSingleText $0,$1F   ; "I think I've seen his style{N}of fighting before.{N}Let's see his face.{W1}"
		nextSingleText $FF,$FF  ; "Astral removes the mask.{W1}"
		nextSingleText $C0,$1C  ; "Huh?{W1}"
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "It's {NAME;28}!{W1}"
		moveEntity $0,$FF,$3,$2
		endMove $8080
		setEntityDir $0,$2
		entityShiver $7
		nextSingleText $0,$7    ; "Let me see him.{W1}"
		entityShiver $1C
		stopEntity $1C
		entityFlashWhite $1C,$39
		setActscript $7,$0,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$7    ; "Wow, he's alive!{W1}"
		nextSingleText $0,$1F   ; "{NAME;28}!  {NAME;28}!{W1}"
		nextSingleText $C0,$1C  ; "Where?!{W1}"
		setActscript $1C,$FF,eas_Init
		startEntity $1C
		setEntityDir $1C,$3
		nextSingleText $C0,$1C  ; "What?!{W1}"
		csWait $5
		setActscript $1C,$0,eas_461B6
		csWait $78
		setEntityDir $1C,$1
		nextText $C0,$1C        ; "Oh, Sir Astral!  I had an{N}awful nightmare.{W2}"
		nextSingleText $C0,$1C  ; "I was controlled by someone{N}and I killed a lot of...{W1}"
		nextSingleText $0,$1F   ; "It wasn't a dream.{W1}"
		setActscript $1C,$FF,eas_Jump
		nextSingleText $C0,$1C  ; "What?!{W1}"
		nextText $0,$1F         ; "You were being controlled{N}by a devil.{W2}"
		nextText $0,$1F         ; "And he made you kill every{N}person you saw.{W2}"
		nextSingleText $0,$1F   ; "You recovered your senses{N}when we defeated the devils.{W1}"
		setEntityDir $1C,$3
		nextSingleText $C0,$1C  ; "I can't believe it!{N}I'm {NAME;28}, I'm...{W1}"
		moveEntity $1C,$FF,$3,$2
		endMove $8080
		entityShiver $1C
		setEntityDir $7,$3
		setEntityDir $0,$3
		nextSingleText $C0,$1C  ; "What can I do?{N}How can I atone for my sins?{W1}"
		setEntityDir $1C,$3
		nextSingleText $C0,$1C  ; "Sir Astral, tell me.{W1}"
		moveEntity $1F,$FF,$3,$1
		endMove $8080
		nextText $0,$1F         ; "You're not at fault.{W1}"
		nextSingleText $0,$1F   ; "It's not your fault.{N}The devils are to blame.{W1}"
		nextSingleText $C0,$1C  ; "But...{W1}"
		entityShiver $1C
		csWait $32
		entityShiver $1C
		setEntityDir $1C,$1
		nextSingleText $C0,$1C  ; "I have to die for my sins.{N}It will be my atonement.{W2}"
		setActscript $7,$0,eas_Jump
		setActscript $0,$FF,eas_Jump
		nextSingleText $C0,$1C  ; "I have to die!{W1}"
		setEntityDir $1C,$3
		csWait $1E
		moveEntity $1C,$FF,$3,$3
		endMove $8080
		nextSingleText $0,$1F   ; "Oh, poor {NAME;28}.{W1}"
		setEntityDir $7,$0
		nextText $0,$7          ; "Sir Astral, {NAME;28} has{N}fled. {W2}"
		nextSingleText $0,$7    ; "Will you let him die?{W1}"
		nextSingleText $0,$1F   ; "{NAME;28} is an immortal{N}vampire now.  He can't die{N}very easily.{W1}"
		setEntityDir $1F,$0
		setEntityDir $0,$2
		nextSingleText $0,$1F   ; "I think we'll meet him again.{N}{LEADER}, let's go.{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4DD8C:       dc.b   0
		dc.b $24 
		dc.w $39
		dc.w 3
		dc.b $21
		dc.b $3B
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $23
		dc.b $3B
		dc.b 3
		dc.b $1C
		dc.l eas_Init           
		dc.w $FFFF
