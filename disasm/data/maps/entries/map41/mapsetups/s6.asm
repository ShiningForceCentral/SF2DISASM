
; ASM FILE data\maps\entries\map41\mapsetups\s6.asm :
; 0x5F4A0..0x5F630 : 

; =============== S U B R O U T I N E =======================================

ms_map41_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $3A2
		beq.s   return_5F4AC
		lea     cs_5F4AE(pc), a0
		trap    #6
return_5F4AC:
		rts

	; End of function ms_map41_InitFunction

cs_5F4AE:       setBlocks $D00,$305,$504; 0034 SET BLOCKS D00 305 504
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5F4B8:       setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		csWait $28              ; WAIT 28
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $3       ; 0033 SET QUAKE AMOUNT 3
		csWait $28              ; WAIT 28
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		csWait $5               ; WAIT 5
		setActscript $0,$0,eas_461B6; 0015 SET ACTSCRIPT 0 0 461B6
		csWait $5               ; WAIT 5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $5               ; WAIT 5
		setActscript $1F,$0,eas_461B6; 0015 SET ACTSCRIPT 1F 0 461B6
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		csWait $28              ; WAIT 28
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		csWait $28              ; WAIT 28
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		csWait $28              ; WAIT 28
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setBlocks $D06,$305,$504; 0034 SET BLOCKS D06 305 504
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		csWait $3C              ; WAIT 3C
		setBlocks $D00,$305,$504; 0034 SET BLOCKS D00 305 504
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $4003    ; 0033 SET QUAKE AMOUNT 4003
		csWait $28              ; WAIT 28
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $1F,$FF,eas_Jump; 0015 SET ACTSCRIPT 1F FF 45E44
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $1F,$FF,eas_Jump; 0015 SET ACTSCRIPT 1F FF 45E44
		csWait $32              ; WAIT 32
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5F594:       csc2B $1C,$6,$F,$1,$FF  ; 002B  1C 6 F 1 FF
		textCursor $DB9         ; Initial text line $DB9 : "Sir Astral!  {LEADER}!{W1}"
		nextSingleText $0,$1C   ; "Sir Astral!  {LEADER}!{W1}"
		setEntityDest $1F,$6,$A ; 0029 SET ENTITY DEST 1F 6 A
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		setCamDest $1,$6        ; 0032 SET CAMERA DEST 1 6
		nextSingleText $0,$1C   ; "{LEADER}, wait!{W1}"
		moveEntity $1C,$FF,$1,$4; 002D MOVE ENTITY 1C FF 1 4
		endMove $8080
		nextSingleText $0,$1C   ; "May I join your force?{W1}"
		csWait $1E              ; WAIT 1E
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		csWait $1E              ; WAIT 1E
		nextSingleText $80,$1F  ; "Well...{W1}"
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		nextText $0,$1C         ; "You can trust me.{N}I'm a born fighter.{W2}"
		nextText $0,$1C         ; "As you know, I want to die.{W2}"
		nextSingleText $0,$1C   ; "I will die fighting for your{N}cause, if you let me.{W1}"
		csWait $28              ; WAIT 28
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		nextSingleText $80,$1F  ; "He's a hero in Galam.{N}I think he should join us.{W1}"
		entityNod $7            ; 0026 MAKE ENTITY NOD 7
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		csWait $14              ; WAIT 14
		entityNod $1F           ; 0026 MAKE ENTITY NOD 1F
		nextSingleText $0,$1F   ; "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
		join $1C                ; 0008 JOIN FORCE 1C
		setActscript $1C,$FF,eas_Jump; 0015 SET ACTSCRIPT 1C FF 45E44
		setActscript $1C,$FF,eas_Jump; 0015 SET ACTSCRIPT 1C FF 45E44
		nextSingleText $0,$1C   ; "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		followEntity $1C,$1F,$2 ; 002C FOLLOW ENTITY 1C 1F 2
		csc_end                 ; END OF CUTSCENE SCRIPT
