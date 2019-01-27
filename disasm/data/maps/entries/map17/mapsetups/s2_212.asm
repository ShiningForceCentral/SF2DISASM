
; ASM FILE data\maps\entries\map17\mapsetups\s2_212.asm :
; 0x611E0..0x61208 : 
ms_map17_flag212_EntityEvents:
		msEntityEvent 128, UP, sub_611F0-ms_map17_flag212_EntityEvents
		msEntityEvent 129, DOWN, sub_611FA-ms_map17_flag212_EntityEvents
		msEntityEvent 131, DOWN, sub_61200-ms_map17_flag212_EntityEvents
		msDefaultEntityEvent 0, nullsub_19-ms_map17_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_611F0:
		 
		txt $DAF                ; "I think he was looking for{N}the Holy Sword.{W2}"
		txt $DB0                ; "Please don't tell anybody{N}that I told you.{W1}"
		rts

	; End of function sub_611F0


; =============== S U B R O U T I N E =======================================

sub_611FA:
		 
		txt $DB2                ; "Why am I guarding the{N}kitchen?!{W1}"
		rts

	; End of function sub_611FA


; =============== S U B R O U T I N E =======================================

sub_61200:
		 
		txt $DB5                ; "I heard a rumor that a{N}handsome boy is leading{N}the devils now.{W1}"
		rts

	; End of function sub_61200


; =============== S U B R O U T I N E =======================================

nullsub_19:
		rts

	; End of function nullsub_19

