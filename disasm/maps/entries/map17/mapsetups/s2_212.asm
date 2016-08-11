
; SCRIPT SECTION maps\entries\map17\mapsetups\s2_212 :
; 
ms_map17_flag212_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_611F0-ms_map17_flag212_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_611FA-ms_map17_flag212_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_61200-ms_map17_flag212_EntityEvents
										dc.w $FD00
										dc.w nullsub_19-ms_map17_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_611F0:
										
										trap    #TRAP_TEXTBOX
										dc.w $DAF               ; "I think he was looking for{N}the Holy Sword.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $DB0               ; "Please don't tell anybody{N}that I told you.{W1}"
										rts

	; End of function sub_611F0


; =============== S U B R O U T I N E =======================================

sub_611FA:
										
										trap    #TRAP_TEXTBOX
										dc.w $DB2               ; "Why am I guarding the{N}kitchen?!{W1}"
										rts

	; End of function sub_611FA


; =============== S U B R O U T I N E =======================================

sub_61200:
										
										trap    #TRAP_TEXTBOX
										dc.w $DB5               ; "I heard a rumor that a{N}handsome boy is leading{N}the devils now.{W1}"
										rts

	; End of function sub_61200


; =============== S U B R O U T I N E =======================================

nullsub_19:
										
										rts

	; End of function nullsub_19

