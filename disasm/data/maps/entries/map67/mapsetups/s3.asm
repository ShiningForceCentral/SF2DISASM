
; ASM FILE data\maps\entries\map67\mapsetups\s3.asm :
; 0x4FB0C..0x4FCCE : 
ms_map67_ZoneEvents:
		dc.b $39
		dc.b $19
		dc.w sub_4FB32-ms_map67_ZoneEvents
		dc.b $38
		dc.b $1A
		dc.w sub_4FB24-ms_map67_ZoneEvents
		dc.b $39
		dc.b $1A
		dc.w sub_4FB24-ms_map67_ZoneEvents
		dc.b $3A
		dc.b $18
		dc.w sub_4FB24-ms_map67_ZoneEvents
		dc.b $3A
		dc.b $19
		dc.w sub_4FB24-ms_map67_ZoneEvents
		dc.w $FD00
		dc.w sub_4FB58-ms_map67_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_4FB24:
		trap    #CHECK_FLAG
		dc.w $208               ; Battle 20 completed
		bne.s   return_4FB30
		lea     cs_4FB64(pc), a0
		trap    #MAPSCRIPT
return_4FB30:
		rts

	; End of function sub_4FB24


; =============== S U B R O U T I N E =======================================

sub_4FB32:
		trap    #CHECK_FLAG
		dc.w $2EF               ; set after Elric opens the passage to Devil's Tail
		bne.s   return_4FB56
		trap    #CHECK_FLAG
		dc.w $D                 ; Elric joined
		beq.s   return_4FB56
		move.w  #$D,d0
		jsr     j_GetCurrentHP
		tst.w   d1
		beq.s   return_4FB56
		lea     cs_4FC32(pc), a0
		trap    #MAPSCRIPT
		trap    #SET_FLAG
		dc.w $2EF               ; set after Elric opens the passage to Devil's Tail
return_4FB56:
		rts

	; End of function sub_4FB32


; =============== S U B R O U T I N E =======================================

sub_4FB58:
		move.w  #$15,d0
		jsr     sub_47856
		rts

	; End of function sub_4FB58

cs_4FB64:       textCursor $9EF         ; Initial text line $9EF : "Wait!{W1}"
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		setActscript $1E,$FF,eas_Init; 0015 SET ACTSCRIPT 1E FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Jump; 0015 SET ACTSCRIPT 1F FF 45E44
		nextSingleText $0,$1F   ; "Wait!{W1}"
		setEntityDest $1F,$3C,$1B; 0029 SET ENTITY DEST 1F 3C 1B
		csWait $5               ; WAIT 5
		setActscript $1F,$0,eas_461B6; 0015 SET ACTSCRIPT 1F 0 461B6
		csWait $78              ; WAIT 78
		setCamDest $35,$18      ; 0032 SET CAMERA DEST 35 18
		setEntityDest $7,$3B,$1B; 0029 SET ENTITY DEST 7 3B 1B
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		nextSingleText $C0,$7   ; "What's wrong, Oddler?{W1}"
		setEntityDest $0,$3C,$1A; 0029 SET ENTITY DEST 0 3C 1A
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		nextSingleText $0,$1F   ; "{LEADER}...{NAME;7}...can{N}you hear that?{W1}"
		nextSingleText $C0,$7   ; "Hear what?{W1}"
		csWait $5               ; WAIT 5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $78              ; WAIT 78
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		nextSingleText $C0,$7   ; "I don't hear anything.{W1}"
		moveEntity $1F,$FF,$3,$1; 002D MOVE ENTITY 1F FF 3 1
		endMove $8080
		csWait $5               ; WAIT 5
		setActscript $1F,$0,eas_461B6; 0015 SET ACTSCRIPT 1F 0 461B6
		csWait $78              ; WAIT 78
		nextText $0,$1F         ; "Somebody is crying for help...{W2}"
		nextSingleText $0,$1F   ; "from...over here.{W1}"
		setEntityDest $1F,$39,$19; 0029 SET ENTITY DEST 1F 39 19
		entityPosDir $1F,$3F,$3F,$3; 0019 SET ENTITY POS AND FACING 1F 3F 3F 3
		csWait $28              ; WAIT 28
		setEntityDest $7,$39,$19; 0029 SET ENTITY DEST 7 39 19
		entityPosDir $7,$3F,$3F,$3; 0019 SET ENTITY POS AND FACING 7 3F 3F 3
		setEntityDest $0,$39,$19; 0029 SET ENTITY DEST 0 39 19
		entityPosDir $0,$3F,$3F,$3; 0019 SET ENTITY POS AND FACING 0 3F 3F 3
		mapSysEvent $330B1601   ; 0007 EXECUTE MAP SYSTEM EVENT 330B1601
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_4FC32:       textCursor $A21         ; Initial text line $A21 : "Fairy said, move this rock{N}in this manner, and...{W1}"
		csc2B $D,$39,$19,$1,$FF ; 002B  D 39 19 1 FF
		setActscript $D,$FF,eas_Init; 0015 SET ACTSCRIPT D FF 460CE
		moveEntity $D,$FF,$1,$1 ; 002D MOVE ENTITY D FF 1 1
		endMove $8080
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		nextSingleText $0,$D    ; "Fairy said, move this rock{N}in this manner, and...{W1}"
		csWait $1E              ; WAIT 1E
		playSound SFX_SECRET_PATH_ROCK; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
		csWait $1E              ; WAIT 1E
		setEntityDir $D,$3      ; 0023 SET ENTITY FACING D 3
		setActscript $D,$FF,eas_Jump; 0015 SET ACTSCRIPT D FF 45E44
		setActscript $D,$FF,eas_Jump; 0015 SET ACTSCRIPT D FF 45E44
		nextSingleText $0,$D    ; "Got it!  Thanks, fairy!{W1}"
		setQuakeAmount $1       ; 0033 SET QUAKE AMOUNT 1
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		csWait $14              ; WAIT 14
		setEntityDir $D,$1      ; 0023 SET ENTITY FACING D 1
		csWait $14              ; WAIT 14
		playSound SFX_DESOUL_HOVERING; 0005 PLAY SOUND SFX_DESOUL_HOVERING
		setBlocks $0,$302,$3816 ; 0034 SET BLOCKS 0 302 3816
		csWait $1E              ; WAIT 1E
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		csWait $1E              ; WAIT 1E
		setEntityDir $D,$3      ; 0023 SET ENTITY FACING D 3
		nextSingleText $0,$D    ; "{LEADER}, come on.{W1}"
		moveEntity $D,$FF,$1,$1 ; 002D MOVE ENTITY D FF 1 1
		endMove $8080
		hideEntity $D           ; 002E HIDE ENTITY D
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		moveEntity $0,$0,$1,$1  ; 002D MOVE ENTITY 0 0 1 1
		endMove $8080
		mapSysEvent $201D0302   ; 0007 EXECUTE MAP SYSTEM EVENT 201D0302
		csc_end                 ; END OF CUTSCENE SCRIPT
