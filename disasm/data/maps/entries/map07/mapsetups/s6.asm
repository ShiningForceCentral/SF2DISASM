
; ASM FILE data\maps\entries\map07\mapsetups\s6.asm :
; 0x55816..0x55F8E : 

; =============== S U B R O U T I N E =======================================

ms_map7_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2C3
		bne.s   return_55830
		move.b  #6,((EGRESS_MAP_INDEX-$1000000)).w
		lea     cs_55832(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2C3               ; set after the "one year has passed" text, after New Granseal is built
		trap    #SET_FLAG
		dc.w $19B               ; Battle 11 unlocked
return_55830:
		rts

	; End of function ms_map7_InitFunction

cs_55832:       textCursor $50A
		mapLoad 7,6,2
		loadMapEntities ce_559AE
		setActscript $0,$FF,eas_Init
		resetMap
		slowFadeInB
		reloadMap 6,2
		nextText $FF,$FF        ; "One year has passed.{W1}"
		textCursor $470
		stopEntity $81
		loadMapFadeIn 7,6,2
		playSound MUSIC_CASTLE
		fadeInB
		csWait 40
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setFacing $80,3
		entityNod $80
		nextText $0,$80         ; "(Cough)...our town is being{N}rebuilt, as you can see.{W2}"
		nextText $0,$80         ; "But, we will be better off{N}if there are no accidents.{W2}"
		nextText $0,$80         ; "You're too young to spend{N}your time guarding our new{N}home.{W2}"
		nextText $0,$80         ; "You are the soldiers of{N}Granseal!{W2}"
		nextSingleText $0,$80   ; "Do your best to improve our{N}new home!{W1}"
		csWait 30
		setFacing $80,1
		nextSingleText $0,$80   ; "King Granseal!{W1}"
		csWait 60
		nextSingleText $0,$80   ; "(Cough)...(cough)...{N}King Granseal!{W1}"
		csWait 20
		startEntity $81
		nextText $0,$80         ; "All the people of Granseal{N}have been working hard for{N}an entire year.{W2}"
		nextSingleText $0,$80   ; "Please thank them for their{N}hard work.{W1}"
		nextSingleText $0,$81   ; "Ah...I have nothing to say.{W1}"
		stopEntity $81
		nextText $0,$80         ; "N...nothing?{W2}"
		nextSingleText $0,$80   ; "Mmmm...alright.{W1}"
		setFacing $80,2
		setFacing $8B,0
		nextSingleText $0,$80   ; "Sir Astral, please speak in{N}place of our King.{W1}"
		entityNod $8B
		nextSingleText $0,$8B   ; "Ummmm...OK, I got it.{W1}"
		csWait 20
		moveEntity $80,$FF,$0,$1
		endMove $8080
		setFacing $80,2
		csWait 25
		moveEntity $8B,$FF,$0,$1
		endMove $8080
		setFacing $8B,3
		setFacing $80,3
		csWait 40
		nextText $0,$8B         ; "One year has passed since{N}we came here.{W2}"
		nextText $0,$8B         ; "The castle, the town...{N}everything is coming along{N}nicely.{W2}"
		nextText $0,$8B         ; "But we lack something.{N}What is it?  It's trading!{W2}"
		entityNod $80
		nextSingleText $0,$8B   ; "We need to make alliances{N}with other towns.{W1}"
		setFacing $8B,0
		setFacing $80,2
		nextSingleText $0,$80   ; "Indeed, indeed.{N}Thank you, sir!{W1}"
		csWait 20
		setFacing $8B,3
		setFacing $80,3
		nextSingleText $0,$80   ; "That's all for today.{N}You may go now.{W1}"
		moveEntity $82,$0,$3,$1
		moreMove $2,$5
		endMove $8080
		moveEntity $83,$0,$2,$5
		endMove $8080
		moveEntity $84,$0,$3,$1
		moreMove $2,$2
		endMove $8080
		moveEntity $85,$0,$3,$4
		endMove $8080
		moveEntity $86,$0,$0,$5
		endMove $8080
		moveEntity $87,$0,$3,$1
		moreMove $0,$2
		endMove $8080
		moveEntity $88,$FF,$3,$4
		endMove $8080
		moveEntity $8B,$0,$2,$1
		endMove $8080
		moveEntity $3,$FF,$3,$1
		endMove $8080
		moveEntity $3,$0,$0,$6
		endMove $8080
		moveEntity $1,$0,$0,$6
		endMove $8080
		moveEntity $4,$0,$1,$1
		moreMove $0,$6
		endMove $8080
		moveEntity $2,$FF,$1,$2
		moreMove $0,$6
		endMove $8080
		setFacing $8B,3
		setFacing $84,3
		setFacing $87,3
		reloadEntities ms_map7_Entities
		csc_end
ce_559AE:       dc.w $B
		dc.w 7
		dc.w 1
		dc.b $C
		dc.b 5
		dc.b 3
		dc.b $CD
		dc.l eas_Init           
		dc.b $B
		dc.b 4
		dc.b 3
		dc.b $CB
		dc.l eas_Init           
		dc.b $A
		dc.b 7
		dc.b 1
		dc.b $CE
		dc.l eas_Init           
		dc.b $A
		dc.b 8
		dc.b 1
		dc.b $CE
		dc.l eas_Init           
		dc.b $A
		dc.b 9
		dc.b 1
		dc.b $CE
		dc.l eas_Init           
		dc.b $A
		dc.b $A
		dc.b 1
		dc.b $CF
		dc.l eas_Init           
		dc.b $C
		dc.b 8
		dc.b 1
		dc.b $CF
		dc.l eas_Init           
		dc.b $C
		dc.b 9
		dc.b 1
		dc.b $CF
		dc.l eas_Init           
		dc.b $C
		dc.b $A
		dc.b 1
		dc.b $CF
		dc.l eas_Init           
		dc.b 8
		dc.b 7
		dc.b 0
		dc.b $D0
		dc.l eas_Init           
		dc.b $E
		dc.b 7
		dc.b 2
		dc.b $D0
		dc.l eas_Init           
		dc.b $A
		dc.b 5
		dc.b 3
		dc.b $D1
		dc.l eas_Init           
		dc.b $C
		dc.b 7
		dc.b 1
		dc.b 3
		dc.l eas_Init           
		dc.b $B
		dc.b 8
		dc.b 1
		dc.b 1
		dc.l eas_Init           
		dc.b $B
		dc.b 9
		dc.b 1
		dc.b 4
		dc.l eas_Init           
		dc.b $B
		dc.b $A
		dc.b 1
		dc.b 2
		dc.l eas_Init           
		dc.w $FFFF
cs_55A36:       textCursor $4AE
		setCamDest 6,2
		nextSingleText $0,$8B   ; "Are you a phoenix?{N}The legendary bird?{W1}"
		nextText $C0,$7         ; "Y...yeah, I'm a phoenix.{W2}"
		nextSingleText $C0,$7   ; "But...legendary?{N}I don't know about that.{W1}"
		nextSingleText $0,$81   ; "You are legendary, {NAME;7}!{N}I read that a phoenix serves{N}a god.{W1}"
		nextText $C0,$7         ; "God?  Ah, Volcanon!{N}{NAME;10} calls him a god. {W2}"
		nextSingleText $C0,$7   ; "As long as he watches over{N}us, nothing can break the{N}peace of Parmecia.{W1}"
		moveEntity $8B,$FF,$1,$1
		endMove $8080
		nextText $0,$8B         ; "Volcanon?  The great being{N}who created the Earth?{W2}"
		nextSingleText $0,$8B   ; "Oh, this is the happiest day{N}of my life!{W1}"
		moveEntity $8B,$FF,$3,$1
		endMove $8080
		setFacing $8B,0
		nextSingleText $0,$8B   ; "Please let me go with you{N}and meet Volcanon!{W1}"
		nextText $C0,$7         ; "Ummm...OK.{W2}"
		nextText $C0,$7         ; "To tell the truth, I hurt{N}my wing during this trip.{W2}"
		nextText $C0,$7         ; "I stopped by here to ask{N}for help.{W2}"
		nextSingleText $C0,$7   ; "But, I don't want to trouble{N}you....{W1}"
		entityNod $8B
		nextSingleText $0,$8B   ; "Don't worry.  These lads{N}love trouble.{W1}"
		moveEntity $8B,$FF,$3,$1
		moreMove $0,$1
		endMove $8080
		setFacing $8B,3
		setFacing $7,3
		nextText $0,$8B         ; "{LEADER}!{W2}"
		nextText $0,$8B         ; "Why didn't you tell me you{N}were here?  Did you listen{N}to our conversation?{W2}"
		nextText $0,$8B         ; "You know, it's time for us to{N}set out!{W2}"
		nextSingleText $0,$8B   ; "We're going to Mt. Volcano{N}with {NAME;7}.{N}It's in the far east!{W1}"
		nextSingleText $0,$80   ; "Sir Astral!{W1}"
		moveEntity $80,$FF,$3,$2
		endMove $8080
		setFacing $80,2
		setFacing $8B,0
		nextSingleText $0,$80   ; "You said, you're going too?{N}No!{W1}"
		setActscript $8B,$FF,eas_JumpLeft
		csWait 40
		moveEntity $8B,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$8B   ; "Wh...why not?{W1}"
		csWait 30
		nextText $0,$80         ; "We came here just a year{N}ago.{W2}"
		nextSingleText $0,$80   ; "We're still learning about{N}this country.  You're needed{N}here.{W1}"
		entityNod $81
		nextSingleText $0,$81   ; "He's right.  You must stay.{W1}"
		moveEntity $80,$0,$1,$1
		endMove $8080
		moveEntity $8B,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		setFacing $7,1
		nextText $0,$81         ; "{LEADER}, please take your{N}party and go with{N}{NAME;7}.{W2}"
		nextSingleText $0,$81   ; "Astral, do you agree?{W1}"
		setFacing $8B,3
		csWait 60
		nextText $0,$8B         ; "Hmmmmm....{W2}"
		setFacing $8B,1
		entityNod $8B
		nextSingleText $0,$8B   ; "Y...yes.{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextSingleText $C0,$7   ; "Then, they're my companions!{W1}"
		entityNod $81
		moveEntity $7,$FF,$3,$2
		endMove $8080
		nextText $C0,$7         ; "I'm {NAME;7}.{W2}"
		nextText $C0,$7         ; "I really appreciate your{N}kindness.{W2}"
		nextSingleText $C0,$7   ; "Mt. Volcano is in the east....{N}It's very far away.{W1}"
		nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}{NAME;7} with him.{W1}{CLEAR}"
		joinForceAI $7,$FFFF    ; 0054 JOIN FORCE WITH AI
		moveEntity $7,$FF,$3,$2
		endMove $8080
		followEntity $7,$0,$2
		followEntity $1,$7,$2
		followEntity $2,$1,$2
		followEntity $3,$0,$5
		followEntity $4,$0,$6
		csWait 60
		nextSingleText $0,$81   ; "Minister, bring the gift!{W1}"
		entityNod $80
		nextSingleText $0,$80   ; "Yes, sir.{W1}"
		moveEntity $80,$FF,$0,$2
		moreMove $1,$1
		endMove $8080
		setFacing $80,1
		csWait 60
		moveEntity $80,$FF,$2,$3
		moreMove $3,$2
		endMove $8080
		nextSingleText $0,$80   ; "A parting gift.  Take it.{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} receives 100{N}gold coins.{W1}"
		moveEntity $80,$FF,$1,$1
		moreMove $0,$1
		endMove $8080
		setFacing $80,3
		moveEntity $8B,$FF,$0,$1
		moreMove $3,$1
		endMove $8080
		nextSingleText $0,$8B   ; "Good luck, {LEADER}.{W2}"
		nextSingleText $0,$8B   ; "Find as many friends as you{N}can on your journey with{N}{NAME;7}.{W1}"
		entityNod $0
		csWait 60
		setCameraEntity $0
		moveEntity $0,$FF,$3,$12
		endMove $8080
		mapSysEvent $6,$B,$1,$3
		csc_end
cs_55BEE:       textCursor $4E1
		setActscript $7,$FF,eas_Init
		nextSingleText $0,$80   ; "Welcome back, {LEADER}.{W1}"
		setEntityDest $8000,11,7
		setEntityDest $7,10,8
		setCamDest 6,2
		setFacing $0,1
		setFacing $7,1
		nextSingleText $0,$8B   ; "Thanks to you, Granseal has{N}many allies to trade with.{W1}"
		nextText $0,$80         ; "You've also made a lot of{N}new friends!{W2}"
		nextSingleText $0,$80   ; "Great job!{W1}"
		nextText $0,$8B         ; "I heard about everything{N}from Bedoe.{W2}"
		nextText $0,$8B         ; "I never imagined Zeon could{N}be revived!{W1}"
		nextSingleText $0,$8B   ; "I understand that Volcanon{N}is angry.{W1}"
		setFacing $80,2
		nextSingleText $0,$80   ; "So Princess Elis must be...{W1}"
		nextSingleText $0,$7    ; "She's alive.{W1}"
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8B,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $80,3
		stopEntity $81
		stopEntity $8B
		stopEntity $80
		csWait 60
		playSound SFX_BATTLEFIELD_DEATH
		setActscript $81,$0,eas_Jump
		setActscript $8B,$0,eas_Jump
		setActscript $80,$FF,eas_Jump
		setActscript $81,$0,eas_Jump
		setActscript $8B,$0,eas_Jump
		setActscript $80,$FF,eas_Jump
		startEntity $81
		startEntity $8B
		startEntity $80
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$3,$2
		moreMove $2,$1
		moreMove $3,$1
		endMove $8080
		setActscript $7,$FF,eas_Jump
		nextSingleText $C0,$81  ; "What did you say?!{N}Is she alive?{W1}"
		nextSingleText $0,$7    ; "Y...yes!{W1}"
		nextSingleText $0,$8B   ; "Is it true?{N}Is it true?!{W1}"
		nextSingleText $0,$7    ; "Yes, it is.{W1}"
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8B,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$1,$1
		moreMove $0,$1
		moreMove $1,$2
		endMove $8080
		setFacing $81,3
		executeSubroutine csub_55EF4
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $7,$FF,$1,$1
		endMove $8080
		entityNod $0
		setActscript $7,$0,eas_Jump
		entityNod $80
		setFacing $7,0
		setActscript $0,$0,eas_Jump
		entityNod $8B
		moveEntity $7,$0,$1,$1
		endMove $8080
		entityShakeHead $0
		setActscript $7,$FF,eas_Jump
		moveEntity $7,$FF,$0,$2
		endMove $8080
		setFacing $7,1
		entityNod $80
		setActscript $8B,$FF,eas_Jump
		entityNod $0
		nextSingleText $FF,$FF  ; "{LEADER} and {NAME;7}{N}explain in detail.{W1}"
		moveEntity $7,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		entityNod $7
		setFacing $8B,0
		setFacing $80,2
		setActscript $81,$FF,eas_Jump
		entityNod $81
		moveEntity $0,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		setFacing $8B,3
		entityNod $0
		moveEntity $0,$FF,$3,$1
		moreMove $0,$1
		endMove $8080
		setFacing $0,1
		nextText $FF,$FF        ; "About the ancient ruins{N}and Creed....{W2}"
		nextText $FF,$FF        ; "And Zeon's message through{N}Evil Spilit.{W2}"
		nextSingleText $FF,$FF  ; "They explain everything.{W1}"
		moveEntity $7,$0,$3,$1
		moreMove $2,$1
		moreMove $3,$1
		endMove $8080
		setFacing $80,3
		waitIdle $7
		setFacing $7,1
		executeSubroutine sub_55F82
		csWait 10
		nextSingleText $0,$80   ; "Amazing!{N}{LEADER}!  And {NAME;7}...{W1}"
		setFacing $80,2
		nextSingleText $0,$80   ; "you've experienced a great{N}deal.{W1}"
		nextSingleText $0,$8B   ; "Hmmm...mmmm....{W1}"
		nextSingleText $0,$80   ; "Sir Astral?{W1}"
		setFacing $8B,0
		nextSingleText $0,$8B   ; "What should we do now?{W1}"
		nextSingleText $C0,$81  ; "Easy, we have to defeat{N}Zeon and save Elis!{W1}"
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setFacing $80,1
		nextSingleText $0,$80   ; "Impossible!{W1}"
		csWait 50
		setFacing $8B,1
		nextSingleText $0,$8B   ; "The King is right.{W1}"
		setActscript $80,$FF,eas_Jump
		setFacing $80,2
		nextSingleText $0,$80   ; "What?{W1}"
		nextText $C0,$81        ; "Astral, thank you.{W2}"
		nextSingleText $C0,$81  ; "What do we have to do first?{W1}"
		moveEntity $80,$FF,$0,$1
		endMove $8080
		setFacing $80,2
		nextText $0,$8B         ; "We have to go to North{N}Parmecia.{W2}"
		nextSingleText $0,$8B   ; "We'd better go and see the{N}storytellers in Tristan.{W1}"
		entityShiver $80
		nextSingleText $0,$80   ; "Sir!{W1}"
		setFacing $8B,0
		nextSingleText $FF,$FF  ; "Astral winks at the Minister{N}and smiles.{W1}"
		setFacing $8B,1
		nextSingleText $0,$8B   ; "It's an important job. Will{N}you allow me to go with{N}{LEADER}?{W1}"
		nextSingleText $C0,$81  ; "Sure, sure!  Just bring{N}Elis back to me!{W1}"
		nextText $0,$80         ; "Be careful, Astral.{W2}"
		nextSingleText $0,$80   ; "It's dangerous out there.{W1}"
		setFacing $8B,0
		entityNod $8B
		nextSingleText $0,$8B   ; "I will!{W1}"
		setFacing $8B,3
		nextText $0,$8B         ; "{LEADER}.{W2}"
		nextSingleText $0,$8B   ; "I'm going with you as an{N}adviser.{W1}"
		playSound MUSIC_JOIN
		nextText $FF,$FF        ; "Adviser Astral has joined the{N}force."
		executeSubroutine j_FadeOut_WaitForP2Input
		hideText
		nextSingleText $0,$8B   ; "We have to remove the rocks{N}blocking the passageway{N}leading to North Parmecia.{W2}{N}Maybe we can use an{N}explosive!{W1}"
		entityNod $0
		followEntity $7,$0,$2
		addNewFollower $8B
		setF $46                ; Astral is a follower
		csc_end

; =============== S U B R O U T I N E =======================================

csub_55EF4:
		lea     (PALETTE_1).l,a0
		lea     (PALETTE_1_BIS).l,a1
		lea     plt_55F6A(pc), a2
		moveq   #$3F,d0 
loc_55F06:
		moveq   #0,d1
		move.w  (a0),d1
		andi.w  #$E00,d1
		lsr.w   #8,d1
		lsr.w   #1,d1
		move.w  (a0),d2
		andi.w  #$E,d2
		add.w   d2,d1
		move.w  (a0)+,d2
		andi.w  #$E0,d2 
		lsr.w   #3,d2
		add.w   d2,d1
		divu.w  #7,d1
		move.l  d1,d2
		swap    d2
		cmpi.w  #4,d2
		bcs.s   loc_55F34
		addq.w  #1,d1
loc_55F34:
		moveq   #7,d2
		sub.w   d1,d2
		move.b  (a2,d2.w),d3
		ext.w   d3
		move.b  8(a2,d2.w),d2
		ext.w   d2
		move.b  $10(a2,d1.w),d1
		ext.w   d1
		clr.w   d4
		lsl.w   #8,d1
		lsl.w   #4,d3
		or.w    d1,d4
		or.w    d2,d4
		or.w    d3,d4
		move.w  d4,(a1)+
		dbf     d0,loc_55F06
		clr.b   ((byte_FFDFAB-$1000000)).w
		lea     (PALETTE_1_BIS).l,a0
		jmp     (sub_19C8).w    

	; End of function csub_55EF4

plt_55F6A:      dc.w $E0C
		dc.w $A08
		dc.w $806
		dc.w $402
		dc.w $E0C
		dc.w $C0A
		dc.w $806
		dc.w $402
		dc.w 2
		dc.w $204
		dc.w $608
		dc.w $A0A

; =============== S U B R O U T I N E =======================================

sub_55F82:
		clr.b   ((byte_FFDFAB-$1000000)).w
		lea     ((byte_FFDF2A-$1000000)).w,a0
		jmp     (sub_19C8).w    

	; End of function sub_55F82

