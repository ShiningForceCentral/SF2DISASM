
; ASM FILE data\maps\entries\map51\mapsetups\s6.asm :
; 0x5C3CA..0x5C454 : 

; =============== S U B R O U T I N E =======================================

ms_map51_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $1D6
		bne.s   return_5C3D6
		lea     cs_5C3D8(pc), a0
		trap    #6
return_5C3D6:
		rts

	; End of function ms_map51_InitFunction

cs_5C3D8:       textCursor $9F6         ; Initial text line $9F6 : "It's coming from this{N}direction.{W1}"
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		entityPosDir $0,$B,$16,$1; 0019 SET ENTITY POS AND FACING 0 B 16 1
		entityPosDir $1F,$A,$16,$1; 0019 SET ENTITY POS AND FACING 1F A 16 1
		entityPosDir $7,$9,$16,$1; 0019 SET ENTITY POS AND FACING 7 9 16 1
		fadeInB                 ; 0039 FADE IN FROM BLACK
		moveEntity $1F,$FF,$1,$2; 002D MOVE ENTITY 1F FF 1 2
		endMove $8080
		csWait $5               ; WAIT 5
		setActscript $1F,$0,eas_461B6; 0015 SET ACTSCRIPT 1F 0 461B6
		csWait $78              ; WAIT 78
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		nextSingleText $0,$1F   ; "It's coming from this{N}direction.{W1}"
		moveEntity $7,$FF,$1,$2 ; 002D MOVE ENTITY 7 FF 1 2
		endMove $8080
		nextSingleText $0,$7    ; "Look!  Over there!{W1}"
		setCamDest $2,$2        ; 0032 SET CAMERA DEST 2 2
		csWait $32              ; WAIT 32
		nextSingleText $C0,$D   ; "Help me!{W1}"
		nextText $0,$7          ; "An...elven boy?{N}He's stuck in the pond.{W2}"
		nextSingleText $0,$7    ; "He must be very tired.{N}Let's pull him out.{W1}"
		setCameraEntity $0      ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 ; END OF CUTSCENE SCRIPT
		dc.b $FF
		dc.b $FF
