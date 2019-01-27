
; ASM FILE data\maps\entries\map14\mapsetups\s3_1CA.asm :
; 0x58F4C..0x58F9A : 
ms_map14_flag1CA_ZoneEvents:
		dc.b $FF
		dc.b $F
		dc.w sub_58F54-ms_map14_flag1CA_ZoneEvents
		dc.w $FD00
		dc.w (return_58E5A-ms_map14_flag1CA_ZoneEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_58F54:
		 
		script  cs_58F5C
		rts

	; End of function sub_58F54

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
