
; ASM FILE data\scripting\map\cs_end.asm :
; 0x49058..0x494BC : End cutscene
EndCutscene:    mapLoad $14,$13,$21
		loadMapEntities ce_492CC; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		entitySprite $B,$AA
		fadeInB
		csWait $3C
		entityPosDir $0,$19,$23,$0
		moveEntity $0,$FF,$7,$1
		moreMove $0,$1
		endMove $8080
		csWait $1E
		moveEntity $0,$FF,$3,$4
		endMove $8080
		setEntityDir $0,$2
		moveEntity $80,$FF,$0,$1
		endMove $8080
		moveEntity $81,$FF,$0,$1
		endMove $8080
		csWait $3C
		entityNod $80
		entityNod $81
		entityNod $0
		csWait $28
		moveEntity $0,$FF,$1,$4
		endMove $8080
		setEntityDir $0,$2
		csWait $50
		entityPosDir $83,$19,$23,$0
		moveEntity $83,$FF,$7,$1
		endMove $8080
		csWait $28
		entityNod $0
		csWait $3C
		moveEntity $0,$0,$3,$4
		endMove $8080
		moveEntity $83,$FF,$0,$1
		moreMove $3,$3
		endMove $8080
		setEntityDir $0,$2
		setEntityDir $83,$2
		setActscript $80,$0,eas_Jump
		setActscript $81,$0,eas_Jump
		setActscript $82,$FF,eas_Jump
		csWait $28
		setEntityDir $82,$3
		csWait $1E
		setEntityDir $81,$1
		entityNod $82
		csWait $3C
		setEntityDir $80,$1
		csWait $1E
		setEntityDir $81,$3
		entityNod $80
		csWait $28
		setEntityDir $81,$0
		csWait $14
		setEntityDir $80,$0
		csWait $28
		setEntityDir $0,$1
		csWait $14
		setEntityDir $83,$3
		csWait $3C
		setEntityDir $0,$2
		csWait $A
		setEntityDir $83,$2
		csWait $1E
		moveEntity $0,$0,$2,$4
		endMove $8080
		moveEntity $83,$FF,$2,$4
		endMove $8080
		entityNod $81
		entityNod $83
		csWait $3C
		setEntityDir $82,$1
		csWait $1E
		setActscript $82,$FF,eas_Jump
		csWait $1E
		moveEntity $82,$FF,$1,$1
		endMove $8080
		setEntityDir $82,$3
		entityPosDir $B,$17,$25,$3
		moveEntity $B,$0,$3,$1
		moreMove $2,$2
		moreMove $3,$2
		endMove $8080
		csWait $14
		entityPosDir $2,$17,$25,$3
		moveEntity $2,$0,$3,$1
		moreMove $2,$2
		moreMove $3,$1
		endMove $8080
		csWait $14
		entityPosDir $A,$17,$25,$3
		moveEntity $A,$0,$3,$1
		moreMove $2,$2
		endMove $8080
		csWait $14
		entityPosDir $3,$17,$25,$3
		moveEntity $3,$0,$3,$1
		moreMove $2,$1
		endMove $8080
		csWait $14
		entityPosDir $7,$17,$25,$3
		moveEntity $7,$0,$3,$1
		endMove $8080
		setEntityDir $B,$0
		csWait $A
		setEntityDir $2,$0
		csWait $A
		setEntityDir $A,$3
		csWait $A
		setEntityDir $3,$3
		setEntityDir $0,$1
		setEntityDir $83,$1
		csWait $1E
		setEntityDir $0,$2
		setEntityDir $83,$2
		csWait $1E
		setEntityDir $0,$1
		setEntityDir $83,$1
		csWait $28
		setActscript $B,$0,eas_Jump
		setActscript $2,$0,eas_Jump
		setActscript $A,$0,eas_Jump
		setActscript $3,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setEntityDir $83,$2
		entityNod $80
		setEntityDir $0,$2
		csWait $32
		entityNod $0
		setActscript $B,$0,eas_Jump
		setActscript $2,$0,eas_Jump
		setActscript $A,$0,eas_Jump
		setActscript $3,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		fadeOutB
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_492CC:       dc.w $3F
		dc.w $3F
		dc.w 3
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $B
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 3
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $15
		dc.b $28
		dc.b 0
		dc.b $D1
		dc.l eas_Init           
		dc.b $15
		dc.b $27
		dc.b 0
		dc.b $CB
		dc.l eas_Init           
		dc.b $16
		dc.b $26
		dc.b 0
		dc.b $CD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $CC
		dc.l eas_Init           
		dc.w $FFFF
dms_01:         csc52 $86,$0            ; 0052 UNKNOWN, RELATED TO TWO ENTITIES
		csc56 $5                ; 0056 UNKNOWN, SOMETHING WITH AN ENTITY
		csc56 $3                ; 0056 UNKNOWN, SOMETHING WITH AN ENTITY
		csc56 $1A               ; 0056 UNKNOWN, SOMETHING WITH AN ENTITY
		followEntity $7,$0,$2
		moveEntityAboveAnother $0,$0
		csc_end                 ; END OF CUTSCENE SCRIPT
		setCameraEntity $0
		setActscript $0,$0,eas_ControlledCharacter
cs_4934A:       entityFlashWhite $0,$B4
		jump cs_4934A
		csc_end                 ; END OF CUTSCENE SCRIPT
		textCursor $142         ; Initial text line $142 : "{NAME} did nothing."
		setActscript $1,$1,eas_ControlledCharacter
		showPortrait $0
		setQuakeAmount $8002
		setQuakeAmount $4002
		loadMapFadeIn $0,$D,$D
		flashScreenWhite $3C
		csc_end                 ; END OF CUTSCENE SCRIPT
		dc.b   0
		dc.b $41 
		dc.w $3C
		dc.w $FFFF
		stopEntity $4
		setActscript $1,$1,eas_493A2
		waitIdle $1
		showPortrait $0
		csWait $3C
		startEntity $4
		hidePortrait
		csc_end                 ; END OF CUTSCENE SCRIPT
eas_493A2:      dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
		dc.w $FFFF
		dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
		dc.w $FFFF
		dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
		dc.w $FFFF
		dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $11                ; 0011  $0
		dc.w 0
		dc.w $12                ; 0012  $FEFF
		dc.w $FEFF
		dc.w $13                ; 0013  $FEFF
		dc.w $FEFF
		dc.w $40                ; 0040 
		dc.w 2                  ; 0002 BIG ONE RELATED TO CAMERA
		dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
		dc.w $40                ; 0040 
		dc.w 0                  ; 0000 WAIT value $1
		dc.w 1
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
