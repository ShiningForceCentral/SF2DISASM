
; SCRIPT SECTION battles\entries\battle16\cs_afterbattle :
; Cutscene after battle 16
abcs_battle16:      dc.w $A                 ; 000A EXECUTE SUBROUTINE 4B1D0
										dc.l sub_4B1D0
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 451D3302
										dc.l $451D3302
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4B1CA:
										
										clr.b   ((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_4B1CA


; =============== S U B R O U T I N E =======================================

sub_4B1D0:
										
										move.b  #2,((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_4B1D0

