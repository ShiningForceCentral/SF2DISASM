
; ASM FILE data\maps\entries\map25\mapsetups\s6.asm :
; 0x5D39C..0x5D40E : 

; =============== S U B R O U T I N E =======================================

ms_map25_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $320
		beq.s   return_5D3A8
		lea     cs_5D3AA(pc), a0
		trap    #6
return_5D3A8:
		rts

	; End of function ms_map25_InitFunction

cs_5D3AA:       setPos $85,25,18,0
		setPos $87,25,17,0
		csc_end
cs_5D3B8:       customActscript $85,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setEntityDest $0,12,2
		setFacing $0,3
		moveEntity $85,$FF,$0,$5
		endMove $8080
		moveEntity $85,$FF,$3,$1
		endMove $8080
		moveEntity $85,$FF,$0,$2
		endMove $8080
		moveEntity $85,$FF,$1,$1
		endMove $8080
		moveEntity $85,$FF,$0,$2
		endMove $8080
		entityShakeHead $0
		setPos $85,25,18,0
		setPos $87,25,17,0
		csc_end
