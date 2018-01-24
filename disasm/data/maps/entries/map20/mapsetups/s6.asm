
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

cs_53996:       textCursor $880
		setPos $0,23,39,DOWN
		setPos $1,23,38,DOWN
		setPos $2,23,37,DOWN
		setActscript $0,$FF,eas_Init
		setActscript $1,$FF,eas_Init
		setActscript $2,$FF,eas_Init
		fadeInB
		csWait 20
		setFacing $0,LEFT
		csWait 20
		setCamDest 12,34
		setFacing $0,DOWN
		nextSingleText $0,$80   ; "Mmmm....{N}Hmmm...mmmm....{W1}"
		nextSingleText $0,$81   ; "Oh, father!{N}Please wake up.{W1}"
		entityActions $83,$FF
		 moveRight 1
		endActions
		setFacing $83,UP
		nextSingleText $0,$83   ; "Sir Astral?{W1}"
		nextSingleText $80,$82  ; "Hmmm.  Nothing is wrong{N}with his body, but...{W1}"
		setPriority $82,$0
		setPriority $83,$FFFF
		setActscript $83,$FF,eas_BumpUp
		setActscript $83,$FF,eas_BumpUp
		nextSingleText $0,$83   ; "He is suffering badly from{N}something....{W1}"
		setFacing $82,DOWN
		nextSingleText $80,$82  ; "Perhaps...it might be...{N}{D1}Well?{W1}"
		csWait 30
		setFacing $82,RIGHT
		setCamDest 17,34
		setFacing $82,DOWN
		csWait 40
		setFacing $82,RIGHT
		csWait 40
		customActscript $82,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $82,$FF
		 moveRight 2
		endActions
		setActscript $82,$FF,eas_Init
		nextSingleText $0,$82   ; "What are you doing here?!{W1}"
		setCamDest 17,34
		setActscript $0,$0,eas_Jump
		setActscript $1,$0,eas_Jump
		setActscript $2,$FF,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $1,$0,eas_Jump
		setActscript $2,$FF,eas_Jump
		nextSingleText $80,$2   ; "Oops!{W1}"
		entityActions $2,$FF
		 moveLeft 2
		 moveDown 1
		endActions
		nextSingleText $80,$2   ; "Sorry, sir!{W1}"
		entityActions $1,$FF
		 moveLeft 1
		endActions
		setFacing $1,DOWN
		setFacing $0,LEFT
		nextSingleText $80,$1   ; "Well, we just followed you....{W1}"
		entityActions $82,$FF
		 moveRight 1
		endActions
		setFacing $82,UP
		nextSingleText $80,$82  ; "Don't lie to me.{N}You wanted to see the{N}castle, didn't you?{W1}"
		entityActions $83,$FF
		 moveUp 1
		endActions
		setFacing $83,RIGHT
		nextSingleText $0,$83   ; "Sir Astral, who are they?{W1}"
		csWait 5
		setActscript $82,$0,eas_461B6
		nextSingleText $80,$82  ; "Oh...{D1}well...{D1}(mumble)...{D1}{N}They're my pupils....{W1}"
		entityActions $83,$FF
		 moveRight 1
		endActions
		setFacing $82,LEFT
		nextText $0,$83         ; "So they are.   They look{N}like good kids.{W1}"
		nextSingleText $0,$83   ; "You must have a special{N}reason to have them here,{N}right?{W1}"
		nextSingleText $80,$82  ; "Um...{D1}I didn't mean for...{W1}"
		setFacing $82,UP
		csWait 40
		setFacing $82,RIGHT
		csWait 30
		nextSingleText $FF,$FF  ; "Astral glares at {LEADER}.{W1}"
		entityActions $82,$FF
		 moveLeft 1
		endActions
		nextSingleText $80,$82  ; "(Cough){N}You said the door of the{N}Ancient Tower is open.{W2}{N}There must be a connection{N}between the open door and{N}the King's sickness.{W1}"
		setFacing $82,DOWN
		csWait 60
		setFacing $82,LEFT
		nextSingleText $80,$82  ; "I called them here to help{N}me investigate the tower.{W1}"
		entityNod $83
		entityActions $82,$FF
		 moveRight 1
		endActions
		nextSingleText $80,$82  ; "Now, pupils.  Follow me.{W1}"
		setFacing $82,UP
		nextSingleText $80,$82  ; "Don't give me any more{N}trouble!{W1}"
		entityActions $1,$0
		 moveUp 1
		endActions
		entityActions $82,$FF
		 moveUp 1
		 moveRight 1
		 moveUp 1
		endActions
		followEntity $1,$0,$2
		followEntity $2,$1,$2
cs_53B60:       hideEntity $82
		csc_end
cs_53B66:       playSound $FD
		textCursor $895
		setActscript $82,$FF,eas_46172
		setActscript $80,$FF,eas_46172
		customActscript $82,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setCamDest 17,48
		playSound MUSIC_ENEMY_ATTACK
		entityActions $80,$0
		 moveUp 2
		endActions
		csWait 10
		entityActions $82,$FF
		 moveUp 2
		endActions
		csWait 40
		entityActions $80,$0
		 moveDown 2
		endActions
		csWait 10
		entityActions $82,$FF
		 moveDown 2
		endActions
		csWait 30
		nextSingleText $80,$82  ; "King Granseal!{N}Calm down!{W1}"
		nextSingleText $0,$80   ; "Guooooorrrr!{W1}"
		entityActions $80,$0
		 moveRight 2
		endActions
		setActscript $82,$FF,eas_Init
		csWait 1
		setActscript $82,$FF,eas_JumpRight
		setActscript $82,$FF,eas_JumpRight
		nextSingleText $80,$82  ; "He's possessed!  He needs{N}an exorcism right now!{W1}"
		setCameraEntity $82
		entityActions $80,$FF
		 moveRight 1
		endActions
		playSound SFX_DESOUL_HOVERING
		setActscript $80,$0,eas_BumpRight
		setActscript $82,$FF,eas_46172
		entityActions $82,$FF
		 moveRight 2
		endActions
		setFacing $82,LEFT
		customActscript $82,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $3           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		csWait 120
cs_53C42:       setCamDest 19,48
		textCursor $898
		setActscript $82,$FF,eas_Init
		setFacing $82,DOWN
		csWait 10
		entityShakeHead $82
		csWait 30
		setFacing $82,UP
		nextText $80,$82        ; "Yeow!  My head!{N}No, I'm OK, {LEADER}.{W2}"
		nextSingleText $80,$82  ; "I must use a powerful spell.{N}It may be dangerous.{N}Stay back!{W1}"
		entityActions $0,$FF
		 moveUp 1
		endActions
		setFacing $0,DOWN
		setActscript $80,$FF,eas_46172
		customActscript $82,$FF
		ac_setSpeed 4112        ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $80,$FF
		ac_setSpeed 4112        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $82,LEFT
		csWait 50
		entityShiver $82
		csWait 30
		entityShiver $82
		csWait 20
		playSound SFX_SPELL_CAST
		entityFlashWhite $82,$78
		entityActions $82,$0
		 moveLeft 2
		endActions
		entityActions $80,$0
		 actionC 20
		 moveLeft 2
		endActions
		entityFlashWhite $82,$78
		playSound SFX_SPELL_CAST
		setPos $88,24,53,LEFT
		nextSingleText $80,$82  ; "Evil spirit inside the King,{N}begone, HAAA!{W1}"
		customActscript $88,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $88,$FF
		 moveLeft 2
		endActions
		hideEntity $88
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
		setQuake 2
		csWait 60
		setQuake 0
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $80,$FF
		 moveLeft 1
		endActions
		customActscript $80,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $3           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		csWait 50
		entityShiver $82
		csWait 20
		entityActions $82,$FF
		 moveLeft 2
		endActions
		nextSingleText $80,$82  ; "King...Granseal?{W1}"
		entityShiver $80
		stopEntity $80
		setPos $87,21,52,DOWN
		animEntityFadeInOut $87,$5
		nextSingleText $80,$82  ; "Did it work?{W1}"
		entityShiver $87
		setActscript $87,$FF,eas_46172
		customActscript $87,$FF
		ac_setSpeed 0           ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $87,$FF
		 moveUp 5
		endActions
		hideEntity $87
		csWait 60
		nextSingleText $0,$80   ; "Ooh....{W1}"
		startEntity $80
		setActscript $80,$FF,eas_Init
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 100
		setFacing $80,RIGHT
		csWait 40
		entityActions $80,$FF
		 moveRight 1
		endActions
		nextSingleText $0,$80   ; "Astral, wha...what{N}happened?{W1}"
		entityShiver $82
		nextText $80,$82        ; "Are you alright?{W2}"
		nextSingleText $80,$82  ; "Let me use your soldiers.{N}We must kill it before it{N}finds another victim.{W1}"
		nextSingleText $0,$80   ; "What are you talking about?{N}I don't understand.{W1}"
		csWait 50
		customActscript $82,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		nextSingleText $80,$82  ; "(Sigh){W1}"
		nextSingleText $0,$80   ; "Astral!{W1}"
		playSound $FD
		csWait 30
		fadeOutB
		resetMap
		fadeInB
		reloadMap 0,0
		csWait 1
		nextSingleText $FF,$FF  ; "Astral is exhausted.{N}He won't wake up!{W2}{N}The Minister summons the{N}soldiers to the hall to kill{N}the evil spirit.{W1}"
		setF $261               ; set after the scene where Astral exorcises the Gizmo
		mapSysEvent $13,$1D,$8,$1
		playSound MUSIC_CASTLE
		csc_end
