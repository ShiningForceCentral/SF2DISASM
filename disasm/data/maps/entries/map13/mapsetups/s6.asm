
; ASM FILE data\maps\entries\map13\mapsetups\s6.asm :
; 0x582E0..0x58E18 : 

; =============== S U B R O U T I N E =======================================

ms_map13_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2C7               ; set after you dislodge the turtle/fairy in Polca
		bne.s   loc_582EC
		lea     cs_58310(pc), a0
		trap    #6
loc_582EC:
		trap    #CHECK_FLAG
		dc.w $2CC               ; set after your raft-giving conversation with the mayor in Polca
		beq.s   loc_582FE
		move.w  #$89,d0 
		moveq   #3,d1
		jsr     sub_4781A
loc_582FE:
		trap    #CHECK_FLAG
		dc.w $2CE               ; set after Oddler runs after you as you leave Polca, and tags along
		beq.s   return_5830E
		move.w  #$8C,d0 
		jsr     MoveEntityOutOfMap
return_5830E:
		rts

	; End of function ms_map13_InitFunction

cs_58310:       setFacing $82,DOWN
		customActscript $82,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $3           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		startEntity $82
		csc_end
cs_58330:       playSound SFX_BIG_DOOR_RUMBLE
		setQuake 6
		flashScreenWhite $5A
		setQuake 0
		csWait 20
		csWait 5
		setActscript $0,$0,eas_461B6
		csWait 5
		setActscript $85,$0,eas_461E4
		csWait 50
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 100
		textCursor $5AC
		setPos $8C,29,7,LEFT
		customActscript $8C,$FF
		ac_setSpeed 2056        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $8C,$FF
		 moveLeft 2
		endActions
		customActscript $8C,$FF
		ac_setSpeed 1028        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $0,RIGHT
		setFacing $7,RIGHT
		entityActions $8C,$FF
		 moveLeft 1
		endActions
		setActscript $8C,$FF,eas_46172
		customActscript $8C,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $8C,$0
		 moveDown 1
		endActions
		csWait 2
		setActscript $8C,$FF,eas_461AA
		customActscript $8C,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $85,RIGHT
		csWait 60
		nextSingleText $0,$85   ; "Oh!{W1}"
		entityActions $85,$FF
		 moveRight 3
		endActions
		setFacing $85,DOWN
		nextSingleText $FF,$FF  ; "The beastman checks the boy.{W1}"
		nextSingleText $0,$85   ; "Good heavens!{N}He's badly injured!{W1}"
		csWait 30
		setFacing $85,RIGHT
		csWait 50
		entityActions $85,$FF
		 moveLeft 2
		endActions
		setActscript $85,$FF,eas_Jump
		setActscript $85,$0,eas_Jump
		nextSingleText $0,$85   ; "Mayor, mayor!{W1}"
		setPos $89,17,7,RIGHT
		setCamDest 13,3
		setPos $0,25,9,UP
		setPos $7,25,9,UP
		setCameraEntity $89
		entityActions $89,$FF
		 moveRight 5
		 moveUp 1
		endActions
		setFacing $89,RIGHT
		nextSingleText $0,$89   ; "What's all this noise?{W1}"
		nextSingleText $0,$85   ; "Mayor, a boy from the mountain{N}is seriously injured!{W1}"
		nextSingleText $0,$89   ; "What?!{W1}"
		entityActions $89,$FF
		 moveDown 1
		 moveRight 3
		endActions
		setFacing $85,RIGHT
		nextText $0,$89         ; "Ohhh...his eyes are{N}seriously damaged!{W2}"
		nextSingleText $0,$89   ; "He must have been caught{N}in the eruption....{W1}"
		entityActions $85,$FF
		 moveRight 3
		 moveDown 1
		endActions
		setFacing $85,LEFT
		nextSingleText $0,$85   ; "He needs prompt treatment!{W1}"
		nextSingleText $0,$89   ; "Yes!  Bring him into my house!{W1}"
		entityNod $85
		entityActions $89,$0
		 moveRight 1
		endActions
		entityActions $85,$0
		 moveLeft 1
		endActions
		csWait 3
		setActscript $85,$FF,eas_461AA
		setActscript $89,$FF,eas_461AA
		setFacing $89,LEFT
		csWait 30
		entityActions $8C,$0
		 moveUp 1
		endActions
		csWait 2
		setActscript $8C,$FF,eas_461AA
		csWait 30
		setCameraEntity $FFFF
		entityActions $89,$0
		 moveLeft 9
		endActions
		entityActions $8C,$0
		 moveLeft 9
		endActions
		entityActions $85,$FF
		 moveLeft 9
		endActions
		setActscript $8C,$FF,eas_Init
		setFacing $89,LEFT
		setFacing $85,UP
		setFacing $8C,DOWN
		setActscript $0,$FF,eas_Init
		followEntity $7,$0,$2
		reloadEntities ms_map13_flag2C6_Entities
		csc_end
cs_58512:       customActscript $82,$FF
		ac_set1Cb7 $0           ;   
		ac_jump eas_Idle        ;   
		ac_end
		setCameraEntity $FFFF
		textCursor $59B
		nextSingleText $0,$82   ; "Help!  Help!{N}I can't...get up!{W2}{N}You, please turn me over!{W1}"
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setEntityDest $7,2,12
		setFacing $7,LEFT
		csWait 30
		setActscript $0,$FF,eas_BumpUp
		csWait 40
		nextSingleText $0,$82   ; "Are you a wimp?{N}Push harder!{W1}"
		csWait 10
		entityNod $0
		setActscript $0,$FF,eas_BumpUp
		setActscript $0,$FF,eas_BumpUp
		csWait 20
		nextSingleText $0,$82   ; "Good, good!{N}Push!{W1}"
		setActscript $0,$FF,eas_46172
		entityActions $0,$FF
		 moveDown 1
		endActions
		csWait 30
		customActscript $0,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $0,$FF
		 moveUp 1
		endActions
		setQuake 2
		csWait 30
		setQuake 0
		animEntityFadeInOut $82,$6
		customActscript $82,$0
		ac_setFlip $0           ;   
		ac_setSprite 219        ;   
		ac_jump eas_Idle        ;   
		ac_end
		animEntityFadeInOut $82,$7
		csWait 40
		setFacing $82,DOWN
		nextSingleText $0,$82   ; "(Giggle)...sorry, I had to{N}test you.{W2}{N}I'm happy to meet you.{N}He must like you.{W2}{N}Oh no, I can't tell you who{N}HE is.{N}See you later!{W1}"
		setActscript $82,$FF,eas_Init2
		setActscript $82,$FF,eas_46172
		entityActions $82,$FF
		 moveUp 10
		endActions
		setActscript $0,$FF,eas_Init
		followEntity $7,$0,$2
		csc_end
cs_585FE:       playSound $FD
		customActscript $81,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $82,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $83,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $84,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $83,$FF,eas_46172
		setActscript $84,$FF,eas_46172
		textCursor $5BC
		setActscript $7,$FF,eas_Init
		nextSingleText $0,$80   ; "Bedoe soldiers are cowards!{W1}"
		setCamDest 14,10
		playSound MUSIC_ENEMY_ATTACK
		nextSingleText $0,$A    ; "Be quiet!{W1}"
		entityActions $A,$FF
		 moveRight 1
		endActions
		entityActions $81,$0
		 moveLeft 3
		endActions
		entityActions $82,$FF
		 moveLeft 3
		endActions
		entityActions $81,$0
		 moveRight 3
		endActions
		entityActions $82,$0
		 moveRight 3
		endActions
		entityActions $83,$0
		 moveLeft 2
		endActions
		entityActions $84,$FF
		 moveLeft 2
		endActions
		setActscript $83,$0,eas_Die
		setActscript $84,$FF,eas_Die
		setFacing $81,LEFT
		setFacing $82,LEFT
		setFacing $A,LEFT
		csWait 40
		nextSingleText $0,$A    ; "My comrades!{W1}"
		csWait 20
		entityActions $80,$FF
		 moveLeft 1
		endActions
		setFacing $A,RIGHT
		nextSingleText $0,$80   ; "You're our captive.  Don't{N}force me to kill you.{W1}"
		csWait 5
		setActscript $80,$0,eas_461E4
		csWait 20
		setFacing $80,LEFT
		nextText $0,$80         ; "No more funny business, you{N}can't resist us!{W2}"
		setFacing $80,LEFT
		nextSingleText $0,$80   ; "Now, give me that injured{N}boy!{W1}"
		entityActions $81,$0
		 moveLeft 1
		endActions
		entityActions $82,$FF
		 moveLeft 1
		endActions
		csWait 20
		nextSingleText $0,$9    ; "Don't listen to him!{W2}"
		csWait 5
		setActscript $80,$0,eas_461E4
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 5
		setActscript $82,$0,eas_461B6
		setFacing $A,UP
		csWait 40
		setCamDest 6,6
		nextSingleText $0,$9    ; "I'll help you fight against{N}the devils and guard Oddler!{W1}"
		setCameraEntity $9
		setPos $0,20,9,DOWN
		setPos $7,19,8,DOWN
		entityActions $9,$FF
		 moveDown 3
		 moveRight 6
		endActions
		setActscript $9,$FF,eas_BumpRight
		csWait 20
		entityActions $9,$FF
		 moveRight 1
		endActions
		setFacing $9,UP
		setCamDest 14,8
		nextSingleText $0,$9    ; "You!{W1}"
		setFacing $80,UP
		setFacing $81,UP
		setFacing $82,UP
		csWait 40
		setFacing $9,RIGHT
		entityActions $A,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$A    ; "Oh, {LEADER}, {NAME;7}!{W1}"
		entityActions $7,$FF
		 moveDown 1
		endActions
		nextSingleText $C0,$7   ; "{NAME;10}!  Why are you here?{W1}"
		nextText $0,$A          ; "I came here to get a raft{N}for you.{W2}"
		nextSingleText $0,$A    ; "The people of Polca are{N}being controlled by these{N}devils.  They deceived me!{W1}"
		entityActions $9,$FF
		 moveRight 1
		endActions
		setFacing $9,DOWN
		nextSingleText $0,$9    ; "Prince {NAME;10}, I'm sorry.{W1}"
		setCameraEntity $9
		entityActions $9,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$9    ; "Polcans will not fight.{N}Please let me join you!{W1}"
		join $9
		setCameraEntity $A
		nextSingleText $0,$A    ; "Great!{W1}"
		setFacing $9,DOWN
		entityNod $9
		entityActions $A,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$A    ; "Don't forget me!{W1}"
		entityActions $81,$FF
		 moveUp 1
		 moveLeft 1
		endActions
		setActscript $A,$FF,eas_46172
		customActscript $A,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $A,$0
		 moveLeft 3
		endActions
		entityActions $81,$FF
		 moveRight 1
		 moveDown 1
		endActions
		customActscript $A,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $81,LEFT
		csWait 40
		entityActions $80,$FF
		 moveLeft 1
		 moveUp 1
		endActions
		nextText $0,$80         ; "You still dare to resist us?!{W2}"
		nextSingleText $0,$80   ; "For that you shall die!!{W1}"
		setStoryFlag $D         ; Battle 13 unlocked
		mapSysEvent $D,$0,$0,$0
		csc_end
cs_58856:       textCursor $5CF
		setActscript $7,$FF,eas_Init
		setActscript $A,$FF,eas_Init
		setFacing $89,DOWN
		csWait 30
		setFacing $89,UP
		csWait 30
		setFacing $89,DOWN
		setActscript $89,$FF,eas_Jump
		setActscript $89,$0,eas_Jump
		nextSingleText $0,$89   ; "Heeeeee!{W1}"
		entityShiver $89
		nextSingleText $0,$89   ; "I'm sorry!  I'm sorry!{N}Don't possess me!{W1}"
		entityShiver $89
		setEntityDest $A,17,4
		setEntityDest $7,17,5
		setFacing $7,UP
		nextSingleText $C0,$7   ; "What's he talking about?{W1}"
		setFacing $A,DOWN
		nextSingleText $0,$A    ; "I don't know...{N}What a loon!{W1}"
		entityActions $A,$FF
		 moveLeft 1
		endActions
		setFacing $A,UP
		nextSingleText $0,$A    ; "C'mon, mayor.  We're alive!{W1}"
		nextSingleText $0,$89   ; "What?!{W1}"
		entityActions $0,$0
		 moveDown 1
		endActions
		entityActions $89,$FF
		 moveDown 1
		endActions
		setFacing $0,UP
		setFacing $89,RIGHT
		setFacing $A,LEFT
		csWait 30
		nextSingleText $FF,$FF  ; "The mayor examines {NAME;10}{N}carefully.{W1}"
		csWait 40
		nextSingleText $0,$89   ; "You're warm!  You're alive!{W1}"
		setActscript $89,$FF,eas_Jump
		setActscript $89,$FF,eas_Jump
		csWait 30
		setFacing $89,DOWN
		customActscript $89,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $89,$FF,eas_46172
		entityActions $89,$FF
		 moveUp 1
		endActions
		entityNod $89
		nextText $0,$89         ; "I really regret all of this.{W2}"
		nextText $0,$89         ; "Suddenly, the devils{N}appeared.{W2}"
		nextText $0,$89         ; "We had no power to resist{N}them.{W2}"
		nextSingleText $0,$89   ; "They promised they would do{N}nothing if we gave Oddler{N}to them.{W1}"
		entityActions $A,$FF
		 moveLeft 1
		endActions
		setFacing $A,UP
		nextSingleText $0,$A    ; "And you sent ME in Oddler's{N}place?!{W1}"
		entityShakeHead $89
		nextSingleText $0,$89   ; "I'm sorry, please don't{N}tell King Bedoe!{W1}"
		csWait 20
		setFacing $A,DOWN
		csWait 50
		nextText $0,$A          ; "Alright, I won't...{W2}"
		setFacing $A,UP
		csWait 20
		nextSingleText $0,$A    ; "If you prepare a raft for{N}{LEADER}.{W1}"
		setActscript $89,$FF,eas_Init
		setActscript $89,$FF,eas_Jump
		setActscript $89,$0,eas_Jump
		nextSingleText $0,$89   ; "Oh, thank you!{N}A raft, OK.{W1}"
		setActscript $A,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		setFacing $A,LEFT
		entityActions $A,$0
		 moveRight 2
		 moveUp 1
		endActions
		entityActions $89,$FF
		 moveDown 1
		 moveRight 2
		endActions
		setFacing $A,DOWN
		setFacing $89,DOWN
		csWait 20
		entityActions $7,$0
		 moveLeft 1
		endActions
		entityActions $89,$FF
		 moveDown 3
		endActions
		setFacing $89,RIGHT
		setCamDest 11,2
		setActscript $89,$FF,eas_Jump
		setActscript $89,$0,eas_Jump
		nextSingleText $0,$89   ; "Hey, Ripster!{W1}"
		setPos $85,23,7,LEFT
		customActscript $85,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $85,$FF
		 moveLeft 5
		endActions
		nextSingleText $0,$85   ; "Yes.{W1}"
		nextSingleText $0,$89   ; "Prepare a raft for{N}Prince {NAME;10}.{W1}"
		setActscript $85,$FF,eas_Init
		setActscript $85,$FF,eas_JumpRight
		csWait 30
		entityActions $85,$FF
		 moveLeft 1
		endActions
		nextSingleText $0,$85   ; "But, it's the last one we{N}have...{W1}"
		setActscript $89,$FF,eas_Jump
		setActscript $89,$0,eas_Jump
		nextText $0,$89         ; "I don't care!{W2}"
		nextSingleText $0,$89   ; "You can make another if{N}necessary, can't you?!{W1}"
		entityNod $85
		nextSingleText $0,$85   ; "Y...yes, sir!{W1}"
		customActscript $85,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $85,$FF
		 moveRight 5
		endActions
		hideEntity $85
		setCamDest 11,0
		entityActions $89,$FF
		 moveUp 3
		endActions
		csWait 20
		nextText $0,$89         ; "A raft will be waiting for{N}you on the river.{W2}"
		nextSingleText $0,$89   ; "Why don't you take a look{N}at it right now?{W1}"
		entityActions $89,$FF
		 moveLeft 2
		 moveUp 1
		endActions
		setFacing $89,DOWN
		csWait 30
		setActscript $7,$FF,eas_Init
		setActscript $A,$FF,eas_Init
		entityActions $A,$FF
		 moveDown 1
		 moveLeft 1
		endActions
		setFacing $A,DOWN
		nextSingleText $C0,$7   ; "He wants to get rid of us.{W1}"
		setFacing $7,UP
		nextText $0,$A          ; "You're right.{W1}"
		nextSingleText $0,$A    ; "Anyway, now we have a raft!{W1}"
		entityActions $A,$FF
		 moveLeft 1
		endActions
		setFacing $A,DOWN
		nextSingleText $0,$A    ; "Let's go!{W1}"
		followEntity $7,$0,$2
		followEntity $A,$7,$2
		csc_end
cs_58AE2:       textCursor $5ED
		setCamDest 16,8
		setPos $89,17,7,RIGHT
		setPos $8C,16,7,RIGHT
		nextSingleText $0,$89   ; "Just a minute.{W1}"
		setCamDest 10,4
		nextSingleText $0,$89   ; "If it's possible...{W1}"
		setFacing $89,LEFT
		csWait 50
		setFacing $89,RIGHT
		csWait 30
		nextSingleText $0,$89   ; "Please take this boy with{N}you.{W1}"
		csWait 20
		nextText $C0,$A         ; "You lazy human!{W2}"
		nextSingleText $C0,$A   ; "You don't want to take care{N}of him!{W1}"
		setFacing $89,LEFT
		nextSingleText $0,$89   ; "I...er....{W1}"
		setPos $0,22,12,RIGHT
		setPos $7,23,12,LEFT
		setPos $A,23,11,DOWN
		setCamDest 16,6
		csWait 30
		nextText $80,$7         ; "{LEADER}, will you take{N}"
		nextText $80,$7         ; "him with us?{W1}"
		yesNo
		jumpIfFlagSet $59,cs_58B7A; YES/NO prompt answer
		nextText $0,$7          ; "I agree.  Our journey will{N}be too difficult on him,{N}as he is blind.{W2}"
		csWait 30
		setFacing $0,UP
		setFacing $7,UP
		setFacing $A,UP
		nextSingleText $80,$7   ; "Mayor, we can't take him,{N}we're sorry.{W1}"
		setCamDest 15,2
		setFacing $89,RIGHT
		nextSingleText $0,$89   ; "B...but....{W1}"
		csc_end
cs_58B7A:       textCursor $5F8
		nextSingleText $80,$7   ; "Are you serious?{N}{LEADER}, you're too nice.{W1}"
		customActscript $8C,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $89,$0
		 moveRight 3
		 faceLeft 1
		endActions
		entityActions $8C,$FF
		 moveRight 3
		endActions
		csWait 20
		entityActions $89,$0
		 moveRight 3
		 faceLeft 1
		endActions
		entityActions $8C,$FF
		 moveRight 3
		endActions
		setFacing $89,DOWN
		setFacing $8C,DOWN
		setFacing $0,UP
		setFacing $7,UP
		setFacing $A,UP
		nextText $0,$89         ; "Oh, thank you!{W1}"
		setFacing $89,LEFT
		setFacing $1F,RIGHT
		nextText $0,$89         ; "Oddler, {LEADER} will{N}take you.{W2}"
		nextSingleText $0,$89   ; "You can trust him!{W1}"
		setFacing $8C,RIGHT
		jump cs_58D4C
cs_58BEA:       textCursor $605
		nextSingleText $0,$8C   ; "Wait, wait!{W1}"
		setPos $8C,14,21,DOWN
		setCamDest 10,18
		entityActions $8C,$FF
		 moveDown 3
		endActions
		nextSingleText $0,$8C   ; "Please, let me go with you!{W1}"
		setActscript $7,$FF,eas_Init
		setActscript $A,$FF,eas_Init
		setPos $0,14,30,UP
		setPos $7,15,30,UP
		setPos $A,13,30,UP
		setCamDest 10,22
		textCursor $5F3
		nextText $80,$7         ; "{LEADER}, will you take{N}"
		nextText $80,$7         ; "him with us?{W1}"
		yesNo
		jumpIfFlagSet $59,cs_58D4C; YES/NO prompt answer
		textCursor $607
		hideText
		nextSingleText $0,$8C   ; "Huh?{W1}"
		customActscript $8C,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $89,DOWN
		entityActions $8C,$FF
		 moveDown 3
		endActions
		setFacing $8C,UP
		customActscript $8C,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $2           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		removeShadow $8C
		csWait 30
		entityActions $0,$0
		 moveUp 2
		endActions
		entityActions $7,$0
		 moveUp 2
		endActions
		entityActions $A,$FF
		 moveUp 2
		endActions
		nextText $80,$7         ; "Watch out!{W2}"
		nextSingleText $80,$7   ; "Be careful.{W1}"
		setActscript $8C,$FF,eas_Init
		setFacing $8C,DOWN
		entityShakeHead $8C
		entityNod $8C
		nextSingleText $0,$8C   ; "Yes, I will....{W1}"
		csWait 50
		setFacing $8C,UP
		csWait 50
		setFacing $8C,DOWN
		nextText $0,$8C         ; "As long as I'm here the{N}devils will return.{W2}"
		nextSingleText $0,$8C   ; "Maybe {LEADER} is strong{N}enough to resist them?{W1}"
		entityActions $7,$FF
		 moveUp 1
		endActions
		setFacing $7,LEFT
		setFacing $8C,RIGHT
		nextSingleText $80,$7   ; "But, you may be injured!{W1}"
		setFacing $8C,DOWN
		setFacing $0,LEFT
		setFacing $A,RIGHT
		nextText $0,$A          ; "Well, I think he should come{N}with us.{W2}"
		nextText $0,$A          ; "If we left him here, he{N}could be killed.{W2}"
		nextSingleText $0,$A    ; "It's too dangerous, isn't it,{N}{LEADER}?{W1}"
		entityActions $7,$FF
		 moveDown 1
		endActions
		setFacing $7,LEFT
		setFacing $0,RIGHT
		nextText $80,$7         ; "He needs a guardian.{W2}"
		nextSingleText $80,$7   ; "I'll take care of him.{W1}"
		entityActions $7,$FF
		 moveUp 1
		endActions
		setFacing $7,LEFT
		setFacing $8C,RIGHT
		setFacing $0,UP
		nextSingleText $80,$7   ; "OK.  Let's go.{W1}"
		textCursor $5FC
		entityNod $8C
		nextSingleText $0,$8C   ; "Thank you very much.{W1}"
		setFacing $8C,DOWN
		jump cs_58DD2
cs_58D4C:       textCursor $5FC
		hideText
		csWait 20
		entityNod $8C
		nextSingleText $0,$8C   ; "Thank you very much.{W1}"
		customActscript $8C,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $89,DOWN
		entityActions $8C,$FF
		 moveDown 2
		endActions
		setFacing $8C,UP
		customActscript $8C,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $2           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		removeShadow $8C
		csWait 30
		entityActions $0,$0
		 moveUp 2
		endActions
		entityActions $7,$0
		 moveUp 2
		endActions
		entityActions $A,$FF
		 moveUp 2
		endActions
		csWait 40
		nextText $80,$7         ; "Watch out!{W2}"
		nextSingleText $80,$7   ; "Be careful.{W1}"
		setActscript $8C,$FF,eas_Init
		setFacing $8C,DOWN
		entityShakeHead $8C
		entityNod $8C
		nextSingleText $0,$8C   ; "Yes, I will....{W1}"
cs_58DD2:       textCursor $600
		nextText $0,$8C         ; "I'm Oddler.{N}I was nearly dead when I{N}came here.{W2}"
		nextText $0,$8C         ; "Actually, I don't remember....{W2}"
		nextText $0,$8C         ; "I don't know the reason why{N}the devils are after me.{W2}"
		nextSingleText $0,$8C   ; "I'm afraid I'll cause you a{N}lot of trouble.{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} decides to{N}take Oddler with him.{W1}"
		csWait 30
		followEntity $7,$0,$2
		followEntity $8C,$7,$2
		followEntity $A,$8C,$2
		setF $44                ; Oddler is a follower
		clearF $4B              ; Luke is a follower
		setF $2CE               ; set after Oddler runs after you as you leave Polca, and tags along
		csc_end
