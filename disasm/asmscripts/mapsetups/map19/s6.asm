
; SCRIPT SECTION mapsetups\map19\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map19_InitFunction:
										
										trap    #1
										dc.w $25D
										bne.s   loc_530F6
										lea     cs_53104(pc), a0
										trap    #6
loc_530F6:
										
										trap    #1
										dc.w $260
										beq.s   return_53102
										lea     cs_53104(pc), a0
										trap    #6
return_53102:
										
										rts

	; End of function ms_map19_InitFunction

cs_53104:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 3F 3F 2
										dc.b $8C
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
