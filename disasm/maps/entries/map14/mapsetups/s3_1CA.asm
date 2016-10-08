
; SCRIPT SECTION maps\entries\map14\mapsetups\s3_1CA :
; 
ms_map14_flag1CA_ZoneEvents:
										dc.b $FF
										dc.b $F
										dc.w sub_58F54-ms_map14_flag1CA_ZoneEvents
										dc.w $FD00
										dc.w return_58E5A+$10000-ms_map14_flag1CA_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_58F54:
										
										lea     (Map42s1_Layout+$DC-ms_map14_flag1CA_ZoneEvents)(pc), a0
										trap    #6
										rts

	; End of function sub_58F54

cs_58F5C:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 81 3
										dc.w $81
										dc.w 3
										dc.w 4                  ; 0004 INIT TEXT CURSOR C84 : "Are you ready?{W1}"
										dc.w $C84
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "Are you ready?{W1}"
										dc.w $81
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 58F7E : YES/NO prompt answer
										dc.w $59
										dc.l word_58F7E         
										dc.w 4                  ; 0004 INIT TEXT CURSOR C86 : "I want to leave soon.{N}Finish your preparations.{W1}"
										dc.w $C86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "I want to leave soon.{N}Finish your preparations.{W1}"
										dc.w $81
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_58F7E:         dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "The game will be suspended.{N}OK?"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 0 3 4
										dc.b $81
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 4
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 48010103
										dc.l $48010103
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
