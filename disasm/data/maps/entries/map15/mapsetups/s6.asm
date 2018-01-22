
; ASM FILE data\maps\entries\map15\mapsetups\s6.asm :
; 0x5D04C..0x5D1CA : 

; =============== S U B R O U T I N E =======================================

ms_map15_InitFunction:
		
		rts

	; End of function ms_map15_InitFunction

cs_5D04E:       textCursor $7D6
		setFacing $0,RIGHT
		setEntityDest $7,24,17
		setFacing $7,RIGHT
		setPos $14,31,33,UP
		csWait 1
		setCamDest 26,22
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setPos $7,24,17,RIGHT
		setPos $1F,24,16,RIGHT
		setPos $0,24,18,RIGHT
		fly $14,$FFFF
		moveEntity $14,$0,$1,$8
		endMove $8080
		csWait 60
		setCamDest 26,20
		moveEntity $14,$0,$2,$3
		endMove $8080
		setCamDest 20,20
		moveEntity $14,$0,$1,$A
		endMove $8080
		setCamDest 20,10
		moveEntity $14,$0,$0,$4
		endMove $8080
		setCamDest 27,10
		moveEntity $14,$0,$3,$5
		endMove $8080
		setCamDest 27,15
		moveEntity $14,$0,$2,$13
		endMove $8080
		setCamDest 9,15
		moveEntity $14,$0,$1,$A
		endMove $8080
		setCamDest 9,5
		moveEntity $14,$0,$0,$D
		endMove $8080
		setCamDest 20,5
		moveEntity $14,$0,$3,$7
		endMove $8080
		setCamDest 20,12
		csWait 60
		setEntityDest $14,26,18
		setFacing $14,LEFT
		nextSingleText $80,$14  ; "Excuse me, are you{N}{LEADER} of Granseal?{W1}"
		moveEntity $7,$FF,$0,$2
		endMove $8080
		setFacing $7,DOWN
		setFacing $14,UP
		nextSingleText $0,$7    ; "Yes, he's {LEADER},{N}but who are you?{W1}"
		nextSingleText $80,$14  ; "I'm {NAME;20} of Bedoe.{W1}"
		entityShiver $7
		nextSingleText $0,$7    ; "Bedoe?{W1}"
		nextSingleText $80,$14  ; "{LEADER} saved my life{N}there.{W1}"
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		nextText $0,$7          ; "{LEADER} saved...{W2}"
		nextSingleText $0,$7    ; "Oh, yes!  I remember!{W1}"
		nextText $80,$14        ; "You remember me?{W2}"
		nextSingleText $80,$14  ; "Let me thank you.{N}May I go with you?{W1}"
		moveEntity $7,$FF,$2,$1
		moreMove $3,$1
		moreMove $8,$28
		endMove $8080
		moveEntity $7,$FF,$1,$1
		moreMove $0,$1
		moreMove $B,$28
		endMove $8080
		moveEntity $7,$FF,$2,$1
		moreMove $3,$1
		moreMove $8,$28
		endMove $8080
		setFacing $14,LEFT
		nextSingleText $0,$7    ; "You grew up quickly, huh?{W1}"
		nextSingleText $80,$14  ; "Yeah, I learned how to fight.{W1}"
		join $14
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $14,$0,$5
		fly $14,$0
		csc_end
