
; SCRIPT SECTION maps\entries\map33\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map33_InitFunction:
										
										trap    #1
										dc.w $20B
										beq.s   loc_5AB98
										trap    #1
										dc.w $30F
										bne.s   loc_5AB98
										lea     cs_5B016(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $30F               ; set after the scene where Creed restores the Force and heads down the basement
										move.b  #9,((RAM_EgressMapIdx-$1000000)).w
loc_5AB98:
										
										trap    #1
										dc.w $16
										beq.s   loc_5ABB2
										lea     cs_5ABA8(pc), a0
										trap    #6
										bra.w   loc_5ABB0
cs_5ABA8:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 E E 1
										dc.b $80
										dc.b $E
										dc.b $E
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_5ABB0:
										
										bra.s   loc_5ABEE
loc_5ABB2:
										
										trap    #1
										dc.w $310
										beq.s   loc_5ABBC
										nop
										bra.s   loc_5ABEE
loc_5ABBC:
										
										trap    #1
										dc.w $30F
										beq.s   loc_5ABD6
										lea     cs_5ABCC(pc), a0
										trap    #6
										bra.w   loc_5ABD4
cs_5ABCC:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 A 3
										dc.b $80
										dc.b $11
										dc.b $A
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_5ABD4:
										
										bra.s   loc_5ABEE
loc_5ABD6:
										
										trap    #1
										dc.w $306
										beq.s   loc_5ABEE
										lea     cs_5ABE6(pc), a0
										trap    #6
										bra.w   loc_5ABEE
cs_5ABE6:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 C 3
										dc.b $80
										dc.b $11
										dc.b $C
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_5ABEE:
										
										trap    #1
										dc.w $310
										beq.s   return_5AC54
										trap    #1
										dc.w $E
										bne.s   loc_5AC0C
										lea     cs_5AC04(pc), a0
										trap    #6
										bra.w   loc_5AC0C
cs_5AC04:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING E F E 3
										dc.b $E
										dc.b $F
										dc.b $E
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_5AC0C:
										
										trap    #1
										dc.w $10
										bne.s   loc_5AC24
										lea     cs_5AC1C(pc), a0
										trap    #6
										bra.w   loc_5AC24
cs_5AC1C:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 10 10 F 3
										dc.b $10
										dc.b $10
										dc.b $F
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_5AC24:
										
										trap    #1
										dc.w $11
										bne.s   loc_5AC3C
										lea     cs_5AC34(pc), a0
										trap    #6
										bra.w   loc_5AC3C
cs_5AC34:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 11 12 F 3
										dc.b $11
										dc.b $12
										dc.b $F
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_5AC3C:
										
										trap    #1
										dc.w $F
										bne.s   return_5AC54
										lea     cs_5AC4C(pc), a0
										trap    #6
										bra.w   return_5AC54
cs_5AC4C:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING F 13 E 3
										dc.b $F
										dc.b $13
										dc.b $E
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
return_5AC54:
										
										rts

	; End of function ms_map33_InitFunction

