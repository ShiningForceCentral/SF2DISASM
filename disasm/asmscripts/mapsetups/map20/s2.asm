
; SCRIPT SECTION mapsetups\map20\s2 :
; 
ms_map20_EntityEvents:
										dc.b $80
										dc.b 0
										dc.w sub_537E6-ms_map20_EntityEvents
										dc.b $81
										dc.b 0
										dc.w sub_537E0-ms_map20_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_537CC-ms_map20_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_537EC-ms_map20_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_537F2-ms_map20_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_537F8-ms_map20_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_537FE-ms_map20_EntityEvents
										dc.w $FD00
										dc.w return_53814-ms_map20_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_537CC:
										
										trap    #1
										dc.w $100
										bne.s   loc_537DA
										trap    #5
										dc.w $23A
										trap    #2
										dc.w $100
loc_537DA:
										
										trap    #5
										dc.w $23B
										rts

	; End of function sub_537CC


; =============== S U B R O U T I N E =======================================

sub_537E0:
										
										trap    #5
										dc.w $23C
										rts

	; End of function sub_537E0


; =============== S U B R O U T I N E =======================================

sub_537E6:
										
										trap    #5
										dc.w $23D
										rts

	; End of function sub_537E6


; =============== S U B R O U T I N E =======================================

sub_537EC:
										
										trap    #5
										dc.w $237
										rts

	; End of function sub_537EC


; =============== S U B R O U T I N E =======================================

sub_537F2:
										
										trap    #5
										dc.w $236
										rts

	; End of function sub_537F2


; =============== S U B R O U T I N E =======================================

sub_537F8:
										
										trap    #5
										dc.w $233
										rts

	; End of function sub_537F8


; =============== S U B R O U T I N E =======================================

sub_537FE:
										
										trap    #1
										dc.w $101
										bne.s   loc_53810
										lea     cs_53816(pc), a0
										trap    #6
										trap    #2
										dc.w $101
										bra.s   return_53814
loc_53810:
										
										trap    #5
										dc.w $235
return_53814:
										
										rts

	; End of function sub_537FE

cs_53816:           dc.w 4                  ; 0004 SET TEXT INDEX 234
										dc.w $234
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 45E44
										dc.b $87
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 87 2
										dc.b $87
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87
										dc.w $87
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87
										dc.w $87
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
