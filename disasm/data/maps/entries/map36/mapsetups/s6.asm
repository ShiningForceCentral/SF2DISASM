
; ASM FILE data\maps\entries\map36\mapsetups\s6.asm :
; 0x5DA16..0x5DAE4 : 

; =============== S U B R O U T I N E =======================================

ms_map36_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $16
		beq.s   return_5DA26
		move.w  #$16,d0
		jsr     MoveEntityOutOfMap
return_5DA26:
		rts

	; End of function ms_map36_InitFunction

cs_5DA28:       textCursor $CFB
		faceEntity $7,$83
		faceEntity $1F,$83
		nextText $0,$16         ; "You defeated Zalbard and{N}saved Mitula.{W2}"
		nextText $0,$16         ; "You are trustworthy{N}soldiers, so...would you{N}do me a favor?{W2}"
		nextSingleText $0,$16   ; "Please go to Moun with me.{W1}"
		nextSingleText $0,$1F   ; "What are you going to do{N}there?{W1}"
		nextText $0,$16         ; "I believe there are{N}survivors in Moun.{W2}"
		nextSingleText $0,$16   ; "I would like to save them.{W1}"
		nextText $0,$7          ; "We have to go through Moun{N}to get to Nazka, right?{W2}"
		nextSingleText $0,$7    ; "{LEADER}, let's go{N}together.{W1}"
		nextSingleText $0,$16   ; "Alright.{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} decides to take{N}{NAME;22} with him.{W1}"
		nextSingleText $0,$16   ; "Thank you very much.{W1}"
		followEntity $16,$1F,$2
		setStoryFlag $1F        ; Battle 31 unlocked
		setStoryFlag $21        ; Battle 33 unlocked
		setStoryFlag $22        ; Battle 34 unlocked
		csc_end
cs_5DA7A:       setCameraEntity $83
		setDest $0,4,23
		setFacing $0,UP
		entityActionsWait $83
		 moveRight 2
		endActions
		entityActionsWait $83
		 moveDown 1
		endActions
		setFacing $0,RIGHT
		csWait 60
		customActscriptWait $83
		 ac_setSpeed 16,16      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $83
		 moveRight 2
		endActions
		headshake $83
		shiver $83
		csWait 120
		shiver $83
		customActscriptWait $83
		 ac_setSpeed 8,8        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $83
		 moveRight 1
		endActions
		shiver $83
		csc_end
