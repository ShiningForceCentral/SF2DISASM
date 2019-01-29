
; ASM FILE data\maps\entries\map14\mapsetups\s3_1CA.asm :
; 0x58F4C..0x58F9A : 
ms_map14_flag1CA_ZoneEvents:
		msZoneEvent 255, 15, Map14_1CA_ZoneEvent0-ms_map14_flag1CA_ZoneEvents
		msDefaultZoneEvent 0, (return_58E5A-ms_map14_flag1CA_ZoneEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

Map14_1CA_ZoneEvent0:
		
		 
		script  cs_58F5C
		rts

	; End of function Map14_1CA_ZoneEvent0

cs_58F5C:       moveNextToPlayer $81,DOWN
		textCursor $C84
		nextText $0,$81         ; "Are you ready?{W1}"
		yesNo
		jumpIfFlagSet $59,cs_58F7E; YES/NO prompt answer
		textCursor $C86
		nextSingleText $0,$81   ; "I want to leave soon.{N}Finish your preparations.{W1}"
		csc_end
cs_58F7E:       nextSingleText $0,$81   ; "The game will be suspended.{N}OK?"
		entityActions $81
		 moveDown 4
		endActions
		entityActionsWait $0
		 moveDown 4
		endActions
		warp $48,$1,$1,$3
		csc_end
