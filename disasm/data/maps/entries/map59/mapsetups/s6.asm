
; ASM FILE data\maps\entries\map59\mapsetups\s6.asm :
; 0x5EAD8..0x5F34C : 

; =============== S U B R O U T I N E =======================================

ms_map59_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $3E7
		bne.s   loc_5EB18
		lea     cs_5EB44(pc), a0
		trap    #6
		lea     cs_5EBFC(pc), a0
		trap    #6
		lea     cs_5ED06(pc), a0
		trap    #6
		lea     cs_5EDB8(pc), a0
		trap    #6
		lea     cs_5EF60(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $3E7               ; set after the Nazca ship shootdown scene
		move.b  #$2D,((EGRESS_MAP_INDEX-$1000000)).w 
		trap    #SET_FLAG
		dc.w $1B4               ; Battle 36 unlocked
		trap    #SET_FLAG
		dc.w $1B8               ; Battle 40 unlocked
		trap    #SET_FLAG
		dc.w $1BA               ; Battle 42 unlocked
		trap    #SET_FLAG
		dc.w $1BB               ; Battle 43 unlocked
		rts
loc_5EB18:
		trap    #CHECK_FLAG
		dc.w $1BB
		beq.s   return_5EB24
		lea     cs_5EB26(pc), a0
		trap    #6
return_5EB24:
		rts

	; End of function ms_map59_InitFunction

cs_5EB26:       executeSubroutine csub_5EB34
		mapSysEvent $3B,$D,$22,$1
		csc_end

; =============== S U B R O U T I N E =======================================

csub_5EB34:
		lea     (PALETTE_1_BIS).l,a0
		moveq   #$1F,d7
loc_5EB3C:
		clr.l   (a0)+
		dbf     d7,loc_5EB3C
		rts

	; End of function csub_5EB34

cs_5EB44:       textCursor $E73
		setCameraEntity $FFFF
		reloadMap $8,$2
		loadMapEntities ce_5F19E
		setActscript $0,$FF,eas_Init
		csWait $3C
		playSound MUSIC_WITCH
		csWait $1E
		setActscript $80,$0,eas_Transparent
		fadeInFromBlackHalf
		nextSingleText $0,$80   ; "{LEADER} is almost here{N}already?{W1}"
		nextSingleText $80,$81  ; "Yes, sir.  With an ancient{N}aircraft.  He'll be passing{N}over the cape soon.{W1}"
		nextSingleText $0,$80   ; "Good.  I'll do anything to{N}get my powers back.{W1}"
		nextText $80,$81        ; "They're stronger than we{N}thought.{W2}"
		nextSingleText $80,$81  ; "But, I have an idea.  Please{N}let me try it.{W1}"
		nextSingleText $0,$80   ; "Well?{W1}"
		nextText $80,$81        ; "I think it's better for us{N}to shoot them down over the{N}"
		nextSingleText $80,$81  ; "cape.{W1}"
		nextSingleText $0,$80   ; "I agree.{W1}"
		nextText $80,$81        ; "Thank you.  Then... may I{W2}"
		nextSingleText $80,$81  ; "borrow Odd Eye?{W1}"
		nextText $0,$80         ; "He's still damaged from his{N}battle against Volcanon.{W2}"
		nextSingleText $0,$80   ; "Take Red Baron instead.{W1}"
		entityShiver $81
		entityShiver $81
		nextSingleText $80,$81  ; "Thank you, sir.{W1}"
		nextSingleText $0,$80   ; "They'll be passing over the{N}cape soon.  Go!{W1}"
		nextSingleText $80,$81  ; "Yes, sir!{W1}"
		animEntityFadeInOut $81,$6
		nextSingleText $0,$82   ; "That Geshp!  He wants{N}everything.{W1}"
		entityPosDir $82,$9,$9,$3
		animEntityFadeInOut $82,$7
		moveEntity $82,$FF,$0,$4
		moreMove $1,$1
		endMove $8080
		nextSingleText $0,$80   ; "You noticed that too?{W1}"
		entityNod $82
		nextText $0,$82         ; "Yes, King Zeon.{W2}"
		nextSingleText $0,$82   ; "I'm afraid Geshp can't stop{N}{LEADER}'s advance.{W1}"
		nextSingleText $0,$80   ; "You really think so?{W1}"
		nextText $0,$82         ; "I was just thinking of{N}{LEADER}'s hidden powers.{W2}"
		nextSingleText $0,$82   ; "We must never underestimate{N}him.{W1}"
		nextSingleText $0,$80   ; "Anyway, it will be a{N}fantastic show!  Ha, ha!{W1}"
		csc_end
cs_5EBFC:       loadMapFadeIn $35,$8,$E
		textCursor $E8B
		loadMapEntities ce_5F1DE
		setActscript $0,$FF,eas_Init
		stopEntity $82
		stopEntity $83
		stopEntity $84
		stopEntity $85
		playSound MUSIC_BATTLE_THEME_1
		fadeInB
		setActscript $82,$FF,eas_Init
		setActscript $86,$FF,eas_Init
		setActscript $87,$FF,eas_Init
		setActscript $88,$FF,eas_Init
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $87,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $88,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$0,$0,$3
		endMove $8080
		moveEntity $86,$0,$0,$3
		endMove $8080
		moveEntity $87,$0,$0,$3
		endMove $8080
		moveEntity $88,$0,$0,$3
		endMove $8080
		setFacing $80,$2
		csWait $1E
		setFacing $80,$0
		csWait $1E
		entityShiver $80
		nextSingleText $0,$80   ; "Finish the preparations{N}before the Nazca Ship flies{N}over the cape!{W1}"
		setCamDest $A,$E
		entityPosDir $81,$F,$10,$3
		animEntityFadeInOut $81,$7
		nextSingleText $80,$81  ; "How are the Prism Flowers?{W1}"
		nextSingleText $0,$80   ; "They're ready!{W1}"
		nextSingleText $80,$81  ; "Excellent!{W1}"
		entityNod $81
		setCameraEntity $81
		moveEntity $81,$FF,$0,$2
		moreMove $1,$2
		endMove $8080
		setFacing $81,$0
		nextText $80,$81        ; "Now, c'mon Granseal losers!{W2}"
		nextSingleText $80,$81  ; "The Prism Flowers are waiting{N}for you!  Hee, heee!{W1}"
		entityNod $81
		entityNod $81
		csc_end
cs_5ED06:       textCursor $E91
		loadMapFadeIn $49,$0,$0
		loadMapEntities ce_5F1BE
		setActscript $0,$FF,eas_Init
		executeSubroutine sub_5F31E
		playSound MUSIC_MITULA_SHRINE
		setBlocks $0,$A,$16,$A,$2A,$A
		fadeInB
		executeSubroutine sub_5FD92
		nextSingleText $80,$1A  ; "There's Grans Island!{W1}"
		nextSingleText $80,$7   ; "Alright!{W1}"
		nextSingleText $0,$1F   ; "We've finally come home.{W1}"
		loadMapFadeIn $35,$A,$D
		loadMapEntities ce_5F23E
		setActscript $0,$FF,eas_Init
		playSound MUSIC_BATTLE_THEME_1
		stopEntity $80
		stopEntity $82
		stopEntity $83
		stopEntity $84
		fadeInB
		nextSingleText $80,$81  ; "I see the Nazca Ship!{N}Everybody, get ready!{W1}"
		loadMapFadeIn $49,$0,$0
		loadMapEntities ce_5F1BE
		setActscript $0,$FF,eas_Init
		executeSubroutine sub_5F31E
		playSound MUSIC_MITULA_SHRINE
		setBlocks $0,$A,$16,$A,$2A,$A
		fadeInB
		executeSubroutine sub_5FD92
		nextSingleText $0,$1F   ; "What's that?  I saw a flash{N}of light over there.{W1}"
		nextSingleText $80,$7   ; "I didn't see it.  You must be{N}seeing things because you're{N}so old!  Ha, ha!{W1}"
		nextText $0,$1F         ; "(Grumble)....{W2}"
		nextSingleText $0,$1F   ; "Someday, {NAME;7}....{W1}"
		csc_end
cs_5EDB8:       textCursor $E99
		loadMapFadeIn $35,$A,$D
		loadMapEntities ce_5F28E
		setActscript $0,$FF,eas_Init
		playSound MUSIC_ENEMY_ATTACK
		setActscript $85,$0,eas_5EF46
		setActscript $86,$0,eas_5EF46
		setActscript $87,$0,eas_5EF46
		setActscript $88,$0,eas_5EF46
		setActscript $89,$0,eas_5EF46
		setActscript $8A,$0,eas_5EF46
		setActscript $8B,$0,eas_5EF46
		setActscript $8C,$0,eas_5EF46
		stopEntity $8D
		stopEntity $8E
		stopEntity $8F
		stopEntity $90
		fadeInB
		setFacing $81,$2
		nextSingleText $80,$81  ; "NOW!{W1}"
		moveEntity $81,$FF,$0,$1
		endMove $8080
		nextSingleText $80,$81  ; "Shoot them!  Shoot them!{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		entityPosDir $85,$C,$10,$2
		csWait $1E
		setFacing $85,$1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $85,$D,$F,$1
		moveEntity $85,$0,$4,$A
		endMove $8080
		flashScreenWhite $2
		entityPosDir $86,$D,$F,$1
		moveEntity $86,$0,$4,$A
		endMove $8080
		csWait $14
		playSound SFX_BATTLEFIELD_DEATH
		entityPosDir $87,$D,$11,$2
		csWait $1E
		setFacing $87,$1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $87,$E,$10,$1
		moveEntity $87,$0,$4,$A
		endMove $8080
		flashScreenWhite $2
		entityPosDir $88,$E,$10,$1
		moveEntity $88,$0,$4,$A
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH
		entityPosDir $89,$E,$13,$2
		csWait $1E
		setFacing $89,$1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $89,$F,$12,$1
		moveEntity $89,$0,$4,$A
		endMove $8080
		flashScreenWhite $2
		entityPosDir $8A,$F,$12,$1
		moveEntity $8A,$0,$4,$A
		endMove $8080
		csWait $A
		playSound SFX_BATTLEFIELD_DEATH
		entityPosDir $8B,$F,$14,$2
		csWait $1E
		setFacing $8B,$1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $8B,$10,$13,$1
		moveEntity $8B,$0,$4,$A
		endMove $8080
		flashScreenWhite $2
		entityPosDir $8C,$10,$13,$1
		moveEntity $8C,$0,$4,$A
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH
		entityPosDir $8B,$C,$10,$2
		csWait $1E
		setFacing $8B,$1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $8B,$D,$F,$1
		moveEntity $8B,$0,$4,$A
		endMove $8080
		flashScreenWhite $2
		entityPosDir $8C,$D,$F,$1
		moveEntity $8C,$FF,$4,$A
		endMove $8080
		csc_end
eas_5EF46:      dc.w $1E                ; 001E SET ANIM SPEED X2 $FFFF
		dc.w $FFFF
		dc.w $1C                ; 001C SET TRANSPARENCY $FFFF
		dc.w $FFFF
		dc.w $1A                ; 001A SET 1C BIT 5 $0
		dc.w 0
		dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
		dc.w 0
		dc.w $10                ; 0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
cs_5EF60:       textCursor $E9B
		loadMapFadeIn $25,$4,$6
		loadEntitiesFromMapSetup $9,$B,$3
		executeSubroutine sub_47948
		entityPosDir $1A,$8,$A,$0
		executeSubroutine sub_5F32E
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setActscript $1A,$FF,eas_Init
		entityPosDir $80,$9,$C,$1
		entityPosDir $7,$A,$C,$1
		entityPosDir $1A,$A,$B,$2
		fadeInB
		entityShiver $80
		nextSingleText $0,$80   ; "I did see something!{W1}"
		nextSingleText $80,$7   ; "Well, I didn't.{W1}"
		nextSingleText $0,$80   ; "This could be bad.{W1}"
		nextSingleText $80,$1A  ; "Sir Astral!  {LEADER}!{N}Something is coming straight{N}towards us!{W1}"
		nextSingleText $0,$80   ; "What is it?{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		flashScreenWhite $14
		setQuake $1
		csWait $A
		setQuake $0
		moveEntity $7,$FF,$0,$1
		moreMove $E,$1
		moreMove $F,$1
		moreMove $E,$1
		moreMove $F,$1
		endMove $8080
		setFacing $7,$2
		nextSingleText $80,$7   ; "Oooouu!!  What was that?!{N}Lightning?{W1}"
		setFacing $0,$0
		setFacing $1A,$3
		nextText $80,$1A        ; "An attack from the ground.{W2}"
		nextSingleText $80,$1A  ; "I can't control the ship!{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		flashScreenWhite $14
		setQuake $1
		csWait $A
		setQuake $0
		csWait $A
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		flashScreenWhite $14
		setQuake $1
		csWait $A
		nextText $80,$1A        ; "We've sustained damage to{N}the engine!{W2}"
		nextSingleText $80,$1A  ; "We might crash!{W1}"
		moveEntity $80,$FF,$0,$1
		endMove $8080
		setFacing $80,$1
		entityShiver $80
		nextText $0,$80         ; "Crash?!{W2}"
		nextSingleText $80,$1A  ; "Geshp's trap!  Darn!{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		flashScreenWhite $14
		setQuake $1
		csWait $A
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		flashScreenWhite $14
		setQuake $1
		csWait $A
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		nextText $80,$7         ; "I don't want to crash!{W2}"
		nextSingleText $80,$7   ; "Sir Astral, please help us!{W1}"
		nextSingleText $0,$80   ; "{NAME;26}, can you land on{N}that cape before the ship{N}crashes?{W1}"
		nextSingleText $80,$1A  ; "I'm not sure,{W2}"
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		flashScreenWhite $14
		setQuake $1
		csWait $A
		nextSingleText $80,$1A  ; "but I'll try.{W1}"
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		flashScreenWhite $14
		setQuake $1
		csWait $A
		setQuake $3
		executeSubroutine sub_5F338
		fadeOutB
		setQuake $0
		mapLoad $4B,$14,$E
		loadMapEntities ce_5F1CE
		setActscript $0,$FF,eas_Init
		setCameraEntity $80
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		cameraSpeed $10
		moveEntity $80,$0,$2,$C
		endMove $8080
		executeSubroutine csub_5F326
		fadeInB
		executeSubroutine sub_5FD92
		csWait $96
		playSound $FD
		executeSubroutine sub_5F16C
		setQuake $1
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $3C
		waitIdle $80
		setBlocks $38,$3B,$4,$5,$C,$11
		csWait $78
		setQuake $0
		executeSubroutine csub_5F14C
		csWait $78
		mapSysEvent $25,$8,$C,$3
		csc_end

; =============== S U B R O U T I N E =======================================

csub_5F14C:
		lea     plt_5F17E(pc), a0
		lea     (PALETTE_4_BIS).l,a1
		moveq   #$20,d7 
		jsr     (CopyBytes).w   
		lea     (PALETTE_1_BIS).l,a0
		clr.b   ((byte_FFDFAB-$1000000)).w
		jsr     (sub_19C8).w    
		rts

	; End of function csub_5F14C


; =============== S U B R O U T I N E =======================================

sub_5F16C:
		moveq   #$17,d7
loc_5F16E:
		subq.b  #1,((byte_FFAEEE+5-$1000000)).w
		moveq   #2,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5F16E
		rts

	; End of function sub_5F16C

plt_5F17E:      dc.w 0
		dc.w $C40
		dc.w $E84
		dc.w $26
		dc.w $6A
		dc.w $2AE
		dc.w $42
		dc.w $C4
		dc.w 0
		dc.w $222
		dc.w $666
		dc.w $AAA
		dc.w $20E
		dc.w $6CE
		dc.w $4E8
		dc.w $EEE
ce_5F19E:       dc.w 0
		dc.w 0
		dc.w 1
		dc.b $D
		dc.b 4
		dc.b 1
		dc.b $FB
		dc.l eas_Init           
		dc.b $D
		dc.b 8
		dc.b 1
		dc.b $9F
		dc.l eas_Init           
		dc.b $D
		dc.b $19
		dc.b 1
		dc.b $A0
		dc.l eas_Init           
		dc.w $FFFF
ce_5F1BE:       dc.w $3F
		dc.w $3F
		dc.w 1
		dc.b 5
		dc.b 5
		dc.b 1
		dc.b $FD
		dc.l eas_Init           
		dc.w $FFFF
ce_5F1CE:       dc.w $3F
		dc.w $3F
		dc.w 1
		dc.b $19
		dc.b $13
		dc.b 1
		dc.b $FD
		dc.l eas_Init           
		dc.w $FFFF
ce_5F1DE:       dc.w 0
		dc.w 0
		dc.w 1
		dc.b $B
		dc.b $13
		dc.b 1
		dc.b $5C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $9F
		dc.l eas_Init           
		dc.b 9
		dc.b $10
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 1
		dc.b $9D
		dc.l eas_Init           
		dc.b $E
		dc.b $13
		dc.b 2
		dc.b $9D
		dc.l eas_Init           
		dc.b $F
		dc.b $14
		dc.b 1
		dc.b $9D
		dc.l eas_Init           
		dc.b 8
		dc.b $10
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $A
		dc.b $10
		dc.b 2
		dc.b $5A
		dc.l eas_Init           
		dc.b $B
		dc.b $10
		dc.b 2
		dc.b $5A
		dc.l eas_Init           
		dc.b $F
		dc.b $13
		dc.b 3
		dc.b $8A
		dc.l eas_Init           
		dc.b $D
		dc.b $13
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.w $FFFF
ce_5F23E:       dc.w 0
		dc.w 0
		dc.w 1
		dc.b $C
		dc.b $10
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $10
		dc.b $12
		dc.b 0
		dc.b $9F
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $E
		dc.b $13
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $F
		dc.b $14
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $B
		dc.b $10
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $C
		dc.b $11
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.b $D
		dc.b $13
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $E
		dc.b $14
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.w $FFFF
ce_5F28E:       dc.w 0
		dc.w 0
		dc.w 1
		dc.b $B
		dc.b $10
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $10
		dc.b $12
		dc.b 0
		dc.b $9F
		dc.l eas_Init           
		dc.b $C
		dc.b $11
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.b $D
		dc.b $13
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $E
		dc.b $14
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b $C
		dc.b $10
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $E
		dc.b $13
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $F
		dc.b $14
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_5F31E:
		move.b  #$F0,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		nop
csub_5F326:
		move.b  #$18,((byte_FFAEEE+5-$1000000)).w
		rts

	; End of function sub_5F31E


; =============== S U B R O U T I N E =======================================

sub_5F32E:
		move.b  #$F8,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		nop
		rts

	; End of function sub_5F32E


; =============== S U B R O U T I N E =======================================

sub_5F338:
		moveq   #$F,d7
loc_5F33A:
		subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		nop
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5F33A
		rts

	; End of function sub_5F338

