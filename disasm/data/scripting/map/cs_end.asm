
; ASM FILE data\scripting\map\cs_end.asm :
; 0x49058..0x494BC : End cutscene
EndCutscene:    mapLoad 20,19,33
		loadMapEntities ce_492CC
		setActscriptWait $0,eas_Init
		customActscriptWait $0
		 ac_setSpeed 20,20      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $80
		 ac_setSpeed 20,20      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $81
		 ac_setSpeed 20,20      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $82
		 ac_setSpeed 20,20      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $83
		 ac_setSpeed 20,20      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entitySprite $B,$AA
		fadeInB
		csWait 60
		setPos $0,25,35,RIGHT
		entityActionsWait $0
		 moveDownRight 1
		 moveRight 1
		endActions
		csWait 30
		entityActionsWait $0
		 moveDown 4
		endActions
		setFacing $0,LEFT
		entityActionsWait $80
		 moveRight 1
		endActions
		entityActionsWait $81
		 moveRight 1
		endActions
		csWait 60
		entityNod $80
		entityNod $81
		entityNod $0
		csWait 40
		entityActionsWait $0
		 moveUp 4
		endActions
		setFacing $0,LEFT
		csWait 80
		setPos $83,25,35,RIGHT
		entityActionsWait $83
		 moveDownRight 1
		endActions
		csWait 40
		entityNod $0
		csWait 60
		entityActions $0
		 moveDown 4
		endActions
		entityActionsWait $83
		 moveRight 1
		 moveDown 3
		endActions
		setFacing $0,LEFT
		setFacing $83,LEFT
		setActscript $80,eas_Jump
		setActscript $81,eas_Jump
		setActscriptWait $82,eas_Jump
		csWait 40
		setFacing $82,DOWN
		csWait 30
		setFacing $81,UP
		entityNod $82
		csWait 60
		setFacing $80,UP
		csWait 30
		setFacing $81,DOWN
		entityNod $80
		csWait 40
		setFacing $81,RIGHT
		csWait 20
		setFacing $80,RIGHT
		csWait 40
		setFacing $0,UP
		csWait 20
		setFacing $83,DOWN
		csWait 60
		setFacing $0,LEFT
		csWait 10
		setFacing $83,LEFT
		csWait 30
		entityActions $0
		 moveLeft 4
		endActions
		entityActionsWait $83
		 moveLeft 4
		endActions
		entityNod $81
		entityNod $83
		csWait 60
		setFacing $82,UP
		csWait 30
		setActscriptWait $82,eas_Jump
		csWait 30
		entityActionsWait $82
		 moveUp 1
		endActions
		setFacing $82,DOWN
		setPos $B,23,37,DOWN
		entityActions $B
		 moveDown 1
		 moveLeft 2
		 moveDown 2
		endActions
		csWait 20
		setPos $2,23,37,DOWN
		entityActions $2
		 moveDown 1
		 moveLeft 2
		 moveDown 1
		endActions
		csWait 20
		setPos $A,23,37,DOWN
		entityActions $A
		 moveDown 1
		 moveLeft 2
		endActions
		csWait 20
		setPos $3,23,37,DOWN
		entityActions $3
		 moveDown 1
		 moveLeft 1
		endActions
		csWait 20
		setPos $7,23,37,DOWN
		entityActions $7
		 moveDown 1
		endActions
		setFacing $B,RIGHT
		csWait 10
		setFacing $2,RIGHT
		csWait 10
		setFacing $A,DOWN
		csWait 10
		setFacing $3,DOWN
		setFacing $0,UP
		setFacing $83,UP
		csWait 30
		setFacing $0,LEFT
		setFacing $83,LEFT
		csWait 30
		setFacing $0,UP
		setFacing $83,UP
		csWait 40
		setActscript $B,eas_Jump
		setActscript $2,eas_Jump
		setActscript $A,eas_Jump
		setActscript $3,eas_Jump
		setActscript $7,eas_Jump
		setFacing $83,LEFT
		entityNod $80
		setFacing $0,LEFT
		csWait 50
		entityNod $0
		setActscript $B,eas_Jump
		setActscript $2,eas_Jump
		setActscript $A,eas_Jump
		setActscript $3,eas_Jump
		setActscript $7,eas_Jump
		fadeOutB
		csc_end
ce_492CC:       mainEntity 63,63,DOWN
		entity 63,63,DOWN,11,eas_Init
		entity 63,63,DOWN,2,eas_Init
		entity 63,63,DOWN,10,eas_Init
		entity 63,63,DOWN,3,eas_Init
		entity 63,63,DOWN,7,eas_Init
		entity 21,40,RIGHT,209,eas_Init
		entity 21,39,RIGHT,203,eas_Init
		entity 22,38,RIGHT,205,eas_Init
		entity 63,63,DOWN,204,eas_Init
		dc.w $FFFF
dms_01:         faceEntity $86,$0
		addNewFollower $5
		addNewFollower $3
		addNewFollower $1A
		followEntity $7,$0,$2
		moveEntityAboveAnother $0,$0
		csc_end
		setCameraEntity $0
		setActscript $0,eas_ControlledCharacter
cs_4934A:       entityFlashWhite $0,$B4
		jump cs_4934A
		csc_end
		textCursor $142
		csc15 $1,$1,eas_ControlledCharacter
		showPortrait $0
		setQuake 32770
		setQuake 16386
		loadMapFadeIn 0,13,13
		flashScreenWhite $3C
		csc_end
		dc.b   0
		dc.b $41 
		dc.w $3C
		dc.w $FFFF
		stopEntity $4
		csc15 $1,$1,eas_493A2
		waitIdle $1
		showPortrait $0
		csWait 60
		startEntity $4
		hidePortrait
		csc_end
eas_493A2:       ac_set1Cb7 $FFFF
		 ac_set1Cb6 $FFFF
		 ac_set1Cb5 $FFFF
		 ac_setSpeed 32,32
		 ac_11 $0
		 ac_12 $FEFF
		 ac_13 $FEFF
		 ac_40
		 ac_02
		 ac_waitDest
		 ac_40
		 ac_wait 1
word_493CA:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $BA74
		dc.w (eas_ControlledCharacter-word_493CA) & $FFFF
		dc.w 4                  ; 0004 SET TEXT INDEX 142
		dc.w $142
		dc.w $1E                ; 001E HIDE PORTRAIT
		dc.w $A                 ; 000A EXECUTE SUBROUTINE 493EC
		dc.l sub_493EC
		dc.w 1                  ; 0001 DISPLAY SINGLE TEXT BOX WITH VARS 0 4
		dc.w 0
		dc.w 4
		dc.w $14                ; 0014 SET ACTSCRIPT MANUAL 0
		dc.b 0
		dc.b 0
		dc.w 0                  ; 0000 WAIT value $1D
		dc.w $1D
		dc.w 0                  ; 0000 WAIT value $FFFF
		dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_493EC:
		move.w  #$18A,d0        ; 018A={NAME} found{N}the {ITEM}.{D1}
		jsr     (DisplayText).l 
		moveq   #$78,d0 
		rts

	; End of function sub_493EC

		dc.w $20
		dc.w $1F
		dc.w 7
		dc.w $1F
		dc.w 1
		dc.w $1F
		dc.w 2
		dc.w $1F
		dc.w 6
		dc.w $21
		dc.w $80
		dc.w $21
		dc.w $96
		dc.w $1F
		dc.w 3
		dc.w $1D
		dc.w 0
		dc.w $FFFF
		dc.w $24
		dc.w $FFFF
		dc.w $18
		dc.w 0
		dc.w $28
		dc.w $2E
		dc.w 0
		dc.w $19
		dc.w $60D
		dc.w $1703
		dc.w $18
		dc.w 6
		dc.w $28
		dc.w $22
		dc.w 6
		dc.w 7
		dc.w 5
		dc.w 4
		dc.w $FFFF
		dc.w 4
		dc.w $18A
		dc.w $1D
		dc.w 0
		dc.w 3
		dc.w 0
		dc.w 3
		dc.w $A
		dc.w 1
		dc.w 0
		dc.w 4
		dc.w $14
		dc.w $1D
		dc.w 0
		dc.w $8078
		dc.w $1E
		dc.w 4
		dc.w $142
		dc.w 2
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $FFFF
		dc.w $14
		dc.w $501
		dc.w $15
		dc.w 0
		dc.w $11
		dc.w 1
		dc.w $10
		dc.b 0
		dc.b $20
		dc.w $12
		dc.w 0
		dc.w $13
		dc.w $FFFF
		dc.w 4
		dc.w 0
		dc.w $FFFF
		dc.w 0
		dc.w 5
		dc.w 4
		dc.w 0
		dc.w 1
		dc.w 0
		dc.w 5
		dc.w 4
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 5
		dc.w $15
		dc.w $FFFF
		dc.w $30
		dc.w $BD50
		dc.b $80
		dc.b $80
		dc.b 0
		dc.b $1D
		dc.b 0
		dc.b 0
		dc.b $80
		dc.b $3C
		dc.b 0
		dc.b $1E
		dc.b $FF
		dc.b $FF
