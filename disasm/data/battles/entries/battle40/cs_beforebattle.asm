
; ASM FILE data\battles\entries\battle40\cs_beforebattle.asm :
; 0x4E4DC..0x4E8A8 : Cutscene before battle 40
bbcs_40:        textCursor $BDC         ; Initial text line $BDC : "{LEADER}, you're finally{N}here.{W1}"
		loadMapFadeIn $36,$B,$22
		loadMapEntities ce_4E878; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$F,$28,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$10,$28,$1
		setActscript $1C,$FF,eas_Init
		entityPosDir $1C,$F,$29,$1
		setActscript $80,$FF,eas_Init
		entityPosDir $80,$10,$29,$1
		jumpIfFlagClear $4C,cs_4E544; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4E544:       setBlocks $B06,$B1D,$2C00
		setBlocks $2000,$B1D,$B06
		playSound MUSIC_STOP
		fadeInB
		csc45 $30               ; (null)
		moveEntity $0,$0,$1,$3
		endMove $8080
		moveEntity $7,$0,$1,$3
		endMove $8080
		moveEntity $1F,$0,$1,$3
		endMove $8080
		moveEntity $80,$0,$1,$3
		endMove $8080
		moveEntity $1C,$FF,$1,$3
		endMove $8080
		nextSingleText $C0,$81  ; "{LEADER}, you're finally{N}here.{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		moveEntity $0,$0,$1,$1
		endMove $8080
		moveEntity $7,$0,$1,$2
		endMove $8080
		moveEntity $1F,$0,$1,$1
		endMove $8080
		moveEntity $1C,$0,$1,$1
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $80,$FF,$1,$1
		moreMove $0,$1
		moreMove $1,$1
		endMove $8080
		csWait $1E
		setCamDest $B,$2
		playSound MUSIC_BATTLE_THEME_3
		nextSingleText $0,$7    ; "Is that...?{W1}"
		nextSingleText $C0,$81  ; "Did you forget about me,{N}{LEADER} and {NAME;7}!{W1}"
		nextSingleText $0,$7    ; "Oddler, are you Odd Eye?{N}Zalbard said...{W1}"
		nextSingleText $C0,$81  ; "Yes, I am he.{W1}"
		nextSingleText $0,$1F   ; "You're the leader of the Devil{N}Army who attacked Bedoe...{W1}"
		nextSingleText $C0,$81  ; "Yes I am, Sir Astral.{W1}"
		nextSingleText $0,$1F   ; "How do you know me?{W1}"
		nextSingleText $C0,$81  ; "{LEADER} told me about{N}you repeatedly.{W1}"
		nextSingleText $0,$7    ; "What do YOU want?{W1}"
		nextSingleText $C0,$81  ; "Don't talk to me like that.{N}I'm very sad.{W1}"
		nextSingleText $0,$7    ; "Sad?{N}You've got to be joking!{W1}"
		setEntityDir $81,$2
		nextSingleText $C0,$81  ; "Well, yes I am.{N}I'm really quite evil.{W1}"
		setEntityDir $81,$3
		nextSingleText $C0,$81  ; "Don't you think so, Red{N}Baron?{W1}"
		nextSingleText $0,$1C   ; "Uhh...(shiver).{W1}"
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextText $C0,$81        ; "Anyway, I came here to{N}deliver an ultimatum.{W2}"
		nextText $C0,$81        ; "Think long and well before{N}answering me.{W2}"
		nextSingleText $C0,$81  ; "Leave the jewel, your{N}weapons, and your items{N}here...or DIE!{W1}"
		nextSingleText $0,$7    ; "That means...we don't have{N}to fight him.{W1}"
		nextSingleText $0,$1F   ; "True, but we can't take the{N}easy way out.  We mustn't{N}give him the jewel.{W1}"
		nextSingleText $C0,$81  ; "You know how strong I am.{N}I think you had better{N}accept the offer.{W1}"
		nextSingleText $0,$0    ; "Hmmm....{W1}"
		nextSingleText $0,$7    ; "Oh, what should we do?!{W1}"
		nextSingleText $0,$1F   ; "We have to fight!{W1}"
		nextSingleText $C0,$81  ; "Times up!  We need space{N}to battle.{W1}"
		entityFlashWhite $81,$1E
		tintMap
		csWait $14
		flickerOnce
		csWait $A
		tintMap
		csWait $14
		flickerOnce
		setActscript $82,$0,eas_AnimSpeedx2
		setActscript $82,$FF,eas_46172
		entityPosDir $82,$10,$8,$1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks $60F,$101,$1006
		entityPosDir $82,$3F,$3F,$1
		csWait $1E
		entityPosDir $82,$F,$8,$1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks $60F,$101,$F06
		entityPosDir $82,$3F,$3F,$1
		csWait $14
		entityPosDir $82,$11,$9,$1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks $60F,$101,$1107
		csWait $A
		entityPosDir $82,$10,$9,$1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks $60F,$101,$1007
		hideEntity $82
		csWait $5
		setBlocks $60F,$101,$F07
		csWait $5
		setBlocks $60F,$101,$E07
		csWait $5
		setBlocks $60F,$101,$1208
		csWait $4
		setBlocks $60F,$101,$1108
		csWait $4
		setBlocks $60F,$101,$1008
		csWait $4
		setBlocks $60F,$101,$F08
		csWait $4
		setBlocks $60F,$101,$E08
		csWait $4
		setBlocks $60F,$101,$D08
		csWait $4
		setBlocks $60F,$101,$1309
		csWait $3
		setBlocks $60F,$101,$1209
		csWait $3
		setBlocks $60F,$101,$1109
		csWait $3
		setBlocks $60F,$101,$1009
		csWait $3
		setBlocks $60F,$101,$F09
		csWait $3
		setBlocks $60F,$101,$E09
		csWait $3
		setBlocks $60F,$101,$D09
		csWait $3
		setBlocks $60F,$101,$C09
		csWait $3
		setBlocks $60F,$101,$130A
		csWait $2
		setBlocks $60F,$101,$120A
		csWait $2
		setBlocks $60F,$101,$110A
		csWait $2
		setBlocks $60F,$101,$100A
		csWait $2
		setBlocks $60F,$101,$F0A
		csWait $2
		setBlocks $60F,$101,$E0A
		csWait $2
		setBlocks $60F,$101,$D0A
		csWait $2
		setBlocks $60F,$101,$C0A
		csWait $2
		setBlocks $60F,$101,$150B
		csWait $1
		setBlocks $60F,$101,$130B
		csWait $1
		setBlocks $60F,$101,$120B
		csWait $1
		setBlocks $60F,$101,$110B
		csWait $1
		setBlocks $60F,$101,$100B
		csWait $1
		setBlocks $60F,$101,$F0B
		csWait $1
		setBlocks $60F,$101,$E0B
		csWait $1
		setBlocks $60F,$101,$D0B
		csWait $1
		setBlocks $60F,$101,$C0B
		csWait $1
		setBlocks $2C00,$B1D,$B06
		nextSingleText $C0,$81  ; "I'm very sorry, {LEADER},{N}but I must kill you!{W1}"
		setCamDest $B,$1F
		setEntityDir $7,$0
		setEntityDir $0,$2
		nextSingleText $0,$7    ; "{LEADER}, are we really{N}going to fight Oddler?{W1}"
		moveEntity $1F,$FF,$2,$1
		endMove $8080
		setEntityDir $1F,$1
		setEntityDir $1C,$0
		nextSingleText $0,$1F   ; "That's enough out of you!{W1}"
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		setEntityDir $1F,$1
		setEntityDir $0,$3
		nextSingleText $0,$1F   ; "{LEADER}, let's do it!{W1}"
		setActscript $7,$0,eas_Jump
		entityNod $0
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4E878:       dc.b   0
		dc.b $10
		dc.w $27
		dc.w 1
		dc.b $F
		dc.b $28
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $F
		dc.b $29
		dc.b 1
		dc.b $1C
		dc.l eas_Init           
		dc.b $10
		dc.b $29
		dc.b 1
		dc.b $3E
		dc.l eas_Init           
		dc.b $10
		dc.b 4
		dc.b 3
		dc.b $A0
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $B2
		dc.l eas_Init           
		dc.w $FFFF
