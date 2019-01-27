
; ASM FILE data\maps\entries\map03\mapsetups\s6_261.asm :
; 0x513C0..0x516CC : 

; =============== S U B R O U T I N E =======================================

ms_map3_flag261_InitFunction:
		
		 
		chkFlg $3               ; Jaha joined
		beq.s   return_513CC
		lea     cs_513CE(pc), a0
		trap    #6
return_513CC:
		rts

	; End of function ms_map3_flag261_InitFunction

cs_513CE:       hide $3
		csc_end

; =============== S U B R O U T I N E =======================================

sub_513D4:
		rts

	; End of function sub_513D4

cs_513D6:       entityActionsWait $1
		 moveLeft 1
		 moveUp 1
		endActions
		csc_end
cs_513E2:       textCursor $216
		nextText $0,$1          ; "{LEADER}, so you decided{N}to go?{W1}"
		yesNo
		jumpIfFlagSet $59,cs_51406; YES/NO prompt answer
		textCursor $214
		nextText $0,$1          ; "No?  Really?{N}Then I'm not going either!{W2}"
		nextSingleText $0,$1    ; "But, if you change your{N}mind, let me know right{N}away!{W1}"
		jump cs_51650
cs_51406:       textCursor $217
		nextSingleText $0,$1    ; "Great!{N}Let's go right now!{N}Hurry!{W1}"
		setFacing $2,LEFT
		nextSingleText $0,$2    ; "What?  {LEADER}, are you{N}going?  I'm going too!{W1}"
		setF $258               ; set after agreeing to try getting into the castle
		setF $42                ; Sarah + Chester are followers
		join $80
		followEntity $1,$0,$2
		followEntity $2,$1,$2
		setPos $8A,27,3,DOWN
		setPos $8B,31,3,DOWN
		csc_end
cs_51444:       moveNextToPlayer $8C,LEFT
		csc_end
cs_5144C:       moveNextToPlayer $8A,UP
		csc_end
cs_51454:       moveNextToPlayer $8B,UP
		csc_end
cs_5145C:       setActscriptWait $80,eas_Init
		entityActionsWait $80
		 moveUp 2
		 faceLeft 20
		endActions
		textCursor $1FE
		nextText $0,$80         ; "Good morning {LEADER}!{N}You woke up late this{N}morning.{W2}"
		nextText $0,$80         ; "Did the storm wake you up?{W2}"
		textCursor $1E3
		nextSingleText $0,$80   ; "Hurry to school!{N}Sir Astral and {NAME;1} must{N}be waiting.{W1}"
		setActscriptWait $80,eas_Init
		csc_end
cs_5148C:       setPos $1,41,10,UP
		setPos $80,6,4,UP
		csc_end
cs_5149A:       textCursor $205
		csWait 20
		setFacing $0,UP
		csWait 60
		setPos $8E,46,7,LEFT
		entityActionsWait $8E
		 moveLeft 1
		 moveDown 1
		 moveLeft 3
		endActions
		setFacing $8E,DOWN
		nextText $0,$8E         ; "Is everybody here?{N}OK, let's start.{W2}"
		nextText $0,$8E         ; "Where is {NAME;3}?{N}Overslept again?  Oh, well.{N}I can't wait for him.{W2}"
		nextSingleText $0,$8E   ; "Where did I leave off{N}yesterday?{W1}"
		entityActionsWait $8E
		 moveUp 1
		endActions
		csWait 120
		nextSingleText $0,$8F   ; "Sir Astral!{W1}"
		setFacing $0,DOWN
		setFacing $1,DOWN
		setFacing $2,DOWN
		setFacing $8E,DOWN
		customActscriptWait $8F
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setPos $8F,41,17,UP
		entityActionsWait $8F
		 moveUp 6
		 moveRight 1
		 moveUp 2
		endActions
		setFacing $0,UP
		setFacing $1,UP
		setFacing $2,UP
		entityActionsWait $8F
		 moveUp 1
		endActions
		nod $8F
		nod $8F
		nextSingleText $0,$8F   ; "The Minister would like you{N}to come to the castle!{W1}"
		nextSingleText $0,$8E   ; "What has happened?{N}Why are you so...?{W1}"
		nextSingleText $0,$8F   ; "The King.  He has fallen{N}down and is in great pain!{W1}"
		nextSingleText $0,$8E   ; "What?!  The King?{N}OK, I'm coming!{W1}"
		csWait 15
		setActscriptWait $8F,eas_Init
		entityActions $8F
		 moveDown 3
		endActions
		entityActionsWait $8E
		 moveDown 3
		endActions
		setFacing $0,DOWN
		setFacing $1,DOWN
		setFacing $2,DOWN
		entityActions $8F
		 moveDown 1
		 moveLeft 1
		 moveDown 2
		endActions
		entityActionsWait $8E
		 moveDown 2
		 moveLeft 1
		 eaWait 20
		 moveRight 1
		endActions
		setFacing $8F,UP
		setFacing $8E,UP
		setCamDest 38,7
		nextSingleText $0,$8E   ; "Sorry, kids.  I have to go{N}to the castle.{N}Stay here.{W1}"
		entityActionsWait $8E
		 moveLeft 1
		endActions
		entityActions $8F
		 moveDown 3
		endActions
		entityActionsWait $8E
		 moveDown 5
		endActions
		hide $8E
		hide $8F
		setCamDest 38,6
		setFacing $0,RIGHT
		setFacing $2,LEFT
		nextText $0,$2          ; "{LEADER}, did you hear that?{N}The King is sick!{W2}"
		nextSingleText $0,$2    ; "But, I think it must be{N}something else!{N}He was acting so strange!{W1}"
		entityActionsWait $1
		 moveDown 1
		 moveRight 3
		endActions
		setFacing $1,UP
		setFacing $0,DOWN
		setFacing $2,DOWN
		nextSingleText $C0,$1   ; "Hey, {NAME;2}!{N}Let's go to the castle.{W1}"
		nextSingleText $0,$2    ; "We can't, {NAME;1}!{N}We're just kids.{N}They won't let us in.{W1}"
		nextSingleText $C0,$1   ; "Never mind that.{N}I have a plan!{W1}"
		entityActionsWait $1
		 moveLeft 1
		endActions
		setFacing $1,UP
		nextText $C0,$1         ; "{LEADER}, maybe we can{N}meet the Princess!{N}Are you going with us?{W1}"
		yesNo
		jumpIfFlagSet $59,cs_51614; YES/NO prompt answer
		nextText $0,$1          ; "No?  Really?{N}Then I'm not going either!{W2}"
		nextSingleText $0,$1    ; "But, if you change your{N}mind, let me know right{N}away!{W1}"
		entityActionsWait $1
		 moveLeft 2
		 moveUp 1
		endActions
		setFacing $2,UP
		jump cs_51650
cs_51614:       textCursor $217
		nextSingleText $0,$1    ; "Great!{N}Let's go right now!{N}Hurry!{W1}"
		setFacing $2,LEFT
		nextSingleText $0,$2    ; "What?  {LEADER}, are you{N}going?  I'm going too!{W1}"
		setF $258               ; set after agreeing to try getting into the castle
		setF $42                ; Sarah + Chester are followers
		join $80
		followEntity $1,$0,$2
		followEntity $2,$1,$2
		setPos $8A,27,3,DOWN
		setPos $8B,31,3,DOWN
cs_51650:       csc_end
cs_51652:       textCursor $219
		entityActions $8A
		 moveRight 1
		endActions
		entityActionsWait $8B
		 moveLeft 1
		endActions
		setFacing $8A,DOWN
		setFacing $8B,DOWN
		nextSingleText $0,$8A   ; "Halt!{N}Where do you think you're{N}going?{W1}"
		setFacing $1,UP
		setFacing $2,UP
		nextSingleText $C0,$1   ; "Well, let's see....{N}Ummm...yes, Sir Astral{N}called us!{W1}"
		nextSingleText $0,$8A   ; "Why?{W1}"
		nextSingleText $C0,$1   ; "We're his pupils.{N}He left a package behind,{N}and....{W1}"
		nextSingleText $0,$8A   ; "You want to deliver it to{N}him?{N}Well...OK, go ahead.{W1}"
		nextSingleText $0,$8B   ; "(Cough!){N}Be good in the castle, OK?{W1}"
		entityActions $8A
		 moveLeft 1
		endActions
		entityActionsWait $8B
		 moveRight 1
		endActions
		setFacing $8A,DOWN
		setFacing $8B,DOWN
		csc_end
cs_516A8:       textCursor $296
		nextSingleText $0,$3    ; "Here you are!{N}I've been waiting.{W1}"
		moveNextToPlayer $3,LEFT
		nextSingleText $0,$3    ; "A soldier said you went{N}into the castle.{N}Is that true?{W2}{N}Oooww!  I missed it!{N}I would've woken up early{N}if I knew that...!{W1}{N}So I came to meet you{N}here, {LEADER}.{N}You're going to Yeel, right?{W2}{N}Under the King's orders!{N}Cool!  Of course, I'm{N}going too!{W1}"
		join $3
		nextSingleText $0,$3    ; "Let's go!{W1}"
		followEntity $3,$2,$2
		csc_end
