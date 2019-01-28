
; ASM FILE data\maps\entries\map03\mapsetups\s3_21F.asm :
; 0x62820..0x62846 : 
ms_map3_flag21F_ZoneEvents:
		msZoneEvent 2, 255, sub_6282A-ms_map3_flag21F_ZoneEvents
		msDefaultZoneEvent 0, nullsub_70-ms_map3_flag21F_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_70:
		rts

	; End of function nullsub_70


; =============== S U B R O U T I N E =======================================

sub_6282A:
		 
		script  cs_6283E
		txt     $F48            ; "Wait, wait!{W2}"
		txt     $F49            ; "Sir Astral told me not to{N}let you go out today!{W2}"
		txt     $F4A            ; "You have to be here.{W1}"
		rts

	; End of function sub_6282A

cs_6283E:       moveNextToPlayer $89,LEFT
		csc_end
