
; ASM FILE data\maps\entries\map11\mapsetups\s6.asm :
; 0x57AA8..0x57CCC : 

; =============== S U B R O U T I N E =======================================

ms_map11_InitFunction:
		
		rts

	; End of function ms_map11_InitFunction

cs_57AAA:       textCursor $C4F         ; Initial text line $C4F : "God Volcanon!{N}I'm back!{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setEntityDest $0,$27,$B ; 0029 SET ENTITY DEST 0 27 B
		moveEntity $0,$FF,$2,$1 ; 002D MOVE ENTITY 0 FF 2 1
		endMove $8080
		setCameraEntity $7      ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
		setEntityDest $7,$27,$B ; 0029 SET ENTITY DEST 7 27 B
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    ; "God Volcanon!{N}I'm back!{W1}"
		setCamDest $22,$3       ; 0032 SET CAMERA DEST 22 3
		csWait $78              ; WAIT 78
		nextSingleText $0,$80   ; "Welcome back, {NAME;7}.{N}You look well.{W1}"
		nextSingleText $0,$7    ; "Yes, I am!  This trip{N}was very interesting.{W1}"
		nextSingleText $0,$80   ; "That's good.{W2}"
		nextSingleText $0,$80   ; "What made it interesting?{W1}"
		entityNod $7            ; 0026 MAKE ENTITY NOD 7
		csWait $1E              ; WAIT 1E
		nextSingleText $0,$7    ; "I met a lot people that live{N}on the ground.{W2}"
		nextSingleText $0,$7    ; "They help each other.{N}I made some friends.{W1}"
		nextSingleText $0,$80   ; "Wonderful.  It must've been{N}a good experience for you.{W1}"
		entityNod $7            ; 0026 MAKE ENTITY NOD 7
		setCamDest $22,$5       ; 0032 SET CAMERA DEST 22 5
		csWait $1E              ; WAIT 1E
		nextSingleText $0,$7    ; "I've brought a friend.{W1}"
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		moveEntity $7,$FF,$3,$2 ; 002D MOVE ENTITY 7 FF 3 2
		endMove $8080
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		moveEntity $7,$FF,$2,$1 ; 002D MOVE ENTITY 7 FF 2 1
		endMove $8080
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		moveEntity $0,$FF,$2,$1 ; 002D MOVE ENTITY 0 FF 2 1
		endMove $8080
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		nextSingleText $0,$7    ; "This is {LEADER}.{N}He's from Granseal.{W1}"
		setCamDest $22,$2       ; 0032 SET CAMERA DEST 22 2
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $2       ; 0033 SET QUAKE AMOUNT 2
		csWait $5A              ; WAIT 5A
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		nextSingleText $0,$80   ; "Granseal!{W1}"
		nextSingleText $0,$80   ; "People of Grans Island{N}caused a serious, deadly{N}problem for the world!{W1}"
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $3       ; 0033 SET QUAKE AMOUNT 3
		csWait $5A              ; WAIT 5A
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		setCamDest $22,$6       ; 0032 SET CAMERA DEST 22 6
		csWait $5               ; WAIT 5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $78              ; WAIT 78
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		nextSingleText $0,$7    ; "Volcanon?{W1}"
		setCamDest $22,$2       ; 0032 SET CAMERA DEST 22 2
		nextSingleText $0,$80   ; "They awakened Zeon, the{N}legendary devil!{W2}"
		nextSingleText $0,$80   ; "I've been protecting all the{N}ground-dwelling people.{W2}"
		nextSingleText $0,$80   ; "I can't forgive them for{N}this!{W1}"
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $4       ; 0033 SET QUAKE AMOUNT 4
		csWait $5A              ; WAIT 5A
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		setCamDest $22,$5       ; 0032 SET CAMERA DEST 22 5
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		moveEntity $7,$FF,$0,$1 ; 002D MOVE ENTITY 7 FF 0 1
		endMove $8080
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		moveEntity $7,$FF,$1,$3 ; 002D MOVE ENTITY 7 FF 1 3
		endMove $8080
		nextSingleText $0,$7    ; "Volcanon, please calm down!{W2}"
		nextSingleText $0,$7    ; "{LEADER} is not the person{N}who did it!{W1}"
		setCamDest $22,$3       ; 0032 SET CAMERA DEST 22 3
		nextSingleText $0,$80   ; "Everybody who lives on the{N}ground is responsibile.{W2}"
		nextSingleText $0,$80   ; "They have to solve this by{N}themselves.{W1}"
		nextSingleText $0,$7    ; "What should {LEADER} do?{W1}"
		nextSingleText $0,$80   ; "My protection ceases now!{W2}"
		nextSingleText $0,$80   ; "He must face the devils on{N}his own.{W1}"
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $4       ; 0033 SET QUAKE AMOUNT 4
		csWait $5A              ; WAIT 5A
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		setActscript $7,$FF,eas_46172; 0015 SET ACTSCRIPT 7 FF 46172
		moveEntity $7,$FF,$3,$1 ; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		nextSingleText $0,$7    ; "But...{W2}"
		nextSingleText $0,$7    ; "Even the greater devils{N}are as strong as you!{W1}"
		nextSingleText $0,$80   ; "If all the humans are{N}annihilated, that's OK.{N}It's their destiny.{W2}"
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $4       ; 0033 SET QUAKE AMOUNT 4
		csWait $5A              ; WAIT 5A
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		nextSingleText $0,$80   ; "I want them to show me{N}courage.{W2}"
		nextSingleText $0,$80   ; "They must reseal the devil{N}again.{W1}"
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    ; "Then, please give some{N}advice to {LEADER}.{W1}"
		nextSingleText $0,$80   ; "{LEADER}, believe in the{N}power of the jewel.{W2}"
		moveEntity $0,$FF,$2,$1 ; 002D MOVE ENTITY 0 FF 2 1
		endMove $8080
		moveEntity $0,$FF,$1,$2 ; 002D MOVE ENTITY 0 FF 1 2
		endMove $8080
		nextSingleText $0,$80   ; "It belongs to both the{N}light and the darkness.{W2}"
		nextSingleText $0,$80   ; "It shows its true power{N}when the light and the{N}darkness are as one.{W2}"
		nextSingleText $0,$80   ; "You may go now.  I don't{N}want to see anybody until{N}Zeon is defeated.{W1}"
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    ; "Volcanon!{W1}"
		csWait $1E              ; WAIT 1E
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		csWait $1E              ; WAIT 1E
		moveEntity $7,$FF,$3,$1 ; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		nextSingleText $0,$7    ; "{LEADER}, we'll defeat{N}that devil by ourselves!{W1}"
		nextSingleText $0,$7    ; "I didn't know he was such a{N}cold-hearted god.{W2}"
		nextSingleText $0,$7    ; "OK, I'll help you!  I'll{N}go with you to reseal the{N}devil!{W1}"
		join $7                 ; 0008 JOIN FORCE 7
		csc54 $7,$0             ; 0054 UNKNOWN
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		csc_end                 ; END OF CUTSCENE SCRIPT
