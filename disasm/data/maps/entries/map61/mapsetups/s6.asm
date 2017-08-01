
; ASM FILE data\maps\entries\map61\mapsetups\s6.asm :
; 0x5C6C8..0x5C76A : 

; =============== S U B R O U T I N E =======================================

ms_map61_InitFunction:
		
		rts

	; End of function ms_map61_InitFunction

cs_5C6CA:       textCursor $E3A         ; Initial text line $E3A : "It's my job!{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1E,$FF,eas_Init; 0015 SET ACTSCRIPT 1E FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		setEntityDest $0,$4,$9  ; 0029 SET ENTITY DEST 0 4 9
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDest $7,$6,$9  ; 0029 SET ENTITY DEST 7 6 9
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setCamDest $0,$5        ; 0032 SET CAMERA DEST 0 5
		setEntityDest $1E,$5,$7 ; 0029 SET ENTITY DEST 1E 5 7
		setEntityDest $1F,$5,$9 ; 0029 SET ENTITY DEST 1F 5 9
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		setEntityDir $1E,$3     ; 0023 SET ENTITY FACING 1E 3
		nextSingleText $0,$1E   ; "It's my job!{W1}"
		setEntityDir $1E,$1     ; 0023 SET ENTITY FACING 1E 1
		nextSingleText $0,$1E   ; "Row...sham...bow!{W1}"
		entityFlashWhite $1E,$28; 0018 FLASH ENTITY WHITE 1E 28
		playSound SFX_BATTLEFIELD_DEATH; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $2       ; 0033 SET QUAKE AMOUNT 2
		setBlocks $B00,$101,$506; 0034 SET BLOCKS B00 101 506
		csWait $1E              ; WAIT 1E
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		setEntityDir $1E,$3     ; 0023 SET ENTITY FACING 1E 3
		nextSingleText $0,$1E   ; "OK, you go first!{W1}"
		setStoryFlag $F         ; Battle 15 unlocked
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		followEntity $1E,$1F,$2 ; 002C FOLLOW ENTITY 1E 1F 2
		csc_end                 ; END OF CUTSCENE SCRIPT
