
; SCRIPT SECTION mapsetups\map03\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map3_InitFunction:
										
										trap    #1
										dc.w 1
										beq.s   loc_51390
										lea     cs_513BA(pc), a0
										trap    #6
										bra.s   loc_513A8
loc_51390:
										
										trap    #1
										dc.w $25A
										beq.s   loc_513A8
										lea     cs_513A0(pc), a0
										trap    #6
										bra.w   loc_513A8
cs_513A0:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 29 A 1
										dc.b 1
										dc.b $29
										dc.b $A
										dc.b 1
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
loc_513A8:
										
										trap    #1
										dc.w $25B
										beq.s   return_513B8
										move.w  #$8E,d0
										jsr     MoveEntityOutOfMap
return_513B8:
										
										rts

	; End of function ms_map3_InitFunction

cs_513BA:           dc.w $2E                ; 002E HIDE ENTITY 8E
										dc.w $8E
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
