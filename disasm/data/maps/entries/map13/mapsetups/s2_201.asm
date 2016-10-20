
; ASM FILE data\maps\entries\map13\mapsetups\s2_201.asm :
; 0x5814C..0x5822A : 
ms_map13_flag201_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w sub_58184-ms_map13_flag201_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_5818A-ms_map13_flag201_EntityEvents
		dc.b $82
		dc.b 0
		dc.w sub_58078+$10000-ms_map13_flag201_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_58090+$10000-ms_map13_flag201_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_5809E+$10000-ms_map13_flag201_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_58190-ms_map13_flag201_EntityEvents
		dc.b $86
		dc.b 3
		dc.w sub_580C6+$10000-ms_map13_flag201_EntityEvents
		dc.b $87
		dc.b 1
		dc.w sub_58196-ms_map13_flag201_EntityEvents
		dc.b $88
		dc.b 1
		dc.w sub_5819C-ms_map13_flag201_EntityEvents
		dc.b $89
		dc.b 0
		dc.w sub_581A2-ms_map13_flag201_EntityEvents
		dc.b $8A
		dc.b 3
		dc.w sub_58218-ms_map13_flag201_EntityEvents
		dc.b $8B
		dc.b 1
		dc.w sub_5821E-ms_map13_flag201_EntityEvents
		dc.b $8C
		dc.b 1
		dc.w sub_58224-ms_map13_flag201_EntityEvents
		dc.w $FD00
		dc.w nullsub_116+$10000-ms_map13_flag201_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_58184:
		
		trap    #TEXTBOX
		dc.w $59F               
						; "I've been to a desolate{N}port town in the south....{W1}"
		rts

	; End of function sub_58184


; =============== S U B R O U T I N E =======================================

sub_5818A:
		
		trap    #TEXTBOX
		dc.w $5A0               
						; "They say, a huge monster{N}lives in the river.{W1}"
		rts

	; End of function sub_5818A


; =============== S U B R O U T I N E =======================================

sub_58190:
		
		trap    #TEXTBOX
		dc.w $5A1               
						; "You saw Volcanon?{N}Are you serious?{W2}{N}I've never met him, though{N}I've lived here all my life.{W1}"
		rts

	; End of function sub_58190


; =============== S U B R O U T I N E =======================================

sub_58196:
		
		trap    #TEXTBOX
		dc.w $5A2               
						; "There's a desert in the south.{W2}{N}Ancient ruins lay in the{N}desert.{W1}"
		rts

	; End of function sub_58196


; =============== S U B R O U T I N E =======================================

sub_5819C:
		
		trap    #TEXTBOX
		dc.w $5A3               
						; "I could help you if I were{N}younger.{W2}{N}But now I'm too darn old.{N}Drat!{W1}"
		rts

	; End of function sub_5819C


; =============== S U B R O U T I N E =======================================

sub_581A2:
		
		trap    #CHECK_FLAG
		dc.w $2CE               
						; set after Oddler runs after you as you leave Polca, and tags along
		bne.s   loc_58212
		trap    #CHECK_FLAG
		dc.w $2CD               
						; set after the mayor first tries to have you take Oddler with you (Peter declines)
		bne.s   loc_5820C
		trap    #CHECK_FLAG
		dc.w $2CC               
						; set after your raft-giving conversation with the mayor in Polca
		bne.s   loc_58206
		trap    #CHECK_FLAG
		dc.w $104
		bne.s   loc_581C4
		trap    #TEXTBOX
		dc.w $5A8               
						; "Pl...please...take that boy{N}with you!{W1}"
		trap    #SET_FLAG
		dc.w $104
		bra.s   loc_58204
loc_581C4:
		
		trap    #CHECK_FLAG
		dc.w $105
		bne.s   loc_581D4
		trap    #TEXTBOX
		dc.w $5A9               
						; "Ddddd...don't kill me!{W1}"
		trap    #SET_FLAG
		dc.w $105
		bra.s   loc_58204
loc_581D4:
		
		trap    #CHECK_FLAG
		dc.w $106
		bne.s   loc_581E4
		trap    #TEXTBOX
		dc.w $5AA               
						; "Please, take him!{W1}"
		trap    #SET_FLAG
		dc.w $106
		bra.s   loc_58204
loc_581E4:
		
		lea     cs_58856(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2CC               
						; set after your raft-giving conversation with the mayor in Polca
		trap    #SET_FLAG
		dc.w $40                
						; Raft is unlocked (0x05264)
		move.b  #$48,((RAFT_MAP_INDEX-$1000000)).w 
		move.b  #$2B,((RAFT_X-$1000000)).w 
		move.b  #$30,((RAFT_Y-$1000000)).w 
loc_58204:
		
		bra.s   loc_5820A
loc_58206:
		
		trap    #TEXTBOX
		dc.w $5E8               
						; "Why don't you take a look{N}at it right now?{W1}"
loc_5820A:
		
		bra.s   loc_58210
loc_5820C:
		
		trap    #TEXTBOX
		dc.w $5AB               
						; "Do I have to ask you to{N}take him with you again?{W1}"
loc_58210:
		
		bra.s   return_58216
loc_58212:
		
		trap    #TEXTBOX
		dc.w $5A4               
						; "Before we knew...we tried{N}to avoid the fighting....{W1}"
return_58216:
		
		rts

	; End of function sub_581A2


; =============== S U B R O U T I N E =======================================

sub_58218:
		
		trap    #TEXTBOX
		dc.w $5A5               
						; "Clank!  Clank!{W2}{N}I heard that blacksmiths in{N}ancient times made special{N}weapons from a rare metal.{W1}"
		rts

	; End of function sub_58218


; =============== S U B R O U T I N E =======================================

sub_5821E:
		
		trap    #TEXTBOX
		dc.w $5A6               
						; "I need more hair and more{N}courage!{W2}{N}I couldn't move when I{N}saw the devils....{W1}"
		rts

	; End of function sub_5821E


; =============== S U B R O U T I N E =======================================

sub_58224:
		
		trap    #TEXTBOX
		dc.w $5A7               
						; "Who are you?{N}Excuse me, but...{N}I'm blind.{W1}"
		rts

	; End of function sub_58224

