
; SCRIPT SECTION mapsetups\map25\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map25_InitFunction:
										
										trap    #1
										dc.w $320
										beq.s   return_5D3A8
										lea     cs_5D3AA(pc), a0
										trap    #6
return_5D3A8:
										
										rts

	; End of function ms_map25_InitFunction

cs_5D3AA:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 19 12 0
										dc.b $85
										dc.b $19
										dc.b $12
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 19 11 0
										dc.b $87
										dc.b $19
										dc.b $11
										dc.b 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5D3B8:           dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $29                ; 0029 SET ENTITY DEST 0 C 2
										dc.w 0
										dc.w $C
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 5
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 3 1
										dc.b $85
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 2
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 1 1
										dc.b $85
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 2
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 19 12 0
										dc.b $85
										dc.b $19
										dc.b $12
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 19 11 0
										dc.b $87
										dc.b $19
										dc.b $11
										dc.b 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
