
; ASM FILE data\battles\entries\battle40\cs_beforebattle.asm :
; 0x4E4DC..0x4E8A8 : Cutscene before battle 40
bbcs_40:        textCursor $BDC
		loadMapFadeIn 54,11,34
		loadMapEntities ce_4E878
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,15,40,1
		setActscript $1F,$FF,eas_Init
		setPos $1F,16,40,1
		setActscript $1C,$FF,eas_Init
		setPos $1C,15,41,1
		setActscript $80,$FF,eas_Init
		setPos $80,16,41,1
		jumpIfFlagClear $4C,cs_4E544; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,3
cs_4E544:       setBlocks 11,6,11,29,44,0
		setBlocks 32,0,11,29,11,6
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
		csWait 30
		setCamDest 11,2
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
		setFacing $81,2
		nextSingleText $C0,$81  ; "Well, yes I am.{N}I'm really quite evil.{W1}"
		setFacing $81,3
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
		csWait 20
		flickerOnce
		csWait 10
		tintMap
		csWait 20
		flickerOnce
		setActscript $82,$0,eas_AnimSpeedx2
		setActscript $82,$FF,eas_46172
		setPos $82,16,8,1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks 6,15,1,1,16,6
		setPos $82,63,63,1
		csWait 30
		setPos $82,15,8,1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks 6,15,1,1,15,6
		setPos $82,63,63,1
		csWait 20
		setPos $82,17,9,1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks 6,15,1,1,17,7
		csWait 10
		setPos $82,16,9,1
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setBlocks 6,15,1,1,16,7
		hideEntity $82
		csWait 5
		setBlocks 6,15,1,1,15,7
		csWait 5
		setBlocks 6,15,1,1,14,7
		csWait 5
		setBlocks 6,15,1,1,18,8
		csWait 4
		setBlocks 6,15,1,1,17,8
		csWait 4
		setBlocks 6,15,1,1,16,8
		csWait 4
		setBlocks 6,15,1,1,15,8
		csWait 4
		setBlocks 6,15,1,1,14,8
		csWait 4
		setBlocks 6,15,1,1,13,8
		csWait 4
		setBlocks 6,15,1,1,19,9
		csWait 3
		setBlocks 6,15,1,1,18,9
		csWait 3
		setBlocks 6,15,1,1,17,9
		csWait 3
		setBlocks 6,15,1,1,16,9
		csWait 3
		setBlocks 6,15,1,1,15,9
		csWait 3
		setBlocks 6,15,1,1,14,9
		csWait 3
		setBlocks 6,15,1,1,13,9
		csWait 3
		setBlocks 6,15,1,1,12,9
		csWait 3
		setBlocks 6,15,1,1,19,10
		csWait 2
		setBlocks 6,15,1,1,18,10
		csWait 2
		setBlocks 6,15,1,1,17,10
		csWait 2
		setBlocks 6,15,1,1,16,10
		csWait 2
		setBlocks 6,15,1,1,15,10
		csWait 2
		setBlocks 6,15,1,1,14,10
		csWait 2
		setBlocks 6,15,1,1,13,10
		csWait 2
		setBlocks 6,15,1,1,12,10
		csWait 2
		setBlocks 6,15,1,1,21,11
		csWait 1
		setBlocks 6,15,1,1,19,11
		csWait 1
		setBlocks 6,15,1,1,18,11
		csWait 1
		setBlocks 6,15,1,1,17,11
		csWait 1
		setBlocks 6,15,1,1,16,11
		csWait 1
		setBlocks 6,15,1,1,15,11
		csWait 1
		setBlocks 6,15,1,1,14,11
		csWait 1
		setBlocks 6,15,1,1,13,11
		csWait 1
		setBlocks 6,15,1,1,12,11
		csWait 1
		setBlocks 44,0,11,29,11,6
		nextSingleText $C0,$81  ; "I'm very sorry, {LEADER},{N}but I must kill you!{W1}"
		setCamDest 11,31
		setFacing $7,0
		setFacing $0,2
		nextSingleText $0,$7    ; "{LEADER}, are we really{N}going to fight Oddler?{W1}"
		moveEntity $1F,$FF,$2,$1
		endMove $8080
		setFacing $1F,1
		setFacing $1C,0
		nextSingleText $0,$1F   ; "That's enough out of you!{W1}"
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		setFacing $1F,1
		setFacing $0,3
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
