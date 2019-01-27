
; ASM FILE data\maps\entries\map45\mapsetups\s6.asm :
; 0x60098..0x603AE : 

; =============== S U B R O U T I N E =======================================

ms_map45_InitFunction:
		
		 
		chkFlg $19              ; Shiela joined
		beq.s   byte_600AA
		move.w  #$19,d0
		jsr     MoveEntityOutOfMap
		bra.s   return_600B0
byte_600AA:
		script  cs_600B2
return_600B0:
		rts

	; End of function ms_map45_InitFunction

cs_600B2:       setActscriptWait $19,eas_45F9C
		setSprite $19,$D9
		setActscriptWait $19,eas_Init3
		setFacing $19,UP
		csc_end
cs_600CE:       textCursor $823
		setActscriptWait $1F,eas_Init
		setActscriptWait $7,eas_Init
		setActscriptWait $1A,eas_Init
		nextSingleText $0,$19   ; "Who's there!{W1}"
		setCamDest 1,1
		nextSingleText $0,$19   ; "This is a sacred place!{W1}"
		setPos $1A,8,12,LEFT
		setPos $1F,6,11,UP
		setPos $0,6,13,UP
		setPos $7,6,14,UP
		setCamDest 1,9
		nextSingleText $80,$1F  ; "Oops!{W1}"
		entityActionsWait $1F
		 moveDown 1
		endActions
		nextSingleText $80,$1F  ; "She's too beautiful for you!{N}Back, back!{W1}"
		setActscriptWait $0,eas_46172
		setActscriptWait $7,eas_46172
		customActscriptWait $0
		 ac_setSpeed 4,4        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $1F
		 ac_setSpeed 4,4        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $7
		 ac_setSpeed 4,4        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $1F
		 moveDown 3
		endActions
		entityActions $0
		 eaWait 20
		 moveDown 3
		endActions
		entityActions $7
		 eaWait 40
		 moveDown 3
		endActions
		csWait 50
		headshake $0
		headshake $0
		csWait 10
		headshake $0
		headshake $0
		csWait 10
		headshake $0
		waitIdle $0
		nextText $0,$19         ; "Wait!{W1}"
		nextSingleText $0,$19   ; "Is that you...Sir Astral?{W1}"
		setFacing $1F,UP
		nextSingleText $80,$1F  ; "What?{W1}"
		setActscriptWait $1F,eas_Init
		entityActionsWait $1F
		 moveUp 4
		endActions
		nextSingleText $80,$1F  ; "Who are you?{N}You know me?{W1}"
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		entityActions $0
		 moveUp 4
		 moveRight 1
		 moveUp 1
		endActions
		entityActions $7
		 moveUp 4
		 moveLeft 1
		 moveUp 1
		endActions
		setCamDest 1,5
		nextSingleText $0,$19   ; "Oh...you don't remember me?{W1}"
		setFacing $1F,DOWN
		nextSingleText $80,$1F  ; "Well...ah...sorry.{W1}"
		nextSingleText $0,$19   ; "I'm {NAME;25}.  I was a pupil{N}of yours in Galam.  I was{N}preparing to become a priest.{W1}"
		shiver $1F
		setFacing $1F,UP
		nextSingleText $80,$1F  ; "{NAME;25}!  I can't believe it!{W1}"
		nextText $0,$19         ; "How is that scar on your{N}chest.{W2}"
		nextSingleText $0,$19   ; "Remember?  You snuck up{N}behind me and tapped my{N}shoulder....{W1}"
		entityActionsWait $1F
		 moveUp 1
		endActions
		nextText $80,$1F        ; "And you kicked me in the{N}chest...and it left a scar.{N}How could I forget.{W2}"
		nextSingleText $80,$1F  ; "Nobody but {NAME;25}{N}knew about that scar....{N}It still aches sometimes.{W1}"
		setActscriptWait $1F,eas_Jump
		setActscriptWait $1F,eas_Jump
		nextSingleText $0,$19   ; "I am sorry I kicked you.{W1}"
		shiver $1F
		nextSingleText $80,$1F  ; "That OK. How have...{W1}"
		entityActionsWait $7
		 moveRight 1
		endActions
		setFacing $7,UP
		setFacing $0,DOWN
		nextSingleText $0,$7    ; "Hey, aren't you going to{N}introduce us?{W1}"
		entityActionsWait $1F
		 moveDown 1
		endActions
		nextSingleText $80,$1F  ; "Of course.{W1}"
		setQuake 3
		csWait 40
		setQuake 0
		csWait 20
		setFacing $1F,UP
		setFacing $7,UP
		setFacing $0,UP
		nextText $80,$1F        ; "All in good time.{W2}"
		nextSingleText $80,$1F  ; "By the way, what are you{N}doing here?{W1}"
		shiver $19
		nextSingleText $0,$19   ; "I came to kill Red Baron.{N}He killed my fiance.{W1}"
		nextSingleText $80,$1F  ; "Oh....{N}I'm sorry...{W1}"
		nextSingleText $0,$19   ; "And why did you come back{N}to Grans?{W1}"
		nextSingleText $80,$1F  ; "To reseal Zeon.{W1}"
		nextSingleText $0,$19   ; "The King of the Devils?{W1}"
		nod $1F
		nextText $80,$1F        ; "Listen, {NAME;25}.{N}All the killings lately were{N}caused by him.{W2}"
		nextSingleText $80,$1F  ; "He'll destroy the entire{N}world.  He must be stopped!{W1}"
		shiver $19
		nextSingleText $0,$19   ; "Is Red Baron his follower?{W1}"
		nextSingleText $80,$1F  ; "Could be.{W1}"
		nextSingleText $0,$19   ; "Hmmm....{W1}"
		csWait 60
		nextSingleText $0,$19   ; "Ok!  I'll do it!{W1}"
		setPos $86,6,8,UP
		setCameraEntity $19
		nextSingleText $0,$19   ; "Close your eyes!{W1}"
		setActscriptWait $19,eas_46172
		setFacing $19,LEFT
		entityActionsWait $19
		 moveUp 2
		endActions
		setFacing $19,DOWN
		startEntity $19
		setActscript $19,eas_Transparent
		entityActionsWait $19
		 moveDown 4
		endActions
		hide $86
		setActscriptWait $19,eas_Init
		setSprite $19,$19
		entityActionsWait $19
		 moveDown 2
		endActions
		setActscript $0,eas_Jump
		setActscript $7,eas_Jump
		setActscriptWait $1F,eas_Jump
		setActscript $0,eas_Jump
		setActscript $7,eas_Jump
		setActscriptWait $1F,eas_Jump
		startEntity $19
		csWait 30
		setActscriptWait $19,eas_Init
		setCamDest 1,5
		nextSingleText $0,$19   ; "Sir Astral, please let me go{N}with you.{W1}"
		nextSingleText $80,$1F  ; "We welcome you, but can you{N}fight?{W1}"
		nextSingleText $0,$19   ; "I've made my body into a{N}weapon.{W1}"
		nextSingleText $80,$1F  ; "Where did you learn to do{N}this?  You're a priest.{W1}"
		nextSingleText $0,$19   ; "I was.  But now I'm a{N}master monk.{W1}"
		setActscriptWait $1F,eas_Jump
		setActscriptWait $1F,eas_Jump
		nextSingleText $80,$1F  ; "We could always use another{N}well-trained fighter!{W1}"
		join $19
		nextSingleText $0,$7    ; "We've got a strong ally!{W1}"
		setFacing $19,LEFT
		nextSingleText $0,$19   ; "Many Galam soldiers are in{N}the west.{N}We must be careful.{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1A,$1F,$2
		followEntity $19,$0,$5
		csc_end
