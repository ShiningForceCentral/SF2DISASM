
; ASM FILE data\battles\entries\battle42\cs_afterbattle.asm :
; 0x4EF04..0x4F358 : Cutscene after battle 42
abcs_battle42:  textCursor $C22
		loadMapFadeIn 59,8,13
		loadMapEntities ce_4F328
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,15,15,LEFT
		setActscript $1F,$FF,eas_Init
		setPos $1F,11,15,RIGHT
		setActscript $1C,$FF,eas_Init
		setPos $1C,12,19,RIGHT
		jumpIfFlagClear $4C,cs_4EF5E; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,DOWN
cs_4EF5E:       stopEntity $80
		customActscript $80,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $80,$FF,eas_46172
		stopEntity $81
		customActscript $81,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setPriority $1F,$0
		setPriority $1C,$0
		setPriority $80,$FFFF
		fadeInB
		cameraSpeed $30
		csWait 60
		entityShiver $80
		nextSingleText $C0,$80  ; "Auuugh...{W1}"
		setFacing $0,DOWN
		setFacing $7,DOWN
		setFacing $1F,DOWN
		entityShiver $80
		nextText $C0,$80        ; "I've never lost to anybody{N}but the gods.{W2}"
		nextSingleText $C0,$80  ; "I don't understand!{W1}"
		setFacing $80,UP
		nextSingleText $0,$1C   ; "Oh, King Galam...poor{N}King Galam....{W1}"
		entityShiver $81
		setFacing $7,LEFT
		setActscript $7,$FF,eas_Jump
		nextSingleText $0,$7    ; "Princess Elis!{W1}"
		setFacing $0,UP
		setFacing $1F,RIGHT
		setFacing $1C,UP
		nextSingleText $C0,$81  ; "Zzzzz....{W1}"
		nextSingleText $0,$1F   ; "...she's waking up!{W1}"
		nextSingleText $C0,$81  ; "Zzzzz...(yawn)...{W1}"
		moveEntity $1F,$0,$0,$1
		endMove $8080
		moveEntity $1C,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$1F   ; "Princess, princess!{W1}"
		csWait 50
		setActscript $81,$FF,eas_Init
		setFacing $81,DOWN
		entitySprite $81,$D8
		nextSingleText $C0,$81  ; "Wha...What?{W1}"
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "It's me!  Astral!{W1}"
		setFacing $81,LEFT
		nextSingleText $C0,$81  ; "Sir Astral?  Oh, what{N}happened?{W1}"
		setFacing $81,DOWN
		csWait 30
		setFacing $81,UP
		csWait 30
		setFacing $81,LEFT
		nextSingleText $C0,$81  ; "Who are they?{W1}"
		nextSingleText $0,$7    ; "Nice to meet you.{W1}"
		setFacing $81,UP
		setActscript $7,$FF,eas_Jump
		nextSingleText $0,$7    ; "I'm {NAME;7}.  And this is{N}our leader.{W1}"
		moveEntity $7,$FF,$3,$2
		moreMove $2,$1
		endMove $8080
		setFacing $81,DOWN
		setFacing $7,UP
		nextSingleText $0,$7    ; "{LEADER}, say something.{W1}"
		entitySprite $81,$CC
		setFacing $81,DOWN
		startEntity $81
		nextSingleText $C0,$81  ; "Oh, it's you.{W1}"
		customActscript $81,$FF
		ac_setSpeed 6168        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $81,$FF,$3,$1
		endMove $8080
		csWait 50
		nextSingleText $0,$0    ; "Ah...{W1}"
		csWait 50
		nextSingleText $C0,$81  ; "Er...ummm....{W1}"
		setPos $7,13,18,UP
		csWait 30
		setPos $7,14,16,LEFT
		csWait 30
		setPos $7,13,15,DOWN
		csWait 30
		setPos $7,14,17,LEFT
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "{NAME;7}, don't bother them!{N}This is a private moment!{W1}"
		setQuake 2
		csWait 30
		setQuake 0
		csWait 5
		setActscript $1C,$0,eas_461B6
		csWait 120
		setFacing $1C,DOWN
		setQuake 2
		moveEntity $0,$0,$2,$2
		endMove $8080
		moveEntity $81,$FF,$3,$1
		moreMove $2,$1
		endMove $8080
		csWait 5
		setActscript $0,$0,eas_461E4
		moveEntity $7,$FF,$0,$2
		endMove $8080
		csWait 5
		setActscript $7,$0,eas_461B6
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		csWait 5
		setActscript $1F,$0,eas_461B6
		csWait 120
		nextSingleText $0,$7    ; "An earthquake!{N}Deep below us....{W1}"
		nextSingleText $0,$1C   ; "Something is coming up{N}through the earth...{W1}"
		setFacing $1F,UP
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
		setFacing $0,RIGHT
		setFacing $1F,LEFT
		nextSingleText $0,$0    ; "You mean...Zeon?{W1}"
		entityNod $1F
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		setFacing $1C,UP
		setCamDest 8,3
		setQuake 3
		nextSingleText $0,$7    ; "Huh?{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks 12,39,7,4,10,3
		csWait 40
		nextSingleText $0,$1C   ; "Uh, oh.{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks 12,44,7,4,10,3
		csWait 40
		nextSingleText $0,$1F   ; "This doesn't look promising.{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setBlocks 12,49,7,4,10,3
		csWait 40
		nextSingleText $0,$81   ; "Eeeekkk!{W1}"
		csWait 40
		nextSingleText $0,$0    ; "Oh, no.{W1}"
		playSound SFX_DEMON_BREATH
		setQuake 4
		csWait 30
		playSound SFX_INTRO_LIGHTNING
		setBlocks 12,54,7,4,10,3
		flashScreenWhite $1E
		setPos $82,13,6,DOWN
		tintMap
		csWait 40
		setQuake 0
		playSound $FD
		csWait 90
		setCameraEntity $80
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		csWait 110
		playSound MUSIC_ZEON_ATTACK
		entitySprite $80,$B2
		setFacing $80,DOWN
		startEntity $80
		moveEntity $80,$FF,$1,$D
		endMove $8080
		animEntityFadeInOut $80,$6
		setCameraEntity $FFFF
		csWait 50
		nextSingleText $C0,$82  ; "Gggggrrr...you destroyed my{N}minions!{W1}"
		nextSingleText $0,$1F   ; "Zeon!{W1}"
		nextText $C0,$82        ; "You resisted me....{W2}"
		nextSingleText $C0,$82  ; "I...I never...!{W1}"
		setFacing $81,DOWN
		stopEntity $81
		customActscript $81,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setQuake 3
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $1E
		tintMap
		setQuake 0
		csWait 50
		setCamDest 8,12
		setFacing $1F,LEFT
		nextSingleText $0,$1F   ; "{LEADER}, we had better{N}run away and return later.{W1}"
		setFacing $7,LEFT
		nextSingleText $0,$7    ; "Sir Astral, we can't!{W1}"
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "Why not?{W1}"
		nextSingleText $0,$7    ; "Princess Elis fainted when{N}she saw Zeon.{W1}"
		setFacing $1F,DOWN
		setFacing $1C,LEFT
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "What?  Oh, my.{W1}"
		setFacing $0,DOWN
		setActscript $0,$FF,eas_Jump
		moveEntity $1C,$FF,$3,$1
		endMove $8080
		setFacing $1C,RIGHT
		csWait 30
		setFacing $1C,DOWN
		csWait 30
		setFacing $1C,LEFT
		csWait 30
		setFacing $1C,DOWN
		csWait 30
		nextSingleText $0,$1C   ; "And now we're surrounded{N}by devils.{W1}"
		csWait 5
		setActscript $7,$0,eas_461B6
		setFacing $1F,LEFT
		csWait 40
		setFacing $1F,UP
		nextText $0,$1F         ; "{LEADER}, believe in your{N}sword and the jewel!{N}We must fight Zeon now!{W1}"
		nextSingleText $0,$1F   ; "Let's go!{W1}"
		setFacing $0,UP
		setFacing $7,UP
		entityNod $0
		setStoryFlag $2B        ; Battle 43 unlocked
		csc_end
ce_4F328:       mainEntity 13,17,UP
		entity 15,15,LEFT,7,eas_Init
		entity 12,19,RIGHT,28,eas_Init
		entity 13,19,DOWN,164,eas_Init
		entity 13,15,DOWN,204,eas_Init
		entity 62,62,DOWN,251,eas_Init
		dc.w $FFFF
