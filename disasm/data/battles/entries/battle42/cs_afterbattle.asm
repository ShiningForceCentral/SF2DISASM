
; ASM FILE data\battles\entries\battle42\cs_afterbattle.asm :
; 0x4EF04..0x4F358 : Cutscene after battle 42
abcs_battle42:  textCursor $C22         ; Initial text line $C22 : "Auuugh...{W1}"
		loadMapFadeIn $3B,$8,$D
		loadMapEntities ce_4F328; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$F,$F,$2
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$B,$F,$0
		setActscript $1C,$FF,eas_Init
		entityPosDir $1C,$C,$13,$0
		jumpIfFlagClear $4C,cs_4EF5E; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4EF5E:       stopEntity $80
		customActscript $80,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $80,$FF,eas_46172
		stopEntity $81
		customActscript $81,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csc53 $1F,$0            ; 0053 UNKNOWN
		csc53 $1C,$0            ; 0053 UNKNOWN
		csc53 $80,$FFFF         ; 0053 UNKNOWN
		fadeInB
		csc45 $30               ; (null)
		csWait $3C
		entityShiver $80
		nextSingleText $C0,$80  ; "Auuugh...{W1}"
		setEntityDir $0,$3
		setEntityDir $7,$3
		setEntityDir $1F,$3
		entityShiver $80
		nextText $C0,$80        ; "I've never lost to anybody{N}but the gods.{W2}"
		nextSingleText $C0,$80  ; "I don't understand!{W1}"
		setEntityDir $80,$1
		nextSingleText $0,$1C   ; "Oh, King Galam...poor{N}King Galam....{W1}"
		entityShiver $81
		setEntityDir $7,$2
		setActscript $7,$FF,eas_Jump
		nextSingleText $0,$7    ; "Princess Elis!{W1}"
		setEntityDir $0,$1
		setEntityDir $1F,$0
		setEntityDir $1C,$1
		nextSingleText $C0,$81  ; "Zzzzz....{W1}"
		nextSingleText $0,$1F   ; "...she's waking up!{W1}"
		nextSingleText $C0,$81  ; "Zzzzz...(yawn)...{W1}"
		moveEntity $1F,$0,$0,$1
		endMove $8080
		moveEntity $1C,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$1F   ; "Princess, princess!{W1}"
		csWait $32
		setActscript $81,$FF,eas_Init
		setEntityDir $81,$3
		entitySprite $81,$D8
		nextSingleText $C0,$81  ; "Wha...What?{W1}"
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "It's me!  Astral!{W1}"
		setEntityDir $81,$2
		nextSingleText $C0,$81  ; "Sir Astral?  Oh, what{N}happened?{W1}"
		setEntityDir $81,$3
		csWait $1E
		setEntityDir $81,$1
		csWait $1E
		setEntityDir $81,$2
		nextSingleText $C0,$81  ; "Who are they?{W1}"
		nextSingleText $0,$7    ; "Nice to meet you.{W1}"
		setEntityDir $81,$1
		setActscript $7,$FF,eas_Jump
		nextSingleText $0,$7    ; "I'm {NAME;7}.  And this is{N}our leader.{W1}"
		moveEntity $7,$FF,$3,$2
		moreMove $2,$1
		endMove $8080
		setEntityDir $81,$3
		setEntityDir $7,$1
		nextSingleText $0,$7    ; "{LEADER}, say something.{W1}"
		entitySprite $81,$CC
		setEntityDir $81,$3
		startEntity $81
		nextSingleText $C0,$81  ; "Oh, it's you.{W1}"
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
		dc.b $18
		dc.b $18
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$3,$1
		endMove $8080
		csWait $32
		nextSingleText $0,$0    ; "Ah...{W1}"
		csWait $32
		nextSingleText $C0,$81  ; "Er...ummm....{W1}"
		entityPosDir $7,$D,$12,$1
		csWait $1E
		entityPosDir $7,$E,$10,$2
		csWait $1E
		entityPosDir $7,$D,$F,$3
		csWait $1E
		entityPosDir $7,$E,$11,$2
		setEntityDir $1F,$3
		nextSingleText $0,$1F   ; "{NAME;7}, don't bother them!{N}This is a private moment!{W1}"
		setQuakeAmount $2
		csWait $1E
		setQuakeAmount $0
		csWait $5
		setActscript $1C,$0,eas_461B6
		csWait $78
		setEntityDir $1C,$3
		setQuakeAmount $2
		moveEntity $0,$0,$2,$2
		endMove $8080
		moveEntity $81,$FF,$3,$1
		moreMove $2,$1
		endMove $8080
		csWait $5
		setActscript $0,$0,eas_461E4
		moveEntity $7,$FF,$0,$2
		endMove $8080
		csWait $5
		setActscript $7,$0,eas_461B6
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		csWait $5
		setActscript $1F,$0,eas_461B6
		csWait $78
		nextSingleText $0,$7    ; "An earthquake!{N}Deep below us....{W1}"
		nextSingleText $0,$1C   ; "Something is coming up{N}through the earth...{W1}"
		setEntityDir $1F,$1
		nextSingleText $0,$1F   ; "I almost forgot...about...{N}the other devil....{W1}"
		moveEntity $0,$0,$1,$2
		moreMove $0,$1
		endMove $8080
		moveEntity $1C,$0,$1,$1
		moreMove $0,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $7,$0,$1,$2
		moreMove $2,$2
		endMove $8080
		moveEntity $81,$0,$1,$1
		endMove $8080
		waitIdle $7
		setEntityDir $0,$0
		setEntityDir $1F,$2
		nextSingleText $0,$0    ; "You mean...Zeon?{W1}"
		entityNod $1F
		setEntityDir $0,$1
		setEntityDir $7,$1
		setEntityDir $1F,$1
		setEntityDir $1C,$1
		setCamDest $8,$3
		setQuakeAmount $3
		nextSingleText $0,$7    ; "Huh?{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks $C27,$704,$A03
		csWait $28
		nextSingleText $0,$1C   ; "Uh, oh.{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks $C2C,$704,$A03
		csWait $28
		nextSingleText $0,$1F   ; "This doesn't look promising.{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks $C31,$704,$A03
		csWait $28
		nextSingleText $0,$81   ; "Eeeekkk!{W1}"
		csWait $28
		nextSingleText $0,$0    ; "Oh, no.{W1}"
		playSound SFX_DEMON_BREATH
		setQuakeAmount $4
		csWait $1E
		playSound SFX_INTRO_LIGHTNING
		setBlocks $C36,$704,$A03
		flashScreenWhite $1E
		entityPosDir $82,$D,$6,$3
		tintMap
		csWait $28
		setQuakeAmount $0
		playSound $FD
		csWait $5A
		setCameraEntity $80
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $6E
		playSound MUSIC_ZEON_ATTACK
		entitySprite $80,$B2
		setEntityDir $80,$3
		startEntity $80
		moveEntity $80,$FF,$1,$D
		endMove $8080
		animEntityFadeInOut $80,$6
		setCameraEntity $FFFF
		csWait $32
		nextSingleText $C0,$82  ; "Gggggrrr...you destroyed my{N}minions!{W1}"
		nextSingleText $0,$1F   ; "Zeon!{W1}"
		nextText $C0,$82        ; "You resisted me....{W2}"
		nextSingleText $C0,$82  ; "I...I never...!{W1}"
		setEntityDir $81,$3
		stopEntity $81
		customActscript $81,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuakeAmount $3
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $1E
		tintMap
		setQuakeAmount $0
		csWait $32
		setCamDest $8,$C
		setEntityDir $1F,$2
		nextSingleText $0,$1F   ; "{LEADER}, we had better{N}run away and return later.{W1}"
		setEntityDir $7,$2
		nextSingleText $0,$7    ; "Sir Astral, we can't!{W1}"
		setEntityDir $1F,$0
		nextSingleText $0,$1F   ; "Why not?{W1}"
		nextSingleText $0,$7    ; "Princess Elis fainted when{N}she saw Zeon.{W1}"
		setEntityDir $1F,$3
		setEntityDir $1C,$2
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "What?  Oh, my.{W1}"
		setEntityDir $0,$3
		setActscript $0,$FF,eas_Jump
		moveEntity $1C,$FF,$3,$1
		endMove $8080
		setEntityDir $1C,$0
		csWait $1E
		setEntityDir $1C,$3
		csWait $1E
		setEntityDir $1C,$2
		csWait $1E
		setEntityDir $1C,$3
		csWait $1E
		nextSingleText $0,$1C   ; "And now we're surrounded{N}by devils.{W1}"
		csWait $5
		setActscript $7,$0,eas_461B6
		setEntityDir $1F,$2
		csWait $28
		setEntityDir $1F,$1
		nextText $0,$1F         ; "{LEADER}, believe in your{N}sword and the jewel!{N}We must fight Zeon now!{W1}"
		nextSingleText $0,$1F   ; "Let's go!{W1}"
		setEntityDir $0,$1
		setEntityDir $7,$1
		entityNod $0
		setStoryFlag $2B        ; Battle 43 unlocked
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4F328:       dc.b   0
		dc.b  $D
		dc.w $11
		dc.w 1
		dc.b $F
		dc.b $F
		dc.b 2
		dc.b 7
		dc.l eas_Init           
		dc.b $C
		dc.b $13
		dc.b 0
		dc.b $1C
		dc.l eas_Init           
		dc.b $D
		dc.b $13
		dc.b 3
		dc.b $A4
		dc.l eas_Init           
		dc.b $D
		dc.b $F
		dc.b 3
		dc.b $CC
		dc.l eas_Init           
		dc.b $3E
		dc.b $3E
		dc.b 3
		dc.b $FB
		dc.l eas_Init           
		dc.w $FFFF
