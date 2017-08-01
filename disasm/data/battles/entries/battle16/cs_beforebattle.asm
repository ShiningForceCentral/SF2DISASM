
; ASM FILE data\battles\entries\battle16\cs_beforebattle.asm :
; 0x4AFBE..0x4B1BC : Cutscene before battle 16
bbcs_16:        textCursor $9D1         ; Initial text line $9D1 : "Huh?  The raft stopped!{W1}"
		loadMapFadeIn $31,$9,$A
		executeSubroutine csub_4B1CA
		loadMapEntities ce_4B15C; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setBlocks $D04,$303,$0
		setBlocks $1F04,$303,$D04
		cloneEntity $81,$82
		cloneEntity $83,$84
		cloneEntity $83,$85
		cloneEntity $83,$86
		cloneEntity $83,$87
		cloneEntity $83,$88
		cloneEntity $83,$89
		cloneEntity $83,$8A
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		entityPosDir $7,$F,$F,$2
		entityPosDir $1F,$D,$E,$3
		fadeInB
		csWait $1E
		csWait $5
		setActscript $0,$0,eas_461B6
		csWait $5
		setActscript $7,$0,eas_461B6
		csWait $5
		setActscript $1F,$0,eas_461B6
		csWait $78
		moveEntity $7,$FF,$0,$1
		endMove $8080
		csWait $14
		setEntityDir $0,$3
		setEntityDir $7,$3
		setEntityDir $1F,$3
		nextSingleText $C0,$7   ; "Huh?  The raft stopped!{W1}"
		setEntityDir $0,$2
		setEntityDir $7,$2
		setEntityDir $1F,$0
		nextSingleText $0,$1F   ; "Did the water stop flowing?{N}What's happening?{W1}"
		csWait $1E
		setEntityDir $7,$1
		csWait $1E
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		nextSingleText $C0,$7   ; "Wow!{D1}  What's that?{W1}"
		setEntityDir $0,$1
		setEntityDir $1F,$1
		csWait $14
		moveEntity $7,$FF,$1,$2
		endMove $8080
		nextSingleText $C0,$7   ; "{LEADER}, look there!{W1}"
		setCamDest $9,$0
		playSound SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $8002
		playSound SFX_BIG_DOOR_RUMBLE
		csWait $1E
		setActscript $80,$FF,eas_46172
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		entityPosDir $80,$E,$5,$3
		moveEntity $80,$FF,$1,$2
		endMove $8080
		setBlocks $0,$303,$D04
		entityPosDir $81,$C,$4,$3
		entityPosDir $82,$10,$4,$3
		playSound SFX_BIG_DOOR_RUMBLE
		animEntityFadeInOut $81,$5
		entityPosDir $83,$D,$2,$3
		entityPosDir $84,$F,$2,$3
		entityPosDir $85,$11,$3,$3
		entityPosDir $86,$B,$4,$3
		entityPosDir $87,$C,$5,$3
		entityPosDir $88,$D,$5,$3
		entityPosDir $89,$10,$5,$3
		entityPosDir $8A,$E,$6,$3
		animEntityFadeInOut $83,$5
		setQuakeAmount $4002
		nextSingleText $C0,$7   ; "M...{D1}monster!{N}It appeared from the river!{W1}"
		nextText $0,$1F         ; "It must be the monster they{N}mentioned in Polca.{W2}"
		nextSingleText $0,$1F   ; "Watch out!{W1}"
		csWait $3C
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4B15C:       dc.w $F
		dc.w $E
		dc.w 0
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $FE
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $7B
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $7B
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $4A
		dc.l eas_Init           
		dc.w $FFFF
