
; ASM FILE data\maps\entries\map19\mapsetups\s6_1FB.asm :
; 0x53168..0x53634 : 

; =============== S U B R O U T I N E =======================================

ms_map19_flag1FB_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $1FB               ; Battle 7 completed
		beq.s   return_53174
		lea     cs_53FD8(pc), a0
		trap    #6
return_53174:
		rts

	; End of function ms_map19_flag1FB_InitFunction

cs_53176:       setCameraEntity $FFFF
		textCursor $2D1
		newEntity $90,29,9,1,$CF
		newEntity $91,28,9,1,$CE
		newEntity $92,28,10,1,$CA
		newEntity $93,28,11,1,$CA
		csWait 1
		newEntity $94,30,9,1,$CE
		newEntity $95,30,10,1,$CA
		newEntity $96,30,11,1,$CA
		csWait 1
		setPos $0,26,9,0
		setPos $1,26,10,0
		setPos $2,26,11,0
		setPos $8C,63,63,3
		setActscript $0,$FF,eas_Init
		setActscript $1,$FF,eas_Init
		setActscript $2,$FF,eas_Init
		fadeInB
		setCamDest 24,5
		csWait 40
		nextSingleText $80,$8A  ; "That's all the info I can{N}give you about the mission.{W1}"
		moveEntity $90,$FF,$1,$1
		endMove $8080
		nextSingleText $80,$8A  ; "So, all we have to do is{N}find the evil Gizmo and{N}kill him.{W1}"
		entityNod $8A
		nextSingleText $80,$8A  ; "That's right.  Kill him{N}before he possesses{N}somebody else.{W2}"
		nextSingleText $80,$8A  ; "You may go.{W1}"
		nextSingleText $0,$90   ; "Yes, sir.{W1}"
		setFacing $90,3
		nextSingleText $0,$90   ; "Let's go and defeat the{N}evil Gizmo.{W1}"
		setActscript $91,$0,eas_Jump
		setActscript $92,$0,eas_Jump
		setActscript $93,$0,eas_Jump
		setActscript $94,$0,eas_Jump
		setActscript $95,$0,eas_Jump
		setActscript $96,$FF,eas_Jump
		setActscript $91,$0,eas_Jump
		setActscript $92,$0,eas_Jump
		setActscript $93,$0,eas_Jump
		setActscript $94,$0,eas_Jump
		setActscript $95,$0,eas_Jump
		setActscript $96,$FF,eas_Jump
		csWait 25
		moveEntity $90,$FF,$3,$4
		endMove $8080
		setFacing $91,3
		setFacing $92,3
		setFacing $93,3
		setFacing $94,3
		setFacing $95,3
		setFacing $96,3
		csWait 20
		setFacing $90,1
		setCamDest 23,6
		nextSingleText $0,$90   ; "Forward men!{W1}"
		moveEntity $90,$0,$3,$6
		endMove $8080
		moveEntity $91,$0,$3,$6
		endMove $8080
		moveEntity $92,$0,$3,$6
		endMove $8080
		moveEntity $93,$0,$3,$6
		endMove $8080
		moveEntity $94,$0,$3,$6
		endMove $8080
		moveEntity $95,$0,$3,$6
		endMove $8080
		moveEntity $96,$FF,$3,$6
		endMove $8080
		hideEntity $90
		hideEntity $91
		hideEntity $92
		hideEntity $93
		hideEntity $94
		hideEntity $95
		hideEntity $96
		csWait 40
		setCamDest 24,6
		moveEntity $8A,$FF,$3,$3
		endMove $8080
		csWait 70
		nextText $80,$8A        ; "Sir Astral is still{N}sleeping...{N}Is he alright?{W2}"
		nextSingleText $80,$8A  ; "The King is upstairs looking{N}in on Sir Astral.{N}I'm worried.{W1}"
		setFacing $8A,2
		csWait 30
		moveEntity $1,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$1    ; "Is he going to be OK?{W1}"
		moveEntity $2,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$2    ; "We...we are...{W1}"
		csWait 20
		customActscript $8A,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $8A,$FF,$2,$1
		endMove $8080
		nextText $80,$8A        ; "He just fainted because{N}he was exhausted by the{N}two battles.{W2}"
		nextSingleText $80,$8A  ; "Don't worry about him.{N}If he dies, it doesn't matter.{N}He's old anyway.{W1}"
		csWait 40
		nextSingleText $0,$8C   ; "Minister!{N}Is the Minister there?{W1}"
		setFacing $8A,3
		csWait 30
		setPos $8C,23,13,1
		moveEntity $8C,$FF,$0,$3
		moreMove $1,$1
		moreMove $0,$3
		moreMove $1,$2
		endMove $8080
		setFacing $8A,0
		nextSingleText $80,$8A  ; "Here I am.{W1}"
		csWait 5
		setActscript $8C,$0,eas_461E4
		csWait 120
		setFacing $8C,2
		nextSingleText $0,$8C   ; "Did our soldiers leave{N}for the subjugation?{W1}"
		entityNod $8A
		nextSingleText $80,$8A  ; "Yes, just a few minutes{N}ago.{W1}"
		csWait 30
		setCamDest 23,5
		moveEntity $8C,$FF,$1,$1
		moreMove $C,$28
		moreMove $1,$1
		moreMove $C,$28
		moreMove $1,$1
		endMove $8080
		moveEntity $8C,$FF,$C,$28
		moreMove $1,$1
		endMove $8080
		setFacing $8C,3
		moveEntity $8A,$FF,$0,$1
		moreMove $1,$1
		endMove $8080
		setFacing $8A,1
		csWait 20
		nextText $0,$8C         ; "Oh, I'm too late.{W2}"
		nextSingleText $0,$8C   ; "Astral came back to his{N}senses just now.{W1}"
		customActscript $8A,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $8A,$FF,$1,$1
		endMove $8080
		nextSingleText $80,$8A  ; "That's great!{N}Did you talk to him?{W1}"
		nextText $0,$8C         ; "Astral said, he feels an ill{N}omen behind the opening of{N}the tower and Gizmo appearing.{W2}"
		nextSingleText $0,$8C   ; "We must study the ancient{N}history of Grans Island.{W1}"
		nextSingleText $80,$8A  ; "How?{W1}"
		nextText $0,$8C         ; "A historian named Hawel{N}lives northwest of Yeel.{W2}"
		nextSingleText $0,$8C   ; "Astral asked me to send{N}soldiers for him, but....{W1}"
		nextSingleText $80,$8A  ; "Ah, I understand.{W1}"
		nextSingleText $0,$8C   ; "What should we do now?{W1}"
		setFacing $8A,3
		nextSingleText $80,$8A  ; "What should we do?{W1}"
		stopEntity $8C
		stopEntity $8A
		csWait 80
		setActscript $8C,$FF,eas_Jump
		startEntity $8C
		nextSingleText $0,$8C   ; "Oh, yes!{W1}"
		setActscript $8A,$FF,eas_Jump
		startEntity $8A
		nextSingleText $80,$8A  ; "Ah, yes!{W1}"
		nextSingleText $0,$8C   ; "Minister, I have a good{N}idea.{W1}"
		setFacing $8A,1
		nextSingleText $80,$8A  ; "As do I.{W1}"
		moveEntity $8A,$FF,$3,$1
		endMove $8080
		setFacing $8A,2
		nextText $80,$8A        ; "You're the pupils of Astral.{N}I know of you, {LEADER}.{W2}"
		moveEntity $0,$FF,$0,$1
		endMove $8080
		csWait 20
		nextSingleText $80,$8A  ; "I heard that you did a very{N}good job in the Ancient{N}Tower.{W1}"
		moveEntity $8C,$FF,$3,$1
		endMove $8080
		nextText $0,$8C         ; "Why don't you go to Yeel{N}and bring Hawel back here?{W2}"
		nextText $0,$8C         ; "I don't think this is a{N}difficult job.{N}Will you go?{W1}"
cs_53482:       yesNo
		jumpIfFlagSet $59,cs_534AC; YES/NO prompt answer
		hideText
		textCursor $2F5
		setActscript $8A,$FF,eas_Jump
		setActscript $8A,$FF,eas_Jump
		nextText $80,$8A        ; "You refuse the King's{N}wish?!{N}Answer again!{W1}"
		jump cs_53482
cs_534AC:       moveEntity $8C,$FF,$3,$1
		endMove $8080
		setFacing $8C,2
		textCursor $2F6
		nextSingleText $0,$8C   ; "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
		followEntity $1,$0,$2
		followEntity $2,$1,$2
		csc_end
cs_534D2:       textCursor $2B6
		nextSingleText $0,$1C   ; "Stop, please stop!{N}Don't make me use my{N}sword any more!{W1}"
		setCamDest 17,6
		nextText $80,$80        ; "Where is King Galam?{N}He went into the tower,{N}Ground Seal, right?{W2}"
		nextSingleText $80,$80  ; "Then, I must go there!{W1}"
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setEntityDest $80,23,12
		setEntityDest $1C,20,10
		nextSingleText $0,$1C   ; "Please don't move, or I'll{N}have to kill you!  Please!{W1}"
		moveEntity $80,$FF,$5,$1
		endMove $8080
		nextText $80,$80        ; "{NAME;28}, calm down!{N}You already figured it out,{N}didn't you?{W2}"
		nextText $80,$80        ; "We didn't attack Galam.{N}Your King lied!{N}We are allies.{W2}"
		nextSingleText $80,$80  ; "Do you believe me?{N}We would never....{W1}"
		setFacing $1C,0
		csWait 20
		setFacing $1C,1
		csWait 30
		entityShakeHead $1C
		nextSingleText $0,$1C   ; "Stop!  NO!{N}King Galam is my...{W1}"
		nextText $80,$80        ; "You have to believe me.{W2}"
		nextSingleText $80,$80  ; "Your King is possessed{N}by a devil.{N}He is not King Galam!{W1}"
		setFacing $1C,0
		nextSingleText $0,$1C   ; "No!....{W1}"
		csWait 30
		nextSingleText $FF,$FF  ; "Princess Elis screams{N}for help.{W1}"
		setFacing $1C,1
		nextSingleText $0,$98   ; "No, no!{N}Father!  Astral!{N}Somebody please...!{W1}"
		nextSingleText $80,$82  ; "Elis!{W1}"
		setFacing $1C,0
		csWait 20
		setFacing $80,0
		nextText $80,$80        ; "He is taking her away!{W2}"
		nextSingleText $80,$80  ; "We have no time.{W1}"
		setEntityDest $80,21,10
		nextSingleText $0,$1C   ; "Stop, sir!{N}I can't let you pass!{W1}"
		nextSingleText $80,$80  ; "Then you come with me!{N}Yes, a good idea.{W1}"
		csWait 30
		setFacing $1C,3
		csWait 50
		setFacing $1C,0
		csWait 20
		entityNod $1C
		csWait 30
		moveEntity $1C,$FF,$2,$1
		endMove $8080
		csWait 20
		moveEntity $80,$FF,$2,$1
		endMove $8080
		moveEntity $1C,$FF,$1,$3
		moreMove $2,$3
		endMove $8080
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextSingleText $80,$80  ; "You kids, follow me!{W1}"
		entityNod $84
		entityNod $85
		moveEntity $80,$0,$1,$3
		moreMove $2,$3
		endMove $8080
		moveEntity $85,$0,$0,$1
		moreMove $1,$3
		moreMove $2,$3
		endMove $8080
		moveEntity $84,$FF,$1,$1
		moreMove $0,$1
		moreMove $1,$3
		moreMove $2,$3
		endMove $8080
		hideEntity $80
		hideEntity $1C
		hideEntity $84
		hideEntity $85
		csc_end
cs_535FA:       textCursor $2B2
		nextText $0,$81         ; "Oh, it's you, {LEADER}!{W2}"
		nextSingleText $0,$81   ; "King Galam took{N}Princess Elis to the{N}Ancient Tower!{W1}"
		nextSingleText $0,$82   ; "Elis is in the tower.{N}I shall go with you and{N}save my daughter.{W1}"
		nextSingleText $FF,$FF  ; "King Granseal and the{N}Minister go with {LEADER}.{W1}"
		followEntity $82,$0,$2
		followEntity $81,$82,$2
		csc_end
cs_53620:       textCursor $2C9
		nextSingleText $0,$80   ; "Strange earthquake....{N}{LEADER}, you must{N}escape!{W1}"
		csc_end
cs_5362A:       textCursor $2CA
		nextSingleText $0,$80   ; "OK, everybody is safe.{W1}"
		csc_end
