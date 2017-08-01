
; ASM FILE data\maps\entries\map52\mapsetups\s6.asm :
; 0x5C4D6..0x5C638 : 

; =============== S U B R O U T I N E =======================================

ms_map52_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2CA
		beq.s   return_5C4EC

	; End of function ms_map52_InitFunction


; =============== S U B R O U T I N E =======================================

sub_5C4DC:
		trap    #CHECK_FLAG
		dc.w $2C8
		bne.s   return_5C4EC
		lea     byte_5C622(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2C8               ; set after Peter delivers his lines after the cliffs before Bedoe battle
return_5C4EC:
		rts

	; End of function sub_5C4DC

byte_5C4EE:     textCursor $575         ; Initial text line $575 : "Who are they?{W1}"
		csc45 $30               ; (null)
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setEntityDest $0,$5,$17 ; 0029 SET ENTITY DEST 0 5 17
		setEntityDest $7,$4,$16 ; 0029 SET ENTITY DEST 7 4 16
		moveEntity $7,$FF,$0,$1 ; 002D MOVE ENTITY 7 FF 0 1
		endMove $8080
		nextSingleText $0,$7    ; "Who are they?{W1}"
		setCamDest $10,$4       ; 0032 SET CAMERA DEST 10 4
		csWait $5               ; WAIT 5
		setActscript $81,$0,eas_461B6; 0015 SET ACTSCRIPT 81 0 461B6
		csWait $5               ; WAIT 5
		setActscript $82,$0,eas_461B6; 0015 SET ACTSCRIPT 82 0 461B6
		nextSingleText $0,$7    ; "They're looking for something.{W1}"
		csWait $5               ; WAIT 5
		setActscript $81,$0,eas_461B6; 0015 SET ACTSCRIPT 81 0 461B6
		csWait $5               ; WAIT 5
		setActscript $82,$0,eas_461B6; 0015 SET ACTSCRIPT 82 0 461B6
		moveEntity $83,$FF,$1,$6; 002D MOVE ENTITY 83 FF 1 6
		endMove $8080
		csWait $28              ; WAIT 28
		nextSingleText $0,$83   ; "He's not here...not under{N}the cliff....{W1}"
		moveEntity $81,$FF,$1,$2; 002D MOVE ENTITY 81 FF 1 2
		moreMove $0,$1
		endMove $8080
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		nextText $0,$81         ; "There are marks of a battle{N}here and there!{W2}"
		nextSingleText $0,$81   ; "Against the birdmen of{N}Bedoe?{W1}"
		entityNod $80           ; 0026 MAKE ENTITY NOD 80
		nextText $0,$80         ; "Could be...{W2}"
		nextSingleText $0,$80   ; "see those volcanic rocks?{W1}"
		csWait $5               ; WAIT 5
		setActscript $81,$0,eas_461E4; 0015 SET ACTSCRIPT 81 0 461E4
		csWait $3C              ; WAIT 3C
		nextText $0,$80         ; "Nobody but Volcanon can do{N}that!{W2}"
		setEntityDir $81,$0     ; 0023 SET ENTITY FACING 81 0
		nextSingleText $0,$80   ; "He has never before killed{N}birdmen, but...{W1}"
		moveEntity $83,$FF,$3,$1; 002D MOVE ENTITY 83 FF 3 1
		endMove $8080
		csWait $28              ; WAIT 28
		customActscript $83,$FF ; 0014 SET MANUAL ACTSCRIPT 83
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $83,$FF,$3,$2; 002D MOVE ENTITY 83 FF 3 2
		moreMove $2,$1
		endMove $8080
		nextSingleText $0,$83   ; "Who's that?{W1}"
		setEntityDir $83,$3     ; 0023 SET ENTITY FACING 83 3
		setCamDest $0,$11       ; 0032 SET CAMERA DEST 0 11
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		csWait $32              ; WAIT 32
		setCamDest $10,$7       ; 0032 SET CAMERA DEST 10 7
		setActscript $83,$FF,eas_Init; 0015 SET ACTSCRIPT 83 FF 460CE
		setActscript $83,$FF,eas_46172; 0015 SET ACTSCRIPT 83 FF 46172
		moveEntity $83,$FF,$1,$1; 002D MOVE ENTITY 83 FF 1 1
		endMove $8080
		nextSingleText $0,$83   ; "Stupid Polca kids!{W1}"
		moveEntity $80,$FF,$3,$2; 002D MOVE ENTITY 80 FF 3 2
		moreMove $2,$2
		moreMove $3,$1
		endMove $8080
		nextText $0,$80         ; "Polcan people are cowards that{N}live in peace.{W2}"
		setEntityDir $80,$1     ; 0023 SET ENTITY FACING 80 1
		setEntityDir $83,$1     ; 0023 SET ENTITY FACING 83 1
		nextSingleText $0,$80   ; "They shall never return{N}alive!{W1}"
		setStoryFlag $C         ; Battle 12 unlocked
		mapSysEvent $34000000   ; 0007 EXECUTE MAP SYSTEM EVENT 34000000
		csc_end                 ; END OF CUTSCENE SCRIPT
byte_5C622:     entityPosDir $7,$16,$8,$0; 0019 SET ENTITY POS AND FACING 7 16 8 0
		textCursor $9BD         ; Initial text line $9BD : "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
		fadeInB                 ; 0039 FADE IN FROM BLACK
		nextText $0,$7          ; "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
		nextSingleText $0,$7    ; "Why do the devils want you?{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
