
; ASM FILE data\battles\entries\battle37\cs_afterbattle.asm :
; 0x4DB94..0x4DDA4 : Cutscene after battle 37
abcs_battle37:  textCursor $B9C
		loadMapFadeIn 77,31,54
		loadMapEntities ce_4DD8C
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,33,59,RIGHT
		setActscript $1F,$FF,eas_Init
		setPos $1F,34,57,DOWN
		setActscript $1E,$FF,eas_Init
		setPos $1E,37,59,LEFT
		jumpIfFlagClear $4C,cs_4DBEE; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,DOWN
cs_4DBEE:       stopEntity $1C
		customActscript $1C,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setPriority $1F,$0
		setPriority $1C,$FFFF
		fadeInB
		entityActions $7,$FF
		 moveRight 1
		endActions
		csWait 50
		setFacing $7,UP
		nextSingleText $0,$7    ; "Sir Astral, he's...crying!{W1}"
		nextSingleText $0,$1F   ; "Why would he be crying?{W1}"
		entityActions $1F,$FF
		 moveRight 1
		 moveDown 1
		endActions
		csWait 30
		setFacing $7,RIGHT
		nextSingleText $0,$1F   ; "I think I've seen his style{N}of fighting before.{N}Let's see his face.{W1}"
		nextSingleText $FF,$FF  ; "Astral removes the mask.{W1}"
		nextSingleText $C0,$1C  ; "Huh?{W1}"
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "It's {NAME;28}!{W1}"
		entityActions $0,$FF
		 moveDown 2
		endActions
		setFacing $0,LEFT
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
		setFacing $1C,DOWN
		nextSingleText $C0,$1C  ; "What?!{W1}"
		csWait 5
		setActscript $1C,$0,eas_461B6
		csWait 120
		setFacing $1C,UP
		nextText $C0,$1C        ; "Oh, Sir Astral!  I had an{N}awful nightmare.{W2}"
		nextSingleText $C0,$1C  ; "I was controlled by someone{N}and I killed a lot of...{W1}"
		nextSingleText $0,$1F   ; "It wasn't a dream.{W1}"
		setActscript $1C,$FF,eas_Jump
		nextSingleText $C0,$1C  ; "What?!{W1}"
		nextText $0,$1F         ; "You were being controlled{N}by a devil.{W2}"
		nextText $0,$1F         ; "And he made you kill every{N}person you saw.{W2}"
		nextSingleText $0,$1F   ; "You recovered your senses{N}when we defeated the devils.{W1}"
		setFacing $1C,DOWN
		nextSingleText $C0,$1C  ; "I can't believe it!{N}I'm {NAME;28}, I'm...{W1}"
		entityActions $1C,$FF
		 moveDown 2
		endActions
		entityShiver $1C
		setFacing $7,DOWN
		setFacing $0,DOWN
		nextSingleText $C0,$1C  ; "What can I do?{N}How can I atone for my sins?{W1}"
		setFacing $1C,DOWN
		nextSingleText $C0,$1C  ; "Sir Astral, tell me.{W1}"
		entityActions $1F,$FF
		 moveDown 1
		endActions
		nextText $0,$1F         ; "You're not at fault.{W1}"
		nextSingleText $0,$1F   ; "It's not your fault.{N}The devils are to blame.{W1}"
		nextSingleText $C0,$1C  ; "But...{W1}"
		entityShiver $1C
		csWait 50
		entityShiver $1C
		setFacing $1C,UP
		nextSingleText $C0,$1C  ; "I have to die for my sins.{N}It will be my atonement.{W2}"
		setActscript $7,$0,eas_Jump
		setActscript $0,$FF,eas_Jump
		nextSingleText $C0,$1C  ; "I have to die!{W1}"
		setFacing $1C,DOWN
		csWait 30
		entityActions $1C,$FF
		 moveDown 3
		endActions
		nextSingleText $0,$1F   ; "Oh, poor {NAME;28}.{W1}"
		setFacing $7,RIGHT
		nextText $0,$7          ; "Sir Astral, {NAME;28} has{N}fled. {W2}"
		nextSingleText $0,$7    ; "Will you let him die?{W1}"
		nextSingleText $0,$1F   ; "{NAME;28} is an immortal{N}vampire now.  He can't die{N}very easily.{W1}"
		setFacing $1F,RIGHT
		setFacing $0,LEFT
		nextSingleText $0,$1F   ; "I think we'll meet him again.{N}{LEADER}, let's go.{W1}"
		csc_end
ce_4DD8C:       mainEntity 36,57,DOWN
		entity 33,59,RIGHT,7,eas_Init
		entity 35,59,DOWN,28,eas_Init
		dc.w $FFFF
