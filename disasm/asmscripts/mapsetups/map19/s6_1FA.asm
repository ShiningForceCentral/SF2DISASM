
; SCRIPT SECTION mapsetups\map19\s6_1FA :
; 

; =============== S U B R O U T I N E =======================================

ms_map19_flag1FA_InitFunction:
										
										trap    #1
										dc.w $26C
										beq.s   loc_5314C
										move.w  #$1C,d0
										jsr     MoveEntityOutOfMap
										move.w  #$80,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$84,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$85,d0 
										jsr     MoveEntityOutOfMap
loc_5314C:
										
										trap    #1
										dc.w $26D
										beq.s   return_53166
										move.w  #$81,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$82,d0 
										jsr     MoveEntityOutOfMap
return_53166:
										
										rts

	; End of function ms_map19_flag1FA_InitFunction

