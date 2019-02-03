
; ASM FILE data\maps\entries\map21\mapsetups\s2_entityevents_21F.asm :
; 0x6345E..0x63472 : 
ms_map21_flag21F_EntityEvents:
		msEntityEvent 128, DOWN, Map21_21F_EntityEvent0-ms_map21_flag21F_EntityEvents
		msDefaultEntityEvent 0, nullsub_127-ms_map21_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_127:
		rts

	; End of function nullsub_127


; =============== S U B R O U T I N E =======================================

Map21_21F_EntityEvent0:
		
		 
		txt     $238            ; "This west tower leads to{N}the Ancient Tower.{W2}"
		txt     $239            ; "The Ancient Tower is a{N}sacred place where only the{N}King can go.{W1}"
		rts

	; End of function Map21_21F_EntityEvent0

