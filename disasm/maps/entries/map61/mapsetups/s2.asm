
; SCRIPT SECTION maps\entries\map61\mapsetups\s2 :
; 
ms_map61_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5C67A-ms_map61_EntityEvents
										dc.w $FD00
										dc.w return_5C694-ms_map61_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5C67A:
										
										trap    #TRAP_CHECKFLAG
										dc.w $100
										bne.s   loc_5C684
										trap    #TRAP_TEXTBOX
										dc.w $E3D               ; "I'm Paseran of Ribble.{N}I'm studying the ancient{N}petroglyphs.{W2}"
loc_5C684:
										
										trap    #TRAP_TEXTBOX
										dc.w $E3E               ; "{NAME;11} told me about{N}a family who has an ancient{N}tomb in Parmecia.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E3F               ; "According to my studies,{N}his house should be around{N}here somewhere.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E40               ; "Or, maybe it's to the east.{W1}"
										trap    #TRAP_SETFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
return_5C694:
										
										rts

	; End of function sub_5C67A

