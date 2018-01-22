
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
		setPos $80,27,50,2
		csc_end
loc_633BA:
		trap    #0
		dc.w 8
		jsr     (FadeInFromBlack).w
		rts

	; End of function ms_map20_flag21F_InitFunction

cs_EndKiss:     hideText
		setCameraEntity $FFFF
		setFacing $0,0
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait 30
		playSound MUSIC_ENDING
		moveEntity $0,$0,$4,$1
		endMove $8080
		csWait 10
		setActscript $0,$FF,eas_461AA
		csWait 80
		moveEntity $0,$0,$0,$1
		endMove $8080
		csWait 10
		setActscript $0,$FF,eas_461AA
		stopEntity $0
		csWait 50
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$0,$1
		endMove $8080
		csWait 16
		setActscript $0,$FF,eas_461AA
		csWait 120
		executeSubroutine j_EndKiss
		csc_end
