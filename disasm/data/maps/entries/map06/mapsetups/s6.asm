
; ASM FILE data\maps\entries\map06\mapsetups\s6.asm :
; 0x54E54..0x5537E : 

; =============== S U B R O U T I N E =======================================

ms_map6_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $322
		beq.s   loc_54E62
		lea     cs_54E70(pc), a0
		trap    #6
		rts
loc_54E62:
		trap    #CHECK_FLAG
		dc.w $2C2
		beq.s   return_54E6E
		lea     cs_54E78(pc), a0
		trap    #6
return_54E6E:
		rts

	; End of function ms_map6_InitFunction

cs_54E70:       setPos $84,11,18,3
		csc_end
cs_54E78:       setPos $8A,63,63,3
		setPos $8B,15,23,3
		csc_end
cs_54E86:       textCursor $42A
		setCameraEntity $8B
		nextSingleText $0,$8B   ; "A strange animal?{N}Really?{W1}"
		nextSingleText $0,$8A   ; "Yeah!  It's a very big bird!{W1}"
		csWait 30
		setFacing $8B,3
		csWait 50
		setFacing $8B,2
		nextText $0,$8B         ; "People are surrounding the{N}bird.  Should we talk to it?{W2}"
		nextText $0,$8B         ; "It would be a good{N}opportunity.{W2}"
		nextSingleText $0,$8B   ; "I'll go see the bird!{N}You tell the King about it!{W1}"
		moveEntity $8B,$FF,$3,$3
		moreMove $0,$4
		moreMove $3,$8
		endMove $8080
		csWait 20
		setActscript $8B,$FF,eas_Jump
		csWait 20
		setFacing $8B,0
		csWait 20
		setActscript $8B,$FF,eas_Jump
		setFacing $8B,3
		csWait 30
		csWait 5
		setActscript $8B,$0,eas_461B6
		csWait 60
		moveEntity $8B,$FF,$2,$1
		moreMove $3,$2
		endMove $8080
		setFacing $8B,0
		setPos $0,10,9,3
		setCameraEntity $8A
		moveEntity $8A,$FF,$1,$1
		endMove $8080
		nextText $0,$8A         ; "Oh, {LEADER}.{N}Good timing.{W2}"
		nextText $0,$8A         ; "There's a strange animal in{N}town.{W2}"
		nextSingleText $0,$8A   ; "It's very exciting!{W1}"
		setCameraEntity $0
		moveEntity $8A,$FF,$0,$1
		moreMove $1,$7
		endMove $8080
		hideEntity $8A
		csc_end
cs_54F26:       textCursor $432
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $88,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $89,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8C,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $7,$FF,eas_46172
		setCameraEntity $88
		setFacing $88,2
		nextSingleText $0,$88   ; "Oooo...it's big!{N}I want to touch him!{W1}"
		setFacing $88,0
		csWait 30
		moveEntity $88,$0,$0,$1
		endMove $8080
		csWait 8
		moveEntity $7,$FF,$0,$1
		endMove $8080
		csWait 30
		setFacing $88,3
		nextSingleText $0,$88   ; "Ooops!{W1}"
		setCameraEntity $89
		nextSingleText $0,$89   ; "Ha, ha!  You missed.{N}Let me try.{W1}"
		setActscript $7,$FF,eas_Init
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $89,$0,$2,$1
		endMove $8080
		csWait 8
		moveEntity $7,$FF,$3,$1
		endMove $8080
		setFacing $89,3
		nextText $0,$89         ; "Wow, he's fast!{W2}"
		nextSingleText $0,$89   ; "Hey, he's over there!{W1}"
		setCameraEntity $8C
		nextSingleText $0,$8C   ; "OK, my turn!{W1}"
		moveEntity $8C,$0,$1,$1
		endMove $8080
		csWait 8
		moveEntity $7,$FF,$2,$1
		moreMove $6,$1
		endMove $8080
		setFacing $88,0
		setFacing $89,2
		nextSingleText $0,$8C   ; "Gosh, he's quick!{W1}"
		setCameraEntity $7
		setFacing $7,1
		csWait 30
		setFacing $7,0
		csWait 30
		nextSingleText $0,$7    ; "Stop!  Stop this!{W1}"
		setActscript $88,$0,eas_Jump
		setActscript $89,$0,eas_Jump
		setActscript $8C,$FF,eas_Jump
		setFacing $88,3
		setFacing $89,2
		setFacing $8C,2
		csWait 30
		nextSingleText $0,$8C   ; "Amazing!  He speaks!{W1}"
		nextText $0,$7          ; "Of course I do.{W2}"
		nextSingleText $0,$7    ; "Is this how you greet{N}strangers?{W1}"
		moveEntity $89,$FF,$3,$1
		moreMove $2,$1
		endMove $8080
		nextSingleText $0,$88   ; "Shut up, bird!{W1}"
		csWait 5
		setActscript $7,$0,eas_461B6
		nextText $0,$7          ; "How barbaric!{W2}"
		nextSingleText $0,$7    ; "I didn't know humans were{N}so impolite.{W1}"
		setFacing $88,0
		setFacing $89,3
		setFacing $8C,1
		nextSingleText $0,$89   ; "What?{W1}"
		setFacing $7,0
		setFacing $88,3
		setFacing $89,2
		setFacing $8C,2
		nextSingleText $FF,$FF  ; "Those boys are about to{N}hit the bird.{W1}"
		moveEntity $88,$0,$3,$1
		endMove $8080
		moveEntity $89,$0,$2,$1
		endMove $8080
		moveEntity $8C,$0,$2,$1
		endMove $8080
		csWait 5
		setActscript $7,$FF,eas_Init
		setActscript $7,$FF,eas_JumpLeft
		nextSingleText $0,$90   ; "Stop!{W1}"
		setQuake 3
		csWait 40
		setFacing $7,1
		setFacing $88,1
		setFacing $89,1
		setFacing $8C,1
		setFacing $0,1
		setFacing $80,1
		setFacing $82,1
		setFacing $83,1
		setFacing $84,1
		setFacing $85,1
		setFacing $86,1
		setFacing $87,1
		setFacing $8B,1
		setFacing $8D,1
		setQuake 0
		setPos $90,16,17,3
		setPos $91,15,16,3
		setPos $92,16,16,3
		setCameraEntity $90
		csWait 60
		moveEntity $90,$0,$3,$3
		endMove $8080
		moveEntity $91,$0,$3,$3
		endMove $8080
		moveEntity $92,$FF,$3,$3
		moreMove $0,$1
		endMove $8080
		setFacing $92,3
		nextSingleText $0,$90   ; "What do you think you're{N}doing?{W1}"
		moveEntity $88,$0,$1,$2
		moreMove $0,$2
		endMove $8080
		moveEntity $89,$0,$1,$2
		moreMove $0,$2
		endMove $8080
		moveEntity $8C,$FF,$1,$2
		moreMove $0,$2
		endMove $8080
		setFacing $88,1
		setFacing $89,1
		setFacing $8C,1
		setCamDest 12,21
		moveEntity $90,$FF,$3,$2
		endMove $8080
		moveEntity $82,$FF,$3,$1
		moreMove $0,$1
		endMove $8080
		setFacing $88,2
		setFacing $89,2
		setFacing $8C,2
		setFacing $0,2
		setFacing $80,2
		setFacing $82,3
		setFacing $83,3
		setFacing $84,3
		setFacing $85,3
		setFacing $86,3
		setFacing $87,0
		setFacing $8B,0
		setFacing $8D,0
		moveEntity $90,$FF,$3,$4
		endMove $8080
		nextText $0,$90         ; "I'm sorry.  I must apologize{N}for their actions.{W2}"
		nextText $0,$90         ; "Welcome to Granseal.{N}I am the Minister.{W2}"
		nextSingleText $0,$90   ; "We just settled here.{N}We're strangers here.{W1}"
		nextText $0,$7          ; "Ha, ha!  You're right.{W2}"
		nextSingleText $0,$7    ; "But, I'm very happy to meet{N}a man like you!{W1}"
		nextText $0,$90         ; "Please stay here as long{N}as you like.{W2}"
		nextSingleText $0,$90   ; "Let me introduce you to{N}King Granseal.{N}Follow me, please.{W1}"
		csWait 40
		setCameraEntity $7
		moveEntity $90,$0,$1,$8
		endMove $8080
		moveEntity $7,$FF,$1,$8
		endMove $8080
		setFacing $91,0
		setFacing $92,2
		csWait 30
		setCameraEntity $FFFF
		moveEntity $90,$0,$2,$1
		moreMove $1,$5
		endMove $8080
		moveEntity $7,$0,$2,$1
		moreMove $1,$5
		endMove $8080
		moveEntity $91,$0,$2,$1
		moreMove $1,$5
		endMove $8080
		moveEntity $92,$FF,$2,$1
		moreMove $1,$2
		moreMove $2,$1
		moreMove $1,$3
		endMove $8080
		hideEntity $90
		hideEntity $91
		hideEntity $92
		hideEntity $7
		moveEntity $82,$FF,$2,$1
		endMove $8080
		setFacing $82,3
		csc_end
cs_55242:       textCursor $463
		newEntity $8E,11,0,3,$CE
		customActscript $8E,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $8E,$FF,$3,$7
		endMove $8080
		setFacing $0,1
		setFacing $7,1
		nextText $0,$8E         ; "Welcome back, {LEADER}!{N}I heard your journey was{N}hard.{W2}"
		nextText $0,$8E         ; "Sir Astral was right.{N}He said, you were coming{N}back soon.{W2}"
		nextSingleText $0,$8E   ; "I'll go to the castle and tell{N}everyone!{W1}"
		moveEntity $8E,$FF,$1,$7
		endMove $8080
		hideEntity $8E
		csc_end
cs_55288:       textCursor $466
		newEntity $12,16,22,3,$12
		setActscript $1F,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		nextSingleText $0,$12   ; "I finally found you.{N}You're {LEADER}, right?{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $1F,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		setFacing $8B,1
		setCamDest 14,17
		setEntityDest $0,19,28
		setEntityDest $1F,20,28
		setEntityDest $7,20,27
		setFacing $0,1
		setFacing $1F,1
		setFacing $7,1
		moveEntity $12,$FF,$3,$2
		moreMove $0,$3
		moreMove $3,$1
		endMove $8080
		setCamDest 14,22
		setFacing $1F,2
		nextSingleText $C0,$1F  ; "Who are you?{W1}"
		setFacing $1F,1
		nextSingleText $0,$12   ; "My love, I mean{N}{NAME;13} is with you.{N}Am I right?{W1}"
		nextSingleText $C0,$7   ; "Yes, he joined us willingly.{W1}"
		entityShakeHead $12
		nextText $0,$12         ; "No, no.  I don't want to stop{N}him, but...{N}I want to be with him!{W2}"
		nextSingleText $0,$12   ; "Please take me with you.{N}Please!{W1}"
		setFacing $7,3
		csWait 50
		moveEntity $7,$FF,$0,$1
		moreMove $3,$1
		endMove $8080
		setFacing $7,1
		nextSingleText $C0,$1F  ; "This is not a sightseeing{N}trip, if you know what I{N}mean?{W1}"
		moveEntity $12,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$12   ; "Yes, I know.{N}I still want to go!{W1}"
		setFacing $0,0
		setFacing $1F,2
		nextSingleText $C0,$1F  ; "OK, you look tough enough,{N}anyway.{W1}"
		entityNod $0
		setFacing $0,1
		setFacing $1F,1
		nextSingleText $0,$12   ; "Oh, really?{N}Thank you very much!{W1}"
		join $12
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $12,$1F,$2
		csc_end
