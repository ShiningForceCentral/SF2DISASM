
; ASM FILE data\maps\entries\map20\mapsetups\s6.asm :
; 0x53966..0x53E18 : 

; =============== S U B R O U T I N E =======================================

ms_map20_InitFunction:
		
		cmpi.l  #$22803780,((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w
		bne.s   loc_53988
		trap    #CHECK_FLAG
		dc.w $25D               ; set after the scene in the King's bedroom
		bne.s   loc_53982
		lea     cs_53996(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $25D               ; set after the scene in the King's bedroom
		bra.s   loc_53988
loc_53982:
		lea     cs_53B60(pc), a0
		trap    #6
loc_53988:
		trap    #CHECK_FLAG
		dc.w $1FB               ; Battle 7 completed
		beq.s   return_53994
		lea     cs_53FD8(pc), a0
		trap    #6
return_53994:
		rts

	; End of function ms_map20_InitFunction

cs_53996:       textCursor $880         ; 0004 INIT TEXT CURSOR 880 : "Mmmm....{N}Hmmm...mmmm....{W1}"
		entityPosDir $0,$17,$27,$3; 0019 SET ENTITY POS AND FACING 0 17 27 3
		entityPosDir $1,$17,$26,$3; 0019 SET ENTITY POS AND FACING 1 17 26 3
		entityPosDir $2,$17,$25,$3; 0019 SET ENTITY POS AND FACING 2 17 25 3
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $1,$FF,eas_Init; 0015 SET ACTSCRIPT 1 FF 460CE
		setActscript $2,$FF,eas_Init; 0015 SET ACTSCRIPT 2 FF 460CE
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csWait $14
		setFacing $0,$2         ; 0023 SET ENTITY FACING 0 2
		csWait $14
		setCamDest $C,$22       ; 0032 SET CAMERA DEST C 22
		setFacing $0,$3         ; 0023 SET ENTITY FACING 0 3
		nextSingleText $0,$80   ; "Mmmm....{N}Hmmm...mmmm....{W1}"
		nextSingleText $0,$81   ; "Oh, father!{N}Please wake up.{W1}"
		moveEntity $83,$FF,$0,$1; 002D MOVE ENTITY 83 FF 0 1
		endMove $8080
		setFacing $83,$1        ; 0023 SET ENTITY FACING 83 1
		nextSingleText $0,$83   ; "Sir Astral?{W1}"
		nextSingleText $80,$82  ; "Hmmm.  Nothing is wrong{N}with his body, but...{W1}"
		setPriority $82,$0      ; 0053  82 0
		setPriority $83,$FFFF   ; 0053  83 FFFF
		setActscript $83,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 83 FF 45F0C
		setActscript $83,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 83 FF 45F0C
		nextSingleText $0,$83   ; "He is suffering badly from{N}something....{W1}"
		setFacing $82,$3        ; 0023 SET ENTITY FACING 82 3
		nextSingleText $80,$82  ; "Perhaps...it might be...{N}{D1}Well?{W1}"
		csWait $1E
		setFacing $82,$0        ; 0023 SET ENTITY FACING 82 0
		setCamDest $11,$22      ; 0032 SET CAMERA DEST 11 22
		setFacing $82,$3        ; 0023 SET ENTITY FACING 82 3
		csWait $28
		setFacing $82,$0        ; 0023 SET ENTITY FACING 82 0
		csWait $28
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$FF,$0,$2; 002D MOVE ENTITY 82 FF 0 2
		endMove $8080
		setActscript $82,$FF,eas_Init; 0015 SET ACTSCRIPT 82 FF 460CE
		nextSingleText $0,$82   ; "What are you doing here?!{W1}"
		setCamDest $11,$22      ; 0032 SET CAMERA DEST 11 22
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $1,$0,eas_Jump; 0015 SET ACTSCRIPT 1 0 45E44
		setActscript $2,$FF,eas_Jump; 0015 SET ACTSCRIPT 2 FF 45E44
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $1,$0,eas_Jump; 0015 SET ACTSCRIPT 1 0 45E44
		setActscript $2,$FF,eas_Jump; 0015 SET ACTSCRIPT 2 FF 45E44
		nextSingleText $80,$2   ; "Oops!{W1}"
		moveEntity $2,$FF,$2,$2 ; 002D MOVE ENTITY 2 FF 2 2
		moreMove $3,$1
		endMove $8080
		nextSingleText $80,$2   ; "Sorry, sir!{W1}"
		moveEntity $1,$FF,$2,$1 ; 002D MOVE ENTITY 1 FF 2 1
		endMove $8080
		setFacing $1,$3         ; 0023 SET ENTITY FACING 1 3
		setFacing $0,$2         ; 0023 SET ENTITY FACING 0 2
		nextSingleText $80,$1   ; "Well, we just followed you....{W1}"
		moveEntity $82,$FF,$0,$1; 002D MOVE ENTITY 82 FF 0 1
		endMove $8080
		setFacing $82,$1        ; 0023 SET ENTITY FACING 82 1
		nextSingleText $80,$82  ; "Don't lie to me.{N}You wanted to see the{N}castle, didn't you?{W1}"
		moveEntity $83,$FF,$1,$1; 002D MOVE ENTITY 83 FF 1 1
		endMove $8080
		setFacing $83,$0        ; 0023 SET ENTITY FACING 83 0
		nextSingleText $0,$83   ; "Sir Astral, who are they?{W1}"
		csWait $5
		setActscript $82,$0,eas_461B6; 0015 SET ACTSCRIPT 82 0 461B6
		nextSingleText $80,$82  ; "Oh...{D1}well...{D1}(mumble)...{D1}{N}They're my pupils....{W1}"
		moveEntity $83,$FF,$0,$1; 002D MOVE ENTITY 83 FF 0 1
		endMove $8080
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		nextText $0,$83         ; "So they are.   They look{N}like good kids.{W1}"
		nextSingleText $0,$83   ; "You must have a special{N}reason to have them here,{N}right?{W1}"
		nextSingleText $80,$82  ; "Um...{D1}I didn't mean for...{W1}"
		setFacing $82,$1        ; 0023 SET ENTITY FACING 82 1
		csWait $28
		setFacing $82,$0        ; 0023 SET ENTITY FACING 82 0
		csWait $1E
		nextSingleText $FF,$FF  ; "Astral glares at {LEADER}.{W1}"
		moveEntity $82,$FF,$2,$1; 002D MOVE ENTITY 82 FF 2 1
		endMove $8080
		nextSingleText $80,$82  ; "(Cough){N}You said the door of the{N}Ancient Tower is open.{W2}{N}There must be a connection{N}between the open door and{N}the King's sickness.{W1}"
		setFacing $82,$3        ; 0023 SET ENTITY FACING 82 3
		csWait $3C
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		nextSingleText $80,$82  ; "I called them here to help{N}me investigate the tower.{W1}"
		entityNod $83           ; 0026 MAKE ENTITY NOD 83
		moveEntity $82,$FF,$0,$1; 002D MOVE ENTITY 82 FF 0 1
		endMove $8080
		nextSingleText $80,$82  ; "Now, pupils.  Follow me.{W1}"
		setFacing $82,$1        ; 0023 SET ENTITY FACING 82 1
		nextSingleText $80,$82  ; "Don't give me any more{N}trouble!{W1}"
		moveEntity $1,$0,$1,$1  ; 002D MOVE ENTITY 1 0 1 1
		endMove $8080
		moveEntity $82,$FF,$1,$1; 002D MOVE ENTITY 82 FF 1 1
		moreMove $0,$1
		moreMove $1,$1
		endMove $8080
		followEntity $1,$0,$2   ; 002C FOLLOW ENTITY 1 0 2
		followEntity $2,$1,$2   ; 002C FOLLOW ENTITY 2 1 2
cs_53B60:       hideEntity $82          ; 002E HIDE ENTITY 82
		csc_end
cs_53B66:       playSound $FD           ; 0005 PLAY SOUND 
		textCursor $895         ; 0004 INIT TEXT CURSOR 895 : "King Granseal!{N}Calm down!{W1}"
		setActscript $82,$FF,eas_46172; 0015 SET ACTSCRIPT 82 FF 46172
		setActscript $80,$FF,eas_46172; 0015 SET ACTSCRIPT 80 FF 46172
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $80,$FF ; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setCamDest $11,$30      ; 0032 SET CAMERA DEST 11 30
		playSound MUSIC_ENEMY_ATTACK; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
		moveEntity $80,$0,$1,$2 ; 002D MOVE ENTITY 80 0 1 2
		endMove $8080
		csWait $A
		moveEntity $82,$FF,$1,$2; 002D MOVE ENTITY 82 FF 1 2
		endMove $8080
		csWait $28
		moveEntity $80,$0,$3,$2 ; 002D MOVE ENTITY 80 0 3 2
		endMove $8080
		csWait $A
		moveEntity $82,$FF,$3,$2; 002D MOVE ENTITY 82 FF 3 2
		endMove $8080
		csWait $1E
		nextSingleText $80,$82  ; "King Granseal!{N}Calm down!{W1}"
		nextSingleText $0,$80   ; "Guooooorrrr!{W1}"
		moveEntity $80,$0,$0,$2 ; 002D MOVE ENTITY 80 0 0 2
		endMove $8080
		setActscript $82,$FF,eas_Init; 0015 SET ACTSCRIPT 82 FF 460CE
		csWait $1
		setActscript $82,$FF,eas_JumpRight
						; 0015 SET ACTSCRIPT 82 FF 45E94
		setActscript $82,$FF,eas_JumpRight
						; 0015 SET ACTSCRIPT 82 FF 45E94
		nextSingleText $80,$82  ; "He's possessed!  He needs{N}an exorcism right now!{W1}"
		setCameraEntity $82     ; 0024 SET ENTITY FOLLOWED BY CAMERA 82
		moveEntity $80,$FF,$0,$1; 002D MOVE ENTITY 80 FF 0 1
		endMove $8080
		playSound SFX_DESOUL_HOVERING; 0005 PLAY SOUND SFX_DESOUL_HOVERING
		setActscript $80,$0,eas_BumpRight
						; 0015 SET ACTSCRIPT 80 0 45EBC
		setActscript $82,$FF,eas_46172; 0015 SET ACTSCRIPT 82 FF 46172
		moveEntity $82,$FF,$0,$2; 002D MOVE ENTITY 82 FF 0 2
		endMove $8080
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $78
cs_53C42:       setCamDest $13,$30      ; 0032 SET CAMERA DEST 13 30
		textCursor $898         ; 0004 INIT TEXT CURSOR 898 : "Yeow!  My head!{N}No, I'm OK, {LEADER}.{W2}"
		setActscript $82,$FF,eas_Init; 0015 SET ACTSCRIPT 82 FF 460CE
		setFacing $82,$3        ; 0023 SET ENTITY FACING 82 3
		csWait $A
		entityShakeHead $82     ; 0027 MAKE ENTITY SHAKE HEAD 82
		csWait $1E
		setFacing $82,$1        ; 0023 SET ENTITY FACING 82 1
		nextText $80,$82        ; "Yeow!  My head!{N}No, I'm OK, {LEADER}.{W2}"
		nextSingleText $80,$82  ; "I must use a powerful spell.{N}It may be dangerous.{N}Stay back!{W1}"
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		setFacing $0,$3         ; 0023 SET ENTITY FACING 0 3
		setActscript $80,$FF,eas_46172; 0015 SET ACTSCRIPT 80 FF 46172
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $80,$FF ; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		csWait $32
		entityShiver $82        ; 002A MAKE ENTITY SHIVER 82
		csWait $1E
		entityShiver $82        ; 002A MAKE ENTITY SHIVER 82
		csWait $14
		playSound SFX_SPELL_CAST; 0005 PLAY SOUND SFX_SPELL_CAST
		entityFlashWhite $82,$78; 0018 FLASH ENTITY WHITE 82 78
		moveEntity $82,$0,$2,$2 ; 002D MOVE ENTITY 82 0 2 2
		endMove $8080
		moveEntity $80,$0,$C,$14; 002D MOVE ENTITY 80 0 C 14
		moreMove $2,$2
		endMove $8080
		entityFlashWhite $82,$78; 0018 FLASH ENTITY WHITE 82 78
		playSound SFX_SPELL_CAST; 0005 PLAY SOUND SFX_SPELL_CAST
		entityPosDir $88,$18,$35,$2; 0019 SET ENTITY POS AND FACING 88 18 35 2
		nextSingleText $80,$82  ; "Evil spirit inside the King,{N}begone, HAAA!{W1}"
		customActscript $88,$FF ; 0014 SET MANUAL ACTSCRIPT 88
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $88,$FF,$2,$2; 002D MOVE ENTITY 88 FF 2 2
		endMove $8080
		hideEntity $88          ; 002E HIDE ENTITY 88
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
						; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
		setQuake $2             ; 0033 SET QUAKE AMOUNT 2
		csWait $3C
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		customActscript $80,$FF ; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$2,$1; 002D MOVE ENTITY 80 FF 2 1
		endMove $8080
		customActscript $80,$FF ; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $32
		entityShiver $82        ; 002A MAKE ENTITY SHIVER 82
		csWait $14
		moveEntity $82,$FF,$2,$2; 002D MOVE ENTITY 82 FF 2 2
		endMove $8080
		nextSingleText $80,$82  ; "King...Granseal?{W1}"
		entityShiver $80        ; 002A MAKE ENTITY SHIVER 80
		stopEntity $80          ; 001C STOP ENTITY ANIM 80
		entityPosDir $87,$15,$34,$3; 0019 SET ENTITY POS AND FACING 87 15 34 3
		animEntityFadeInOut $87,$5; 0022 ANIMATE ENTITY FADE INOUT 87
		nextSingleText $80,$82  ; "Did it work?{W1}"
		entityShiver $87        ; 002A MAKE ENTITY SHIVER 87
		setActscript $87,$FF,eas_46172; 0015 SET ACTSCRIPT 87 FF 46172
		customActscript $87,$FF ; 0014 SET MANUAL ACTSCRIPT 87
		dc.w $10                ;   0010 SET SPEED X=$0 Y=$0
		dc.b 0
		dc.b 0
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $87,$FF,$1,$5; 002D MOVE ENTITY 87 FF 1 5
		endMove $8080
		hideEntity $87          ; 002E HIDE ENTITY 87
		csWait $3C
		nextSingleText $0,$80   ; "Ooh....{W1}"
		startEntity $80         ; 001B START ENTITY ANIM 80
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		csWait $5
		setActscript $80,$0,eas_461B6; 0015 SET ACTSCRIPT 80 0 461B6
		csWait $64
		setFacing $80,$0        ; 0023 SET ENTITY FACING 80 0
		csWait $28
		moveEntity $80,$FF,$0,$1; 002D MOVE ENTITY 80 FF 0 1
		endMove $8080
		nextSingleText $0,$80   ; "Astral, wha...what{N}happened?{W1}"
		entityShiver $82        ; 002A MAKE ENTITY SHIVER 82
		nextText $80,$82        ; "Are you alright?{W2}"
		nextSingleText $80,$82  ; "Let me use your soldiers.{N}We must kill it before it{N}finds another victim.{W1}"
		nextSingleText $0,$80   ; "What are you talking about?{N}I don't understand.{W1}"
		csWait $32
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		nextSingleText $80,$82  ; "(Sigh){W1}"
		nextSingleText $0,$80   ; "Astral!{W1}"
		playSound $FD           ; 0005 PLAY SOUND 
		csWait $1E
		fadeOutB                ; 003A FADE OUT TO BLACK
		csc36                   ; 0036 RELATED TO LOADING A MAP
		fadeInB                 ; 0039 FADE IN FROM BLACK
		reloadMap $0,$0         ; 0046  0 0
		csWait $1
		nextSingleText $FF,$FF  ; "Astral is exhausted.{N}He won't wake up!{W2}{N}The Minister summons the{N}soldiers to the hall to kill{N}the evil spirit.{W1}"
		setF $261               ; set after the scene where Astral exorcises the Gizmo
		mapSysEvent $13,$1D,$8,$1; 0007 EXECUTE MAP SYSTEM EVENT 131D0801
		playSound MUSIC_CASTLE  ; 0005 PLAY SOUND MUSIC_CASTLE
		csc_end
