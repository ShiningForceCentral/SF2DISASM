
; ASM FILE data\maps\entries\map03\mapsetups\s6_21F.asm :
; 0x628C6..0x6299A : 

; =============== S U B R O U T I N E =======================================

ms_map3_flag21F_InitFunction:
		
		rts

	; End of function ms_map3_flag21F_InitFunction

cs_628C8:       textCursor $F4B         ; Initial text line $F4B : "I envy you.{N}I'm an old woman now.{W2}"
		nextText $0,$87         ; "I envy you.{N}I'm an old woman now.{W2}"
		nextSingleText $0,$87   ; "Nobody kisses me anymore.{W1}"
		setEntityDest $0,$19,$1C; 0029 SET ENTITY DEST 0 19 1C
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDest $88,$19,$1B; 0029 SET ENTITY DEST 88 19 1B
		setEntityDir $88,$0     ; 0023 SET ENTITY FACING 88 0
		setEntityDir $87,$2     ; 0023 SET ENTITY FACING 87 2
		nextText $0,$88         ; "You're wrong!{W2}"
		nextSingleText $0,$88   ; "I'll kiss you!{W1}"
		csWait $A               ; WAIT A
		setActscript $87,$FF,eas_Jump; 0015 SET ACTSCRIPT 87 FF 45E44
		setActscript $87,$FF,eas_Jump; 0015 SET ACTSCRIPT 87 FF 45E44
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_6290C:       hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		moveEntity $8A,$FF,$3,$1; 002D MOVE ENTITY 8A FF 3 1
		endMove $8080
		setEntityDest $0,$2A,$A ; 0029 SET ENTITY DEST 0 2A A
		setEntityDest $4,$2A,$A ; 0029 SET ENTITY DEST 4 2A A
		setEntityDest $1,$2A,$A ; 0029 SET ENTITY DEST 1 2A A
		setEntityDest $3,$2A,$A ; 0029 SET ENTITY DEST 3 2A A
		setEntityDest $2,$2A,$A ; 0029 SET ENTITY DEST 2 2A A
		followEntity $0,$8A,$2  ; 002C FOLLOW ENTITY 0 8A 2
		followEntity $4,$8A,$5  ; 002C FOLLOW ENTITY 4 8A 5
		followEntity $1,$8A,$6  ; 002C FOLLOW ENTITY 1 8A 6
		followEntity $3,$4,$2   ; 002C FOLLOW ENTITY 3 4 2
		followEntity $2,$1,$2   ; 002C FOLLOW ENTITY 2 1 2
		moveEntity $8A,$FF,$3,$1; 002D MOVE ENTITY 8A FF 3 1
		moreMove $2,$1
		moreMove $3,$1
		moreMove $3,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $8A,$FF,$3,$3; 002D MOVE ENTITY 8A FF 3 3
		moreMove $2,$6
		moreMove $C,$A
		endMove $8080
		moveEntity $8A,$FF,$1,$8; 002D MOVE ENTITY 8A FF 1 8
		moreMove $2,$6
		moreMove $1,$2
		moreMove $C,$A
		moreMove $1,$6
		endMove $8080
		mapSysEvent $131A1E01   ; 0007 EXECUTE MAP SYSTEM EVENT 131A1E01
		csc_end                 ; END OF CUTSCENE SCRIPT
