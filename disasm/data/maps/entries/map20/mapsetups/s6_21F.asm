
; ASM FILE data\maps\entries\map20\mapsetups\s6_21F.asm :
; 0x633A2..0x6343C : 

; =============== S U B R O U T I N E =======================================

ms_map20_flag21F_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $3D6
		beq.s   loc_633BA
		lea     cs_633B2(pc), a0
		trap    #6
		bra.w   loc_633BA
cs_633B2:
		entityPosDir $80,$1B,$32,$2; 0019 SET ENTITY POS AND FACING 80 1B 32 2
		csc_end                 ; END OF CUTSCENE SCRIPT
loc_633BA:
		trap    #0
		dc.w 8
		jsr     (FadeInFromBlack).w
		rts

	; End of function ms_map20_flag21F_InitFunction

cs_EndKiss:     hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $1E              ; WAIT 1E
		playSound MUSIC_ENDING  ; 0005 PLAY SOUND MUSIC_ENDING
		moveEntity $0,$0,$4,$1  ; 002D MOVE ENTITY 0 0 4 1
		endMove $8080
		csWait $A               ; WAIT A
		setActscript $0,$FF,eas_461AA; 0015 SET ACTSCRIPT 0 FF 461AA
		csWait $50              ; WAIT 50
		moveEntity $0,$0,$0,$1  ; 002D MOVE ENTITY 0 0 0 1
		endMove $8080
		csWait $A               ; WAIT A
		setActscript $0,$FF,eas_461AA; 0015 SET ACTSCRIPT 0 FF 461AA
		stopEntity $0           ; 001C STOP ENTITY ANIM 0
		csWait $32              ; WAIT 32
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$0,$1  ; 002D MOVE ENTITY 0 0 0 1
		endMove $8080
		csWait $10              ; WAIT 10
		setActscript $0,$FF,eas_461AA; 0015 SET ACTSCRIPT 0 FF 461AA
		csWait $78              ; WAIT 78
		executeSubroutine j_EndKiss; 000A EXECUTE SUBROUTINE 100B4
		csc_end                 ; END OF CUTSCENE SCRIPT
