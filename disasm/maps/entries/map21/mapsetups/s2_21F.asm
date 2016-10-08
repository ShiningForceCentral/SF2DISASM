
; SCRIPT SECTION maps\entries\map21\mapsetups\s2_21F :
; 
ms_map21_flag21F_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_63468-ms_map21_flag21F_EntityEvents
										dc.w $FD00
										dc.w nullsub_127-ms_map21_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_127:
										
										rts

	; End of function nullsub_127


; =============== S U B R O U T I N E =======================================

sub_63468:
										
										trap    #TEXTBOX
										dc.w $238               ; "This west tower leads to{N}the Ancient Tower.{W2}"
										trap    #TEXTBOX
										dc.w $239               ; "The Ancient Tower is a{N}sacred place where only the{N}King can go.{W1}"
										rts

	; End of function sub_63468

