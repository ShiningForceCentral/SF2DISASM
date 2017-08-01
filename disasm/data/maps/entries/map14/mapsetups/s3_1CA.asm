
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
		
		lea     cs_58F5C(pc), a0
		trap    #6
		rts

	; End of function sub_58F54

cs_58F5C:
		moveEntityNextToPlayer $81,$3
						; 0028 MOVE ENTITY NEXT TO PLAYER 81 3
		textCursor $C84         
						; Initial text line $C84 : "Are you ready?{W1}"
		nextText $0,$81         
						; "Are you ready?{W1}"
		yesNo                   
						; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_58F7E
						; YES/NO prompt answer
		textCursor $C86         
						; Initial text line $C86 : "I want to leave soon.{N}Finish your preparations.{W1}"
		nextSingleText $0,$81   
						; "I want to leave soon.{N}Finish your preparations.{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_58F7E:
		nextSingleText $0,$81   
						; "The game will be suspended.{N}OK?"
		moveEntity $81,$0,$3,$4 
						; 002D MOVE ENTITY 81 0 3 4
		endMove $8080
		moveEntity $0,$FF,$3,$4 
						; 002D MOVE ENTITY 0 FF 3 4
		endMove $8080
		mapSysEvent $48010103   
						; 0007 EXECUTE MAP SYSTEM EVENT 48010103
		csc_end                 
						; END OF CUTSCENE SCRIPT
