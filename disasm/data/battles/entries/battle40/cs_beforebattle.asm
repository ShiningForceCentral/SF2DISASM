
; ASM FILE data\battles\entries\battle40\cs_beforebattle.asm :
; 0x4E4DC..0x4E8A8 : Cutscene before battle 40
bbcs_40:        textCursor $BDC
		loadMapFadeIn $36,$B,$22
		loadMapEntities ce_4E878
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
cs_4E544:       setBlocks $B,$6,$B,$1D,$2C,$0
		setBlocks $20,$0,$B,$1D,$B,$6
		playSound MUSIC_STOP
		fadeInB
		cameraSpeed $30
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
		setFacing $81,$2
		nextSingleText $C0,$81  ; "Well, yes I am.{N}I'm really quite evil.{W1}"
		setFacing $81,$3
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
		setBlocks $6,$F,$1,$1,$10,$6
		entityPosDir $82,$3F,$3F,$1
		csWait $1E
		entityPosDir $82,$F,$8,$1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks $6,$F,$1,$1,$F,$6
		entityPosDir $82,$3F,$3F,$1
		csWait $14
		entityPosDir $82,$11,$9,$1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks $6,$F,$1,$1,$11,$7
		csWait $A
		entityPosDir $82,$10,$9,$1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks $6,$F,$1,$1,$10,$7
		hideEntity $82
		csWait $5
		setBlocks $6,$F,$1,$1,$F,$7
		csWait $5
		setBlocks $6,$F,$1,$1,$E,$7
		csWait $5
		setBlocks $6,$F,$1,$1,$12,$8
		csWait $4
		setBlocks $6,$F,$1,$1,$11,$8
		csWait $4
		setBlocks $6,$F,$1,$1,$10,$8
		csWait $4
		setBlocks $6,$F,$1,$1,$F,$8
		csWait $4
		setBlocks $6,$F,$1,$1,$E,$8
		csWait $4
		setBlocks $6,$F,$1,$1,$D,$8
		csWait $4
		setBlocks $6,$F,$1,$1,$13,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$12,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$11,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$10,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$F,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$E,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$D,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$C,$9
		csWait $3
		setBlocks $6,$F,$1,$1,$13,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$12,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$11,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$10,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$F,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$E,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$D,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$C,$A
		csWait $2
		setBlocks $6,$F,$1,$1,$15,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$13,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$12,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$11,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$10,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$F,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$E,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$D,$B
		csWait $1
		setBlocks $6,$F,$1,$1,$C,$B
		csWait $1
		setBlocks $2C,$0,$B,$1D,$B,$6
		nextSingleText $C0,$81  ; "I'm very sorry, {LEADER},{N}but I must kill you!{W1}"
		setCamDest $B,$1F
		setFacing $7,$0
		setFacing $0,$2
		nextSingleText $0,$7    ; "{LEADER}, are we really{N}going to fight Oddler?{W1}"
		moveEntity $1F,$FF,$2,$1
		endMove $8080
		setFacing $1F,$1
		setFacing $1C,$0
		nextSingleText $0,$1F   ; "That's enough out of you!{W1}"
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		setFacing $1F,$1
		setFacing $0,$3
		nextSingleText $0,$1F   ; "{LEADER}, let's do it!{W1}"
		setActscript $7,$0,eas_Jump
		entityNod $0
		csc_end
ce_4E878:       dc.w $10
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
