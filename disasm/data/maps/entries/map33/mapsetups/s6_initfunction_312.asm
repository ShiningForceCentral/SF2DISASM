
; ASM FILE data\maps\entries\map33\mapsetups\s6_initfunction_312.asm :
; 0x5AC56..0x5B5B6 : 

; =============== S U B R O U T I N E =======================================

ms_map33_flag312_InitFunction:
		
		rts

	; End of function ms_map33_flag312_InitFunction

cs_5AC58:       textCursor $70C
		nextSingleText $0,$81   ; "You may go now.{N}I need to talk to fairy.{W1}"
		nextSingleText $0,$80   ; "Yes, sir.{W1}"
		setCamDest 12,11
		csWait 30
		stepEvent 17,11
		setPos $80,17,11,DOWN
		entityActionsWait $80
		 moveDown 3
		endActions
		csWait 5
		setActscript $80,eas_461B6
		csWait 80
		nextSingleText $0,$80   ; "Tum-de-dum-dum.  Oh...{N}Time to check the{N}collections.{W1}"
		setCameraEntity $80
		entityActionsWait $80
		 moveLeft 5
		endActions
		setFacing $80,UP
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setPos $7,15,21,UP
		setPos $0,15,22,UP
		setPos $1F,15,23,UP
		stepEvent 15,20
		setCamDest 8,12
		csWait 30
		nextSingleText $FF,$FF  ; "Servant Goliath unlocks the{N}door.{W1}"
		entityActions $7
		 moveUp 4
		 moveLeft 3
		 moveUp 1
		endActions
		entityActions $0
		 moveUp 5
		 moveLeft 3
		endActions
		entityActionsWait $1F
		 moveUp 6
		 moveLeft 2
		endActions
		setFacing $0,UP
		setFacing $1F,UP
		nextSingleText $0,$7    ; "Excuse me.{W1}"
		shiver $80
		nextSingleText $0,$80   ; "Yeow!{W1}"
		stopEntity $80
		csWait 30
		setFacing $80,RIGHT
		csWait 60
		setFacing $80,DOWN
		csWait 30
		startEntity $80
		nextSingleText $0,$80   ; "Y...yes?{W1}"
		entityActionsWait $7
		 moveUp 1
		endActions
		nextSingleText $0,$7    ; "We've come to see Mr. Creed.{W1}"
		nextText $0,$80         ; "My master?{W2}"
		nextSingleText $0,$80   ; "Do you have an appointment?{W1}"
		nextSingleText $0,$7    ; "A what?{W1}"
		entityActionsWait $7
		 moveDown 1
		endActions
		headshake $0
		entityActionsWait $7
		 moveUp 1
		endActions
		nextSingleText $0,$7    ; "No, not yet, but...{W1}"
		nextText $0,$80         ; "I'm sorry, but he's busy now.{W2}"
		nextSingleText $0,$80   ; "Please come back later.{W1}"
		entityActionsWait $7
		 moveDown 1
		endActions
		nextSingleText $0,$7    ; "We can't see Mr. Creed now.{W1}"
		setFacing $0,RIGHT
		setFacing $1F,LEFT
		nextText $0,$1F         ; "No kidding!{W2}"
		nextSingleText $0,$1F   ; "{LEADER}, {NAME;7}, let's{N}force our way into the room!{W1}"
		entityActionsWait $7
		 moveRight 1
		endActions
		setFacing $7,DOWN
		setFacing $0,UP
		setFacing $1F,UP
		nextText $0,$7          ; "Oddler, you're getting bold.{W2}"
		nextSingleText $0,$7    ; "But, it is a good idea.{W1}"
		setFacing $80,UP
		csWait 10
		shiver $80
		entityActionsWait $7
		 moveLeft 1
		endActions
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		shiver $80
		csWait 10
		nextSingleText $0,$80   ; "Hmmmph....{W1}"
		csWait 20
		nextSingleText $0,$7    ; "Let's go!{W1}"
		setCameraEntity $0
		setActscript $0,eas_Jump
		setActscript $7,eas_Jump
		setActscriptWait $1F,eas_Jump
		customActscriptWait $0
		 ac_setSpeed 40,40      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $7
		 ac_setSpeed 40,40      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $1F
		 ac_setSpeed 40,40      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $7
		 moveRight 5
		 moveUp 3
		endActions
		entityActions $1F
		 moveRight 5
		 moveUp 3
		endActions
		entityActions $0
		 moveRight 5
		 moveUp 3
		endActions
		csWait 10
		animEntityFX $80,2
		setPos $80,17,12,DOWN
		animEntityFX $80,3
		waitIdle $0
		setActscript $7,eas_BumpUp
		setActscript $1F,eas_BumpUp
		setActscriptWait $0,eas_BumpUp
		nextSingleText $0,$7    ; "How did he do that?{W1}"
		shiver $80
		nextText $0,$80         ; "You impolite kids!{N}You can't go in!{W2}"
		nextSingleText $0,$80   ; "Mr. Creed is too busy!{N}Go away!{W1}"
		setActscriptWait $0,eas_46172
		setActscriptWait $7,eas_46172
		setActscriptWait $1F,eas_46172
		customActscriptWait $0
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $7
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $1F
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $0
		 moveDown 1
		endActions
		entityActions $7
		 moveDown 1
		endActions
		entityActionsWait $1F
		 moveDown 1
		endActions
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		csWait 25
		csWait 5
		setActscript $7,eas_461B6
		csWait 120
		nextText $0,$7          ; "{LEADER}, on our left!{N}That door might lead to{N}Mr. Creed!{W2}"
		setFacing $7,DOWN
		nextSingleText $0,$7    ; "Let's ditch this guy and go{N}through that door.{W1}"
		setFacing $0,RIGHT
		setFacing $1F,LEFT
		nextSingleText $0,$1F   ; "{LEADER}, let's do it!{N}I don't want to fail now!{W1}"
		nod $0
		setFacing $7,UP
		nextText $0,$7          ; "OK, OK.  We give up.{W2}"
		nextSingleText $0,$7    ; "We'll see Mr. Creed later.{N}Let's get out of here.{W1}"
		setFacing $1F,UP
		setFacing $0,UP
		nextSingleText $0,$1F   ; "Yeah, maybe later.{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_5AF36:       textCursor $72A
		setActscriptWait $80,eas_Init
		setActscriptWait $80,eas_Jump
		customActscriptWait $80
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $80
		 moveDown 2
		 moveLeft 2
		endActions
		setCameraEntity $80
		nextSingleText $0,$80   ; "No, don't go in there!{N}That door is...!{W1}"
		flashScreenWhite $4
		csWait 40
		flashScreenWhite $4
		csWait 30
		flashScreenWhite $4
		csWait 5
		setActscript $0,eas_461B6
		csWait 5
		setActscript $7,eas_461E4
		csWait 5
		setActscript $1F,eas_461B6
		csWait 20
		flashScreenWhite $4
		csWait 10
		flashScreenWhite $1E
		setActscript $0,eas_463AE
		setActscript $7,eas_463AE
		setActscript $1F,eas_463AE
		csWait 60
		nextSingleText $0,$80   ; "What stupid kids!{W1}"
		setActscriptWait $80,eas_Init
		entityActionsWait $80
		 moveLeft 3
		endActions
		setFacing $80,UP
		nextText $0,$80         ; "Whoever passes through this{N}magic door becomes small.{W2}"
		nextSingleText $0,$80   ; "That is, anybody who's not{N}protected by Mr. Creed.{W1}"
		stopEntity $80
		csWait 20
		nextSingleText $FF,$FF  ; "Goliath picks up{N}{LEADER}.{W1}"
		startEntity $80
		nextSingleText $0,$80   ; "Now, you're part of the{N}collection!{W1}"
		stepEvent 12,13
		entityActionsWait $80
		 moveUp 2
		 moveLeft 5
		 faceUp 20
		endActions
		setActscriptWait $80,eas_Jump
		csWait 20
		warp $16,$0,$0,$3
		csc_end
cs_5B016:       textCursor $730
		reloadMap 12,2
		setPos $0,63,63,DOWN
		setPos $7,63,63,DOWN
		setPos $1F,63,63,DOWN
		fadeInB
		csWait 40
		nextSingleText $80,$81  ; "Goliath...Goliath!{W1}"
		entityActionsWait $81
		 moveDown 1
		 moveLeft 2
		endActions
		setFacing $81,DOWN
		nextSingleText $80,$81  ; "Goliath!!!{W1}"
		nextSingleText $0,$80   ; "I'm here!  I'm coming!{W1}"
		setPos $80,17,14,UP
		setCamDest 12,4
		entityActionsWait $80
		 moveUp 2
		endActions
		stepEvent 17,11
		entityActionsWait $80
		 moveUp 3
		endActions
		nextSingleText $0,$80   ; "Yes, Mr. Creed?{W1}"
		nextSingleText $80,$81  ; "My collection is rather noisy{N}today.{W1}"
		csWait 10
		shiver $80
		nextSingleText $0,$80   ; "Oh, yes...ah...{W1}"
		nextSingleText $80,$81  ; "What?{W1}"
		headshake $80
		nextSingleText $0,$80   ; "No, I...I added to your{N}collection today.{W1}"
		customActscriptWait $81
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $81
		 moveDown 1
		endActions
		nextSingleText $80,$81  ; "You did what?!{W1}"
		setQuake 3
		shiver $80
		setQuake 0
		shiver $80
		nextText $0,$80         ; "I'm sorry!{W2}"
		nextSingleText $0,$80   ; "I tried to stop them, but they{N}jumped through the magic door.{W1}"
		nextText $80,$81        ; "You didn't lock the door, did{N}you?{W2}"
		nextSingleText $80,$81  ; "I told you to always lock{N}that door!{W1}"
		setQuake 3
		shiver $80
		setQuake 0
		shiver $80
		csWait 20
		setFacing $81,UP
		csWait 30
		customActscriptWait $81
		 ac_setSpeed 16,16      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $81
		 moveUp 1
		endActions
		csWait 20
		setFacing $81,DOWN
		nextSingleText $80,$81  ; "Anyway, I want to see them.{W1}"
		nod $80
		nextSingleText $0,$80   ; "Right away, sir!{W1}"
		customActscriptWait $80
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $80
		 moveDown 5
		endActions
		setFacing $81,UP
		csWait 120
		setFacing $81,DOWN
		nextSingleText $80,$81  ; "What?{W1}"
		csWait 5
		setActscript $81,eas_461B6
		csWait 120
		entityActionsWait $81
		 moveDown 1
		 moveLeft 1
		endActions
		csWait 20
		nextSingleText $FF,$FF  ; "Ah...{W1}"
		csWait 5
		setActscript $81,eas_461B6
		nextSingleText $80,$81  ; "I heard something.{W1}"
		csWait 30
		entityActionsWait $81
		 moveLeft 1
		endActions
		nextSingleText $0,$7    ; "Are you Mr. Creed?{W1}"
		setFacing $81,DOWN
		csWait 20
		setActscriptWait $81,eas_Init
		setActscriptWait $81,eas_Jump
		nextText $80,$81        ; "Oh, someone from my{N}collection is talking!{W2}"
		nextSingleText $80,$81  ; "You must be one of the people{N}Goliath was talking about.{W1}"
		nextText $0,$7          ; "We came to see you.{W2}"
		nextSingleText $0,$7    ; "Please return us to our{N}original size.{W1}"
		nextText $80,$81        ; "You came to see me?{W2}"
		nextSingleText $80,$81  ; "Hmmm...why?{W1}"
		nextSingleText $0,$7    ; "Make us bigger.  My neck{N}hurts from looking up at you!{W1}"
		nextSingleText $80,$81  ; "Oh, sorry. {W1}"
		customActscriptWait $81
		 ac_setSpeed 16,16      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setActscriptWait $81,eas_46172
		entityActionsWait $81
		 moveUp 1
		endActions
		csWait 40
		shiver $81
		csWait 30
		shiver $81
		csWait 20
		nextSingleText $80,$81  ; "Abra kadabra!  1-2-3!{W1}"
		flashScreenWhite $4
		csWait 40
		flashScreenWhite $4
		csWait 30
		flashScreenWhite $4
		csWait 20
		flashScreenWhite $4
		csWait 10
		flashScreenWhite $1E
		setPos $0,16,9,DOWN
		setActscript $0,eas_46310
		setPos $7,15,9,DOWN
		setActscript $7,eas_46310
		setPos $1F,17,9,DOWN
		setActscript $1F,eas_46310
		csWait 60
		csWait 5
		setActscript $0,eas_461B6
		csWait 5
		setActscript $7,eas_461E4
		csWait 5
		setActscript $1F,eas_461B6
		csWait 120
		setFacing $7,RIGHT
		nextSingleText $0,$7    ; "Wow, we're back to normal!{N}I can't believe we were so{N}small!{W1}"
		nod $0
		nod $0
		setFacing $0,RIGHT
		nod $1F
		nod $1F
		nextSingleText $80,$81  ; "Now, why did you want to see{N}me?{W1}"
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		nextSingleText $0,$7    ; "Oh, yes!{N}We want to know about Zeon!{W1}"
		nextSingleText $0,$82   ; "Zeon?{W1}"
		setPos $82,16,0,DOWN
		entityActionsWait $82
		 moveDown 7
		endActions
		nextSingleText $0,$82   ; "You said Zeon?{W1}"
		nextSingleText $80,$81  ; "The King of the Devils who is{N}sealed in Arc Valley?{W1}"
		entityActionsWait $82
		 moveDown 1
		endActions
		nextSingleText $0,$82   ; "Did something happen to{N}Zeon?  Has he revived?{W1}"
		nod $0
		nextSingleText $FF,$FF  ; "{LEADER} nods.{W1}"
		csWait 5
		setActscript $82,eas_461B6
		nextSingleText $0,$82   ; "No way!  You're kidding!{N}I can't believe it!{W1}"
		setActscriptWait $81,eas_Init
		entityActionsWait $81
		 moveDown 1
		endActions
		setFacing $82,DOWN
		setFacing $81,RIGHT
		nextSingleText $80,$81  ; "Noisy fairy!{N}Be quiet!{W1}"
		setActscriptWait $82,eas_46172
		entityActions $82
		 moveRight 1
		endActions
		entityActionsWait $81
		 moveRight 1
		endActions
		setFacing $81,DOWN
		nextSingleText $80,$81  ; "Is what you say true?{W1}"
		nod $0
		nextSingleText $FF,$FF  ; "{LEADER} nods again.{W1}"
		customActscriptWait $81
		 ac_setSpeed 16,16      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $81
		 moveUp 1
		endActions
		nextSingleText $80,$81  ; "So, Zeon will appear again....{N}He will destroy everything.{W1}"
		setFacing $81,DOWN
		entityActionsWait $80
		 moveUp 4
		 moveRight 1
		 moveUp 3
		endActions
		setFacing $80,LEFT
		setActscriptWait $80,eas_Jump
		setActscriptWait $80,eas_Jump
		nextSingleText $0,$80   ; "Sir, the new additions to{N}your collection are missing!{W1}"
		setFacing $82,UP
		setFacing $81,RIGHT
		nextSingleText $0,$81   ; "I know.{W1}"
		setFacing $81,DOWN
		entityActionsWait $80
		 moveLeft 1
		endActions
		nextSingleText $0,$80   ; "How...?{W1}"
		setFacing $81,RIGHT
		shiver $81
		nextSingleText $0,$81   ; "It doesn't matter how!{N}Now, go away!{W1}"
		setQuake 4
		shiver $80
		setQuake 0
		setActscriptWait $80,eas_Jump
		setActscriptWait $80,eas_Jump
		entityActionsWait $80
		 moveRight 1
		 moveDown 2
		endActions
		csWait 20
		setActscriptWait $82,eas_Init2
		entityActionsWait $82
		 moveUp 1
		endActions
		setFacing $82,LEFT
		nextSingleText $0,$82   ; "Wow!  I can't believe this{N}is happening!{W1}"
		setFacing $81,RIGHT
		nextText $0,$81         ; "You know, Grans Island is{N}covered by a dark cloud.{W2}"
		nextText $0,$81         ; "At the same time, North{N}Parmecia has had no rain.{W2}"
		nextSingleText $0,$81   ; "South Parmecia is OK, but....{W1}"
		nextText $0,$82         ; "That's because of Volcanon.{W2}"
		nextSingleText $0,$82   ; "I fear for Mitula....{W1}"
		nextText $0,$81         ; "Volcanon and Mitula are{N}invulnerable to everything, {N}except Zeon!{W2}"
		nextSingleText $0,$81   ; "Indeed...Zeon is extremely{N}powerful!{W1}"
		setFacing $80,UP
		shiver $80
		setActscriptWait $80,eas_46172
		customActscriptWait $80
		 ac_setSpeed 16,16      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $80
		 moveDown 1
		endActions
		nextSingleText $0,$80   ; "Zeon?  Oh, gosh!{W1}"
		setFacing $81,DOWN
		nextSingleText $0,$81   ; "Goliath!  What are you still{N}doing here?!{W1}"
		setQuake 4
		setActscriptWait $80,eas_Init
		entityActionsWait $80
		 moveLeft 1
		endActions
		setFacing $80,UP
		setQuake 0
		nextText $80,$81        ; "I have no time to scold you{N}now!{W2}"
		setFacing $81,LEFT
		nextSingleText $80,$81  ; "The Evil Spirit may know{N}something.{W1}"
		setActscriptWait $81,eas_Init
		entityActionsWait $81
		 moveLeft 3
		 moveUp 2
		 moveLeft 4
		endActions
		hide $81
		setActscriptWait $82,eas_Init2
		entityActionsWait $82
		 moveLeft 1
		 moveDown 1
		endActions
		nextSingleText $0,$82   ; "You guys, follow him.{N}Follow him!{W1}"
		entityActionsWait $82
		 moveUp 1
		 moveLeft 3
		 moveUp 2
		 moveLeft 4
		endActions
		hide $82
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_5B466:       textCursor $78C
		setCamDest 12,15
		csWait 20
		setFacing $7,UP
		setFacing $0,UP
		shiver $1F
		csWait 20
		nextSingleText $0,$7    ; "Oddler?{W1}"
		nextSingleText $0,$81   ; "I understand you.{W1}"
		setFacing $1F,UP
		setFacing $82,UP
		setPos $81,17,15,DOWN
		setCamDest 12,7
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setActscriptWait $82,eas_Init
		setPos $0,15,23,UP
		setPos $7,15,22,UP
		setPos $1F,16,22,UP
		setPos $82,16,23,UP
		hide $E
		hide $10
		hide $11
		hide $F
		setCameraEntity $81
		entityActionsWait $81
		 moveDown 2
		 moveLeft 2
		 moveDown 4
		endActions
		setCamDest 10,18
		nextSingleText $0,$7    ; "Understand what?{W1}"
		nextText $0,$81         ; "Oddler will remain here.{W2}"
		entityActionsWait $81
		 moveRight 1
		 faceDown 1
		endActions
		nextSingleText $0,$81   ; "Won't you, Oddler?{W1}"
		setFacing $7,RIGHT
		setFacing $1F,LEFT
		nextSingleText $0,$7    ; "Oddler, is this true?{W1}"
		nextText $80,$1F        ; "I don't know why, but I{N}would like to stay.{W2}"
		nextSingleText $80,$1F  ; "No, I must stay here....{N}I must stay here....{W1}"
		entityActionsWait $81
		 moveLeft 1
		 faceDown 1
		endActions
		setFacing $7,UP
		setFacing $1F,UP
		nextText $0,$81         ; "He's weak.{W2}"
		nextSingleText $0,$81   ; "He had better stay.{N}Say farewell.{W1}"
		entityActionsWait $1F
		 moveUp 1
		endActions
		setFacing $1F,LEFT
		setFacing $81,RIGHT
		csWait 60
		nod $81
		csWait 30
		entityActionsWait $81
		 moveLeft 1
		 faceDown 1
		endActions
		entityActionsWait $1F
		 moveLeft 1
		 faceDown 1
		endActions
		nextText $80,$1F        ; "It was great travelling with{N}you {LEADER}.{W2}"
		nextSingleText $80,$1F  ; "Thank you.  Please be{N}careful.{W1}"
		nod $1F
		csWait 30
		entityActionsWait $1F
		 moveUp 1
		endActions
		csWait 70
		setFacing $1F,DOWN
		csWait 50
		setFacing $1F,UP
		csWait 30
		entityActionsWait $1F
		 moveUp 3
		endActions
		hide $1F
		entityActionsWait $81
		 moveRight 1
		 faceDown 1
		endActions
		nextText $0,$81         ; "{LEADER}, you'll learn{N}the reason why he has to stay{N}here soon enough.{W2}"
		nextSingleText $0,$81   ; "Don't think about it now.{N}Go to the north.{W1}"
		followEntity $7,$0,$2
		followEntity $82,$7,$2
		csc_end
